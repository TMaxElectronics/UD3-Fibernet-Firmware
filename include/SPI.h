#include <xc.h>
#include <stdint.h>

void SPI_init(uint32_t clkFreq);
uint8_t SPI_send(uint8_t data);
void SPI_sendBytes(uint8_t * data, uint8_t length, unsigned WE);
void SPI_readBytes(uint8_t * data, uint16_t length);
uint32_t SPI_getCLKDiv();
void SPI_setCLKDiv(uint32_t div);