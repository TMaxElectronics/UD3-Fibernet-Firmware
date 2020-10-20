/*
 * File:   FiberCommys.c
 * Author: Thorb
 *
 * Created on October 20, 2020, 6:07 PM
 */


#include <xc.h>
#include "FreeRTOS.h"
#include "FreeRTOS_Sockets.h"
#include "FreeRTOS_IP.h"
#include "FiberComms.h"
#include "min.h"
#include "include/LAN9250.h"

struct min_context * COMMS_UDP;
struct min_context * COMMS_UART;

void COMMS_init(){
    COMMS_UDP = pvPortMalloc(sizeof(struct min_context));
    COMMS_UART = pvPortMalloc(sizeof(struct min_context));
    min_init_context(COMMS_UDP, (uint8_t) COMMS_UDP);
    min_init_context(COMMS_UART, (uint8_t) COMMS_UART);
    
    xTaskCreate(COMMS_udpDataHandler, "udpRecv", configMINIMAL_STACK_SIZE, NULL , tskIDLE_PRIORITY + 2, NULL);
}

void COMMS_udpDataHandler(void * params){
    int32_t lBytes;
    uint8_t * cReceivedString = pvPortMalloc(512);
    struct freertos_sockaddr xClient, xBindAddress;
    uint32_t xClientLength = sizeof( xClient );
    Socket_t xListeningSocket;

	xListeningSocket = FreeRTOS_socket( FREERTOS_AF_INET, FREERTOS_SOCK_DGRAM, FREERTOS_IPPROTO_UDP );
	configASSERT( xListeningSocket != FREERTOS_INVALID_SOCKET );

	xBindAddress.sin_port = FreeRTOS_htons(1337);
	FreeRTOS_bind( xListeningSocket, &xBindAddress, sizeof( xBindAddress ) );

	while(1){
		memset( cReceivedString, 0x00, 512);
		lBytes = FreeRTOS_recvfrom( xListeningSocket, cReceivedString, 512, 0, &xClient, &xClientLength );
        
        if(lBytes > 0){
            ETH_dumpPackt(cReceivedString, lBytes);
            min_poll(COMMS_UDP, cReceivedString, lBytes);
        }
	}
}

void COMMS_udpDiscoverHandler(void * params){
    
}

void min_application_handler(uint8_t min_id, uint8_t * min_payload, uint8_t len_payload, uint8_t port){
    if(min_id == 0xff){ //frame needs to be forwarded
        if(port == (uint8_t) COMMS_UDP){
            //forward the PC's data
            UART_queBuffer(min_payload, len_payload);
            LED_ethPacketReceivedHook();
        }else if(port == (uint8_t) COMMS_UART){
            UART_packetEndHandler();
            LED_minPacketReceivedHook();
        }
    }else{
        //the packet is probably for us -> process its contents
        if(port == (uint8_t) COMMS_UDP){
            
        }else if(port == (uint8_t) COMMS_UART){

        }
    }
}

uint32_t min_time_ms(){
    return xTaskGetTickCount();
}

uint16_t min_tx_space(uint8_t port){
    return xPortGetFreeHeapSize();
}

void min_tx_byte(uint8_t port, uint8_t byte){
    
}

void min_tx_start(uint8_t port){
    
}

void min_tx_finished(uint8_t port){
    
}