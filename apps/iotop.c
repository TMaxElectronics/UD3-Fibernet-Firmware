/*
 * TTerm
 *
 * Copyright (c) 2020 Thorben Zethoff, Jens Kerrinnes
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#include "iotop.h"
#include "string.h"

#define APP_NAME "iotop"
#define APP_DESCRIPTION "shows performance stats"
#define APP_STACK 250

static uint8_t CMD_main(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
static void TASK_main(void *pvParameters);
static uint8_t INPUT_handler(TERMINAL_HANDLE * handle, uint16_t c);

static ConnStats * ConnectionStats = NULL;

uint8_t iotop_stat_ptr(ConnStats * ptr){
    ConnectionStats = ptr;
}

uint8_t REGISTER_iotop(TermCommandDescriptor * desc){
    TERM_addCommand(CMD_main, APP_NAME, APP_DESCRIPTION, 0, desc); 
}

static uint8_t CMD_main(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    uint8_t currArg = 0;
    uint8_t returnCode = TERM_CMD_EXIT_SUCCESS;
    for(;currArg<argCount; currArg++){
        if(strcmp(args[currArg], "-?") == 0){
            ttprintf(APP_DESCRIPTION "\r\n");
            return TERM_CMD_EXIT_SUCCESS;
        }
    }
    
    TermProgram * prog = pvPortMalloc(sizeof(TermProgram));
    prog->inputHandler = INPUT_handler;
    TERM_sendVT100Code(handle, _VT100_RESET, 0); TERM_sendVT100Code(handle, _VT100_CURSOR_POS1, 0);
    returnCode = xTaskCreate(TASK_main, APP_NAME, APP_STACK, handle, tskIDLE_PRIORITY + 1, &prog->task) ? TERM_CMD_EXIT_PROC_STARTED : TERM_CMD_EXIT_ERROR;
    if(returnCode == TERM_CMD_EXIT_PROC_STARTED) TERM_attachProgramm(handle, prog);
    return returnCode;
}

static void TASK_main(void *pvParameters){
    TERMINAL_HANDLE * handle = (TERMINAL_HANDLE*)pvParameters;
    char c=0;
    do{
        if(ConnectionStats){
            TERM_sendVT100Code(handle, _VT100_CURSOR_POS1, 0);
            ttprintf("%sioTop - %d\r\nAll datarates are in bytes/s and packets/s respectively\r\n", UART_getVT100Code(_VT100_ERASE_LINE_END, 0), xTaskGetTickCount());

            ttprintf("%s%s%s", UART_getVT100Code(_VT100_BACKGROUND_COLOR, _VT100_WHITE), UART_getVT100Code(_VT100_ERASE_LINE_END, 0), UART_getVT100Code(_VT100_FOREGROUND_COLOR, _VT100_BLACK));
            ttprintf("Connection \r\x1b[%dCDatarate last \r\x1b[%dCDatarate avg \r\x1b[%dCPacketrate last \r\x1b[%dCPacketrate avg \r\x1b[%dCTotal packet count\r\n", 11, 30, 49, 68, 87);
            ttprintf("%s", UART_getVT100Code(_VT100_RESET_ATTRIB, 0));

            ttprintf("%sUDP (rx) \r\x1b[%dC%d", UART_getVT100Code(_VT100_ERASE_LINE_END, 0), 11, ConnectionStats->rxDataRateLast); 
            ttprintf("\r\x1b[%dC%d \r\x1b[%dC%d \r\x1b[%dC%d \r\x1b[%dC%d\r\n", 30, ConnectionStats->rxDataRateAVG, 49, ConnectionStats->rxPacketRateLast, 68, ConnectionStats->rxPacketRateAVG, 87, ConnectionStats->rxPacketsTotal);

            ttprintf("%sUART (rx) \r\x1b[%dC%d", UART_getVT100Code(_VT100_ERASE_LINE_END, 0), 11, ConnectionStats->txDataRateLast); 
            ttprintf("\r\x1b[%dC%d \r\x1b[%dC%d \r\x1b[%dC%d \r\x1b[%dC%d\r\n", 30, ConnectionStats->txDataRateAVG, 49, ConnectionStats->txPacketRateLast, 68, ConnectionStats->txPacketRateAVG, 87, ConnectionStats->txPacketsTotal);
        }
        xStreamBufferReceive(handle->currProgram->inputStream,&c,sizeof(c),500);
    }while(c!=CTRL_C);
    TERM_killProgramm(handle);
}

static uint8_t INPUT_handler(TERMINAL_HANDLE * handle, uint16_t c){
    if(handle->currProgram->inputStream==NULL) return TERM_CMD_EXIT_SUCCESS;
    switch(c){
        case 'q':
        case CTRL_C:
            c=CTRL_C;
            xStreamBufferSend(handle->currProgram->inputStream,&c,1,20);
            return TERM_CMD_EXIT_SUCCESS;
        default:
            return TERM_CMD_CONTINUE;
    }
}