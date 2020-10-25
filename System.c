#include <xc.h>
#include <stdint.h>

#include "FreeRTOSConfig.h"
#include "System.h"
#include "task.h"

//a non scheduler dependent wait function. Used in exception handlers where no interrupts are enabled
void SYS_waitCP0(uint16_t length){
    uint32_t currCount = _CP0_GET_COUNT();
    uint32_t targetTime = currCount + length * (configCPU_CLOCK_HZ / 2000);
    while(_CP0_GET_COUNT() < targetTime);
}


uint32_t SYS_getCPULoadFine(TaskStatus_t * taskStats, uint32_t taskCount, uint32_t sysTime){
    uint32_t currTask = 0;
    for(;currTask < taskCount; currTask++){
        if(strlen(taskStats[currTask].pcTaskName) == 4 && strcmp(taskStats[currTask].pcTaskName, "IDLE") == 0){
            return 1000 - ((taskStats[currTask].ulRunTimeCounter) / (sysTime/1000));
        }
    }
    return -1;
}

const char * SYS_getTaskStateString(eTaskState state){
    switch(state){
        case eRunning:
            return "running";
        case eReady:
            return "ready";
        case eBlocked:
            return "blocked";
        case eSuspended:
            return "suspended";
        case eDeleted:
            return "deleted";
        default:
            return "invalid";
    }
}