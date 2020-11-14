#ifndef uart_H
#define uart_H

#include <stdint.h>

//Allow the UART driver to send printf text to the serial port
//#define UART_ALLOW_DEBUG
#define MIN_MAX_PACKETSIZE 255

#define UART_BUFFERSIZE 2048

extern volatile uint8_t UART_bootloader;
extern volatile uint32_t lastScanPosition;
extern uint8_t * UART_rxBuffer;

void UART_init(uint32_t baud, volatile uint32_t* TXPinReg, uint8_t RXPinReg);
void UART_sendString(char *data, unsigned newLine);
void UART_sendChar(char data);
void UART_sendTask( void *pvParameters );
void UART_receiveTask( void *pvParameters );

void UART_print(char * format, ...);
void UART_termPrint(void * port, char * format, ...);
void UART_printDebug(char * format, ...);
void UART_queBuffer(uint8_t * data, uint32_t length, unsigned freeAfterSend);
uint32_t UART_queEmpty();
void UART_flush();
void UART_sendBytes(uint8_t * data, uint32_t length, unsigned freeAfterSend);

inline unsigned UART_isOERR();
inline unsigned UART_isFERR();
inline void UART_clearOERR();
inline void UART_clearFERR();

const char * UART_getVT100Code(uint16_t cmd, uint8_t var);
void UART_setBaud(uint64_t newBaud);

uint32_t UART_getBaud();

//DEPRECATED LEGACY FUNCTIONS (WILL BE REMOVED SOONER OR LATER)
void UART_disableRX();
void UART_enableRX();
void UART_setCursorPosVT100(uint8_t line, uint8_t col);
unsigned UART_dataAvailable();
unsigned char UART_getChar();

#endif