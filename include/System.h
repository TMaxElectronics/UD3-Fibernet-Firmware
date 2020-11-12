#include <xc.h>
#include <stdint.h>

#include "FreeRTOS.h"
#include "task.h"

extern const char * SYS_BOOTCODES[];
enum BOOTLOADER_CODE{
    BOOTLOADER_EXIT_NOSD,
    BOOTLOADER_EXIT_SD_INIT_FAIL,
    BOOTLOADER_EXIT_NO_BOOTFILE,
    BOOTLOADER_EXIT_INVALID_BOOTFILE,
    BOOTLOADER_EXIT_UPDATE_COMPLETE
};

//a non scheduler dependent wait function. Used in exception handlers where no interrupts are enabled
void SYS_waitCP0(uint16_t length);

uint32_t SYS_getCPULoadFine(TaskStatus_t * taskStats, uint32_t taskCount, uint32_t sysTime);