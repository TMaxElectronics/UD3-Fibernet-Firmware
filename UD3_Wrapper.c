#include <xc.h>
#include <stdint.h>
#include <string.h>
#include "UD3_Wrapper.h"
#include "FreeRTOS/Core/include/portable.h"

const char * UD3_getName(){
    //TODO pull in the string from the UD3
    return "An unnamed UD3";
}

const char * UD3_getProtocolVersion(){
    //TODO pull in the string from the UD3
    return "2.0";
}