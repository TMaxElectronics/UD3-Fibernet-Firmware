/*******************************************************************************
* File Name: communication_api.h  
* Version 1.0
*
* Description:
* This is the header file for the communication module created by the author.  
* It contains function prototypes and constants for the users' convenience. 
********************************************************************************/

#include "UART.h"
#include <stdint.h>
#include "cybtldr_utils.h"

/* Function declarations */
int OpenConnection(void);
int CloseConnection(void);
int ReadData(uint8_t* rdData, int byteCnt);
int WriteData(uint8_t* wrData, int byteCnt);

//[] END OF FILE

