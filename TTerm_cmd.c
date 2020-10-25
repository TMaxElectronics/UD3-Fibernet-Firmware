#include <xc.h>
#include <stdint.h>
#include <string.h>
#include <stdarg.h>
#include "FreeRTOS.h""
#include "task.h"
#include "TTerm.h"

uint8_t TERM_testCommandHandler(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    uint8_t currArg = 0;
    uint8_t returnCode = TERM_CMD_EXIT_SUCCESS;
    for(;currArg<argCount; currArg++){
        if(strcmp(args[currArg], "-?") == 0){
            (*handle->print)("This function is intended for testing. it will list all passed arguments\r\n");
            return TERM_CMD_EXIT_SUCCESS;
        }
        if(strcmp(args[currArg], "-r") == 0){
            if(argCount > currArg + 1){
                returnCode = atoi(args[currArg + 1]);
                (*handle->print)("returning %d (from string \"%s\")\r\n", returnCode, args[currArg + 1]);
                currArg++;
                return returnCode;
            }else{
                (*handle->print)("usage:\r\ntest -r [return code]\r\n");
                return 0;
            }
        }
    }
    (*handle->print)("Terminal test function called. ArgCount = %d ; Calling user = \"%s\"%s\r\n", argCount, handle->currUserName, (argCount != 0) ? "; \r\narguments={" : "");
    for(currArg = 0;currArg<argCount; currArg++){
        (*handle->print)("%d:\"%s\"%s\r\n", currArg, args[currArg], (currArg == argCount - 1) ? "\r\n}" : ",");
    }
    return TERM_CMD_EXIT_SUCCESS;
}