#include <xc.h>
#include <stdint.h>
#include <string.h>

#include "FreeRTOSConfig.h"
#include "System.h"
#include "task.h"

const char * SYS_BOOTCODES[] = {"BOOTLOADER_EXIT_NOSD", "BOOTLOADER_EXIT_SD_INIT_FAIL", "BOOTLOADER_EXIT_NO_BOOTFILE", "BOOTLOADER_EXIT_INVALID_BOOTFILE", "BOOTLOADER_EXIT_UPDATE_COMPLETE"};

//a non scheduler dependent wait function. Used in exception handlers where no interrupts are enabled
void SYS_waitCP0(uint16_t length){
    uint32_t currCount = _CP0_GET_COUNT();
    uint32_t targetTime = currCount + length * (configCPU_CLOCK_HZ / 2000);
    while(_CP0_GET_COUNT() < targetTime);
}


uint32_t SYS_getCPULoadFine(TaskStatus_t * taskStats, uint32_t taskCount, uint32_t sysTime){
    uint32_t currTask = 0;
    volatile TaskStatus_t * ct = &taskStats[0];
    for(;currTask < taskCount; currTask++){
        ct = &taskStats[currTask];
        configASSERT(ct > 0xa0000000 && ct < 0xa0010000);
        if(strncmp(taskStats[currTask].pcTaskName, "IDLE", configMAX_TASK_NAME_LEN) == 0){
            return configTICK_RATE_HZ - ((taskStats[currTask].ulRunTimeCounter) / (sysTime/configTICK_RATE_HZ));
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