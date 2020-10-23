#include <xc.h>
#include <stdint.h>
#include <string.h>
#include "UD3_Wrapper.h"
#include "FreeRTOS/Core/include/portable.h"

char * UD3_getName(){
    char * ret = pvPortMalloc(strlen("An unnamed UD3") + 1);
    strcpy(ret, "An unnamed UD3");
    return ret;
}