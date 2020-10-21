/*
 * File:   LED.c
 * Author: Thorb
 *
 * Created on October 19, 2020, 9:20 PM
 */


#include <xc.h>
#include <stdint.h>

#include "FreeRTOSConfig.h"
#include "FreeRTOS.h"
#include "LED.h"

#define LED_BLINK_TIME 1

int32_t minLEDTime = 0;
int32_t ethLEDTime = 0;
int32_t errLEDTime = 0;
unsigned ethError = 1;
unsigned ethReady = 0;

void LED_init(){
    //IO
    TRISACLR = _TRISA_TRISA2_MASK;
    TRISBCLR = _TRISB_TRISB2_MASK | _TRISB_TRISB3_MASK;
    
    //Set LED pins to open drain and turn off r,g and b
    ODCASET = _ODCA_ODCA2_MASK;
    ODCBSET = _ODCB_ODCB2_MASK | _ODCB_ODCB3_MASK;
    LATASET = _LATA_LATA2_MASK;
    LATBSET = _LATB_LATB2_MASK | _LATB_LATB3_MASK;
    
    xTaskCreate(LED_task, "LED Task", configMINIMAL_STACK_SIZE, NULL, 1, NULL);
}

//Handle led IO
void LED_task(void * params){
    while(1){
        if(ethError){
            LATASET = _LATA_LATA2_MASK;
            LATBSET = _LATB_LATB3_MASK;
            
            LATBCLR = _LATB_LATB3_MASK;
        }else{
            LATBSET = _LATB_LATB3_MASK;
            
            if(--ethLEDTime < 0){
                ethLEDTime = 0;
                if(ethReady){
                    LATBCLR = _LATB_LATB2_MASK;
                }else{
                    LATBSET = _LATB_LATB2_MASK;
                }
            }

            if(--minLEDTime < 0){
                minLEDTime = 0;
                LATASET = _LATA_LATA2_MASK;
            }

            if(--errLEDTime < 0){
                errLEDTime = 0;
                LATBSET = _LATB_LATB3_MASK;
            }
        }
        vTaskDelay(40);
    }
}

void LED_ethLinkStateChangeHook(unsigned newState){
    ethError = !newState;
}

void LED_ethDHCPStateChangeHook(unsigned newState){
    ethReady = newState;
}

void LED_ethPacketReceivedHook(){
    ethLEDTime = LED_BLINK_TIME;
    LATBINV = _LATB_LATB2_MASK;
}

void LED_minPacketReceivedHook(){
    minLEDTime = LED_BLINK_TIME;
    LATAINV = _LATA_LATA2_MASK;
}

void LED_errorFlashHook(){
    errLEDTime = LED_BLINK_TIME;
    LATBINV = _LATB_LATB3_MASK;
}