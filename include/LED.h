#include <xc.h>
#include <stdint.h>


void LED_init();
void LED_task(void * params);
void LED_ethLinkStateChangeHook(unsigned newState);
void LED_ethPacketReceivedHook();
void LED_minPacketReceivedHook();