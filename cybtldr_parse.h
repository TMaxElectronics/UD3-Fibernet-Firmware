/*******************************************************************************
* Copyright 2011-2012, Cypress Semiconductor Corporation.  All rights reserved.
* You may use this file only in accordance with the license, terms, conditions, 
* disclaimers, and limitations in the end user license agreement accompanying 
* the software package with which this file was provided.
********************************************************************************/

#ifndef __CYBTLDR_PARSE_H__
#define __CYBTLDR_PARSE_H__

#include "cybtldr_utils.h"

/* Maximum number of bytes to allocate for a single row.  */
/* NB: Rows should have a max of 592 chars (2-arrayID, 4-rowNum, 4-len, 576-data, 2-checksum, 4-newline) */
#define MAX_BUFFER_SIZE 768

/*******************************************************************************
* Function Name: CyBtldr_FromHex
********************************************************************************
* Summary:
*   Converts the provided ASCII char into its hexadecimal numerical equivilant.
*
* Parameters:
*   value - the ASCII char to convert into a number
*
* Returns:
*   The hexadecimal numerical equivilant of the provided ASCII char.  If the
*   provided char is not a valid ASCII char, it will return 0.
*
*******************************************************************************/
unsigned char CyBtldr_FromHex(char value);

/*******************************************************************************
* Function Name: CyBtldr_FromAscii
********************************************************************************
* Summary:
*   Converts the provided ASCII array into its hexadecimal numerical equivilant.
*
* Parameters:
*   bufSize - The length of the buffer to convert
*   buffer  - The buffer of ASCII characters to convert
*   rowSize - The number of bytes of equivilant hex data generated
*   rowData - The hex data generated for the buffer
*
* Returns:
*   CYRET_SUCCESS    - The buffer was converted successfully
*   CYRET_ERR_LENGTH - The buffer does not have an even number of chars
*
*******************************************************************************/
int CyBtldr_FromAscii(unsigned int bufSize, unsigned char* buffer, unsigned short* rowSize, unsigned char* rowData);


/*******************************************************************************
* Function Name: CyBtldr_ParseHeader
********************************************************************************
* Summary:
*   Parses the hader information from the *.cyacd file.  The header information
*   is stored as the first line, so this method should only be called once, 
*   and only immediatly after calling OpenDataFile and reading the first line.
*
* Parameters:
*   bufSize    - The number of bytes contained within buffer
*   buffer     - The buffer containing the header data to parse
*   siliconId  - The silicon ID that the provided *.cyacd file is for
*   siliconRev - The silicon Revision that the provided *.cyacd file is for
*   chksum     - The type of checksum to use for packet integrety check
*
* Returns:
*   CYRET_SUCCESS    - The file was opened successfully.
*   CYRET_ERR_LENGTH - The line does not contain enough data
*
*******************************************************************************/
EXTERN int CyBtldr_ParseHeader(unsigned int bufSize, unsigned char* buffer, unsigned long* siliconId, unsigned char* siliconRev, unsigned char* chksum);

/*******************************************************************************
* Function Name: CyBtldr_ParseRowData
********************************************************************************
* Summary:
*   Parses the contents of the provided buffer which is expected to contain
*   the row data from the *.cyacd file.  This is expected to be called multiple
*   times.  Once for each row of the *.cyacd file, excluding the header row.
*
* Parameters:
*   bufSize  - The number of bytes contained within buffer
*   buffer   - The buffer containing the row data to parse
*   arrayId  - The flash array that the row of data belongs in
*   rowNum   - The flash row number that the data corresponds to
*   rowData  - The preallocated buffer to store the flash row data
*   size     - The number of bytes of rowData
*   checksum - The checksum value for the entire row (rowNum, size, rowData)
*
* Returns:
*   CYRET_SUCCESS    - The file was opened successfully.
*   CYRET_ERR_LENGTH - The line does not contain enough data
*   CYRET_ERR_DATA   - The line does not contain a full row of data
*   CYRET_ERR_CMD    - The line does not start with the cmd identifier ':'
*
*******************************************************************************/
EXTERN int CyBtldr_ParseRowData(unsigned int bufSize, unsigned char* buffer, unsigned char* arrayId, unsigned short* rowNum, unsigned char* rowData, unsigned short* size, unsigned char* checksum);

#endif
