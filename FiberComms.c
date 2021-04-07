/*
 * File:   FiberCommys.c
 * Author: Thorb
 *
 * Created on October 20, 2020, 6:07 PM
 */


#include <xc.h>
#include <stdio.h>
#include "FiberComms.h"
#include "FreeRTOS_Sockets.h"
#include "FreeRTOS_IP.h"
#include "FreeRTOS_DHCP.h"
#include "FreeRTOS_Sockets.h"
#include "min.h"
#include "LAN9250.h"
#include "UART.h"
#include "min_id.h"
#include "UD3_Wrapper.h"
#include "TTerm.h"
#include "startup.h"
#include "TTerm_cmd.h"
#include "FreeRTOS/Core/include/stream_buffer.h"


char FIND_queryString[] = "FINDReq=1;";
struct min_context * COMMS_UDP;
struct min_context * COMMS_UART;
struct freertos_sockaddr lastClient;
uint32_t clientLength = sizeof(lastClient);
Socket_t dataSocket;
TERMINAL_HANDLE * term;
uint8_t dhcpEnable = pdTRUE;

StreamBufferHandle_t streamRx;

#define STREAM_SIZE 255

void Term_task(void *pvParameters);

struct{
    uint32_t findPacketsTotal;
    
    uint32_t rxPacketsTotal;
    uint32_t rxPacketsLast;
    uint32_t rxBytesLast;
    uint32_t rxDataRateLast;
    uint32_t rxDataRateAVG;
    uint32_t rxPacketRateLast;
    uint32_t rxPacketRateAVG;
    
    uint32_t txPacketsTotal;
    uint32_t txPacketsLast;
    uint32_t txBytesLast;
    uint32_t txDataRateLast;
    uint32_t txDataRateAVG;
    uint32_t txPacketRateLast;
    uint32_t txPacketRateAVG;
} ConnectionStats;


void COMMS_init(){
    //initialize min contexts
    COMMS_UDP = pvPortMalloc(sizeof(struct min_context));
    COMMS_UART = pvPortMalloc(sizeof(struct min_context));
    min_init_context(COMMS_UDP, COMMS_UDP);
    min_init_context(COMMS_UART, COMMS_UART);
    
    TERM_addCommand(CMD_ioTop, "iotop", "shows connection statistics", 0, &TERM_cmdListHead);
    TERM_addCommand(CMD_ifconfig, "ifconfig", "displays network interface parameters", 0, &TERM_cmdListHead);
    TERM_addCommand(CMD_testAlarm, "testAlarm", "sends an alarm to the UD3", 0, &TERM_cmdListHead);
    TERM_addCommand(CMD_boot, "boot", "Bootloader", 0, &TERM_cmdListHead);
    
    streamRx = xStreamBufferCreate(STREAM_SIZE,1);
    term = TERM_createNewHandle(UART_termPrint, 0, 1, &TERM_cmdListHead, 0, "root");
    
    xTaskCreate(Term_task, "Term", configMINIMAL_STACK_SIZE + 500, term, tskIDLE_PRIORITY + 2, NULL);
}

void COMMS_statsHandler(void * params){
    
    while(1){
        ConnectionStats.rxDataRateLast = ConnectionStats.rxBytesLast * 2;
        ConnectionStats.rxBytesLast = 0;
        ConnectionStats.rxDataRateAVG = ((ConnectionStats.rxDataRateAVG * 97) + (ConnectionStats.rxDataRateLast * 3)) / 100;
        
        ConnectionStats.txDataRateLast = ConnectionStats.txBytesLast * 2;
        ConnectionStats.txBytesLast = 0;
        ConnectionStats.txDataRateAVG = ((ConnectionStats.txDataRateAVG * 97) + (ConnectionStats.txDataRateLast * 3)) / 100;
        
        ConnectionStats.rxPacketRateLast = (ConnectionStats.rxPacketsTotal - ConnectionStats.rxPacketsLast) * 2;
        ConnectionStats.rxPacketsLast = ConnectionStats.rxPacketsTotal;
        ConnectionStats.rxPacketRateAVG = ((ConnectionStats.rxPacketRateAVG * 90) + (ConnectionStats.rxPacketRateLast * 10)) / 100;
        
        ConnectionStats.txPacketRateLast = (ConnectionStats.txPacketsTotal - ConnectionStats.txPacketsLast) * 2;
        ConnectionStats.txPacketsLast = ConnectionStats.txPacketsTotal;
        ConnectionStats.txPacketRateAVG = ((ConnectionStats.txPacketRateAVG * 90) + (ConnectionStats.txPacketRateLast * 10)) / 100;
        
        vTaskDelay(pdMS_TO_TICKS(500));
    }
}

void COMMS_udpDataHandler(void * params){
    int32_t receivedDataLength;
    uint8_t * udpData = pvPortMalloc(COMMS_UDP_BUFFER_SIZE);
    struct freertos_sockaddr dataPort;

    //set up the socket for the data
	dataSocket = FreeRTOS_socket(FREERTOS_AF_INET, FREERTOS_SOCK_DGRAM, FREERTOS_IPPROTO_UDP);
    
	configASSERT( dataSocket != FREERTOS_INVALID_SOCKET );

	dataPort.sin_port = FreeRTOS_htons(COMMS_DATA_PORT);
	FreeRTOS_bind( dataSocket, &dataPort, sizeof( dataPort ) );

	while(1){
		receivedDataLength = FreeRTOS_recvfrom(dataSocket, udpData, COMMS_UDP_BUFFER_SIZE, 0, &lastClient, &clientLength);
        
        //check if we have received data or are here because of a timeout
        if(receivedDataLength > 0){
            
            //do a quick check on the received data. If it is a valid min frame and has the transport bit set we can immediately forward it without checking anything
            uint16_t length = min_checkUDPFrame(udpData);
            ConnectionStats.rxPacketsTotal++;
            ConnectionStats.rxBytesLast += receivedDataLength;
            
            if(UART_bootloader==pdFALSE){
                if(length <= MAX_PAYLOAD){
                    UART_queBuffer(udpData, receivedDataLength, 1);
                    LED_ethPacketReceivedHook();
                    udpData = pvPortMalloc(COMMS_UDP_BUFFER_SIZE);
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
}

void COMMS_udpDiscoverHandler(void * params){
    int32_t receivedDataLength;
    uint8_t * udpData = pvPortMalloc(COMMS_UDP_BUFFER_SIZE);
    struct freertos_sockaddr dataPort;
    Socket_t discoverySocet;
    struct freertos_sockaddr discoverClient;
    uint32_t dClientLength = sizeof(discoverClient);

    //set up the socket for the data
	discoverySocet = FreeRTOS_socket( FREERTOS_AF_INET, FREERTOS_SOCK_DGRAM, FREERTOS_IPPROTO_UDP );
    
	configASSERT( discoverySocet != FREERTOS_INVALID_SOCKET );

	dataPort.sin_port = FreeRTOS_htons(COMMS_DISCOVER_PORT);
	FreeRTOS_bind( discoverySocet, &dataPort, sizeof( dataPort ) );

	while(1){
		receivedDataLength = FreeRTOS_recvfrom(discoverySocet, udpData, COMMS_UDP_BUFFER_SIZE, 0, &discoverClient, &dClientLength);
        
        //check if we have received data or are here because of a timeout
        if(receivedDataLength == sizeof(FIND_queryString)){
            if(memcmp(udpData, FIND_queryString, sizeof(FIND_queryString)) == 0){
                ConnectionStats.findPacketsTotal ++;
                
                uint8_t * response = pvPortMalloc(FIND_MAX_RESPONSE_SIZE);
                uint8_t * IPAdrr = pvPortMalloc(16);
                const uint8_t * MACAdrr = FreeRTOS_GetMACAddress();
                uint32_t ulIPAddress, ulNetMask, ulGatewayAddress, ulDNSServerAddress;
                FreeRTOS_GetAddressConfiguration(&ulIPAddress, &ulNetMask, &ulGatewayAddress, &ulDNSServerAddress);
                FreeRTOS_inet_ntoa(ulIPAddress, IPAdrr);
                uint16_t length = snprintf(response,FIND_MAX_RESPONSE_SIZE, "FIND=1;IP=%s;HWADDR=%02x:%02x:%02x:%02x:%02x:%02x;DeviceName=%s;SN=%s;deviceType=UD3;", IPAdrr, MACAdrr[0], MACAdrr[1], MACAdrr[2], MACAdrr[3], MACAdrr[4], MACAdrr[5], UD3_name, UD3_sn);
                FreeRTOS_sendto(dataSocket, response, length, 0, &discoverClient, dClientLength);
                vPortFree(response);
                vPortFree(IPAdrr);
            }
        }
	}
}

//send data to the last client we got a packet from
void COMMS_sendDataToLastClient(uint8_t * data, uint16_t dataLength){
    if(!ETH_CheckLinkUp()) return;
    FreeRTOS_sendto(dataSocket, data, dataLength, 0, &lastClient, clientLength);
}

//quickly check if a received UDP packet is a min transport frame, a normal min frame or something entirely different (This does mean that min frames have to be aligned to a single UDP packet)
uint16_t min_checkUDPFrame(uint8_t * data){
    if(data[0] != 0xaa || data[1] != 0xaa || data[2] != 0xaa) return MIN_FRAME_INVALID;
    if(data[3] & 0x80U) return data[8]; //return length if the frame needs to be forwarded
    return MIN_NON_TRANSPORT_FRAME;
}

//handle incoming MIN frames (except for transport frames from UDP as those are forwarded immediately)
void min_application_handler(uint8_t min_id, uint8_t * min_payload, uint16_t len_payload, void * port){
    if(!deviceReady) if(startupMINHandler(min_id, min_payload, len_payload, port)) return;
    
    if(min_id == 0xff){ //frame needs to be forwarded
        if(port == COMMS_UDP){
            //we should never actually get here
            UART_queBuffer(min_payload, len_payload, 1);
            LED_ethPacketReceivedHook();
        }else if(port == COMMS_UART){
            ConnectionStats.txPacketsTotal++;
            ConnectionStats.txBytesLast += len_payload;
            //we got a valid transport frame from the UD3, so we send it on to the PC
            COMMS_sendDataToLastClient(min_payload, len_payload);
            LED_minPacketReceivedHook();
            vPortFree(min_payload); //the data is copied by the send function so we can free it here
        }
    }else{
        
        switch(min_id){
            case MIN_ID_DEBUG:
                xStreamBufferSend(streamRx, min_payload, len_payload,2);
                break;
            case MIN_ID_EVENT:
                if(len_payload == 0) break;
                switch(min_payload[0]){
                    case EVENT_GET_INFO:
                        break;

                    default:
                        break;
                }

                break;
        
            case MIN_ID_ALARM:
                
                break;
            default:
                if(port == COMMS_UDP){
                    min_send_frame(COMMS_UART, min_id, min_payload, len_payload);
                }else if(port == COMMS_UART){
                    min_send_frame(COMMS_UDP, min_id, min_payload, len_payload);
                }
        }
    }
}

void Term_task(void *pvParameters){
    TERMINAL_HANDLE * termPtr = pvParameters;
    uint8_t c;
    while(1){
        xStreamBufferReceive(streamRx, &c,sizeof(c), portMAX_DELAY);
        TERM_processBuffer(&c, sizeof(c), termPtr);
    }
}

uint32_t min_time_ms(){
    return (xTaskGetTickCount() * portTICK_RATE_MS);
}

uint16_t min_tx_space(void * port){
    return xPortGetFreeHeapSize();
}

void min_tx_byte(void * port, uint8_t byte){
    struct min_context * ctx = port;
    if(ctx->tx_data_buffer == NULL) return;
    if(ctx->tx_data_position<ctx->tx_data_buffer_size){
        ctx->tx_data_buffer[ctx->tx_data_position] = byte;
        ctx->tx_data_position++;
    }
}

void min_tx_start(void * port, uint16_t on_wire_len){
    struct min_context * ctx = port;
    if(ctx->tx_data_buffer) return;
    ctx->tx_data_buffer = pvPortMalloc(on_wire_len);
    ctx->tx_data_buffer_size = on_wire_len;
}

void min_tx_finished(void * port){
    struct min_context * ctx = port;
    if(ctx->tx_data_buffer == NULL) return;
    if(port == COMMS_UART){
        UART_queBuffer(ctx->tx_data_buffer, ctx->tx_data_position, 1);
    }else{
        COMMS_sendDataToLastClient(ctx->tx_data_buffer, ctx->tx_data_position);
        vPortFree(ctx->tx_data_buffer);
    }
    ctx->tx_data_position = 0;
    ctx->tx_data_buffer = 0;
}

void COMMS_pushEvent(Event evt){
    min_send_frame(COMMS_UART, MIN_ID_EVENT, (uint8_t *) &evt, sizeof(Event));
}

void COMMS_eventHook(Event evt){
    char cBuffer[16];
    uint32_t ulIPAddress, ulNetMask, ulGatewayAddress, ulDNSServerAddress;
    
    COMMS_pushEvent(evt);
    char buffer[50];
    
    switch(evt){
        case ETH_INIT_FAIL:
            COMMS_pushAlarm(ALARM_PRIO_CRITICAL, "Fibernet initialization failed: LAN9250 could not be initialized, retrying", ALARM_NO_VALUE);
            TERM_printDebug(term, "LAN9250 initialization failed!\r\n");
            break;
            
        case ETH_INIT_DONE:
            COMMS_pushAlarm(ALARM_PRIO_INFO, "LAN9250 initialization complete", ALARM_NO_VALUE);
            TERM_printDebug(term, "LAN9250 initialized\r\n");
            break;
            
        case ETH_LINK_UP:
            TERM_printDebug(term, "link up\r\n");
            break;
            
        case ETH_LINK_DOWN:
            TERM_printDebug(term, "link down\r\n");
            break;
            
        case ETH_DHCP_SUCCESS:
            
            FreeRTOS_GetAddressConfiguration( &ulIPAddress, &ulNetMask, &ulGatewayAddress, &ulDNSServerAddress );
            FreeRTOS_inet_ntoa( ulIPAddress, cBuffer );
            snprintf(buffer,sizeof(buffer),"DHCP Successful (IP=%s)", cBuffer);
            COMMS_pushAlarm(ALARM_PRIO_INFO, buffer, ALARM_NO_VALUE);
            TERM_printDebug(term, "DHCP Successful (IP=%s)\r\n", cBuffer);
            break;
            
        case ETH_DHCP_FAIL:
            FreeRTOS_GetAddressConfiguration( &ulIPAddress, &ulNetMask, &ulGatewayAddress, &ulDNSServerAddress );
            FreeRTOS_inet_ntoa( ulIPAddress, cBuffer );
            TERM_printDebug(term, "DHCP Failed - reverted to defaults (IP=%s)\r\n", cBuffer);
            break;
            
        case FS_CARD_CONNECTED:
            TERM_printDebug(term, "SD card connected\r\n");
            break;
            
        case FS_CARD_REMOVED:
            TERM_printDebug(term, "SD card removed\r\n");
            break;
            
        case FTP_CLIENT_CONNECTED:
            TERM_printDebug(term, "FTP client connected\r\n");
            break;
            
        case FTP_CLIENT_DISCONNECTED:
            TERM_printDebug(term, "FTP client disconnected\r\n");
            break;
            
        default:
            UART_print("unknown Event received\r\n");
    }
}

void COMMS_pushAlarm(uint8_t level, char* message, int32_t value){
    uint8_t * pl = pvPortMalloc(sizeof(MIN_ALARM_PAYLOAD_DESCRIPTOR) + strlen(message) + 1);
    memset(pl, 0, sizeof(MIN_ALARM_PAYLOAD_DESCRIPTOR) + strlen(message) + 1);
    
    MIN_ALARM_PAYLOAD_DESCRIPTOR * alarmPayload = (MIN_ALARM_PAYLOAD_DESCRIPTOR *) pl;
    char * alarmMessage = (char *) (&pl[sizeof(MIN_ALARM_PAYLOAD_DESCRIPTOR)]);
    
    alarmPayload->level = level;
    alarmPayload->value = value;
    strcpy(alarmMessage, message);
    
    min_send_frame(COMMS_UART, MIN_ID_ALARM, pl, sizeof(MIN_ALARM_PAYLOAD_DESCRIPTOR) + strlen(message) + 1);
    vPortFree(pl);
}


//WARNING: UNSAFE, NEEDS TO BE RE-CODED!
void COMMS_dumpPacket(uint8_t * data, uint16_t length){
    return;
    UART_print("\r\nPacket dump:\r\n");
    
    char * buff = pvPortMalloc(length * 7);
    uint16_t currPos = 0;
    uint16_t nls = 0;
    for(;currPos < length; currPos++){
        sprintf(&buff[(currPos*5)+nls], "%s0x%02x ", data[currPos], (currPos % 16 == 0) ? "\r\n" : ((currPos % 8 == 0) ? " " : ""));
        if(currPos % 16 == 0) nls += 2; else if(currPos % 8 == 0) nls += 1;
    }
    min_send_frame(COMMS_UART, MIN_ID_DEBUG, buff, (currPos*5)+nls);
    vPortFree(buff);
    
    UART_print("\r\n---------\r\n");
}

uint8_t CMD_ioTop(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    uint8_t currArg = 0;
    uint8_t returnCode = TERM_CMD_EXIT_SUCCESS;
    for(;currArg<argCount; currArg++){
        if(strcmp(args[currArg], "-?") == 0){
            ttprintf("shows packet throughput\r\n");
            return TERM_CMD_EXIT_SUCCESS;
        }
    }
    
    TermProgram * prog = pvPortMalloc(sizeof(TermProgram));
    prog->inputHandler = CMD_ioTop_handleInput;
    TERM_sendVT100Code(handle, _VT100_RESET, 0); TERM_sendVT100Code(handle, _VT100_CURSOR_POS1, 0);
    returnCode = xTaskCreate(CMD_ioTop_task, "iotop", configMINIMAL_STACK_SIZE + 125, handle, tskIDLE_PRIORITY + 1, &prog->task) ? TERM_CMD_EXIT_PROC_STARTED : TERM_CMD_EXIT_ERROR;
    if(returnCode == TERM_CMD_EXIT_PROC_STARTED) TERM_attachProgramm(handle, prog);
    return returnCode;
}

void CMD_ioTop_task(void *pvParameters){
    TERMINAL_HANDLE * handle = (TERMINAL_HANDLE*)pvParameters;
    while(1){
        TERM_sendVT100Code(handle, _VT100_CURSOR_POS1, 0);
        ttprintf("%sioTop - %d\r\nAll datarates are in bytes/s and packets/s respectively\r\n", UART_getVT100Code(_VT100_ERASE_LINE_END, 0), xTaskGetTickCount());
        
        ttprintf("%s%s%s", UART_getVT100Code(_VT100_BACKGROUND_COLOR, _VT100_WHITE), UART_getVT100Code(_VT100_ERASE_LINE_END, 0), UART_getVT100Code(_VT100_FOREGROUND_COLOR, _VT100_BLACK));
        ttprintf("Connection \r\x1b[%dCDatarate last \r\x1b[%dCDatarate avg \r\x1b[%dCPacketrate last \r\x1b[%dCPacketrate avg \r\x1b[%dCTotal packet count\r\n", 11, 30, 49, 68, 87);
        ttprintf("%s", UART_getVT100Code(_VT100_RESET_ATTRIB, 0));
        
        ttprintf("%sUDP (rx) \r\x1b[%dC%d", UART_getVT100Code(_VT100_ERASE_LINE_END, 0), 11, ConnectionStats.rxDataRateLast); 
        ttprintf("\r\x1b[%dC%d \r\x1b[%dC%d \r\x1b[%dC%d \r\x1b[%dC%d\r\n", 30, ConnectionStats.rxDataRateAVG, 49, ConnectionStats.rxPacketRateLast, 68, ConnectionStats.rxPacketRateAVG, 87, ConnectionStats.rxPacketsTotal);
        
        ttprintf("%sUART (rx) \r\x1b[%dC%d", UART_getVT100Code(_VT100_ERASE_LINE_END, 0), 11, ConnectionStats.txDataRateLast); 
        ttprintf("\r\x1b[%dC%d \r\x1b[%dC%d \r\x1b[%dC%d \r\x1b[%dC%d\r\n", 30, ConnectionStats.txDataRateAVG, 49, ConnectionStats.txPacketRateLast, 68, ConnectionStats.txPacketRateAVG, 87, ConnectionStats.txPacketsTotal);
        
        vTaskDelay(pdMS_TO_TICKS(500));
    }
}

uint8_t CMD_ioTop_handleInput(TERMINAL_HANDLE * handle, uint16_t c){
    switch(c){
        case 'q':
        case 0x03:
            vTaskDelete(handle->currProgram->task);
            vPortFree(handle->currProgram);
            TERM_removeProgramm(handle);
            return TERM_CMD_EXIT_SUCCESS;
        default:
            return TERM_CMD_CONTINUE;
    }
}

uint8_t CMD_testAlarm(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    uint8_t currArg = 0;
    for(;currArg<argCount; currArg++){
        if(strcmp(args[currArg], "-?") == 0){
            ttprintf("sends a test alarm with a value\r\nUsage:\r\n\ttestAlarm [alarm priority] [alarm text] ([alarm value])");
            return TERM_CMD_EXIT_SUCCESS;
        }
    }
    
    if(argCount < 2) return TERM_CMD_EXIT_ERROR;
    
    uint8_t level = atoi(args[0]);
    uint32_t value = ALARM_NO_VALUE;
    if(argCount == 3){
        value = atoi(args[2]);
    }
    
    if(argCount == 2) COMMS_pushAlarm(level, args[1], ALARM_NO_VALUE);
    if(argCount == 3) COMMS_pushAlarm(level, args[1], atoi(args[2]));
    
    ttprintf("Sent alarm: priority %d, text \"%s\", value %d%s (lenghth = %d)\r\n", level, args[1], value, (value == ALARM_NO_VALUE) ? " (no value)" : "", sizeof(MIN_ALARM_PAYLOAD_DESCRIPTOR) + strlen(args[1]) + 1);
    
    return TERM_CMD_EXIT_SUCCESS;
}

eDHCPCallbackAnswer_t xApplicationDHCPHook( eDHCPCallbackPhase_t eDHCPPhase, uint32_t ulIPAddress ){
    
eDHCPCallbackAnswer_t eReturn;
uint32_t ulStaticIPAddress, ulStaticNetMask;

  /* This hook is called in a couple of places during the DHCP process, as
  identified by the eDHCPPhase parameter. */
    switch( eDHCPPhase ){
        case eDHCPPhasePreDiscover  :
        /* A DHCP discovery is about to be sent out.  eDHCPContinue is
        returned to allow the discovery to go out.

        If eDHCPUseDefaults had been returned instead then the DHCP process
        would be stopped and the statically configured IP address would be
        used.

        If eDHCPStopNoChanges had been returned instead then the DHCP
        process would be stopped and whatever the current network
        configuration was would continue to be used. */
        if(dhcpEnable){
            eReturn = eDHCPContinue;
        }else{
            eReturn = eDHCPStopNoChanges;
        }
        break;

    case eDHCPPhasePreRequest  :
      /* An offer has been received from the DHCP server, and the offered
      IP address is passed in the ulIPAddress parameter.  Convert the
      offered and statically allocated IP addresses to 32-bit values. */
      ulStaticIPAddress = FreeRTOS_inet_addr_quick( IP_ADDRESS[0],
                                                    IP_ADDRESS[1],
                                                    IP_ADDRESS[2],
                                                    IP_ADDRESS[3] );

      ulStaticNetMask = FreeRTOS_inet_addr_quick( NETMASK[0],
                                                  NETMASK[1],
                                                  NETMASK[2],
                                                  NETMASK[3] );

      /* Mask the IP addresses to leave just the sub-domain octets. */
      ulStaticIPAddress &= ulStaticNetMask;
      ulIPAddress &= ulStaticNetMask;

      /* Are the sub-domains the same? */
      if( ulStaticIPAddress == ulIPAddress )
      {
        /* The sub-domains match, so the default IP address can be
        used.  The DHCP process is stopped at this point. */
        eReturn = eDHCPUseDefaults;
      }
      else
      {
        /* The sub-domains don?t match, so continue with the DHCP
        process so the offered IP address is used. */
        eReturn = eDHCPContinue;
      }

      break;

    default :
      /* Cannot be reached, but set eReturn to prevent compiler warnings
      where compilers are disposed to generating one. */
      eReturn = eDHCPContinue;
      break;
  }

  return eReturn;
}
void help_ifconfig(TERMINAL_HANDLE * handle){
    ttprintf("\teth0 [ip]\r\n");
    ttprintf("\tnetmask [netmask]\r\n");
    ttprintf("\tgw [netmask]\r\n");
    ttprintf("\tdhcp\r\n");
}

uint8_t CMD_ifconfig(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    uint8_t currArg = 0;
    uint32_t ip;
    for(;currArg<argCount; currArg++){
        if(strcmp(args[currArg], "-?") == 0){
            help_ifconfig(handle);
            return TERM_CMD_EXIT_SUCCESS;
        }
        if(strcmp(args[currArg], "eth0") == 0){
            if(++currArg<argCount){
                dhcpEnable = pdFALSE;                      
                ip=FreeRTOS_inet_addr(args[currArg]);
                if(ip){
                    FreeRTOS_SetIPAddress(ip);
                }else{
                    help_ifconfig(handle);
                    return TERM_CMD_EXIT_SUCCESS;
                }
            }else{
               help_ifconfig(handle);
               return TERM_CMD_EXIT_SUCCESS;
            }
        }
        if(strcmp(args[currArg], "netmask") == 0){
            if(++currArg<argCount){
                dhcpEnable = pdFALSE;
                ip=FreeRTOS_inet_addr(args[currArg]);
                if(ip){
                    FreeRTOS_SetNetmask(ip);
                }else{
                    help_ifconfig(handle);
                    return TERM_CMD_EXIT_SUCCESS;
                }
            }else{
                help_ifconfig(handle);
                return TERM_CMD_EXIT_SUCCESS;
            }
        }
        if(strcmp(args[currArg], "gw") == 0){
            if(++currArg<argCount){
                dhcpEnable = pdFALSE;
                ip=FreeRTOS_inet_addr(args[currArg]);
                if(ip){
                    FreeRTOS_SetGatewayAddress(ip);
                }else{
                    help_ifconfig(handle);
                    return TERM_CMD_EXIT_SUCCESS;
                }
            }else{
                help_ifconfig(handle);
                return TERM_CMD_EXIT_SUCCESS;
            }
        }
        if(strcmp(args[currArg], "dhcp") == 0){
            dhcpEnable = pdTRUE;
            vDHCPProcess(pdTRUE);
        }
    }
    
    uint32_t ulIPAddress, ulNetMask, ulGatewayAddress, ulDNSServerAddress;
    char buff[16];
    FreeRTOS_GetAddressConfiguration(&ulIPAddress, &ulNetMask, &ulGatewayAddress, &ulDNSServerAddress);
    ttprintf("eth0\r\x1b[%dCLink type: Ethernet  HWaddr %02x:%02x:%02x:%02x:%02x:%02x\r\n", 7, MAC_ADDRESS[0], MAC_ADDRESS[1], MAC_ADDRESS[2], MAC_ADDRESS[3], MAC_ADDRESS[4], MAC_ADDRESS[5]);
    FreeRTOS_inet_ntoa(ulIPAddress, buff);
    ttprintf("\x1b[%dCinet addr: %s ", 7, buff); 
    FreeRTOS_inet_ntoa(ulNetMask, buff);
    ttprintf("Mask: %s\r\n", buff);
    FreeRTOS_inet_ntoa(ulGatewayAddress, buff);
    ttprintf("\x1b[%dCgateway: %s ", 7, buff);
    FreeRTOS_inet_ntoa(ulDNSServerAddress, buff);
    ttprintf("dns: %s\r\n\n", buff);
    
    return TERM_CMD_EXIT_SUCCESS;
}