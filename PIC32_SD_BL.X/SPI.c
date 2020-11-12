#include "SPI.h"
#include <xc.h>

#define SPICON SPI1CON
#define SPICONbits SPI1CONbits
#define SPICON2 SPI1CON2
#define SPICON2bits SPI1CON2bits
#define SPIBRG SPI1BRG
#define SPISTAT SPI1STAT
#define SPIBUF SPI1BUF

void SPI_init(volatile uint32_t* SDOPin, uint8_t SDIPin, uint8_t spiMode, uint32_t clkFreq){
    SPICONbits.FRMEN = 0;
    SPICONbits.MSSEN = 0;
    SPICONbits.MCLKSEL = 0;
    SPICONbits.ENHBUF = 0;
    SPICONbits.SIDL = 0;
    
    SPICONbits.DISSDI = 0; //all data pins active, CS controlled seperately
    SPICONbits.DISSDO = 0;
    SPICONbits.SSEN = 0;
    
    switch(spiMode){
        case 0:
            SPICONbits.CKP = 0;    //set up for spi mode 0
            SPICONbits.CKE = 1;
            SPICONbits.SMP = 0;
            
        case 1:
            SPICONbits.CKP = 0;    //set up for spi mode 0
            SPICONbits.CKE = 0;
            SPICONbits.SMP = 0;
            
        case 2:
            SPICONbits.CKP = 1;    //set up for spi mode 0
            SPICONbits.CKE = 0;
            SPICONbits.SMP = 0;
            
        case 3:
            SPICONbits.CKP = 1;    //set up for spi mode 0
            SPICONbits.CKE = 1;
            SPICONbits.SMP = 0;
            
        default:    //mode 0 if any others are selected
            SPICONbits.CKP = 0;
            SPICONbits.CKE = 1;
            SPICONbits.SMP = 1;
            break;
    }
    
    SPICONbits.MODE32 = 0; //8 bit communication, master mode
    SPICONbits.MODE16 = 0;
    SPICONbits.MSTEN = 1;
    
    SPICONbits.STXISEL = 0;
    SPICONbits.SRXISEL = 0;
    
    SPICONbits.ON = 1;
    
    SPICON2 = 0;   //no audio stuff
    
    *SDOPin = 0b0011;
    SDI1R = SDIPin;
    
    SPIBRG = (48000000/(2*clkFreq)) - 1;
}

uint8_t SPI_send(uint8_t data){
    SPIBUF = data;

    while(SPISTAT & _SPI2STAT_SPIBUSY_MASK);// UART_print("return 0x%08x\r\n", SPISTAT);
    uint8_t ret = SPIBUF;
    return ret;
}

void SPI_sendBytes(uint8_t * data, uint8_t length, unsigned WE){
    uint16_t i = 0;
    for(;i < length; i++){
        uint8_t trash = SPI_send(data[i]);
        if(WE) data[i] = trash;
    }
}

void SPI_readBytes(uint8_t * data, uint16_t length){
    uint16_t i = 0;
    for(;i < length; i++) data[i] = SPI_send(0xff);
}

void SPI_setCLKFreq(uint32_t freq){
    SPIBRG = (48000000/(2*freq)) - 1;
}

void SPI_setCLKDiv(uint32_t div){
    SPIBRG = div;
}

uint32_t SPI_getCLKDiv(SPI_HANDLE * handle){
    return SPIBRG;
}