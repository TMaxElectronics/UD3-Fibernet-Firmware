#include <stdint.h>
#include <xc.h>
#include <sys/kmem.h>
#include <sys/attribs.h>
#include <proc/p32mx270f256b.h>
#include <cp0defs.h>
#include "NVM.h"

unsigned NVM_memcpy4(void * dst, void * src, uint32_t length){
    uint32_t currOffset = 0;
    for(;currOffset < length; currOffset += 4){
        uint32_t * data = (uint32_t *) ((uint32_t) src + currOffset);
        if(!NVM_writeWord(dst + currOffset, *data)) return 0;
    }
    return 1;
}

unsigned NVM_writeRow(void* address, void * data){
    NVMADDR = KVA_TO_PA((unsigned int) address);
    NVMSRCADDR = KVA_TO_PA((unsigned int) data);
    return NVM_operation(0x4003); //NVM Row Program
}

unsigned NVM_writeWord(void* address, unsigned int data){
    NVMADDR = KVA_TO_PA((unsigned int)address);
    NVMDATA = data;
    return NVM_operation(0x4001);
}

unsigned NVM_erasePage(void* address){
    NVMADDR = KVA_TO_PA((unsigned int)address);
    return NVM_operation(0x4004);
}
 
unsigned int __attribute__((nomips16)) NVM_operation(unsigned int nvmop){
    int int_status;
    int susp;
    
    LATBCLR = _LATB_LATB15_MASK | _LATB_LATB5_MASK;  //make sure to turn off the output just in case
    
    NVMCON = NVMCON_WREN | nvmop;
    {
    unsigned long t0 = _CP0_GET_COUNT();
    while (_CP0_GET_COUNT() - t0 < (80/2)*6);
    }

    NVMKEY = 0xAA996655;
    NVMKEY = 0x556699AA;
    NVMCONSET = NVMCON_WR;
    
    while(NVMCON & NVMCON_WR);
    
    NVMCONCLR = NVMCON_WREN;
    
    return (NVMCON & (_NVMCON_LVDERR_MASK | _NVMCON_WRERR_MASK)) == 0;
}