#include <xc.h>
#include <stdint.h>
#include <string.h>
#include <stdarg.h>
#include "FreeRTOS.h"
#include "task.h"
#include "TTerm.h"
#include "TTerm_cmd.h"
#include "include/System.h"
#include "include/UART.h"
#include "include/LAN9250.h"
#include "FreeRTOS/Core/include/semphr.h"

uint8_t TERM_testCommandHandler(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    uint8_t currArg = 0;
    uint8_t returnCode = TERM_CMD_EXIT_SUCCESS;
    for(;currArg<argCount; currArg++){
        if(strcmp(args[currArg], "-?") == 0){
            ttprintf("This function is intended for testing. it will list all passed arguments\r\n");
            return TERM_CMD_EXIT_SUCCESS;
        }
        if(strcmp(args[currArg], "-r") == 0){
            if(argCount > currArg + 1){
                returnCode = atoi(args[currArg + 1]);
                ttprintf("returning %d (from string \"%s\")\r\n", returnCode, args[currArg + 1]);
                currArg++;
                return returnCode;
            }else{
                ttprintf("usage:\r\ntest -r [return code]\r\n");
                return 0;
            }
        }
    }
    ttprintf("Terminal test function called. ArgCount = %d ; Calling user = \"%s\"%s\r\n", argCount, handle->currUserName, (argCount != 0) ? "; \r\narguments={" : "");
    for(currArg = 0;currArg<argCount; currArg++){
        ttprintf("%d:\"%s\"%s\r\n", currArg, args[currArg], (currArg == argCount - 1) ? "\r\n}" : ",");
    }
    return TERM_CMD_EXIT_SUCCESS;
}

uint8_t CMD_help(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    uint8_t currArg = 0;
    uint8_t returnCode = TERM_CMD_EXIT_SUCCESS;
    for(;currArg<argCount; currArg++){
        if(strcmp(args[currArg], "-?") == 0){
            ttprintf("come on do you really need help with help?\r\n");
            return TERM_CMD_EXIT_SUCCESS;
        }
    }
    ttprintf("\r\nTTerm %s\r\n%d Commands available:\r\n\r\n", TERM_VERSION_STRING, TERM_cmdCount);
    ttprintf("\x1b[%dC%s\r\x1b[%dC%s\r\n\r\n", 2, "Command:", 19, "Description:");
    uint8_t currCmd = 0;
    for(currCmd = 0; currCmd < TERM_cmdCount; currCmd++){
        ttprintf("\x1b[%dC%s\r\x1b[%dC%s\r\n", 3, TERM_cmdList[currCmd]->command, 20, TERM_cmdList[currCmd]->commandDescription);
    }
    return TERM_CMD_EXIT_SUCCESS;
}

uint8_t CMD_cls(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    uint8_t currArg = 0;
    uint8_t returnCode = TERM_CMD_EXIT_SUCCESS;
    for(;currArg<argCount; currArg++){
        if(strcmp(args[currArg], "-?") == 0){
            ttprintf("clears the screen\r\n");
            return TERM_CMD_EXIT_SUCCESS;
        }
    }
    
    TERM_sendVT100Code(handle, _VT100_RESET, 0); TERM_sendVT100Code(handle, _VT100_CURSOR_POS1, 0);
    
    return TERM_CMD_EXIT_SUCCESS;
}

uint8_t CMD_top(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    uint8_t currArg = 0;
    uint8_t returnCode = TERM_CMD_EXIT_SUCCESS;
    for(;currArg<argCount; currArg++){
        if(strcmp(args[currArg], "-?") == 0){
            ttprintf("shows performance stats\r\n");
            return TERM_CMD_EXIT_SUCCESS;
        }
    }
    
    TermProgram * prog = pvPortMalloc(sizeof(TermProgram));
    prog->inputHandler = CMD_top_handleInput;
    TERM_sendVT100Code(handle, _VT100_RESET, 0); TERM_sendVT100Code(handle, _VT100_CURSOR_POS1, 0);
    returnCode = xTaskCreate(CMD_top_task, "top", configMINIMAL_STACK_SIZE, handle, tskIDLE_PRIORITY + 1, &prog->task) ? TERM_CMD_EXIT_PROC_STARTED : TERM_CMD_EXIT_ERROR;
    if(returnCode == TERM_CMD_EXIT_PROC_STARTED) TERM_attachProgramm(handle, prog);
    return returnCode;
}

void CMD_top_task(void *pvParameters){
    TERMINAL_HANDLE * handle = (TERMINAL_HANDLE*)pvParameters;
    while(1){
        /*char * buff = pvPortMalloc(1024);
        vTaskGetRunTimeStats(buff);
        UART_print("\r\nTask stats: \r\n%s\r\n", buff);
        vPortFree(buff);*/
        
        TaskStatus_t * taskStats;
        uint32_t taskCount = uxTaskGetNumberOfTasks();
        uint32_t sysTime;
                
        taskStats = pvPortMalloc( taskCount * sizeof( TaskStatus_t ) );
        taskCount = uxTaskGetSystemState(taskStats, taskCount, &sysTime);
        
        TERM_sendVT100Code(handle, _VT100_CURSOR_POS1, 0);
    
        uint32_t cpuLoad = SYS_getCPULoadFine(taskStats, taskCount, sysTime);
        ttprintf("%sbottom - %d\r\n%sTasks: \t%d\r\n%sCPU: \t%d,%d%%\r\n", UART_getVT100Code(_VT100_ERASE_LINE_END, 0), xTaskGetTickCount(), UART_getVT100Code(_VT100_ERASE_LINE_END, 0), taskCount, UART_getVT100Code(_VT100_ERASE_LINE_END, 0), cpuLoad / 10, cpuLoad % 10);
        
        uint32_t heapRemaining = xPortGetFreeHeapSize();
        ttprintf("%sMem: \t%db total,\t %db free,\t %db used (%d%%)\r\n", UART_getVT100Code(_VT100_ERASE_LINE_END, 0), configTOTAL_HEAP_SIZE, heapRemaining, configTOTAL_HEAP_SIZE - heapRemaining, ((configTOTAL_HEAP_SIZE - heapRemaining) * 100) / configTOTAL_HEAP_SIZE);
        //taskStats[0].
        ttprintf("%s%s%s", UART_getVT100Code(_VT100_BACKGROUND_COLOR, _VT100_WHITE), UART_getVT100Code(_VT100_ERASE_LINE_END, 0), UART_getVT100Code(_VT100_FOREGROUND_COLOR, _VT100_BLACK));
        ttprintf("PID \r\x1b[%dCName \r\x1b[%dCstate \r\x1b[%dC%%Cpu \r\x1b[%dCtime  \r\x1b[%dCStack \r\x1b[%dCHeap\r\n", 6, 7 + configMAX_TASK_NAME_LEN, 20 + configMAX_TASK_NAME_LEN, 27 + configMAX_TASK_NAME_LEN, 38 + configMAX_TASK_NAME_LEN, 45 + configMAX_TASK_NAME_LEN);
        ttprintf("%s", UART_getVT100Code(_VT100_RESET_ATTRIB, 0));
        
        uint32_t currTask = 0;
        for(;currTask < taskCount; currTask++){
            if(strlen(taskStats[currTask].pcTaskName) != 4 || strcmp(taskStats[currTask].pcTaskName, "IDLE") != 0){
                char name[configMAX_TASK_NAME_LEN+1];
                strncpy(name, taskStats[currTask].pcTaskName, configMAX_TASK_NAME_LEN);
                uint32_t load = (taskStats[currTask].ulRunTimeCounter) / (sysTime/1000);
                ttprintf("%s%d\r\x1b[%dC%s\r\x1b[%dC%s\r\x1b[%dC%d,%d\r\x1b[%dC%d\r\x1b[%dC%u\r\x1b[%dC%d\r\n", UART_getVT100Code(_VT100_ERASE_LINE_END, 0), taskStats[currTask].xTaskNumber, 6, name, 7 + configMAX_TASK_NAME_LEN
                        , SYS_getTaskStateString(taskStats[currTask].eCurrentState), 20 + configMAX_TASK_NAME_LEN, load / 10, load % 10, 27 + configMAX_TASK_NAME_LEN, taskStats[currTask].ulRunTimeCounter
                        , 38 + configMAX_TASK_NAME_LEN, taskStats[currTask].usStackHighWaterMark, 45 + configMAX_TASK_NAME_LEN, taskStats[currTask].usedHeap);
            }
        }
        
        vPortFree(taskStats);
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}

uint8_t CMD_top_handleInput(TERMINAL_HANDLE * handle, uint16_t c){
    switch(c){
        case 'q':
        case 0x03:
            vTaskDelete(handle->currProgram->task);
            vPortFree(handle->currProgram);
            TERM_removeProgramm(handle);
            return TERM_CMD_EXIT_SUCCESS;
        default:
            return TERM_CMD_CONTINUE;
    }
}