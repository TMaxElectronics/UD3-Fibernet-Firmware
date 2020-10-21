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
#include "FreeRTOS/Core/include/semphr.h"
#include "FiberComms.h"
#include "include/LAN9250.h"

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
SemaphoreHandle_t UART_rxDMAOverflow;

unsigned freeNextData = 0;

void UART_init(uint32_t baud, volatile uint32_t* TXPinReg, uint8_t RXPinReg){
    U2MODE = 0b1000000000001000;                //UART Module ON, U1RX and U1TX only, Autobaud off, 8bit Data no parity, High Speed mode off
    U2STA = 0b0001010000000000;                 //Tx interrupt when at leasts one byte can be written, Rx & Tx enabled, Rx interrupt when buffer not empty
    if(baud > 250000){
        U2MODEbits.BRGH = 1;
        U2BRG = (configPERIPHERAL_CLOCK_HZ / (4 * baud)) - 1;
    }else{
        U2MODEbits.BRGH = 0;
        U2BRG = (configPERIPHERAL_CLOCK_HZ / (16 * baud)) - 1;
    }

    U2RXR = RXPinReg;
    *TXPinReg = 0b0010;
    
    //IEC1SET = _IEC1_U2RXIE_MASK;
    //IPC9bits.U2IP = 3;
    //IPC9bits.U2IS = 3;

    UART_sendString("                                                                                                       ", 1);
    UART_sendString("                                                                                                       ", 1);
    UART_sendString("                                                                                                       ", 1);        //clear terminal trash
    UART_sendString(UART_getVT100Code(_VT100_RESET, 0), 0);
    UART_sendString("                                                                                                       ", 1);        //clear terminal trash
   
    UART_sendQueue = xQueueCreate(35, sizeof(UART_SENDQUE_ELEMENT*));
    
    UART_txDMA = xSemaphoreCreateBinary();
    UART_rxDMAOverflow = xSemaphoreCreateBinary();
    xSemaphoreGive(UART_txDMA);
    xSemaphoreGive(UART_rxDMAOverflow);
    
    //setup RX & TX DMA
    //TX channel
    DCH2CON = 0b00000000;   //channel is off (enabled once transmission starts), no chaining, channel auto enable is off, prio 1
    DCH2ECON = (_UART2_TX_IRQ << 8) | 0b10000;       //transmit byte on UART TX done
    DCH2SSA = 0; //(source start) is to be set before each transfer
    DCH2DSA = KVA_TO_PA(&U2TXREG);   //write into the SPI buffer
    
    //DCH0SSIZ (source size) is to be set before each transfer
    DCH2DSIZ = 1;   // destination size - 1 byte
    DCH2CSIZ = 1;   // Cell size - copy one byte every time the interrupt fires
    
    DCH2INT = _DCH2INT_CHBCIE_MASK; //interrupt once the transfer is completed
    IEC1SET = _IEC1_DMA2IE_MASK;
    IPC10bits.DMA2IP = 4;
    IPC10bits.DMA2IS = 4;
    
    
    //RX channel
    DCH3CON = 0b00000001;   //channel is off, no chaining, channel auto enable is off, prio 3
    DCH3ECON = (_UART2_RX_IRQ << 8) | 0b10000;       //transmit byte on SPI TX done
    DCH3SSA = KVA_TO_PA(&U2RXREG);
    DCH3DSA = 0;
    
    DCH3SSIZ = 1;   // source size - 1 byte
    DCH3DSIZ = MIN_MAX_PACKETSIZE + 30; //maximum packet size (data) + sizeof(MIN_HEADER)
    DCH3CSIZ = 1;   // Cell size - copy one byte every time the interrupt fires
    
    DCH3INT = _DCH1INT_CHBCIE_MASK; //interrupt once the transfer is completed
    IEC1SET = _IEC1_DMA3IE_MASK;
    IPC10bits.DMA3IP = 4;
    IPC10bits.DMA3IS = 4;
    
    xTaskCreate(UART_sendTask, "SendTask", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 1, NULL);
    xTaskCreate(UART_receiveTask, "RecvTask", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 2, NULL);
    //xTaskCreate(UART_bufferOverflowHandler, "OfloHndl", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY + 4, NULL);
}

void UART_sendTask( void *pvParameters ){
    UART_SENDQUE_ELEMENT * toSendData;
    while(1){
        if(xQueueReceive(UART_sendQueue, &toSendData, 1000)){
            if(toSendData != 0){
                if(toSendData->dataLength > 0){
                    if(!toSendData->freeAfterSend){
                        ETH_dumpPackt(toSendData->data, toSendData->dataLength);
                    }
                    UART_sendBytes(toSendData->data, toSendData->dataLength, toSendData->freeAfterSend);
                }else{
                    UART_sendString(toSendData->data, 0);
                }
                //vPortFree(toSendData->data); //don't free the data pointer yet, as DMA is still transmitting stuff and will do so itself after completion
                vPortFree(toSendData);
            }
        }
    }
}

void __ISR(_DMA3_VECTOR) UART_rxDmaOverflowHook(){
    IFS1CLR = _IFS1_DMA3IF_MASK;
    
    if((DCH3INT & _DCH3INT_CHBCIF_MASK) != 0){
        DCH3INTCLR = _DCH3INT_CHBCIF_MASK;
        
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;
        xSemaphoreGiveFromISR(UART_rxDMAOverflow, &xHigherPriorityTaskWoken);
        portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
    }
    //TODO handle errors
}

void UART_bufferOverflowHandler(void *pvParameters){
    while(1){
        //TODO handle overflow
    }
}

volatile uint32_t lastScanPosition = 0;
uint32_t currPackageOffset = 0;
uint8_t * currBuff;
    

void UART_receiveTask(void *pvParameters){
    currBuff = pvPortMalloc(MIN_MAX_PACKETSIZE + 11);
    DCH3DSA = KVA_TO_PA(currBuff);
    DCH3CONSET = _DCH3CON_CHEN_MASK;
    
    //set this after the first detected end sequence
    unsigned receiverLocked = 0;
    
    while(1){
        uint32_t nextSegmentLength = (DCH3DPTR + currPackageOffset) - lastScanPosition;
        configASSERT(nextSegmentLength < 0xffff);
    
        configASSERT(currPackageOffset || (DCH3DPTR >= lastScanPosition));
        
        if(nextSegmentLength > 0){
            uint8_t * currData = &currBuff[lastScanPosition];
            lastScanPosition += nextSegmentLength;
            
            min_poll(COMMS_UART, currData, nextSegmentLength);
        }
        
        if(U2STAbits.FERR || U2STAbits.OERR){
            U2MODEbits.ON = 0;
            U2STAbits.OERR = 0;
            U2STAbits.FERR = 0;
            U2MODEbits.ON = 1;
            U2STAbits.URXEN = 1;
            LED_errorFlashHook();
        }
        
        vTaskDelay(5);
    }
}

void UART_packetEndHandler(){
    taskENTER_CRITICAL();
                
    //disable DMA so we can copy the remaining data without getting any new in
    DCH3CONCLR = _DCH3CON_CHEN_MASK;

    //the amount of bytes in the buffer, after the packet end
    uint32_t remainingBytes = DCH3DPTR - lastScanPosition;

    //create the new Buffer, copy the remaining data into it and the n deal with the old one
    uint8_t * lastBuff = currBuff;
    currBuff = pvPortMalloc(MIN_MAX_PACKETSIZE + 30);
    memcpy(currBuff, &lastBuff[lastScanPosition + 1], remainingBytes);

    //set DMA to copy [maxPacketLength - bytesWeAlredyGot] bytes from UART to
    DCH3DSIZ = (MIN_MAX_PACKETSIZE + 11) - remainingBytes;
    DCH3DSA = KVA_TO_PA(&currBuff[remainingBytes]);
    DCH3CONSET = _DCH3CON_CHEN_MASK;

    currPackageOffset = remainingBytes;
    lastScanPosition = 0;
    //we are at the beginning of the buffer again (we didn't yet check the bytes we just copied)
    
    taskEXIT_CRITICAL();
}

void UART_sendString(char *data, unsigned newLine){
    //return;
    while((*data) != 0){
        UART_sendChar(*data++);
    }
    if(newLine){
        UART_sendChar('\r');
        UART_sendChar('\n');
    }
}

void UART_print(char * format, ...){
#ifdef UART_ALLOW_DEBUG
    va_list arg;
    va_start (arg, format);
    
    uint8_t * buff = (uint8_t*) pvPortMalloc(256);
    uint32_t length = vsprintf(buff, format, arg);
    UART_queBuffer(buff, length, 1);
    //if(!xQueueSend(UART_sendQueue, &buff, 10)) vPortFree(buff);
    
    va_end (arg);
#endif
}

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

void __ISR(_DMA2_VECTOR) UART_txDmaFinishedCallback(){
    IFS1CLR = _IFS1_DMA2IF_MASK;
    
    if((DCH2INT & _DCH2INT_CHBCIF_MASK) != 0){
        DCH2INTCLR = _DCH2INT_CHBCIF_MASK;
        
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;
        xSemaphoreGiveFromISR(UART_txDMA, &xHigherPriorityTaskWoken);
        portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
    }
    //TODO handle errors
}

void UART_sendBytes(uint8_t * data, uint32_t length, unsigned freeAfterSend){
    if(!xSemaphoreTake(UART_txDMA, 1000)){ 
        UART_sendString("\r\nUART TX DMA start timeout!\r\n", 1); //write data directly to the UART fifo
        return;
    }
    
    //If this is non zero, then there is still an allocated buffer for the last message, which we need to free
    if(DCH2SSA != 0 && freeNextData){
        vPortFree(PA_TO_KVA1(DCH2SSA));
    }
    
    DCH2SSA = KVA_TO_PA(data);
    DCH2SSIZ = length;
    DCH2CONSET = _DCH2CON_CHEN_MASK;
    freeNextData = freeAfterSend;
    //DCH2ECONSET = _DCH2ECON_CFORCE_MASK;
}

void UART_sendChar(char data){
    while(U2STAbits.UTXBF);
    U2TXREG = data;
}

void UART_clearOERR(){
    U2STAbits.OERR = 0;
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

void UART_setBaud(uint64_t newBaud){
    if(newBaud > 1000000){
        U2MODEbits.BRGH = 1;
        U2BRG = (configPERIPHERAL_CLOCK_HZ / (4 * newBaud)) - 1;
    }else{
        U2MODEbits.BRGH = 0;
        U2BRG = (configPERIPHERAL_CLOCK_HZ / (16 * newBaud)) - 1;
    }
}

unsigned UART_isOERR(){
    return U2STAbits.OERR;
}

const char * UART_getVT100Code(uint16_t cmd, uint8_t var){
    switch(cmd){
        case _VT100_RESET:
            return "\x1bC";
            
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

uint32_t UART_getBaud(){
    return (configPERIPHERAL_CLOCK_HZ/ (((U2MODEbits.BRGH) ? 4 : 16) * (U2BRG+1)));
}

void UART_setCursorPosVT100(uint8_t line, uint8_t col){
    UART_print("%c[%d;%dH", 0x1b, line, col);
}