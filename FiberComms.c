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
#include "min_id.h"

struct min_context * COMMS_UDP;
struct min_context * COMMS_UART;
struct freertos_sockaddr lastClient;
Socket_t dataSocket;

void COMMS_init(){
    //initialize min contexts
    COMMS_UDP = pvPortMalloc(sizeof(struct min_context));
    COMMS_UART = pvPortMalloc(sizeof(struct min_context));
    min_init_context(COMMS_UDP, (uint8_t) COMMS_UDP);
    min_init_context(COMMS_UART, (uint8_t) COMMS_UART);
    
    //start the listener task
    xTaskCreate(COMMS_udpDataHandler, "udpRecv", configMINIMAL_STACK_SIZE, NULL , tskIDLE_PRIORITY + 2, NULL);
}

void COMMS_udpDataHandler(void * params){
    int32_t receivedDataLength;
    uint8_t * udpData = pvPortMalloc(300);
    struct freertos_sockaddr dataPort;
    uint32_t clientLength = sizeof(lastClient);

    //set up the socket for the data
	dataSocket = FreeRTOS_socket( FREERTOS_AF_INET, FREERTOS_SOCK_DGRAM, FREERTOS_IPPROTO_UDP );
    
	configASSERT( dataSocket != FREERTOS_INVALID_SOCKET );

	dataPort.sin_port = FreeRTOS_htons(COMMS_DATA_PORT);
	FreeRTOS_bind( dataSocket, &dataPort, sizeof( dataPort ) );

	while(1){
		receivedDataLength = FreeRTOS_recvfrom(dataSocket, udpData, 512, 0, &lastClient, &clientLength);
        
        //check if we have received data or are here because of a timeout
        if(receivedDataLength > 0){
            
            //do a quick check on the received data. If it is a valid min frame and has the transport bit set we can immediately forward it without checking anything
            uint16_t length = min_checkUDPFrame(udpData);
            
            if(length <= MAX_PAYLOAD){
                UART_queBuffer(udpData, receivedDataLength, 1);
                LED_ethPacketReceivedHook();
                udpData = pvPortMalloc(300);
            }else if(length == MIN_NON_TRANSPORT_FRAME){
                //if it is a non transport min frame we have to deal with it properly
                min_poll(COMMS_UDP, udpData, receivedDataLength);
            }else{
                //we have received an invalid min frame
                UART_printDebug("Invalid MIN frame received\r\n");
            }
        }
	}
}

void COMMS_udpDiscoverHandler(void * params){
    //TODO
    /*
    int32_t lBytes;
    uint8_t * udpData = pvPortMalloc(COMMS_UDP_BUFFER_SIZE);
    struct freertos_sockaddr bindAddress;
    uint32_t clientLength = sizeof( lastClient );

	dataSocket = FreeRTOS_socket( FREERTOS_AF_INET, FREERTOS_SOCK_DGRAM, FREERTOS_IPPROTO_UDP );
    
	configASSERT( dataSocket != FREERTOS_INVALID_SOCKET );

	bindAddress.sin_port = FreeRTOS_htons(COMMS_DATA_PORT);
	FreeRTOS_bind( dataSocket, &bindAddress, sizeof( bindAddress ) );

	while(1){
		lBytes = FreeRTOS_recvfrom( dataSocket, udpData, 512, 0, &lastClient, &clientLength );
        
        if(lBytes > 0){
            
        }
	}
    */
}

//send data to the last client we got a packet from
void COMMS_sendDataToLastClient(uint8_t * data, uint16_t dataLength){
    FreeRTOS_sendto(dataSocket, data, dataLength, 0, &lastClient, sizeof(lastClient));
}

//quickly check if a received UDP packet is a min transport frame, a normal min frame or something entirely different (This does mean that min frames have to be aligned to a single UDP packet)
uint16_t min_checkUDPFrame(uint8_t * data){
    if(data[0] != 0xaa || data[1] != 0xaa || data[2] != 0xaa) return MIN_FRAME_INVALID;
    if(data[3] & 0x80U) return data[8]; //return length if the frame needs to be forwarded
    return MIN_NON_TRANSPORT_FRAME;
}

//handle incoming MIN frames (except for transport frames from UDP as those are forwarded immediately)
void min_application_handler(uint8_t min_id, uint8_t * min_payload, uint16_t len_payload, uint8_t port){
    if(min_id == 0xff){ //frame needs to be forwarded
        if(port == (uint8_t) COMMS_UDP){
            //we should never actually get here
            UART_queBuffer(min_payload, len_payload, 1);
            LED_ethPacketReceivedHook();
        }else if(port == (uint8_t) COMMS_UART){
            //we got a valid transport frame from the UD3, so we send it on to the PC
            COMMS_sendDataToLastClient(min_payload, len_payload);
            LED_minPacketReceivedHook();
            vPortFree(min_payload); //the data is copied by the send function so we can free it here
        }
    }else{
        switch(min_id){
            //TODO handle MIN frames   
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
    if(port == (uint8_t) COMMS_UART){
        COMMS_UART->tx_data_buffer[COMMS_UART->tx_data_position] = byte;
        COMMS_UART->tx_data_position++;
    }else{
        COMMS_UDP->tx_data_buffer[COMMS_UART->tx_data_position] = byte;
        COMMS_UDP->tx_data_position++;
    }
}

void min_tx_start(uint8_t port){
    if(port == (uint8_t) COMMS_UART){
        if(COMMS_UART->tx_data_buffer) return;
        COMMS_UART->tx_data_buffer = pvPortMalloc(300);
    }else{
        if(COMMS_UDP->tx_data_buffer) return;
        COMMS_UDP->tx_data_buffer = pvPortMalloc(300);
    }
}

void min_tx_finished(uint8_t port){
    if(port == (uint8_t) COMMS_UART){
        if(COMMS_UART->tx_data_buffer == NULL) return;
        UART_queBuffer(COMMS_UART->tx_data_buffer, COMMS_UART->tx_data_position, 1);
        COMMS_UART->tx_data_position = 0;
        COMMS_UART->tx_data_buffer = 0;
    }else{
        if(COMMS_UDP->tx_data_buffer == NULL) return;
        COMMS_sendDataToLastClient(COMMS_UDP->tx_data_buffer, COMMS_UDP->tx_data_position);
        COMMS_UDP->tx_data_position = 0;
        COMMS_UDP->tx_data_buffer = 0;
    }
}

void COMMS_ethEventHook(EthEvent evt){
    switch(evt){
        case ETH_INIT_FAIL:
            UART_print("LAN9250 initialization failed\r\n");
            break;
            
        default:
            UART_print("unknown EthEvent received\r\n");
    }
}

void COMMS_pushAlarm(uint8_t level, char* message, int32_t value){
    uint8_t * pl = pvPortMalloc(sizeof(MIN_ALARM_PAYLOAD_DESCRIPTOR) + strlen(message) + 1);
    
    MIN_ALARM_PAYLOAD_DESCRIPTOR * alarmPayload = (MIN_ALARM_PAYLOAD_DESCRIPTOR *) pl;
    char * alarmMessage = (char *) (pl + sizeof(MIN_ALARM_PAYLOAD_DESCRIPTOR));
    
    alarmPayload->level = level;
    alarmPayload->value = value;
    strcpy(alarmMessage, message);
    
    min_send_frame(COMMS_UART, MIN_ID_ALARM, pl, sizeof(MIN_ALARM_PAYLOAD_DESCRIPTOR) + strlen(message) + 1);
    vPortFree(pl);
}

void COMMS_dumpPacket(uint8_t * data, uint16_t length){
    uint16_t currPos = 0;
    UART_print("\r\nPacket dump:\r\n");
    for(;currPos < length; currPos++){
        UART_print(" %02x%s%s", data[currPos], (((currPos % 8) == 0) && currPos != 0) ? " " : "", (((currPos % 16) == 0) && currPos != 0) ? "\r\n" : "");
    }
    UART_print("\r\n---------\r\n");
}