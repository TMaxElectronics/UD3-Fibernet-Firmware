#include <stdint.h>
#include <sys/attribs.h>

unsigned int __attribute__((nomips16)) NVM_operation(unsigned int nvmop);
unsigned NVM_erasePage(void* address);
unsigned NVM_writeWord(void* address, unsigned int data);
unsigned NVM_writeRow(void* address, void * data);
unsigned NVM_memcpy4(void * dst, void * src, uint32_t length);