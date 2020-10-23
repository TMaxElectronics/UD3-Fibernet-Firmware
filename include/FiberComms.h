#include <xc.h>
#include <stdint.h>

#define FIND_MAX_RESPONSE_SIZE 512

#define COMMS_DATA_PORT 1337
#define COMMS_DISCOVER_PORT 50022

#define COMMS_UDP_BUFFER_SIZE 300

#define ALARM_PRIO_INFO       0
#define ALARM_PRIO_WARN       1
#define ALARM_PRIO_ALARM      2
#define ALARM_PRIO_CRITICAL   3

#define MIN_FRAME_INVALID 0xffff
#define MIN_NON_TRANSPORT_FRAME 0xfffe

extern struct min_context * COMMS_UDP;
extern struct min_context * COMMS_UART;

typedef enum{
    ETH_INIT_FAIL,
    ETH_LINK_UP,
    ETH_LINK_DOWN,
    ETH_DHCP_SUCCESS,
    ETH_DHCP_FAIL,
}EthEvent;

typedef struct{
    uint8_t level;
    uint8_t value;
} MIN_ALARM_PAYLOAD_DESCRIPTOR;

extern char FIND_queryString[];

void COMMS_init();
void COMMS_udpDataHandler(void * params);
void COMMS_udpDiscoverHandler(void * params);
void COMMS_sendDataToLastClient(uint8_t * data, uint16_t dataLength);
uint16_t min_checkUDPFrame(uint8_t * data);
void COMMS_ethEventHook(EthEvent evt);
void COMMS_pushAlarm(uint8_t level, char* message, int32_t value);
void COMMS_dumpPacket(uint8_t * data, uint16_t length);