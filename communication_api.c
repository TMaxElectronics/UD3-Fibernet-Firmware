/*******************************************************************************
* File Name: communication_api.c  
* Version 1.0
*
* Description:
* This file is created by the author . This contains definitions of APIs 
* used in structure 'CyBtldr_CommunicationsData' defined in cybtldr_api.h ,
* using SPI commuincations component 
********************************************************************************/

#include "communication_api.h"
#include <xc.h>
#include "UART.h"




/*******************************************************************************
* Function Name: OpenConnection
********************************************************************************
*
* Summary:
*  Initializes the communications component : In this case UART
*
* Parameters:  
*  void
*
* Return: 
*  Returns a flag to indicate whether the operation was successful or not
*
*
*******************************************************************************/
int OpenConnection(void)
{
	//UART_Start();
	return(CYRET_SUCCESS);
}


/*******************************************************************************
* Function Name: CloseConnection
********************************************************************************
*
* Summary:
*  Clears the status and stops the communications component (UART).
*
* Parameters:  
*  void
*
* Return: 
*  Returns a flag to indicate whether the operation was successful or not
*
*
*******************************************************************************/
int CloseConnection(void)
{
	//UART_Stop();
	return(CYRET_SUCCESS);
}

/*******************************************************************************
* Function Name: WriteData
********************************************************************************
*
* Summary:
*  Writes the specified number of bytes using the communications component (UART)
*
* Parameters:  
*  wrData - Pointer to write data buffer
*  byteCnt - No. of bytes to be written 
*
* Return: 
*  Returns a flag to indicate whether the operation was successful or not
*
*
*******************************************************************************/
int WriteData(uint8_t* wrData, int byteCnt)
{
    UART_queBuffer(wrData, byteCnt, 0);
	return(CYRET_SUCCESS);
}


/*******************************************************************************
* Function Name: ReadData
********************************************************************************
*
* Summary:
*  Reads the specified number of bytes usign the communications component (UART)
*
* Parameters:  
*  rdData - Pointer to read data buffer
*  byteCnt - No. of bytes to be read 
*
* Return: 
*  Returns a flag to indicate whether the operation was successful or not
*
*
*******************************************************************************/
int ReadData(uint8_t* rdData, int byteCnt)
{
    int bytesRead=0;
    uint32_t timeout = 400;
    while(bytesRead < byteCnt && timeout){
        while(lastScanPosition != DCH3DPTR){
            *rdData = UART_rxBuffer[lastScanPosition];
            rdData++;
            bytesRead++;
            if(++lastScanPosition >= DCH3DSIZ) lastScanPosition = 0;
            if(bytesRead == byteCnt) break;
        }
        timeout--;
        if(!timeout) return(CYRET_ERR_COMM_MASK);
        vTaskDelay(1);
    }
    
	return(CYRET_SUCCESS);
}

/* [] END OF FILE */

