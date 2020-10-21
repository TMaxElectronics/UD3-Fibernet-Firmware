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
#include "include/UART.h"

#define MIN_FRAME_INVALID 0xffff
#define MIN_NON_TRANSPORT_FRAME 0xfffe

uint16_t min_checkUDPFrame(uint8_t * data);

struct min_context * COMMS_UDP;
struct min_context * COMMS_UART;
struct freertos_sockaddr lastClient;
Socket_t xListeningSocket;

void COMMS_init(){
    COMMS_UDP = pvPortMalloc(sizeof(struct min_context));
    COMMS_UART = pvPortMalloc(sizeof(struct min_context));
    min_init_context(COMMS_UDP, (uint8_t) COMMS_UDP);
    min_init_context(COMMS_UART, (uint8_t) COMMS_UART);
    
    xTaskCreate(COMMS_udpDataHandler, "udpRecv", configMINIMAL_STACK_SIZE, NULL , tskIDLE_PRIORITY + 2, NULL);
}

void COMMS_udpDataHandler(void * params){
    int32_t lBytes;
    uint8_t * cReceivedString = pvPortMalloc(300);
    struct freertos_sockaddr xBindAddress;
    uint32_t xClientLength = sizeof( lastClient );

	xListeningSocket = FreeRTOS_socket( FREERTOS_AF_INET, FREERTOS_SOCK_DGRAM, FREERTOS_IPPROTO_UDP );
    
	configASSERT( xListeningSocket != FREERTOS_INVALID_SOCKET );

	xBindAddress.sin_port = FreeRTOS_htons(1337);
	FreeRTOS_bind( xListeningSocket, &xBindAddress, sizeof( xBindAddress ) );

	while(1){
		lBytes = FreeRTOS_recvfrom( xListeningSocket, cReceivedString, 512, 0, &lastClient, &xClientLength );
        
        if(lBytes > 0){
            //ETH_dumpPackt(cReceivedString, lBytes);
            
            //do a quick check on the received data. If it is a valid min frame and has the transport bit set we can immediately forward it without checking anything
            uint16_t length = min_checkUDPFrame(cReceivedString);
            
            if(length <= MAX_PAYLOAD){
                UART_queBuffer(cReceivedString, lBytes, 1);
                LED_ethPacketReceivedHook();
            }else if(length = MIN_NON_TRANSPORT_FRAME){
                //if it is a non transport min frame we have to deal with it properly
                min_poll(COMMS_UDP, cReceivedString, lBytes);
            }
            cReceivedString = pvPortMalloc(300);
        }
	}
}

void COMMS_udpDiscoverHandler(void * params){
    
}

void COMMS_sendDataToLastClient(uint8_t * data, uint8_t dataLength){
    FreeRTOS_sendto(xListeningSocket, data, dataLength, 0, &lastClient, sizeof(lastClient));
}

uint16_t min_checkUDPFrame(uint8_t * data){
    if(data[0] != 0xaa || data[1] != 0xaa || data[2] != 0xaa) return MIN_FRAME_INVALID;
    if(data[3] & 0x80U) return data[8]; //return length if the frame needs to be forwarded
    return MIN_NON_TRANSPORT_FRAME;
}

void min_application_handler(uint8_t min_id, uint8_t * min_payload, uint16_t len_payload, uint8_t port){
    if(min_id == 0xff){ //frame needs to be forwarded
        if(port == (uint8_t) COMMS_UDP){
            //forward the PC's data
            //ETH_dumpPackt(min_payload, len_payload);
            UART_queBuffer(min_payload, len_payload, 1);
            LED_ethPacketReceivedHook();
        }else if(port == (uint8_t) COMMS_UART){
            COMMS_sendDataToLastClient(min_payload, len_payload);
            LED_minPacketReceivedHook();
            vPortFree(min_payload);
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