#include <xc.h>
#include <stdint.h>

uint8_t TERM_testCommandHandler(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
uint8_t CMD_help(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
uint8_t CMD_cls(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
uint8_t CMD_top(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);
void CMD_top_task(TERMINAL_HANDLE * handle);
TermCommandInputHandler CMD_top_handleInput(TERMINAL_HANDLE * handle, uint16_t c);
uint8_t CMD_getMacState(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args);