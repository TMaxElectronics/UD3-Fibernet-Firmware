

typedef struct {
    uint8_t id;
    uint8_t struct_version;
    uint32_t unique_id[2];
    char udname[16];   
} EVENT_ID_RESPONSE;

//if you want to use the default mac address (de:ad:be:ef:fe:ed), uncomment the following line (networking will still wait for the UD3 info)
//#define configUSE_DEFAULT_MAC

#define EVENT_GET_INFO      1

extern uint8_t MAC_ADDRESS[6];
extern uint8_t IP_ADDRESS[4];
extern uint8_t NETMASK[4];
extern uint8_t DNSIP[4];
extern uint8_t GATEWAYIP[4];

extern char * UD3_name;
extern char * UD3_sn;
extern unsigned deviceReady;

void startServices();
unsigned startupMINHandler(uint8_t min_id, uint8_t * min_payload, uint16_t len_payload, void * port);
uint8_t CMD_getBLState(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
uint8_t CMD_verify(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
unsigned BL_verifyFile(FIL * file, TERMINAL_HANDLE * handle);