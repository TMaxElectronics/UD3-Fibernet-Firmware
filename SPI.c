#include "SPI.h"
#include "UART.h"
#include "FreeRTOSConfig.h"



void SPI_init(uint32_t clkFreq){
    SPI2CONbits.FRMEN = 0;
    SPI2CONbits.MSSEN = 0;
    SPI2CONbits.MCLKSEL = 0; //PBCLK
    SPI2CONbits.ENHBUF = 0; //TODO implement enhanced buffering
    SPI2CONbits.SIDL = 0;
    
    SPI2CONbits.DISSDI = 0; //all data pins active, CS controlled seperately
    SPI2CONbits.DISSDO = 0;
    SPI2CONbits.SSEN = 0;
    
    SPI2CONbits.CKP = 0;    //set up for spi mode 0
    SPI2CONbits.CKE = 1;
    SPI2CONbits.SMP = 0;
    
    SPI2CONbits.MODE32 = 0; //8 bit communication, master mode
    SPI2CONbits.MODE16 = 0;
    SPI2CONbits.MSTEN = 1;
    
    SPI2CONbits.STXISEL = 0;
    SPI2CONbits.SRXISEL = 0;
    
    SPI2CONbits.ON = 1;
    
    SPI2CON2 = 0;   //no audio stuff and no interrupts (for now)
    
    RPB8R = 0b0100; //RB8
    SDI2R = 0b0011; //RB13
    
    //TODO configure interrupts
    
    //SPI1BRG = (_PB_FREQ/(2*clkFreq1)) - 1;
    SPI2BRG = (configPERIPHERAL_CLOCK_HZ/(2*clkFreq)) - 1;
}

uint8_t SPI_send(uint8_t data){
    SPI2BUF = data;
    while(SPI2STATbits.SPIBUSY);
    uint8_t ret = SPI2BUF;
    return SPI2BUF;
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
    for(;i < length; i++) data[i] = SPI_send(0xff);// UART_sendString("data[0x", 0, _COMS_MODULE); UART_sendHex(i, 0, _COMS_MODULE); UART_sendString("]=", 0, _COMS_MODULE); UART_sendHex((uint8_t) data[i], 1, _COMS_MODULE);}
}

void SPI_setCLKFreq(uint32_t freq){
    SPI2BRG = (configPERIPHERAL_CLOCK_HZ/(2*freq)) - 1;
}

void SPI_setCLKDiv(uint32_t div){
    SPI2BRG = div;
}

uint32_t SPI_getCLKDiv(){
    return SPI2BRG;
}