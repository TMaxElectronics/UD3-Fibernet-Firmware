#include <xc.h>
#include <stdint.h>

#include "include/FreeRTOSConfig.h"

//a non scheduler dependent wait function. Used in exception handlers where no interrupts are enabled
void SYS_waitCP0(uint16_t length){
    uint32_t currCount = _CP0_GET_COUNT();
    uint32_t targetTime = currCount + length * (configCPU_CLOCK_HZ / 2000);
    while(_CP0_GET_COUNT() < targetTime);
}