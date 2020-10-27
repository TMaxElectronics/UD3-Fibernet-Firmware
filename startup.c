/*
 * File:   startup.c
 * Author: Thorb
 *
 * Created on 27. Oktober 2020, 08:45
 */


#include <xc.h>
#include <string.h>

#include "FreeRTOS.h"
#include "task.h"
#include "min.h"
#include "FiberComms.h"
#include "min_id.h"
#include "startup.h"
#include "LAN9250.h"

uint8_t MAC_ADDRESS[6] = {DEF_MAC_ADDR};
uint8_t IP_ADDRESS[4] = {DEF_IP_ADDRESS};
uint8_t NETMASK[4] = {DEF_NETMASK};
uint8_t DNSIP[4] = {DEF_DNSIP};
uint8_t GATEWAYIP[4] = {DEF_GATEWAYIP};

unsigned deviceReady = 0;
char * UD3_name;
static void startupTask();
static void crcReset();
static uint32_t crcProc(uint8_t byte);
static void prvSetupHardware();

void startServices(){
    prvSetupHardware();
    COMMS_init();
    
    xTaskCreate(startupTask, "startTsk", configMINIMAL_STACK_SIZE, NULL , tskIDLE_PRIORITY + 2, NULL);
}

//as long as the network is not ready, we won't process any data for the transport protocol, so we call this handler instead
unsigned startupMINHandler(uint8_t min_id, uint8_t * min_payload, uint16_t len_payload, uint8_t port){
    switch(min_id){
        case 0xff:
            break;
            
        case MIN_ID_EVENT:
            if(len_payload == 0) break;
            switch(min_payload[0]){
                case EVENT_GET_INFO:
                    crcReset();
                    EVENT_ID_RESPONSE * data = (EVENT_ID_RESPONSE *) min_payload;
                    
                    if(data->struct_version > 1) break;
                    
                    //we have received the info struct so we set all of our parameters
                    
#ifndef configUSE_DEFAULT_MAC
                    //the last 32 bits of the mac are the crc of the id bytes
                    uint32_t newMac = 0;
                    uint8_t * id = &data->unique_id;
                    uint8_t currByte = 0;
                    for(currByte = 0; currByte < 8; currByte ++) newMac = crcProc(id[currByte]);
                    //copy the data to the mac adress array
                    memcpy(&MAC_ADDRESS[2], &newMac, 4);
#endif
                    
                    //copy the UD3 name
                    UD3_name = pvPortMalloc(16);
                    memcpy(UD3_name, &data->udname, 16);
                    
                    deviceReady = 1;
                    
                    break;
                    
                default:
                    break;
            }
            
            break;
          
        //if this is neither a frame to forward nor an event request, we just pass it onto the handler
        default:
            return 0;
    }
    
    return 1;
}

//wait for the UD3 to boot so we can get the id and calculate our mac address
static void startupTask(void * params){
    COMMS_pushAlarm(ALARM_PRIO_INFO, "FiberNet is waiting for ID", ALARM_NO_VALUE);
    
    //wait for the startupMINHandler to receive the response to MIN_ID_EVENT, and continously send the request 
    while(1){
        if(deviceReady) break;
        vTaskDelay(100);
        min_send_frame(COMMS_UART, MIN_ID_EVENT, "\x01", 1);
    }
    
    //the configuration is ready -> start networking
    FreeRTOS_IPInit(IP_ADDRESS, NETMASK, GATEWAYIP, DNSIP, MAC_ADDRESS);
    
    //create the listener tasks
    xTaskCreate(COMMS_udpDataHandler, "udpRecv", configMINIMAL_STACK_SIZE, NULL , tskIDLE_PRIORITY + 2, NULL);
    xTaskCreate(COMMS_udpDiscoverHandler, "udpDisc", configMINIMAL_STACK_SIZE, NULL , tskIDLE_PRIORITY + 1, NULL);
    xTaskCreate(COMMS_statsHandler, "paCcount", configMINIMAL_STACK_SIZE, NULL , tskIDLE_PRIORITY + 1, NULL);
    
    //inform the UD3
    COMMS_pushAlarm(ALARM_PRIO_INFO, "FiberNet networking started", ALARM_NO_VALUE);
    
    //kill ourselves, as our job is done. Nice
    vTaskDelete(xTaskGetCurrentTaskHandle());
    
    while(1);
}

uint32_t currCrc = 0xffffffff;

static void crcReset(){
    currCrc = 0xffffffff;
}

//thank you MIN, very cool
static uint32_t crcProc(uint8_t byte){
    currCrc ^= byte;
    uint32_t j = 0;
    for(j = 0; j < 8; j++) {
        uint32_t mask = (uint32_t) -(currCrc & 1U);
        currCrc = (currCrc >> 1) ^ (0xedb88320U & mask);
    }
    return currCrc;
}

static void prvSetupHardware(){
	/* Configure the hardware for maximum performance. */
	vHardwareConfigurePerformance();

	/* Setup to use the external interrupt controller. */
	vHardwareUseMultiVectoredInterrupts();

	portENABLE_INTERRUPTS();
    
    /* initalize IO */
    TRISA = 0xffff; //start with everything tri-stated
    TRISB = 0xffff;
    ANSELA = 0;     //disable all analog inputs, otherwise any digital read returns 0
    ANSELB = 0;
    
    LATBSET = _LATB_LATB4_MASK | _LATB_LATB9_MASK;  //set CS lines
    
    TRISACLR = _TRISA_TRISA2_MASK | _TRISA_TRISA3_MASK | _TRISA_TRISA4_MASK;
    TRISBCLR = _TRISB_TRISB2_MASK | _TRISB_TRISB3_MASK | _TRISB_TRISB4_MASK | _TRISB_TRISB7_MASK | _TRISB_TRISB8_MASK | _TRISB_TRISB9_MASK | _TRISB_TRISB14_MASK | _TRISB_TRISB15_MASK;
    
    //Set LED pins to open drain and turn off r,g and b
    ODCASET = _ODCA_ODCA2_MASK;
    ODCBSET = _ODCB_ODCB2_MASK | _ODCB_ODCB3_MASK;
    LATASET = _LATA_LATA2_MASK;
    LATBSET = _LATB_LATB2_MASK | _LATB_LATB3_MASK;
    
    //turn on DMA
    DMACON = _DMACON_ON_MASK;
    DCRCCON = 0;
    
    T2CON = 0b1000000001111000;
    T3CON = 0b1000000001111000;
    
    UART_init(460800, &RPA3R, 0b0001);
    
    SPI_init(2000000);

    LED_init();
}