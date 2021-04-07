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
#include "FreeRTOS/TCPIP/include/FreeRTOS_Sockets.h"
#include "include/System.h"

#define LED_BLINK_TIME 10

int32_t minLEDTime = 0;
int32_t ethLEDTime = 0;
int32_t errLEDTime = 0;
unsigned ethError = 1;
unsigned ethReady = 0;

const uint8_t LED_generalExceptionCode[] = {1,1,0,0xfe,0,0xff};
const uint8_t LED_stackOverflowCode[] = {0,0,0,0xfe,1,1,1,0xff};
const uint8_t LED_mallocFailedCode[] = {1,1,0xfe,0,0,1,0,0xff};
const uint8_t LED_assertCode[] = {0, 1, 0xfe, 0, 0, 0, 0xfe, 0, 0, 0, 0xff};

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

        if(--minLEDTime < 0){
            minLEDTime = 0;
            LATASET = _LATA_LATA2_MASK;
        }
        
        if(ethError){
            LATBSET = _LATB_LATB2_MASK;
            
            LATBCLR = _LATB_LATB3_MASK;
        }else{
            if(--ethLEDTime < 0){
                ethLEDTime = 0;
                if(ethReady){
                    LATBCLR = _LATB_LATB2_MASK;
                }else{
                    LATBSET = _LATB_LATB2_MASK;
                }
            }

            if(--errLEDTime < 0){
                errLEDTime = 0;
                LATBSET = _LATB_LATB3_MASK;
            }else{
                LATASET = _LATA_LATA2_MASK;
                LATBSET = _LATB_LATB2_MASK;
            }
        }
        vTaskDelay(pdMS_TO_TICKS(5));
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
    LATBCLR = _LATB_LATB3_MASK;
    LATASET = _LATA_LATA2_MASK;
    LATBSET = _LATB_LATB2_MASK;
}

void LED_showCode(uint8_t * code){
    uint8_t currentPos = 0;
    
    //turn off all LEDs
    LATASET = _LATA_LATA2_MASK;
    LATBSET = _LATB_LATB2_MASK;
    LATBSET = _LATB_LATB3_MASK;
    
    //allows the debugger to skip out of this loop if desired
    unsigned cont = 1;
    while(cont){
        switch(code[currentPos]){
            case 0:     //short flash
                LATBCLR = _LATB_LATB3_MASK;
                SYS_waitCP0(LED_CODE_0_TIME);
                LATBSET = _LATB_LATB3_MASK;
                break;
                
            case 1:     //long flash
                LATBCLR = _LATB_LATB3_MASK;
                SYS_waitCP0(LED_CODE_1_TIME);
                LATBSET = _LATB_LATB3_MASK;
                break;
                
            case 0xfe:  //inter-character pause
                SYS_waitCP0(LED_CODE_IC_PAUSE_TIME);
                currentPos ++;
                continue;
                
            case 0xff:  //sequence end
                SYS_waitCP0(LED_CODE_END_TIME);
                currentPos = 0;
                continue;
                
            default:
                currentPos = 0;
                continue;
        }
        currentPos ++;
        SYS_waitCP0(LED_CODE_IB_PAUSE_TIME);
    }
}