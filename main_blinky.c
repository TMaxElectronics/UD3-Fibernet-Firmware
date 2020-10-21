/*
 * FreeRTOS Kernel V10.4.1
 * Copyright (C) 2020 Amazon.com, Inc. or its affiliates.  All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * http://www.FreeRTOS.org
 * http://aws.amazon.com/freertos
 *
 * 1 tab == 4 spaces!
 */

/******************************************************************************
 * NOTE 1:  This project provides two demo applications.  A simple blinky style
 * project, and a more comprehensive test and demo application.  The
 * mainCREATE_SIMPLE_BLINKY_DEMO_ONLY setting in main.c is used to select
 * between the two.  See the notes on using mainCREATE_SIMPLE_BLINKY_DEMO_ONLY
 * in main.c.  This file implements the simply blinky style version.
 *
 * NOTE 2:  This file only contains the source code that is specific to the
 * basic demo.  Generic functions, such FreeRTOS hook functions, and functions
 * required to configure the hardware, are defined in main.c.
 ******************************************************************************
 *
 * main_blinky() creates one queue, two tasks, and one software timer.  It then
 * starts the scheduler.
 *
 * The Blinky Software Timer:
 * This demonstrates an auto-reload software timer.  The timer callback function
 * does nothing but toggle an LED.
 *
 * The Queue Send Task:
 * The queue send task is implemented by the prvQueueSendTask() function in
 * this file.  prvQueueSendTask() sits in a loop that causes it to repeatedly
 * block for 200 milliseconds, before sending the value 100 to the queue that
 * was created within main_blinky().  Once the value is sent, the task loops
 * back around to block for another 200 milliseconds.
 *
 * The Queue Receive Task:
 * The queue receive task is implemented by the prvQueueReceiveTask() function
 * in this file.  prvQueueReceiveTask() sits in a loop where it repeatedly
 * blocks on attempts to read data from the queue that was created within
 * main_blinky().  When data is received, the task checks the value of the
 * data, and if the value equals the expected 100, toggles the LED.  The 'block
 * time' parameter passed to the queue receive function specifies that the
 * task should be held in the Blocked state indefinitely to wait for data to
 * be available on the queue.  The queue receive task will only leave the
 * Blocked state when the queue send task writes to the queue.  As the queue
 * send task writes to the queue every 200 milliseconds, the queue receive
 * task leaves the Blocked state every 200 milliseconds, and therefore toggles
 * the LED every 200 milliseconds.
 */

/* Standard includes. */
#include <stdio.h>

/* Kernel includes. */
#include "FreeRTOS.h"
#include "FreeRTOS_IP.h"
#include "FreeRTOS_Sockets.h"
#include "task.h"
#include "queue.h"
#include "timers.h"

/* Standard demo includes. */
#include "UART.h"
#include "LAN9250.h"

/* Priorities at which the tasks are created. */
#define mainQUEUE_RECEIVE_TASK_PRIORITY		( tskIDLE_PRIORITY + 2 )
#define	mainQUEUE_SEND_TASK_PRIORITY		( tskIDLE_PRIORITY + 1 )

/* The rate at which data is sent to the queue.  The 200ms value is converted
to ticks using the portTICK_PERIOD_MS constant. */
#define mainQUEUE_SEND_FREQUENCY_MS			( 1000 / portTICK_PERIOD_MS )

/* The number of items the queue can hold.  This is 1 as the receive task
will remove items as they are added, meaning the send task should always find
the queue empty. */
#define mainQUEUE_LENGTH					( 1 )

/* Values passed to the two tasks just to check the task parameter
functionality. */
#define mainQUEUE_SEND_PARAMETER			( 0x1111UL )
#define mainQUEUE_RECEIVE_PARAMETER			( 0x22UL )

/* The period of the blinky software timer.  The period is specified in ms and
converted to ticks using the portTICK_PERIOD_MS constant. */
#define mainBLINKY_TIMER_PERIOD				( 1000 / portTICK_PERIOD_MS )

/* The LED used by the communicating tasks and the blinky timer respectively. */
#define mainTASKS_LED						( 0 )
#define mainTIMER_LED						( 0 )

/* Misc. */
#define mainDONT_BLOCK						( 0 )

/*-----------------------------------------------------------*/

/*
 * The tasks as described in the comments at the top of this file.
 */
static void prvQueueReceiveTask( void *pvParameters );
static void prvQueueSendTask( void *pvParameters );

/*
 * The callback function for the blinky software timer, as described at the top
 * of this file.
 */
static void prvBlinkyTimerCallback( TimerHandle_t xTimer );
static void prvTimerCallback( TimerHandle_t xTimer );

/*
 * Called by main() to create the simply blinky style application if
 * mainCREATE_SIMPLE_BLINKY_DEMO_ONLY is set to 1.
 */
void main_blinky( void );

/*-----------------------------------------------------------*/

/* The queue used by both tasks. */
static QueueHandle_t xQueue = NULL;
xSocket_t xSocket;
struct freertos_sockaddr xBindAddress;
static void prvSimpleServerTask(void *pvParameters);

/*-----------------------------------------------------------*/

void main_blinky( void )
{
    TimerHandle_t xTimer;

	/* Create the queue. */
	xQueue = xQueueCreate( mainQUEUE_LENGTH, sizeof( unsigned long ) );
    
    //xTaskCreate( prvQueueSendTask, "TX", configMINIMAL_STACK_SIZE, ( void * ) mainQUEUE_SEND_PARAMETER, mainQUEUE_SEND_TASK_PRIORITY, NULL );
    //xTaskCreate( prvTimerCallback, "ethtest", configMINIMAL_STACK_SIZE, ( void * ) mainQUEUE_SEND_PARAMETER, tskIDLE_PRIORITY + 1, NULL );
    //xTaskCreate(prvSimpleServerTask, "udpRecv", configMINIMAL_STACK_SIZE, ( void * ) mainQUEUE_SEND_PARAMETER, tskIDLE_PRIORITY + 2, NULL);
}
/*-----------------------------------------------------------*/

static void prvSimpleServerTask( void *pvParameters )
{
    int32_t lBytes;
    uint8_t * cReceivedString = pvPortMalloc(512);
    struct freertos_sockaddr xClient, xBindAddress;
    uint32_t xClientLength = sizeof( xClient );
    Socket_t xListeningSocket;

	/* Just to prevent compiler warnings. */
	( void ) pvParameters;

	/* Attempt to open the socket. */
	xListeningSocket = FreeRTOS_socket( FREERTOS_AF_INET, FREERTOS_SOCK_DGRAM, FREERTOS_IPPROTO_UDP );
	configASSERT( xListeningSocket != FREERTOS_INVALID_SOCKET );

	/* This test receives data sent from a different port on the same IP
	address.  Configure the freertos_sockaddr structure with the address being
	bound to.  The strange casting is to try and remove	compiler warnings on 32
	bit machines.  Note that this task is only created after the network is up,
	so the IP address is valid here. */
	xBindAddress.sin_port = ( uint16_t ) ( ( uint32_t ) pvParameters ) & 0xffffUL;
	xBindAddress.sin_port = FreeRTOS_htons(1337);

	/* Bind the socket to the port that the client task will send to. */
	FreeRTOS_bind( xListeningSocket, &xBindAddress, sizeof( xBindAddress ) );

	while(1){
		/* Zero out the receive array so there is NULL at the end of the string
		when it is printed out. */
		memset( cReceivedString, 0x00, 512);

		/* Receive data on the socket.  ulFlags is zero, so the zero copy option
		is not set and the received data is copied into the buffer pointed to by
		cReceivedString.  By default the block time is portMAX_DELAY.
		xClientLength is not actually used by FreeRTOS_recvfrom(), but is set
		appropriately in case future versions do use it. */
		lBytes = FreeRTOS_recvfrom( xListeningSocket, cReceivedString, 512, 0, &xClient, &xClientLength );

        if(lBytes > 0){
            UART_printDebug("Received data:\r\n%s\r\n------------\r\n", cReceivedString);
        }
	}
}
/*-----------------------------------------------------------*/

static void prvQueueSendTask( void *pvParameters )
{
TickType_t xNextWakeTime;
const unsigned long ulValueToSend = 100UL;

	/* Check the task parameter is as expected. */
	configASSERT( ( ( unsigned long ) pvParameters ) == mainQUEUE_SEND_PARAMETER );

	/* Initialise xNextWakeTime - this only needs to be done once. */
	xNextWakeTime = xTaskGetTickCount();

	for( ;; )
	{
		/* Place this task in the blocked state until it is time to run again.
		The block time is specified in ticks, the constant used converts ticks
		to ms.  While in the Blocked state this task will not consume any CPU
		time. */
		vTaskDelayUntil( &xNextWakeTime, mainQUEUE_SEND_FREQUENCY_MS );

		/* Send to the queue - causing the queue receive task to unblock and
		toggle the LED.  0 is used as the block time so the sending operation
		will not block - it shouldn't need to block as the queue should always
		be empty at this point in the code. */
		xQueueSend( xQueue, &ulValueToSend, 0U );
	}
}
/*-----------------------------------------------------------*/

static void prvQueueReceiveTask( void *pvParameters )
{
unsigned long ulReceivedValue;

	/* Check the task parameter is as expected. */
	configASSERT( ( ( unsigned long ) pvParameters ) == mainQUEUE_RECEIVE_PARAMETER );

	for( ;; )
	{
		/* Wait until something arrives in the queue - this task will block
		indefinitely provided INCLUDE_vTaskSuspend is set to 1 in
		FreeRTOSConfig.h. */
		xQueueReceive( xQueue, &ulReceivedValue, portMAX_DELAY );

		/*  To get here something must have been received from the queue, but
		is it the expected value?  If it is, toggle the LED. */
		if( ulReceivedValue == 100UL )
		{
			//vParTestToggleLED( mainTASKS_LED );
			ulReceivedValue = 0U;
            UART_printDebug("Hello %s%s%sWorld%s! \r\n", UART_getVT100Code(_VT100_BLINK, 0), UART_getVT100Code(_VT100_FOREGROUND_COLOR, _VT100_GREEN), UART_getVT100Code(_VT100_BACKGROUND_COLOR, _VT100_BLUE), UART_getVT100Code(_VT100_RESET_ATTRIB, 0));
        }
	}
}
/*-----------------------------------------------------------*/

static void prvTimerCallback( TimerHandle_t xTimer )
{
    while(1){
        vTaskDelay(500);
        UART_print("Heap free: %d\r\n", xPortGetFreeHeapSize());
        
        char * buff = pvPortMalloc(1024);
        vTaskGetRunTimeStats(buff);
        UART_print("\r\nTask stats: \r\n%s\r\n", buff);
        vPortFree(buff);
        //UART_print("UART baudrate: %d\r\n", UART_getBaud());
        //ETH_writePacket("Hello World!", 12);
        //ETH_dumpRX();
    }
}
/*-----------------------------------------------------------*/

static void prvBlinkyTimerCallback( TimerHandle_t xTimer )
{
	/* This function is called when the blinky software time expires.  All the
	function does is toggle the LED.  LED mainTIMER_LED should therefore toggle
	with the period set by mainBLINKY_TIMER_PERIOD. */
	//vParTestToggleLED( 0 );
    
    uint32_t ulIPAddress, ulNetMask, ulGatewayAddress, ulDNSServerAddress;
    static BaseType_t xTasksAlreadyCreated = pdFALSE;
    int8_t cBuffer[ 16 ];

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
    //ETH_dumpConfig();
}

