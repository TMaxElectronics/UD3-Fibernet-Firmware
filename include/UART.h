

#define _VT100_RESET 0
#define _VT100_CURSOR_BACK 0x1003
#define _VT100_CURSOR_FORWARD 0x1002
#define _VT100_CURSOR_POS1 3
#define _VT100_CURSOR_END 4
#define _VT100_FOREGROUND_COLOR 5
#define _VT100_BACKGROUND_COLOR 6
#define _VT100_RESET_ATTRIB 7
#define _VT100_BRIGHT 8
#define _VT100_DIM 9
#define _VT100_UNDERSCORE 10
#define _VT100_BLINK 11
#define _VT100_REVERSE 12
#define _VT100_HIDDEN 13
#define _VT100_ERASE_SCREEN 14
#define _VT100_ERASE_LINE 15
#define _VT100_FONT_G0 16
#define _VT100_FONT_G1 17
#define _VT100_WRAP_ON 18
#define _VT100_WRAP_OFF 19
#define _VT100_ERASE_LINE_END 20
#define _VT100_CURSOR_BACK_BY 21
#define _VT100_CURSOR_FORWARD_BY 22

//VT100 cmds given to us by the terminal software
#define _VT100_KEY_END 0x1000
#define _VT100_KEY_POS1 0x1001
#define _VT100_CURSOR_UP 0x1004
#define _VT100_CURSOR_DOWN 0x1005
#define _VT100_BACKWARDS_TAB 0x1006

#define _VT100_BLACK 0
#define _VT100_RED 1
#define _VT100_GREEN 2
#define _VT100_YELLOW 3
#define _VT100_BLUE 4
#define _VT100_MAGENTA 5
#define _VT100_CYAN 6
#define _VT100_WHITE 7

#include <stdint.h>

//Allow the UART driver to send printf text to the serial port
#define UART_ALLOW_DEBUG
#define MIN_MAX_PACKETSIZE 255

void UART_init(uint32_t baud, volatile uint32_t* TXPinReg, uint8_t RXPinReg);
void UART_sendString(char *data, unsigned newLine);
void UART_sendChar(char data);
void UART_clearOERR();
unsigned UART_dataAvailable();
unsigned char UART_getChar();
void UART_disableRX();
void UART_enableRX();
unsigned UART_isOERR();
void UART_setBaud(uint64_t newBaud);
uint32_t UART_getBaud();
const char * UART_getVT100Code(uint16_t cmd, uint8_t var);
void UART_setCursorPosVT100(uint8_t line, uint8_t col);
uint8_t UART_readByteFromBuffer(uint8_t * data, uint32_t bytesToRead);
void UART_sendTask( void *pvParameters );
void UART_receiveTask( void *pvParameters );

void UART_print(char * format, ...);
void UART_queBuffer(uint8_t * data, uint32_t length);
void UART_sendBytes(uint8_t * data, uint32_t length);
void UART_packetEndHandler();