/*
        UART Driver for pic32
        Copyright Sep. 2018 TMAX-Electronics.de
 */

#include <stdio.h>
#include <xc.h>
#include <string.h>
#include <stdarg.h>
#include <sys/attribs.h>
#include <sys/kmem.h>
#include "UART.h"
#include "FreeRTOSConfig.h"
#include "FreeRTOS.h"
#include "queue.h"
#include "stream_buffer.h"
#include "LED.h"
#include "semphr.h"
#include "FiberComms.h"
#include "LAN9250.h"
#include "min.h"
#include "min_id.h"
#include "TTerm.h"

// Special protocol bytes
enum {
    HEADER_BYTE = 0xaaU,
    STUFF_BYTE = 0x55U,
    EOF_BYTE = 0x55U,
};

typedef struct{
    uint16_t dataLength;
    unsigned freeAfterSend;
    uint8_t * data;
} UART_SENDQUE_ELEMENT;

QueueHandle_t UART_sendQueue;
SemaphoreHandle_t UART_txDMA;

volatile uint8_t UART_bootloader = pdFALSE;

volatile uint32_t lastScanPosition = 0;
uint32_t currPackageOffset = 0;
uint8_t * UART_rxBuffer;

unsigned freeNextData = 0;

void UART_init(uint32_t baud, volatile uint32_t* TXPinReg, uint8_t RXPinReg){
    //basic module initialisation
    U2MODE = 0b0000000000001000;                    //UART Module OFF, no flow control, Autobaud off, 8bit Data no parity
    U2STA = 0b0001010000000000;                     //Tx interrupt when at leasts one byte can be written, Rx interrupt when buffer not empty, Rx & Tx enabled
    
    //setup the baud rate generator, if the baud rate is over 250000 it is worth switchign to the high speed mode to allow for a higher programming resolution
    if(baud > 250000){
        U2MODEbits.BRGH = 1;
        U2BRG = (configPERIPHERAL_CLOCK_HZ / (4 * baud)) - 1;
    }else{
        U2MODEbits.BRGH = 0;
        U2BRG = (configPERIPHERAL_CLOCK_HZ / (16 * baud)) - 1;
    }
    
    
    //set PPS so the selected pins
    U2RXR = RXPinReg;
    *TXPinReg = 0b0010;
    
    
    //allocate permanent buffers
    UART_rxBuffer = pvPortMalloc(UART_BUFFERSIZE);
    
    
    //setup RX & TX DMA
    
    //TX channel
    DCH2CON = 0b00000000;                           //channel is off (enabled once transmission starts), no chaining, channel auto enable is off, prio 1
    DCH2ECON = (_UART2_TX_IRQ << 8) | 0b10000;      //transmit byte on UART TX done
    
    DCH2INT = _DCH2INT_CHBCIE_MASK;                 //interrupt once the transfer is completed
    IEC1SET = _IEC1_DMA2IE_MASK;
    IPC10bits.DMA2IP = 4;
    IPC10bits.DMA2IS = 3;
    
    DCH2SSA = 0;                                    //(source start) is to be set before each transfer
    DCH2DSA = KVA_TO_PA(&U2TXREG);                  //write into the SPI buffer
    
    //DCH0SSIZ (source size) is to be set before each transfer
    DCH2DSIZ = 1;                                   // destination size - 1 byte
    DCH2CSIZ = 1;                                   // Cell size - copy one byte every time the interrupt fires
    
    
    //Rx channel goes into a ring buffer
    DCH3CON = 0b10010010;                           //channel is on, no chaining, channel auto enable is on, priority 2
    DCH3ECON = (_UART2_RX_IRQ << 8) | 0b10000;      //start cell transfer on byte on _UART2_RX_IRQ
    DCH3INT = 0;                                    //no interrupts
    
    DCH3SSA = KVA_TO_PA(&U2RXREG);
    DCH3DSA = KVA_TO_PA(UART_rxBuffer);
    
    DCH3SSIZ = 1;                                   //source size - 1 byte (UART data register)
    DCH3DSIZ = UART_BUFFERSIZE;                     //destination size - start over once the entire buffer has been written
    DCH3CSIZ = 1;                                   //Cell size - copy one byte every time the interrupt fires
    

    //init RTOS specific stuff
    UART_sendQueue = xQueueCreate(35, sizeof(UART_SENDQUE_ELEMENT*));       //contains pointers to the buffer to be send
    
    UART_txDMA = xSemaphoreCreateBinary();                                  //semaphore signaling that the TX DMA is currently transmitting data
    xSemaphoreGive(UART_txDMA); //is this actually necessary?
    
    //Serial Send / Receive Tasks
    xTaskCreate(UART_sendTask, "SSendTsk", configMINIMAL_STACK_SIZE + 50, NULL, tskIDLE_PRIORITY + 4, NULL);
    xTaskCreate(UART_receiveTask, "SRecvTsk", configMINIMAL_STACK_SIZE + 175, NULL, tskIDLE_PRIORITY + 2, NULL);//<-----250 alt
    
    //enable the UART module (we need the RX DMA running before this point to avoid an overflow in the time that we initialize other stuff)
    U2MODEbits.ON = 1;
}

void UART_sendTask( void *pvParameters ){
    UART_SENDQUE_ELEMENT * toSendData;
    while(1){
        //get the pointer to the element to be sent
        if(xQueueReceive(UART_sendQueue, &toSendData, 1000)){
            //if this is NULL, then something went wrong, discard this buffer position
            if(toSendData != NULL){
                //if the length field has a zero value somebody tried to write the deprecated TYPE_STRING, which we just ignore and free the data
                if(toSendData->dataLength > 0){
                    UART_sendBytes(toSendData->data, toSendData->dataLength, toSendData->freeAfterSend);
                }else{
                    if(toSendData->data != NULL) vPortFree(toSendData->data);
                }
                
                //free the data pointer struct. It is in 
                vPortFree(toSendData);
            }
        }
    }
}

void __ISR(_DMA2_VECTOR) UART_txDmaFinishedCallback(){
    IFS1CLR = _IFS1_DMA2IF_MASK;
    
    if((DCH2INT & _DCH2INT_CHBCIF_MASK) != 0){
        //the transfer has finished => clear the IF and return the semaphore
        DCH2INTCLR = _DCH2INT_CHBCIF_MASK;
        
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;
        xSemaphoreGiveFromISR(UART_txDMA, &xHigherPriorityTaskWoken);
        portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
    }
    //TODO handle errors
}

void UART_sendBytes(uint8_t * data, uint32_t length, unsigned freeAfterSend){
    //wait for the DMA to become available (this should never happen as the only task calling this is the UART_sendTask, but just incase somebody tries to send data directly)
    if(!xSemaphoreTake(UART_txDMA, 1000)){ 
        UART_sendString("\r\nUART TX DMA start timeout!\r\n", 1);
        return;
    }
    
    //set dma parameters for the current buffer
    DCH2SSA = KVA_TO_PA(data);
    DCH2SSIZ = length;
    
    //start the transfer
    DCH2CONSET = _DCH2CON_CHEN_MASK;
    
    //wait for the dma to finish
    if(!xSemaphoreTake(UART_txDMA, 1000)){ 
        UART_sendString("\r\nUART TX DMA finish timeout!\r\n", 1);
    }
    
    //if the buffer we are transmitting expects to bee freed do so
    if(freeAfterSend) vPortFree(PA_TO_KVA1(DCH2SSA));
    
    //return the DMA state to avaiable
    xSemaphoreGive(UART_txDMA);
}

void UART_receiveTask(void *pvParameters){
    while(1){
//if UART_DEBUG_DATA is defined we just send all of the data in the uart buffer to the last client, without inspecting it for any protocol 
#ifdef UART_DEBUG_DATA
        if(lastScanPosition != DCH3DPTR){
            char * buff = pvPortMalloc(100);
            uint16_t currPos = 0;
            while(lastScanPosition != DCH3DPTR){
                LED_minPacketReceivedHook();
                buff[currPos++] = *(UART_rxBuffer + lastScanPosition);
                min_poll(COMMS_UART, UART_rxBuffer + lastScanPosition, 1);
                if(++lastScanPosition >= DCH3DSIZ) lastScanPosition = 0;
            }
            COMMS_sendDataToLastClient(buff, currPos);
            vPortFree(buff);
        }
#else
        while(lastScanPosition != DCH3DPTR && UART_bootloader == pdFALSE){
            min_poll(COMMS_UART, &UART_rxBuffer[lastScanPosition], 1);
            if(++lastScanPosition >= DCH3DSIZ) lastScanPosition = 0;
        }
#endif
        
        if(UART_isOERR()){
            //an overrun error has occurred. some bytes will have been lost at this point, which MIN will have to deal with
            UART_clearOERR();
            LED_errorFlashHook();
        }
        
        if(UART_isFERR()){
            //a framing error has occurred, this means that the baud rate is probably set wrong
            UART_clearFERR();
            LED_errorFlashHook();
        }
        vTaskDelay(pdMS_TO_TICKS(2));
    }
}
void UART_flush(){
    memset(UART_rxBuffer,0, UART_BUFFERSIZE);
    lastScanPosition = DCH3DPTR;
}

//support functions:

//sends a string directly to the output buffer, incase there is some dramatic error
//we don't use the semaphore here as this will only be called from a context where an error prevents the semaphore from being released (tx error, _general_exception_handler, vAssert, etc.)
void UART_sendString(char *data, unsigned newLine){
    while((*data) != 0){
        while(U2STAbits.UTXBF);
        U2TXREG = *data++;
    }
    if(newLine){
        UART_sendChar('\r');
        UART_sendChar('\n');
    }
}

uint32_t UART_printDebug(char * format, ...){
    //surely the must be a better way to do this
#ifdef UART_ALLOW_DEBUG
    va_list arg;
    va_start (arg, format);
    
    uint8_t * buff = (uint8_t*) pvPortMalloc(256);
    uint32_t length = vsprintf(buff, format, arg);
    min_send_frame(COMMS_UART, MIN_DEBUG, buff, length);
    vPortFree(buff);
    //if(!xQueueSend(UART_sendQueue, &buff, 10)) vPortFree(buff);
    
    va_end (arg);
#endif
}

//send data to the debug min ID
uint32_t UART_print(char * format, ...){
    va_list arg;
    va_start (arg, format);
    
    uint8_t * buff = (uint8_t*) pvPortMalloc(256);
    uint32_t length = vsprintf(buff, format, arg);
    
    configASSERT(length < 256);
    
    min_send_frame(COMMS_UART, MIN_ID_DEBUG, buff, length);
    
    vPortFree(buff);
    
    va_end (arg);
    return length;
}

//send data to the debug min ID
uint32_t UART_termPrint(void * port, char * format, ...){
    va_list arg;
    va_start (arg, format);
    
    uint8_t * buff = (uint8_t*) pvPortMalloc(256);
    uint32_t length = vsprintf(buff, format, arg);
    
    configASSERT(length < 256);
    
    min_send_frame(COMMS_UART, MIN_ID_DEBUG, buff, length);
    
    vPortFree(buff);
    
    va_end (arg);
    return length;
}

//write data into the transmit queue
void UART_queBuffer(uint8_t * data, uint32_t length, unsigned freeAfterSend){
    UART_SENDQUE_ELEMENT * toSendData = pvPortMalloc(sizeof(UART_SENDQUE_ELEMENT));
    toSendData->dataLength = length;
    toSendData->data = data;
    toSendData->freeAfterSend = freeAfterSend;
    if(!xQueueSend(UART_sendQueue, &toSendData, 10)){ //queue buffer to be sent out via UART. If we can't enqueue it we have to free it
        if(freeAfterSend) vPortFree(toSendData->data);
        vPortFree(toSendData);
    }
}

uint32_t UART_queEmpty(){
    if(uxQueueMessagesWaiting(UART_sendQueue)){
        return pdFALSE;
    }else{
        return pdTRUE;
    }
}

void UART_setBaud(uint64_t newBaud){
    if(newBaud > 250000){
        U2MODEbits.BRGH = 1;
        U2BRG = (configPERIPHERAL_CLOCK_HZ / (4 * newBaud)) - 1;
    }else{
        U2MODEbits.BRGH = 0;
        U2BRG = (configPERIPHERAL_CLOCK_HZ / (16 * newBaud)) - 1;
    }
}

uint32_t UART_getBaud(){
    return (configPERIPHERAL_CLOCK_HZ/ (((U2MODEbits.BRGH) ? 4 : 16) * (U2BRG+1)));
}

inline unsigned UART_isOERR(){
    return (U2STA & _U2STA_OERR_MASK) != 0;
}

inline unsigned UART_isFERR(){
    return (U2STA & _U2STA_FERR_MASK) != 0;
}

inline void UART_clearOERR(){
    U2STACLR = _U2STA_OERR_MASK;
}

inline void UART_clearFERR(){
    U2STACLR = _U2STA_FERR_MASK;
}

//returns a static pointer to the requested VT100 code, so it can be used in printf without needing any free() call afterwards
const char * UART_getVT100Code(uint16_t cmd, uint8_t var){
    //INFO this is deprecated since all of the VT100 functions are handled by the terminal now
    switch(cmd){
        case _VT100_RESET:
            return "\x1b" "C";
            
        case _VT100_CURSOR_BACK:
            return "\x1b[D";
            
        case _VT100_CURSOR_FORWARD:
            return "\x1b[C";
            
        case _VT100_CURSOR_POS1:
            return "\x1b[H";
            
        case _VT100_CURSOR_END:
            return "\x1b[F";
        case _VT100_FOREGROUND_COLOR:
            switch(var){
                case 0:
                    return "\x1b[30m";
                case 1:
                    return "\x1b[31m";
                case 2:
                    return "\x1b[32m";
                case 3:
                    return "\x1b[33m";
                case 4:
                    return "\x1b[34m";
                case 5:
                    return "\x1b[35m";
                case 6:
                    return "\x1b[36m";
                case 7:
                    return "\x1b[37m";
                default:
                    return "\x1b[30m";
            }
            
        case _VT100_BACKGROUND_COLOR:
            switch(var){
                case 0:
                    return "\x1b[40m";
                case 1:
                    return "\x1b[41m";
                case 2:
                    return "\x1b[42m";
                case 3:
                    return "\x1b[43m";
                case 4:
                    return "\x1b[44m";
                case 5:
                    return "\x1b[45m";
                case 6:
                    return "\x1b[46m";
                case 7:
                    return "\x1b[47m";
                default:
                    return "\x1b[40m";
            }
            
        case _VT100_RESET_ATTRIB:
            return "\x1b[0m";
            
        case _VT100_BRIGHT:
            return "\x1b[1m";
            
        case _VT100_DIM:
            return "\x1b[2m";
            
        case _VT100_UNDERSCORE:
            return "\x1b[4m";
            
        case _VT100_BLINK:
            return "\x1b[5m";
            
        case _VT100_REVERSE:
            return "\x1b[7m";
            
        case _VT100_HIDDEN:
            return "\x1b[8m";
            
        case _VT100_ERASE_SCREEN:
            return "\x1b[2J";
            
        case _VT100_ERASE_LINE:
            return "\x1b[2K";
            
        case _VT100_FONT_G0:
            return "\x1b(";
            
        case _VT100_FONT_G1:
            return "\x1b)";
            
        case _VT100_WRAP_ON:
            return "\x1b[7h";
            
        case _VT100_WRAP_OFF:
            return "\x1b[71";
            
        case _VT100_ERASE_LINE_END:
            return "\x1b[K";
            
    }
    return "";
}

//DEPRECATED LEGACY FUNCTIONS (WILL BE REMOVED SOONER OR LATER)

void UART_sendChar(char data){
    while(U2STAbits.UTXBF);
    U2TXREG = data;
}

inline unsigned UART_dataAvailable(){
    return U2STAbits.URXDA;
}

unsigned char UART_getChar(){
    return U2RXREG;
}

void UART_disableRX(){
    U2STAbits.URXEN = 0;
}

void UART_enableRX(){
    U2STAbits.URXEN = 1;
}

void UART_setCursorPosVT100(uint8_t line, uint8_t col){
    UART_printDebug("%c[%d;%dH", 0x1b, line, col);
}