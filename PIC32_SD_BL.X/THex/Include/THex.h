#include <xc.h>
#include <stdint.h>

typedef enum{
    THEX_OK,
    THEX_EOF,
    THEX_CHKSM_ERROR,
    THEX_INCOMPATIBLE_STRING,     
    THEX_INVALID_ADDRESS,
} THexResult_t;

typedef struct{
    uint32_t addressOffset;
} THexFileInfo;


uint32_t THEX_parseString(THexFileInfo * currFile, char * string, uint32_t * chunkSize, uint8_t * dataBuffer);
uint16_t ahtous(char * data);
uint8_t ahtofc(char * data);
uint8_t ahtohc(char data);
unsigned THEX_verifyChecksum(char * string);
unsigned THEX_isAddressWritable(uint32_t addr);
unsigned THEX_isAddressValid(uint32_t addr);