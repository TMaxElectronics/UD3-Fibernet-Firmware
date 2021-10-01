#ifndef LED
#define LED

#include <xc.h>
#include <stdint.h>

#define LED_CODE_1_TIME         600
#define LED_CODE_0_TIME         300
#define LED_CODE_IB_PAUSE_TIME  300
#define LED_CODE_IC_PAUSE_TIME  1000
#define LED_CODE_END_TIME       3000

extern const uint8_t LED_generalExceptionCode[];
extern const uint8_t LED_stackOverflowCode[];
extern const uint8_t LED_mallocFailedCode[];
extern const uint8_t LED_assertCode[];

void LED_init();
void LED_task(void * params);
void LED_ethLinkStateChangeHook(unsigned newState);
void LED_ethPacketReceivedHook();
void LED_minPacketReceivedHook();
void LED_errorFlashHook();
void LED_ethDHCPStateChangeHook(unsigned newState);
void LED_showCode(uint8_t * code);

#endif