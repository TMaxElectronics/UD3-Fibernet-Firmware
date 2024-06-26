/*
 * File:   startup.c
 * Author: Thorb
 *
 * Created on 27. Oktober 2020, 08:45
 */


#include <xc.h>
#include <string.h>
#include <stdio.h>

#include "FreeRTOS.h"
#include "task.h"
#include "FreeRTOS_Sockets.h"
#include "min.h"
#include "FiberComms.h"
#include "min_id.h"
#include "startup.h"
#include "LAN9250.h"
#include "FatFs/include/ff.h"
#include "FS.h"
#include "FTP.h"
#include "System.h"
#include "THex/include/THex.h"
#include "include/UART.h"
#include "ini.h"
#include "LED.h"
#include "ConfigPerformance.h"

uint8_t MAC_ADDRESS[6] = {DEF_MAC_ADDR};
uint8_t IP_ADDRESS[4] = {DEF_IP_ADDRESS};
uint8_t NETMASK[4] = {DEF_NETMASK};
uint8_t DNSIP[4] = {DEF_DNSIP};
uint8_t GATEWAYIP[4] = {DEF_GATEWAYIP};

unsigned deviceReady = 0;
char * UD3_name;
char * UD3_sn;
static void startupTask();
static void crcReset();
static uint32_t crcProc(uint8_t byte);
static void prvSetupHardware();
uint32_t BL_result;

void startServices(){
    BL_result = TMR2;
    TMR2 = 0;
    
    prvSetupHardware();
    COMMS_init();
    
    TERM_addCommand(CMD_getBLState, "getBLState", "shows the last bootloader exit code", 0, &TERM_cmdListHead);
    TERM_addCommand(CMD_verify, "verify", "verifies a pic bootfile", 0, &TERM_cmdListHead);
    
    //create the FS task. (checks for SD card connection/removal)
    xTaskCreate(FS_task, "fs Task", configMINIMAL_STACK_SIZE + 200, NULL , tskIDLE_PRIORITY + 1, NULL);
    //TODO optimize stack usage and figure out why it needs to be this large
    
    xTaskCreate(startupTask, "startTsk", configMINIMAL_STACK_SIZE + 400, NULL , tskIDLE_PRIORITY + 2, NULL);
}



//as long as the network is not ready, we won't process any data for the transport protocol, so we call this handler instead
unsigned startupMINHandler(uint8_t min_id, uint8_t * min_payload, uint16_t len_payload, void * port){
    switch(min_id){
        case 0xff:
            vPortFree(min_payload);
            break;
            
        case MIN_ID_EVENT:
            if(len_payload == 0) break;
            switch(min_payload[0]){
                case EVENT_GET_INFO:
                    
                    if(deviceReady) return 0;
                    
                    crcReset();
                    EVENT_ID_RESPONSE * data = (EVENT_ID_RESPONSE *) min_payload;
                    
                    if(data->struct_version > 1) break;
                    
                    //we have received the info struct so we set all of our parameters
                    
                    //out serial number is the crc32 of the ID bytes, so lets calculate that
                    uint32_t serialNr = 0;
                    uint8_t * id = (uint8_t *) &data->unique_id;
                    uint8_t currByte = 0;
                    for(currByte = 0; currByte < 8; currByte ++) serialNr = crcProc(id[currByte]);
                    
#ifndef configUSE_DEFAULT_MAC
                    //copy the data to the mac adress array
                    memcpy(&MAC_ADDRESS[2], &serialNr, 4);
#endif
                    
                    //copy the UD3 name
                    UD3_name = pvPortMalloc(16);
                    memcpy(UD3_name, &data->udname, 16);
                    
                    //convert the serial number into a hex string
                    UD3_sn = pvPortMalloc(11);
                    sprintf(UD3_sn, "%x", serialNr);
                    
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

#define u32IP(addr) *(uint32_t*)addr

static int handler(void* user, const char* section, const char* name, const char* value){
    #define MATCH(s, n) strcmp(section, s) == 0 && strcmp(name, n) == 0

    if (MATCH("network", "dhcp")) {
        if(strcmp(value,"false")==0){
            DHCP_enable(pdFALSE);
        }else{
            DHCP_enable(pdTRUE);  
        } 
    } else if (MATCH("network", "ip")) {
        if(DHCP_enabled()==0){
            u32IP(IP_ADDRESS) = FreeRTOS_inet_addr(value);
            FreeRTOS_SetIPAddress(u32IP(IP_ADDRESS));
        }
    } else if (MATCH("network", "netmask")) {
        if(DHCP_enabled()==0){
            u32IP(NETMASK) = FreeRTOS_inet_addr(value);
            FreeRTOS_SetIPAddress(u32IP(NETMASK));
        }
    } else if (MATCH("network", "gateway")) {
        if(DHCP_enabled()==0){
            u32IP(GATEWAYIP) = FreeRTOS_inet_addr(value);
            FreeRTOS_SetIPAddress(u32IP(GATEWAYIP));
        }
    } else if (MATCH("network", "dns")) {
        if(DHCP_enabled()==0){
            u32IP(DNSIP) = FreeRTOS_inet_addr(value);
            FreeRTOS_SetIPAddress(u32IP(DNSIP));
        }
    } else if (MATCH("com", "baudrate")) {
        UART_setBaud(atoi(value));
    } 


    return 1;
}

#define INI_N_TRYS 5

//wait for the UD3 to boot so we can get the id and calculate our mac address
static void startupTask(void * params){
    
    vTaskDelay(200);
    
    int flag=0;
    for(int i=0;i<INI_N_TRYS;i++){
        flag = ini_parse("config.ini", handler, NULL);
        if(flag==0){
            break;
        }
        vTaskDelay(200);
    }
    if(flag != 0){
        COMMS_pushAlarm(ALARM_PRIO_WARN, "FiberNet: No config file starting default", ALARM_NO_VALUE);
        DHCP_enable(pdTRUE);
    }

    COMMS_pushAlarm(ALARM_PRIO_INFO, "FiberNet: is waiting for ID", ALARM_NO_VALUE);
    
    //wait for the startupMINHandler to receive the response to MIN_ID_EVENT, and continously send the request 
    while(1){
        if(deviceReady) break;
        vTaskDelay(pdMS_TO_TICKS(100));
        min_send_frame(COMMS_UART, MIN_ID_EVENT, "\x01", 1);
    }
    
    //the configuration is ready -> start networking
    FreeRTOS_IPInit(IP_ADDRESS, NETMASK, GATEWAYIP, DNSIP, MAC_ADDRESS);
    
    //create the listener tasks
    
    xTaskCreate(FTP_task, "ftp Task", configMINIMAL_STACK_SIZE + 50, NULL , tskIDLE_PRIORITY + 1, NULL);
    xTaskCreate(COMMS_udpDataHandler, "udpRecv", configMINIMAL_STACK_SIZE + 50, NULL , tskIDLE_PRIORITY + 2, NULL);
    xTaskCreate(COMMS_udpDiscoverHandler, "udpDisc", configMINIMAL_STACK_SIZE + 50, NULL , tskIDLE_PRIORITY + 1, NULL);
    xTaskCreate(COMMS_statsHandler, "paCcount", configMINIMAL_STACK_SIZE , NULL , tskIDLE_PRIORITY + 1, NULL);
    
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
    
    //enable pull up on the SD card detect pin
    CNPUASET = _CNPUA_CNPUA0_MASK;
    
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

    LED_init();
}

uint8_t CMD_getBLState(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    uint8_t currArg = 0;
    for(;currArg<argCount; currArg++){
        if(strcmp(args[currArg], "-?") == 0){
            ttprintf("shows the status given to us by the bootloader");
            return TERM_CMD_EXIT_SUCCESS;
        }
    }
    
    if(BL_result <= BOOTLOADER_EXIT_UPDATE_COMPLETE){
        ttprintf("BL_EXITCODE=%s\r\n", SYS_BOOTCODES[BL_result]);
    }else{
        ttprintf("BL_EXITCODE=%d (invalid)\r\n", BL_result);
    }
    
    return TERM_CMD_EXIT_SUCCESS;
}

uint8_t CMD_verify(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    uint8_t currArg = 0;
    uint8_t scannedFiles = 0;
    uint8_t validFiles = 0;
    uint8_t invalidFiles = 0;
    for(;currArg<argCount; currArg++){
        if(strcmp(args[currArg], "-?") == 0){
            ttprintf("verifies a pic boot file\r\nUsage:\r\n\tverify [filename]");
            return TERM_CMD_EXIT_SUCCESS;
        }else{
            
            FIL* file = f_open(args[currArg], FA_READ);
            if(file){
                unsigned res = BL_verifyFile(file, handle);
                ttprintf("\"%s\" is %s", args[currArg], res ? "valid" : "invalid");
                f_close(file);
            }else{
                ttprintf("\"%s\" could not be found", args[currArg]);
            }
        }
    }
    
    return TERM_CMD_EXIT_SUCCESS;
}

unsigned BL_verifyFile(FIL * file, TERMINAL_HANDLE * handle){
    unsigned ret = 1;
    char * buff = pvPortMalloc(64);
    THexFileInfo * fileInfo = pvPortMalloc(sizeof(THexFileInfo));
    uint8_t * dBuff = pvPortMalloc(32);
    
    uint32_t fileLength = f_size(file);
    uint32_t lengthRead = 0;
    uint32_t totalRead = 0;
    uint8_t perc = 0;
    uint8_t percTenth;
    uint8_t lastPerc = 0;
    TERM_sendVT100Code(handle, _VT100_CURSOR_DISABLE, 0);
    
    while(f_gets(buff, 64, file) != 0){
        THexResult_t res = THEX_parseString(fileInfo, buff, 0, 0);
        if(res == THEX_EOF) break;
        
        totalRead += strlen(buff);
        perc = (totalRead * 100) / fileLength;
        if(perc != lastPerc){
            lastPerc = perc;
            percTenth = perc / 10;
            ttprintf("scanning <%s%.*s%s%.*s%s> (%d%%)\r", TERM_getVT100Code(_VT100_FOREGROUND_COLOR, _VT100_GREEN), percTenth, SYS_fullBar, TERM_getVT100Code(_VT100_FOREGROUND_COLOR, _VT100_RED), 10-percTenth, SYS_emptyBar, TERM_getVT100Code(_VT100_FOREGROUND_COLOR, _VT100_WHITE), perc);
        }
        
        if(res != THEX_OK && res < 0x1000){ 
            ret = 0;
        }
    }
    
    TERM_sendVT100Code(handle, _VT100_CURSOR_ENABLE, 0);
    TERM_sendVT100Code(handle, _VT100_ERASE_LINE, 0);
    
    vPortFree(buff);
    vPortFree(fileInfo);
    return ret;
}