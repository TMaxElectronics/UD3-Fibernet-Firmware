#ifndef serviceH
#define serviceH

#include <xc.h>
#include <stdint.h>

#include "FreeRTOS.h"
#include "task.h"

typedef struct{
    void (* ServiceStart)(void *params);
    void (* ServiceKill)();
    
    TaskHandle_t task;
} Service;

void SERVICE_init();

#endif