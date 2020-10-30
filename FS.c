#include <xc.h>
#include <stdint.h>
#include "SPI.h"
#include "FiberComms.h"
#include "FS.h"
#include "diskio.h"
#include "ff.h"

void FS_task(void * params){
    SPI_HANDLE * handle = SPI_createHandle(1);
    SPI_init(handle, &RPA4R, 0, 5, 400000);
    disk_setSPIHandle(handle);
    
    FATFS fso;
    
    unsigned SDState = 0;
    unsigned SDintialized = 0;
    
    while(1){
        unsigned currState = FS_isCardPresent();
        if(currState != SDState){
            SDState = currState;
            if(SDState){        //sd card was just connected
                COMMS_eventHook(FS_CARD_CONNECTED);
                vTaskDelay(50);
            }else{              //sd card was just removed
                COMMS_eventHook(FS_CARD_REMOVED);
                SDintialized = 0;
                f_mount(NULL, "", 0);
            }
        }
        
        if(SDState && !SDintialized){
            if(disk_initialize(0) == 0){
                SDintialized = 1;
                UART_print("sd initialized\r\n");
                f_mount(&fso, "", 0);
                f_chdir("/");
            }else{
                UART_print("sd no initialized\r\n");
            }
        }
        
        vTaskDelay(50/portTICK_PERIOD_MS);
    }
}

unsigned FS_isCardPresent(){
    return !PORTAbits.RA0;
}