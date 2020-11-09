#include <stdarg.h>
#include <stdio.h>

#include "FTP.h"
#include "FreeRTOS.h"
#include "FreeRTOS_Sockets.h"
#include "FreeRTOS_IP.h"
#include "TTerm.h"
#include "ff.h"
#include "System.h"
#include "FS.h"
#include "FiberComms.h"

#define FTP_SERVER_PORT 21
#define FTP_DATA_PORT 20

#define FTP_PERMISSION_ROOT 0xaa
#define FTP_PERMISSION_ANONYMOUS 0xee
#define FTP_PERMISSION_NONE 0


TermCommandDescriptor FTP_cmdListHead = {.nextCmd = 0};
unsigned FTP_cmdsAdded = 0;
static const TickType_t xReceiveTimeOut = pdMS_TO_TICKS(10000);
static const TickType_t xTransmitTimeOut = pdMS_TO_TICKS(1000);

typedef enum{
    FTP_DISCONNECTED = 0,
    FTP_CONNECTED = 1,
    FTP_AUTHENTICATED = 2,
}FTP_STATE;

typedef struct{
    FTP_STATE state;
    char * currUSRBuffer;
    uint8_t privilegeLevel;
    Socket_t clientRX;
    Socket_t clientTX;
    struct freertos_sockaddr clientAddr;
    char * cwdPath;
    
}FTP_CLIENT_HANDLE;

static void print(void * port, char * format, ...);
static void FTP_clientTask(void *pvParameters);
static void FTP_errorPrinter(TERMINAL_HANDLE * handle, uint32_t retCode);
static void FTP_closeTranferSocket(FTP_CLIENT_HANDLE * client);
static unsigned FTP_openTranferSocket(FTP_CLIENT_HANDLE * client);
static uint16_t FTP_generateDirlistEntry(FILINFO * fno, char * dst);
static uint8_t FTP_testCommandHandler(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
static uint8_t FTP_SYST(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
static uint8_t FTP_PASS(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
static uint8_t FTP_USER(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
static uint8_t FTP_AUTH(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
static uint8_t FTP_FEAT(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
static uint8_t FTP_PWD(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
static uint8_t FTP_TYPE(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
static uint8_t FTP_PASV(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
static uint8_t FTP_PORTCMD(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
static uint8_t FTP_LIST(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
static uint8_t FTP_CWD(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
static uint8_t FTP_CDUP(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
static uint8_t FTP_MKD(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
static uint8_t FTP_RMD(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
static uint8_t FTP_STOR(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
static uint8_t FTP_RETR(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
static uint8_t FTP_DELE(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);

void FTP_task(void * params){
    //setup the server socket and start listening
    
    struct freertos_sockaddr xClient, xServAddress;   
    Socket_t xListeningSocket, xConnectedSocket;
    socklen_t xSize = sizeof(xClient);
    const BaseType_t xBacklog = 20;
    
	xListeningSocket = FreeRTOS_socket(FREERTOS_AF_INET, FREERTOS_SOCK_STREAM, FREERTOS_IPPROTO_TCP);
    
	configASSERT(xListeningSocket != FREERTOS_INVALID_SOCKET);
	FreeRTOS_setsockopt(xListeningSocket, 0, FREERTOS_SO_RCVTIMEO, &xReceiveTimeOut, sizeof(xReceiveTimeOut));
	xServAddress.sin_port = FreeRTOS_htons(FTP_SERVER_PORT);
    
	FreeRTOS_bind(xListeningSocket, &xServAddress, sizeof(xServAddress));
	FreeRTOS_listen(xListeningSocket, xBacklog);
    
    //if the ftp commands aren't added yet, do so now
    //the FTP runs a TTerm console in the background to interpret the commands
    if(!FTP_cmdsAdded){
        FTP_cmdsAdded = 1;
        TERM_addCommand(FTP_SYST,       "SYST", 0, 0, &FTP_cmdListHead);
        TERM_addCommand(FTP_PASS,       "PASS", 0, 0, &FTP_cmdListHead);
        TERM_addCommand(FTP_USER,       "USER", 0, 0, &FTP_cmdListHead);
        TERM_addCommand(FTP_AUTH,       "AUTH", 0, 0, &FTP_cmdListHead);
        TERM_addCommand(FTP_FEAT,       "FEAT", 0, 0, &FTP_cmdListHead);
        TERM_addCommand(FTP_PWD ,       "PWD",  0, 0, &FTP_cmdListHead);
        TERM_addCommand(FTP_TYPE,       "TYPE", 0, 0, &FTP_cmdListHead);
        TERM_addCommand(FTP_PASV,       "PASV", 0, 0, &FTP_cmdListHead);
        TERM_addCommand(FTP_PORTCMD,    "PORT", 0, 0, &FTP_cmdListHead);
        TERM_addCommand(FTP_LIST,       "LIST", 0, 0, &FTP_cmdListHead);
        TERM_addCommand(FTP_CWD,        "CWD",  0, 0, &FTP_cmdListHead);
        TERM_addCommand(FTP_CDUP,       "CDUP", 0, 0, &FTP_cmdListHead);
        TERM_addCommand(FTP_RETR,       "RETR", 0, 0, &FTP_cmdListHead);
        TERM_addCommand(FTP_MKD,        "MKD",  0, 0, &FTP_cmdListHead);
        TERM_addCommand(FTP_RMD,        "RMD",  0, 0, &FTP_cmdListHead);
        TERM_addCommand(FTP_STOR,       "STOR", 0, 0, &FTP_cmdListHead);
        TERM_addCommand(FTP_DELE,       "DELE", 0, 0, &FTP_cmdListHead);
    }

	while(1){
        //wait for a connection
		xConnectedSocket = FreeRTOS_accept( xListeningSocket, &xClient, &xSize );
        
        //create a new client task if the socket received is valid
        if(xConnectedSocket != NULL){
            //initialise the client handle
            FTP_CLIENT_HANDLE * newClient = pvPortMalloc(sizeof(FTP_CLIENT_HANDLE));
            memset(newClient, 0, sizeof(FTP_CLIENT_HANDLE));
            newClient->clientRX = xConnectedSocket;
            newClient->clientTX = 0;
            
            //set the timeouts for the newly created socket
            FreeRTOS_setsockopt(newClient->clientRX, 0, FREERTOS_SO_RCVTIMEO, &xReceiveTimeOut, sizeof(xReceiveTimeOut));
            FreeRTOS_setsockopt(newClient->clientRX, 0, FREERTOS_SO_SNDTIMEO, &xReceiveTimeOut, sizeof(xReceiveTimeOut));
            
            //create the terminal handle with the FTP_CLIENT_HANDLE as the port, and disable text echo
            TERMINAL_HANDLE * term = TERM_createNewHandle(print, (void *) newClient, 0, &FTP_cmdListHead, FTP_errorPrinter, "FTP");
            
            //create the task that will take care of the new client. Needs a lot of stack because of FatFs :(
            xTaskCreate(FTP_clientTask, "FTP Client", configMINIMAL_STACK_SIZE + 300, (void *) term, tskIDLE_PRIORITY + 1, NULL);
        }
	}
}

//a custom error printing routine, that sends FTP status codes
static void FTP_errorPrinter(TERMINAL_HANDLE * handle, uint32_t retCode){
    switch(retCode){
        case TERM_CMD_EXIT_NOT_FOUND:
        case TERM_CMD_EXIT_ERROR:
            ttprintf("504 dude get on my level bitch\r\n");
            break;
    }
}

//TTerm compatible print function to send data to the client
static void print(void * port, char * format, ...){
    va_list arg;
    va_start(arg, format);
    
    uint8_t * buff = (uint8_t*) pvPortMalloc(256);
    uint32_t length = vsprintf(buff, format, arg);
    
    FreeRTOS_send(((FTP_CLIENT_HANDLE *) port)->clientRX, buff, length, 0);
    
    vPortFree(buff);
    
    va_end(arg);
}

static void FTP_clientTask(void *pvParameters){
    //convert the parameter pointer back to the correct types
    TERMINAL_HANDLE * handle = (TERMINAL_HANDLE *) pvParameters;
    FTP_CLIENT_HANDLE * client = (FTP_CLIENT_HANDLE *) handle->port;
    
    //initialise the current working directory path
    client->cwdPath = pvPortMalloc(2);
    memcpy(client->cwdPath, "/", 2);

	uint8_t * rxBuffer = (uint8_t *) pvPortMalloc(ipconfigTCP_MSS);

    //tell the world that we have a new client
    COMMS_eventHook(FTP_CLIENT_DISCONNECTED);
    
    //print the welcome message
    print((void*) client, "220 Hello There\r\n");

    //loop as long as the client is connected
    while(1){
        int32_t byteCount = FreeRTOS_recv(client->clientRX, rxBuffer, ipconfigTCP_MSS, 0);

        if(byteCount >= 0){
            TERM_processBuffer(rxBuffer, byteCount, handle);
        }else{
            //if we get a < 0 byteCount back, we have had an error and can't continue
            break;
        }
    }
    
    //tell the world that we are going to kill ourselves
    COMMS_eventHook(FTP_CLIENT_DISCONNECTED);
    
    //close the transfer socket if one is still open (this can theoretically never happen)
    FTP_closeTranferSocket(client);

    //begin a graceful shutdown of our socket
	FreeRTOS_shutdown( client->clientRX, FREERTOS_SHUT_RDWR);

    //wait for the connection to be closed
	TickType_t xTimeOnShutdown = xTaskGetTickCount();
	while((xTaskGetTickCount() - xTimeOnShutdown) < 1000){
		if(FreeRTOS_recv(client->clientRX, rxBuffer, ipconfigTCP_MSS, 0) < 0) break;
	} 

    //free the buffer and close the socket
	vPortFree(rxBuffer);
	FreeRTOS_closesocket(client->clientRX);
    
    //free other leftovers we might have
    if(client->currUSRBuffer != 0) vPortFree(client->currUSRBuffer);
    vPortFree(client->cwdPath);
    vPortFree(client);
    
    //destroy the terminal handle
    TERM_destroyHandle(handle);
    
    //and finally kill ourselves, nice
	vTaskDelete(NULL);
    while(1);
}

/*
 * FTP Auth:
 * Requests the server to establish an encrypted connection
 */
static uint8_t FTP_AUTH(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    //we don't support encryption
    ttprintf("530 NO\r\n");
    return TERM_CMD_EXIT_SUCCESS;
}

/*
 * FTP User:
 * provides the username for the session
 */
static uint8_t FTP_USER(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    if(argCount != 1){
        ttprintf("501 NO\r\n");
        return TERM_CMD_EXIT_ERROR;
    }
    
    //store the username until we get the PASS command
    char * tempUsr = pvPortMalloc(strlen(args[0]) + 1);
    FTP_CLIENT_HANDLE * client = (FTP_CLIENT_HANDLE *) handle->port;
    strcpy(tempUsr, args[0]);
    client->currUSRBuffer = tempUsr;
    ttprintf("331 go on. im listening\r\n");
    
    return TERM_CMD_EXIT_SUCCESS;
}

/*
 * FTP Pass:
 * Provides the password for the user.
 * It requires the USER verb to be sent beforehand
 */
static uint8_t FTP_PASS(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    FTP_CLIENT_HANDLE * client = (FTP_CLIENT_HANDLE *) handle->port;
    if(argCount != 1 || client->currUSRBuffer == 0){
        ttprintf("503 NO\r\n");
        client->privilegeLevel = FTP_PERMISSION_NONE;
        return TERM_CMD_EXIT_ERROR;
    }
    
    //check if the client is logging in as the bootMaster, if so we elevate the permissions to FTP_PERMISSION_ROOT
    if(strcmp(client->currUSRBuffer, "bootMaster") == 0 && strcmp(args[0], "ud3789") == 0){
        client->privilegeLevel = FTP_PERMISSION_ROOT;
    }else{
        client->privilegeLevel = FTP_PERMISSION_ANONYMOUS;
    }
    
    ttprintf("230 Hello my friend\r\n");
    
    //free the username buffer
    vPortFree(client->currUSRBuffer);
    client->currUSRBuffer = 0;
    
    return TERM_CMD_EXIT_SUCCESS;
}

/*
 * FTP SYST:
 * get system information
 */
static uint8_t FTP_SYST(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    ttprintf("215 UNIX but actually freeRTOS on a pic32mx\r\n");
    return TERM_CMD_EXIT_SUCCESS;
}

/*
 * FTP FEAT:
 * get features... that we don't have
 */
static uint8_t FTP_FEAT(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    ttprintf("211 yes, but actually no\r\n");
    return TERM_CMD_EXIT_SUCCESS;
}

/*
 * FTP PWD:
 * prints the current working directory
 */
static uint8_t FTP_PWD(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    FTP_CLIENT_HANDLE * client = (FTP_CLIENT_HANDLE *) handle->port;
    ttprintf("257 \"%s\"\r\n", client->cwdPath);
    return TERM_CMD_EXIT_SUCCESS;
}

/*
 * FTP TYPE:
 * requests a change of the connection type. We only support ASCII and binary at the moment
 */
static uint8_t FTP_TYPE(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    FTP_CLIENT_HANDLE * client = (FTP_CLIENT_HANDLE *) handle->port;
    if(argCount != 1){
        ttprintf("503 NO\r\n");
        return TERM_CMD_EXIT_ERROR;
    }
    
    if(strcmp(args[0], "I") == 0 || strcmp(args[0], "A") == 0){
        ttprintf("200 yas, veri nais\r\n");
    }else{
        ttprintf("504 nah can't do that sorry\r\n");
    }
    return TERM_CMD_EXIT_SUCCESS;
}

/*
 * FTP PASV:
 * requests change to passive mode, which I'm too lazy to implement...
 * I mean who would want to upgrade their tesla coils firmware from outside the network anyway?
 */
static uint8_t FTP_PASV(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    ttprintf("504 nah can't do that sorry\r\n");
    return TERM_CMD_EXIT_SUCCESS;
}

/*
 * FTP PORT:
 * provide the server with the IP address and port for the data socket
 */
static uint8_t FTP_PORTCMD(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    if(argCount != 1){
        ttprintf("503 NO\r\n");
        return TERM_CMD_EXIT_ERROR;
    }
    
    //separate the argument into the individual numbers of the address and port
    char * currPtr = args[0];
    uint8_t numbers[6];
    uint8_t currPos = 0;
    for(;currPos < 6; currPos++){
        char * temp = strchr(currPtr, ',');
        if(temp == 0){ 
            if(currPos == 5) numbers[currPos++] = atoi(currPtr);
            break;
        }
        *temp = 0;
        numbers[currPos] = atoi(currPtr);
        currPtr = temp + 1;
        if(*currPtr == 0) break;
    }
    
    //check that we actually got all the info we need
    if(currPos < 6){
        ttprintf("503 give more data blyat\r\n");
        return TERM_CMD_EXIT_ERROR;
    }
    
    //update the parameters of the client handle
    FTP_CLIENT_HANDLE * client = (FTP_CLIENT_HANDLE *) handle->port;
    client->clientAddr.sin_port = FreeRTOS_htons((numbers[4] * 256) + numbers[5]);
    client->clientAddr.sin_addr = FreeRTOS_inet_addr_quick(numbers[0], numbers[1], numbers[2], numbers[3]);
    
    ttprintf("200 lets go boyyyyys\r\n");
    
    return TERM_CMD_EXIT_SUCCESS;
}

/*
 * FTP LIST:
 * prints a directory list
 */
static uint8_t FTP_LIST(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    if(argCount != 0){
        ttprintf("504 NO\r\n");
        return TERM_CMD_EXIT_ERROR;
    }
    
    FRESULT res;
    DIR dir;
    UINT i;
    static FILINFO fno;
    char * buffer = pvPortMalloc(ipconfigTCP_MSS);
    uint16_t currPacketLength = 0;
    
    FTP_CLIENT_HANDLE * client = (FTP_CLIENT_HANDLE *) handle->port;
    
    //try to open the data socket
    if(!FTP_openTranferSocket(client)){
        vPortFree(buffer);
        ttprintf("550 couldn't open data socket\r\n", res);
        return TERM_CMD_EXIT_SUCCESS;
    }
    
    //start parsing the current directory
    res = f_opendir(&dir, client->cwdPath);                       /* Open the directory */
    if(res == FR_OK){
        ttprintf("150 ok get ready\r\n");
        while(1){
            //read the next entry
            res = f_readdir(&dir, &fno);          
            
            //check if it is valid, and not hidden
            if (res != FR_OK || fno.fname[0] == 0) break;  
            if(fno.fattrib & (AM_HID | AM_SYS)) continue;
            
            //generate a new entry string and append it to the list
            currPacketLength += FTP_generateDirlistEntry(&fno, (char *) ((uint32_t) buffer + currPacketLength));
            
            //if there is not enough space to fit another entry, send the data to the client and start over
            if(currPacketLength > ipconfigTCP_MSS - 300){
                FreeRTOS_send(client->clientTX, buffer, currPacketLength, 0);
                currPacketLength = 0;
            }
        }
        //clean up and send the last buffer
        f_closedir(&dir);
        FreeRTOS_send(client->clientTX, buffer, currPacketLength, 0);
        ttprintf("226 and thats it\r\n");
    }else{
        ttprintf("550 yo wtf (%d)\r\n", res);
    }
    
    //clean up even more
    FTP_closeTranferSocket(client);
    vPortFree(buffer);
    
    return TERM_CMD_EXIT_SUCCESS;
}

//generate a unix style directory list item, but without the time stuff
//for reference: https://www.ibm.com/support/knowledgecenter/ssw_ibm_i_74/rzaiq/rzaiqrzaiqfdrtu.htm
static uint16_t FTP_generateDirlistEntry(FILINFO * fno, char * dst){
    
    //is the entry a file or a directory?
    char type = '-';
    if(fno->fattrib & AM_DIR) type = 'd';
    
    //yeah the permissions are constant for now...
    char permissions[] = "rw-rw-rw-";
    
    //                   mode lnk own  grp  siz name
    return sprintf(dst, "%c%s %4d %-8d %-8d %8d %s\r\n", type, permissions, 1, 1337, 6077, fno->fsize, fno->fname);
}

//opens the data socket to the client, with the parameters specified in the PORT command
static unsigned FTP_openTranferSocket(FTP_CLIENT_HANDLE * client){
    if(client->clientTX != 0) return; //socket is already open
    struct freertos_sockaddr xSlavAddress;
    
    client->clientTX = FreeRTOS_socket(FREERTOS_AF_INET, FREERTOS_SOCK_STREAM, FREERTOS_IPPROTO_TCP);
    configASSERT(client->clientTX != FREERTOS_INVALID_SOCKET);
    
    FreeRTOS_setsockopt(client->clientTX, 0, FREERTOS_SO_RCVTIMEO, &xTransmitTimeOut, sizeof(xTransmitTimeOut));
    FreeRTOS_setsockopt(client->clientTX, 0, FREERTOS_SO_SNDTIMEO, &xTransmitTimeOut, sizeof(xTransmitTimeOut));
    
	xSlavAddress.sin_port = FreeRTOS_htons(FTP_DATA_PORT);
    
    FreeRTOS_bind(client->clientTX, &xSlavAddress, sizeof(xSlavAddress));
    
    return FreeRTOS_connect(client->clientTX, &client->clientAddr, sizeof(client->clientAddr));
}

//closes the data socket, if one is opened
static void FTP_closeTranferSocket(FTP_CLIENT_HANDLE * client){
    if(client->clientTX == 0) return; //the socket is already closed
    FreeRTOS_shutdown(client->clientTX, FREERTOS_SHUT_RDWR);
    uint8_t chicken[256];
    while(FreeRTOS_recv(client->clientTX, chicken, 256, 0) >= 0) vTaskDelay(pdMS_TO_TICKS(250));
    FreeRTOS_closesocket(client->clientTX);
    client->clientTX = 0;
}

/*
 * FTP CWD
 * set the current working directory
 */
static uint8_t FTP_CWD(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    if(argCount == 0){
        ttprintf("504 NO\r\n");
        return TERM_CMD_EXIT_ERROR;
    }
    
    FTP_CLIENT_HANDLE * client = (FTP_CLIENT_HANDLE *) handle->port;
    
    //reassemble the argument string, as FTP doesn't use ""
    uint8_t currArg = 1;
    for(;currArg < argCount; currArg++){
        *(args[currArg] - 1) = ' ';
    }
    
    //generate the new CWD path. This can include this like ../ and ./
    char * oldPath = client->cwdPath;
    char * newCWD = FS_newCWD(oldPath, args[0]);
    
    //check if the new path is valid
    DIR temp;
    FRESULT res = f_opendir(&temp, newCWD);                
    if(res == FR_OK){
        f_closedir(&temp);
        
        //update the cwd Path in the FTP_CLIENT_HANDLE
        vPortFree(client->cwdPath);
        client->cwdPath = newCWD;
        
        ttprintf("250 yeah\r\n");
    }else{
        //free the new string, if the path is invalid
        vPortFree(newCWD);
        ttprintf("550 oh he dead\r\n");
    }
    
    return TERM_CMD_EXIT_SUCCESS;
}

/*
 * FTP CDUP
 * go up one directory (same as cd ../)
 */
static uint8_t FTP_CDUP(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    if(argCount != 0){
        ttprintf("504 NO\r\n");
        return TERM_CMD_EXIT_SUCCESS;
    }
    
    FTP_CLIENT_HANDLE * client = (FTP_CLIENT_HANDLE *) handle->port;
    
    //assuming that the parent directory always exists, just check if we actually went back one
    if(FS_dirUp(client->cwdPath) == 0){
        ttprintf("550 nah forget about that\r\n");
    }else{
        ttprintf("250 yep\r\n");
    }
    
    return TERM_CMD_EXIT_SUCCESS;
}

/*
 * FTP RETR
 * get a file
 */
static uint8_t FTP_RETR(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    if(argCount == 0){
        ttprintf("504 NO\r\n");
        return TERM_CMD_EXIT_ERROR;
    }
    
    FRESULT res;
    FIL file;
    UINT numRead;
    char * buffer = pvPortMalloc(ipconfigTCP_MSS);
    
    FTP_CLIENT_HANDLE * client = (FTP_CLIENT_HANDLE *) handle->port;
    
    //reassemble argument string
    uint8_t currArg = 1;
    for(;currArg < argCount; currArg++){
        *(args[currArg] - 1) = ' ';
    }
    
    //create the path to the file
    char * filePath = FS_newCWD(client->cwdPath, args[0]);
    
    //open it
    res = f_open(&file, filePath, FA_READ);
    if(res == FR_OK){
    
        //open the data socket
        if(!FTP_openTranferSocket(client)){
            f_close(&file);  
            vPortFree(buffer);
            vPortFree(filePath);
            ttprintf("550 couldn't open data socket\r\n", res);
            return TERM_CMD_EXIT_SUCCESS;
        }
        
        //stream the file's data to the client
        ttprintf("150 ok get ready\r\n");
        while(1){
            res = f_read(&file, buffer, ipconfigTCP_MSS, &numRead); 
            if (res != FR_OK || numRead == 0) break;  
            BaseType_t sendRes = FreeRTOS_send(client->clientTX, buffer, numRead, 0);
            if(sendRes != numRead){
                break;
            }
        }
        
        //clean up
        f_close(&file);  
        ttprintf("226 and thats it\r\n");
        FTP_closeTranferSocket(client);
    }else{
        ttprintf("550 yo wtf (%d)\r\n", res);
    }
    
    vPortFree(buffer);
    vPortFree(filePath);
    
    return TERM_CMD_EXIT_SUCCESS;
}

/*
 * FTP STOR
 * write a file
 */
static uint8_t FTP_STOR(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    if(argCount == 0){
        ttprintf("504 NO\r\n");
        return TERM_CMD_EXIT_ERROR;
    }
    
    FRESULT res;
    FIL file;
    int32_t numRead;
    char * buffer = pvPortMalloc(ipconfigTCP_MSS);
    
    FTP_CLIENT_HANDLE * client = (FTP_CLIENT_HANDLE *) handle->port;
    
    //reassemble argument string
    uint8_t currArg = 1;
    for(;currArg < argCount; currArg++){
        *(args[currArg] - 1) = ' ';
    }
    
    //create the path to the file
    char * filePath = FS_newCWD(client->cwdPath, args[0]);
    
    //check if the file to be written already exists, if so, delete it
    res = f_open(&file, filePath, FA_READ);
    if(res == FR_OK){
        //File exists => kill it
        f_close(&file);  
        res = f_unlink(filePath);
        if(res != FR_OK){
            vPortFree(buffer);
            vPortFree(filePath);
            ttprintf("550 can't delete the old one sorry(%d)\r\n", res);
            return TERM_CMD_EXIT_SUCCESS;
        }
    }
    
    //open the file for writing
    res = f_open(&file, filePath, FA_WRITE | FA_OPEN_ALWAYS);
    if(res != FR_OK){
        vPortFree(buffer);
        vPortFree(filePath);
        ttprintf("550 can't create the file (%d)\r\n", res);
        return TERM_CMD_EXIT_SUCCESS;
    }
    
    ttprintf("150 day mne dannyye blyat\r\n", res);
    
    //open the data socket
    if(!FTP_openTranferSocket(client)){
        f_close(&file);  
        vPortFree(buffer);
        vPortFree(filePath);
        ttprintf("550 can't create the file (couldn't open data socket)\r\n", res);
        return TERM_CMD_EXIT_SUCCESS;
    }
    
    //stream data from the client and write it to the file
    while(1){
        numRead = FreeRTOS_recv(client->clientTX, buffer, ipconfigTCP_MSS, 0);
        if (numRead <= 0) break;  
        
        res = f_write(&file, buffer, numRead, &numRead); 
        
        if (res != FR_OK) break;
    }
    
    if(res == FR_OK){
        ttprintf("226 and thats it\r\n");
    }else{
        ttprintf("550 sorry I messed something up (%d)\r\n", res);
    }
    
    //clean up
    f_close(&file);  
    FTP_closeTranferSocket(client);
    
    vPortFree(buffer);
    vPortFree(filePath);
    
    return TERM_CMD_EXIT_SUCCESS;
}

/*
 * FTP RMD
 * removes a directory
 */
static uint8_t FTP_RMD(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    if(argCount == 0){
        ttprintf("504 NO\r\n");
        return TERM_CMD_EXIT_ERROR;
    }
    
    FRESULT res;
    DIR dir;
    UINT numRead;
    uint16_t itemCount = 0;
    static FILINFO fno;
    
    FTP_CLIENT_HANDLE * client = (FTP_CLIENT_HANDLE *) handle->port;
    
    //reassemble argument string
    uint8_t currArg = 1;
    for(;currArg < argCount; currArg++){
        *(args[currArg] - 1) = ' ';
    }
    
    char * dirPath = FS_newCWD(client->cwdPath, args[0]);
    
    //check if the directory even exists
    res = f_opendir(&dir, dirPath);
    if(res != FR_OK){
        vPortFree(dirPath);
        ttprintf("550 that doesn't exist(%d)\r\n", res);
        return TERM_CMD_EXIT_SUCCESS;
    }
    
    //check if the directory is empty
    res = f_readdir(&dir, &fno);                   
    if (res == FR_OK && fno.fname[0] != 0){
        f_closedir(&dir);
        vPortFree(dirPath);
        ttprintf("550 directory is not empty\r\n", res);
        return TERM_CMD_EXIT_SUCCESS;
    } 
    f_closedir(&dir);
    
    //remove it
    res = f_unlink(dirPath);
    if(res != FR_OK){
        ttprintf("550 can't delete the old one sorry(%d)\r\n", res);
    }else{
        ttprintf("250 done\r\n", res);
    }
    
    //clean up
    vPortFree(dirPath);
    
    return TERM_CMD_EXIT_SUCCESS;
}

/*
 * FTP MKD
 * creates a directory
 */
static uint8_t FTP_MKD(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    if(argCount == 0){
        ttprintf("504 NO\r\n");
        return TERM_CMD_EXIT_ERROR;
    }
    
    FRESULT res;
    DIR dir;
    UINT numRead;
    uint16_t itemCount = 0;
    static FILINFO fno;
    
    FTP_CLIENT_HANDLE * client = (FTP_CLIENT_HANDLE *) handle->port;
    
    //reassemble argument string
    uint8_t currArg = 1;
    for(;currArg < argCount; currArg++){
        *(args[currArg] - 1) = ' ';
    }
    
    char * dirPath = FS_newCWD(client->cwdPath, args[0]);
    
    //check if the directory exists
    res = f_opendir(&dir, dirPath);
    if(res == FR_OK){
        f_closedir(&dir);
        vPortFree(dirPath);
        ttprintf("550 that already exists exist\r\n");
        return TERM_CMD_EXIT_SUCCESS;
    }
    
    //create it
    res = f_mkdir(dirPath);
    if(res != FR_OK){
        ttprintf("550 didn't work (%d) :(\r\n", res);
    }else{
        ttprintf("250 ok\r\n");
    }
    
    vPortFree(dirPath);
    
    return TERM_CMD_EXIT_SUCCESS;
}

/*
 * FTP DELE
 * deletes a file
 */
static uint8_t FTP_DELE(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    if(argCount == 0){
        ttprintf("504 NO\r\n");
        return TERM_CMD_EXIT_ERROR;
    }
    
    FRESULT res;
    FIL file;
    
    FTP_CLIENT_HANDLE * client = (FTP_CLIENT_HANDLE *) handle->port;
    
    //reassemble argument string
    uint8_t currArg = 1;
    for(;currArg < argCount; currArg++){
        *(args[currArg] - 1) = ' ';
    }
    
    char * filePath = FS_newCWD(client->cwdPath, args[0]);
    
    //check if the file exists
    res = f_open(&file, filePath, FA_READ);
    if(res != FR_OK){
        vPortFree(filePath);
        ttprintf("550 that doesn't exist(%d)\r\n", res);
        return TERM_CMD_EXIT_SUCCESS;
    }
    f_close(&file);
    
    //and kill it
    res = f_unlink(filePath);
    if(res != FR_OK){
        ttprintf("550 can't delete the old one sorry(%d)\r\n", res);
    }else{
        ttprintf("250 done\r\n", res);
    }
    
    //finally clean up the mess
    vPortFree(filePath);
    
    return TERM_CMD_EXIT_SUCCESS;
}