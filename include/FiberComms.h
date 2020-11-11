#ifndef FiberComms_H
#define FiberComms_H

#include <xc.h>
#include <stdint.h>
#include "FreeRTOS.h"
#include "stream_buffer.h"
#include "TTerm.h"

#define FIND_MAX_RESPONSE_SIZE 512

#define COMMS_DATA_PORT 1337
#define COMMS_DISCOVER_PORT 50022

#define COMMS_UDP_BUFFER_SIZE 300

#define ALARM_PRIO_INFO       0
#define ALARM_PRIO_WARN       1
#define ALARM_PRIO_ALARM      2
#define ALARM_PRIO_CRITICAL   3
#define ALARM_NO_VALUE        0x80000000

#define MIN_FRAME_INVALID 0xffff
#define MIN_NON_TRANSPORT_FRAME 0xfffe

extern struct min_context * COMMS_UDP;
extern struct min_context * COMMS_UART;

extern StreamBufferHandle_t terminal;

typedef enum{
    GET_INFO = 1,   
    ETH_INIT_FAIL = 2,
    ETH_INIT_DONE = 3,
    ETH_LINK_UP = 4,
    ETH_LINK_DOWN = 5,
    ETH_DHCP_SUCCESS = 6,
    ETH_DHCP_FAIL = 7,
    FS_CARD_CONNECTED = 8,
    FS_CARD_REMOVED = 9,
    FTP_CLIENT_CONNECTED = 10,
    FTP_CLIENT_DISCONNECTED = 11,
}Event;

typedef struct{
    uint8_t level;
    int32_t value;
}__attribute__((packed)) MIN_ALARM_PAYLOAD_DESCRIPTOR;

extern char FIND_queryString[];

void COMMS_init();
void COMMS_udpDataHandler(void * params);
void COMMS_udpDiscoverHandler(void * params);
void COMMS_sendDataToLastClient(uint8_t * data, uint16_t dataLength);
uint16_t min_checkUDPFrame(uint8_t * data);
void COMMS_eventHook(Event evt);
void COMMS_pushAlarm(uint8_t level, char* message, int32_t value);
void COMMS_dumpPacket(uint8_t * data, uint16_t length);
uint8_t CMD_ioTop_handleInput(TERMINAL_HANDLE * handle, uint16_t c);
void CMD_ioTop_task(void *pvParameters);
uint8_t CMD_ioTop(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
void COMMS_statsHandler(void * params);
uint8_t CMD_testAlarm(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
uint8_t CMD_ifconfig(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);

#endif