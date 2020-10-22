



extern struct min_context * COMMS_UDP;
extern struct min_context * COMMS_UART;

void COMMS_init();
void COMMS_udpDataHandler(void * params);
void COMMS_udpDiscoverHandler(void * params);
void COMMS_sendDataToLastClient(uint8_t * data, uint16_t dataLength);
uint16_t min_checkUDPFrame(uint8_t * data);