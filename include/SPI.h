#include <xc.h>
#include <stdint.h>

#ifndef SPI
#define SPI

typedef union {
  struct {
    uint32_t SRXISEL:2;
    uint32_t STXISEL:2;
    uint32_t DISSDI:1;
    uint32_t MSTEN:1;
    uint32_t CKP:1;
    uint32_t SSEN:1;
    uint32_t CKE:1;
    uint32_t SMP:1;
    uint32_t MODE16:1;
    uint32_t MODE32:1;
    uint32_t DISSDO:1;
    uint32_t SIDL:1;
    uint32_t :1;
    uint32_t ON:1;
    uint32_t ENHBUF:1;
    uint32_t SPIFE:1;
    uint32_t :5;
    uint32_t MCLKSEL:1;
    uint32_t FRMCNT:3;
    uint32_t FRMSYPW:1;
    uint32_t MSSEN:1;
    uint32_t FRMPOL:1;
    uint32_t FRMSYNC:1;
    uint32_t FRMEN:1;
  };
  struct {
    uint32_t w:32;
  };
} CONBITS_t;

typedef union {
  struct {
    uint32_t AUDMOD:2;
    uint32_t :1;
    uint32_t AUDMONO:1;
    uint32_t :3;
    uint32_t AUDEN:1;
    uint32_t IGNTUR:1;
    uint32_t IGNROV:1;
    uint32_t SPITUREN:1;
    uint32_t SPIROVEN:1;
    uint32_t FRMERREN:1;
    uint32_t :2;
    uint32_t SPISGNEXT:1;
  };
  struct {
    uint32_t AUDMOD0:1;
    uint32_t AUDMOD1:1;
  };
  struct {
    uint32_t w:32;
  };
} CON2BITS_t;

typedef union {
  struct {
    uint32_t SPIRBF:1;
    uint32_t SPITBF:1;
    uint32_t :1;
    uint32_t SPITBE:1;
    uint32_t :1;
    uint32_t SPIRBE:1;
    uint32_t SPIROV:1;
    uint32_t SRMT:1;
    uint32_t SPITUR:1;
    uint32_t :2;
    uint32_t SPIBUSY:1;
    uint32_t FRMERR:1;
    uint32_t :3;
    uint32_t TXBUFELM:5;
    uint32_t :3;
    uint32_t RXBUFELM:5;
  };
  struct {
    uint32_t w:32;
  };
} STATBITS_t;

typedef struct{
    volatile CONBITS_t * CON;
    volatile CON2BITS_t * CON2;
    volatile uint32_t * BRG;
    volatile uint32_t * BUF;
    volatile uint32_t * STAT;
    volatile uint32_t * SDIR;
    volatile uint8_t pinVal;
} SPI_HANDLE;

SPI_HANDLE * SPI_createHandle(uint8_t module);
void SPI_init(SPI_HANDLE * handle, volatile uint32_t* SDOPin, uint8_t SDIPin, uint8_t spiMode, uint32_t clkFreq);
uint8_t SPI_send(SPI_HANDLE * handle, uint8_t data);
void SPI_sendBytes(SPI_HANDLE * handle, uint8_t * data, uint8_t length, unsigned WE);
void SPI_readBytes(SPI_HANDLE * handle, uint8_t * data, uint16_t length);
void SPI_setCLKFreq(SPI_HANDLE * handle, uint32_t freq);
void SPI_setCLKDiv(SPI_HANDLE * handle, uint32_t div);
uint32_t SPI_getCLKDiv(SPI_HANDLE * handle);

#endif