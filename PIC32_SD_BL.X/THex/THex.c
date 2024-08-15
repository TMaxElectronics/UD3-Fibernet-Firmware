/*
 * THex simple Intel HEX parser
 *
 * Copyright (c) 2020 Thorben Zethoff
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#include <xc.h>
#include <sys/kmem.h>

#include "include/THex.h"

uint32_t THEX_parseString(THexFileInfo * currFile, char * string, uint32_t * chunkSize, uint8_t * dataBuffer){
    if(string[0] != ':') return THEX_INCOMPATIBLE_STRING;
    
    if(!THEX_verifyChecksum(string)) return THEX_CHKSM_ERROR;
    
    //NULL file info means we just verify checksums
    if(currFile == 0) return THEX_OK;
    
    uint8_t byteCount = ahtofc(&string[1]);
    uint16_t address = ahtous(&string[3]);
    
    uint8_t currByte = 0;
    uint8_t type = ahtofc(&string[7]);
    
    switch(type){
        case 0:
            if(!THEX_isAddressValid(currFile->addressOffset | address)) return THEX_INVALID_ADDRESS;
            //NULL dataBuffer means we just check if the memory is inside the writable area of this chip
            if(dataBuffer == 0)  return THEX_OK;
            
            for(;currByte < byteCount; currByte++) dataBuffer[currByte] = ahtofc(&string[currByte*2+9]);
            
            *chunkSize = byteCount;
            return currFile->addressOffset | address;
        case 1:
            //UART_print("EOF\r\n");
            return THEX_EOF;
        case 4:
            currFile->addressOffset = ahtous(&string[9]) << 16;
            //UART_print("extended address. new base address = 0x%08x\r\n", currFile->addressOffset);
            break;
        default:
            return THEX_INCOMPATIBLE_STRING;
    }
    return THEX_OK;
}

uint16_t ahtous(char * data){
    return (ahtofc(&data[0]) << 8) | ahtofc(&data[2]);
}

uint8_t ahtofc(char * data){
    return (ahtohc(data[0]) << 4) | ahtohc(data[1]);
}

uint8_t ahtohc(char data){
    switch(data){
        case '0' ... '9':
            return data - 48;
        case 'A' ... 'F':
            return data - 55;
        case 'a' ... 'f':
            return data - 87;
    }
}

unsigned THEX_verifyChecksum(char * string){
    uint16_t acc = 0;
    uint32_t chksm = 0;
    
    if(string[0] == 0 || string[1] == 0 || string[2] == 0) return 0;
    
    //skip the first character (:), and start parsing at start + 3 - 2
    string += 2;
    while(*(++string) != 0){
        if((acc++ % 2) == 0){
            chksm += ahtofc(string-2);
        }
    }
    if((acc++ % 2) != 0){
        //check if we had an even number of bytes, in other words:
        //make sure that there is no half byte nibble in the string
        return 0;
    }
    
    uint8_t res = chksm & 0xff;
    if(res != 0){ 
        //UART_print("checksum check failed: 0x%08x & 0xff = 0x%02x != 0\r\n", chksm, res);
        return 0;
    }
    return 1;
}

unsigned THEX_isAddressValid(uint32_t addr){
    //is the address in PFM (program flash memory)?
    if(addr >= KVA_TO_PA(__KSEG0_PROGRAM_MEM_BASE)   &&  addr < KVA_TO_PA(__KSEG0_PROGRAM_MEM_BASE+__KSEG0_PROGRAM_MEM_LENGTH))   return 1;
    
    //is it part of the boot memory block                                                       the macro is WRONG :()
    if(addr >= KVA_TO_PA(__KSEG1_BOOT_MEM_BASE)      &&  addr < KVA_TO_PA(__KSEG1_BOOT_MEM_BASE+0xbef))         return 1;
    
    //is it pointing to configuration registers?
    if(addr >= KVA_TO_PA(__CONFIGSFRS_BASE)          &&  addr < KVA_TO_PA(__CONFIGSFRS_BASE+__CONFIGSFRS_LENGTH))                 return 1;
    
    //is it in the exception memory (will have debug things, vectors and stuff)?
    if(addr >= KVA_TO_PA(__EXCEPTION_MEM_BASE)       &&  addr < KVA_TO_PA(__EXCEPTION_MEM_BASE+__EXCEPTION_MEM_LENGTH))           return 1;
    
    return 0;
}