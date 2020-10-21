



extern struct min_context * COMMS_UDP;
extern struct min_context * COMMS_UART;

void COMMS_init();
void COMMS_udpDataHandler(void * params);
void COMMS_udpDiscoverHandler(void * params);
void COMMS_sendDataToLastClient(uint8_t * data, uint8_t dataLength);