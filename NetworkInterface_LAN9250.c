#include <xc.h>
#include <stdint.h>

#include "FreeRTOS.h"
#include "FreeRTOSIPConfig.h"
#include "FreeRTOS_IP.h"

#include "NetworkInterface.h"
#include "NetworkBufferManagement.h"

#include "LAN9250.h"
#include "include/FiberComms.h"


/* INTERNAL API FUNCTIONS. */
BaseType_t xNetworkInterfaceInitialise( void ){
    ETH_init();
}

BaseType_t xNetworkInterfaceOutput( NetworkBufferDescriptor_t * const pxNetworkBuffer, BaseType_t xReleaseAfterSend ){
    //UART_print("sending packet with length %d\r\n", pxNetworkBuffer->xDataLength);
    ETH_writePacket(pxNetworkBuffer->pucEthernetBuffer, pxNetworkBuffer->xDataLength);
    if(xReleaseAfterSend != pdFALSE){
        vReleaseNetworkBufferAndDescriptor(pxNetworkBuffer);
    }
}
/* coverity[misra_c_2012_rule_8_6_violation] */
/* "vNetworkInterfaceAllocateRAMToBuffers" is declared but never defined.
The following function is only used when BufferAllocation_1.c is linked in the project. */
void vNetworkInterfaceAllocateRAMToBuffers( NetworkBufferDescriptor_t pxNetworkBuffers[ ipconfigNUM_NETWORK_BUFFER_DESCRIPTORS ] ){
    
}

/* "xGetPhyLinkStatus" is provided by the network driver. */
/* coverity[misra_c_2012_rule_8_6_violation] */
BaseType_t xGetPhyLinkStatus( void ){
    //UART_print("checked link\r\n");
    return ETH_CheckLinkUp() ? pdTRUE : pdFALSE;
}

void vLoggingPrintf( const char *pcFormatString, ... ){
    UART_printDebug(pcFormatString);
}

void vApplicationIPNetworkEventHook( eIPCallbackEvent_t eNetworkEvent ){
uint32_t ulIPAddress, ulNetMask, ulGatewayAddress, ulDNSServerAddress;
static BaseType_t xTasksAlreadyCreated = pdFALSE;
int8_t cBuffer[ 16 ];

    UART_printDebug( "event!\r\n");
    
    LED_minPacketReceivedHook();

    /* Check this was a network up event, as opposed to a network down event. */
    if( eNetworkEvent == eNetworkUp )
    {
        LED_ethDHCPStateChangeHook(1);
        COMMS_ethEventHook(ETH_DHCP_SUCCESS);
        /* Create the tasks that use the IP stack if they have not already been
        created. */
        if( xTasksAlreadyCreated == pdFALSE )
        {
            /*
             * Create the tasks here.
             */

            xTasksAlreadyCreated = pdTRUE;
        }

        /* The network is up and configured.  Print out the configuration,
        which may have been obtained from a DHCP server. */
        FreeRTOS_GetAddressConfiguration( &ulIPAddress,
                                          &ulNetMask,
                                          &ulGatewayAddress,
                                          &ulDNSServerAddress );

        /* Convert the IP address to a string then print it out. */
        FreeRTOS_inet_ntoa( ulIPAddress, cBuffer );
        UART_printDebug( "IP Address: %s\r\n", cBuffer );

        /* Convert the net mask to a string then print it out. */
        FreeRTOS_inet_ntoa( ulNetMask, cBuffer );
        UART_printDebug( "Subnet Mask: %s\r\n", cBuffer );

        /* Convert the IP address of the gateway to a string then print it out. */
        FreeRTOS_inet_ntoa( ulGatewayAddress, cBuffer );
        UART_printDebug( "Gateway IP Address: %s\r\n", cBuffer );

        /* Convert the IP address of the DNS server to a string then print it out. */
        FreeRTOS_inet_ntoa( ulDNSServerAddress, cBuffer );
        UART_printDebug( "DNS server IP Address: %s\r\n", cBuffer );
    }else{
        LED_ethDHCPStateChangeHook(0);
    }
}

BaseType_t xApplicationGetRandomNumber( uint32_t *pulNumber ){
    *pulNumber = rand();
    return pdTRUE;
}

BaseType_t xApplicationDNSQueryHook( const char *pcName ){
    return pdFALSE;
}

uint32_t ulApplicationGetNextSequenceNumber( uint32_t ulSourceAddress, uint16_t usSourcePort, uint32_t ulDestinationAddress, uint16_t usDestinationPort ){
    return rand();
}