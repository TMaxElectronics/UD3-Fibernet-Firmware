#pragma config PMDL1WAY = OFF           // Peripheral Module Disable Configuration (Allow only one reconfiguration)
#pragma config IOL1WAY = OFF            // Peripheral Pin Select Configuration (Allow only one reconfiguration)
#pragma config FUSBIDIO = OFF           // USB USID Selection (Controlled by Port Function)
#pragma config FVBUSONIO = OFF          // USB VBUS ON Selection (Controlled by Port Function)

// DEVCFG2
#pragma config FPLLIDIV = DIV_2         // PLL Input Divider (4x Divider)
#pragma config FPLLMUL = MUL_24         // PLL Multiplier (24x Multiplier)
#pragma config UPLLIDIV = DIV_4         // USB PLL Input Divider (4x Divider)
#pragma config UPLLEN = OFF             // USB PLL Enable (Enabled)
#pragma config FPLLODIV = DIV_2         // System PLL Output Clock Divider (PLL Divide by 2)
#pragma config FNOSC = FRCPLL           // Oscillator Selection Bits (Primary Osc w/PLL (XT+,HS+,EC+PLL))

// DEVCFG1
#pragma config FSOSCEN = OFF            // Secondary Oscillator Enable (Disabled)
#pragma config IESO = OFF               // Internal/External Switch Over (Disabled)
#pragma config POSCMOD = OFF            // Primary Oscillator Configuration (HS osc mode)
#pragma config OSCIOFNC = OFF           // CLKO Output Signal Active on the OSCO Pin (Disabled)
#pragma config FPBDIV = DIV_1           // Peripheral Clock Divisor (Pb_Clk is Sys_Clk/1)
#pragma config FCKSM = CSDCMD           // Clock Switching and Monitor Selection (Clock Switch Disable, FSCM Disabled)
#pragma config WDTPS = PS1048576        // Watchdog Timer Postscaler (1:1048576)
#pragma config WINDIS = OFF             // Watchdog Timer Window Enable (Watchdog Timer is in Non-Window Mode)
#pragma config FWDTEN = OFF             // Watchdog Timer Enable (WDT Disabled (SWDTEN Bit Controls))
#pragma config FWDTWINSZ = WINSZ_25     // Watchdog Timer Window Size (Window Size is 25%)

// DEVCFG0
#pragma config JTAGEN = OFF             // JTAG Enable (JTAG Disabled)
#pragma config ICESEL = ICS_PGx1        // ICE/ICD Comm Channel Select (Communicate on PGEC1/PGED1)
#pragma config PWP = OFF                // Program Flash Write Protect (Disable)
#pragma config BWP = OFF                // Boot Flash Write Protect bit (Protection Disabled)
#pragma config CP = OFF                 // Code Protect (Protection Disabled)

#include <xc.h>
#include <sys/kmem.h>

#include "ff.h"
#include "THex.h"
#include "SPI.h"
#include "NVM.h"

#define SD_INIT_MAXATTEMPS 10
#define BL_IMAGE_PATH "/boot.hex"
#define BL_MEMSTART 0x9d000000
#define BL_MEMEND 0x9D03B000
#define PAGE_SIZE 1024

FATFS fso;
FIL file;
unsigned FS_isCardPresent();
void BL_startApplication(uint32_t code);
void SYS_waitCP0(uint16_t length);
unsigned BL_verifyFile(FIL * file);
unsigned BL_writeFlash(FIL * file);
unsigned BL_eraseFlash();
unsigned BL_isAddressWritable(uint32_t addr);
uint16_t flashCount = 0;

enum BOOTLOADER_CODE{
    BOOTLOADER_EXIT_NOSD,
    BOOTLOADER_EXIT_SD_INIT_FAIL,
    BOOTLOADER_EXIT_NO_BOOTFILE,
    BOOTLOADER_EXIT_INVALID_BOOTFILE,
    BOOTLOADER_EXIT_UPDATE_COMPLETE
};

void main(void) {
    /* initalize IO */
    TRISA = 0xffff; //start with everything tri-stated
    TRISB = 0xffff;
    ANSELA = 0;     //disable all analog inputs, otherwise any digital read returns 0
    ANSELB = 0;
    
    //enable pull up on the SD card detect pin
    CNPUASET = _CNPUA_CNPUA0_MASK;
    
    //enable the pullup on the SD MISO data line, because I totally intended it this way, and not because I forgot it in hardware...
    CNPUBSET = _CNPUB_CNPUB8_MASK;
    
    SYS_waitCP0(100);
    
    //if no card is inserted jump straight to the code
    if(!FS_isCardPresent()){
        BL_startApplication(BOOTLOADER_EXIT_NOSD);
    }
    
    //init SD card pins
    TRISACLR = _TRISA_TRISA2_MASK | _TRISA_TRISA3_MASK | _TRISA_TRISA4_MASK;
    TRISBCLR = _TRISB_TRISB2_MASK | _TRISB_TRISB3_MASK | _TRISB_TRISB4_MASK;
    
    //Set LED pins to open drain and turn off r,g and b
    ODCASET = _ODCA_ODCA2_MASK;
    ODCBSET = _ODCB_ODCB2_MASK | _ODCB_ODCB3_MASK;
    LATASET = _LATA_LATA2_MASK;
    
    SYS_waitCP0(100);
    SPI_init(&RPA4R, 0, 5, 400000);
    
    LATBCLR = _LATB_LATB2_MASK | _LATB_LATB3_MASK;
    uint32_t count = SD_INIT_MAXATTEMPS;
    while(--count){
        if(disk_initialize(0) == 0){
            f_mount(&fso, "", 0);
            break;
        }
        SYS_waitCP0(100);
    }
    
    if(!count){
        BL_startApplication(BOOTLOADER_EXIT_SD_INIT_FAIL);
    }
    
    FRESULT res = f_open(&file, BL_IMAGE_PATH, FA_READ);
    if(res != FR_OK){
        BL_startApplication(BOOTLOADER_EXIT_NO_BOOTFILE);
    }
    if(!BL_verifyFile(&file)){
        BL_startApplication(BOOTLOADER_EXIT_INVALID_BOOTFILE);
    }
    //a valid boot file exists

    f_lseek(&file, 0);

    if(!BL_eraseFlash()){
        //if the code gets here we have fucked up...
        LATASET = _LATA_LATA2_MASK;
        LATBSET = _LATB_LATB2_MASK | _LATB_LATB2_MASK;
        while(1){
            LATBINV = _LATB_LATB3_MASK;
            SYS_waitCP0(500);
        }
    }

    LATASET = _LATA_LATA2_MASK;
    LATBCLR = _LATB_LATB2_MASK;

    //flash is now empty
    if(!BL_writeFlash(&file)){
        //if the code gets here we have fucked up...
        LATASET = _LATA_LATA2_MASK;
        LATBSET = _LATB_LATB2_MASK | _LATB_LATB2_MASK;
        while(1){
            LATBINV = _LATB_LATB3_MASK;
            SYS_waitCP0(500);
        }
    }
    
    LATACLR = _LATA_LATA2_MASK;
    LATBSET = _LATB_LATB2_MASK | _LATB_LATB2_MASK;
    
    SYS_waitCP0(1000);

    BL_startApplication(BOOTLOADER_EXIT_UPDATE_COMPLETE);
}

//scan through the file and make sure it has no errors in it
unsigned BL_verifyFile(FIL * file){
    unsigned ret = 1;
    char buff[64];
    THexFileInfo fileInfo;
    LATASET = _LATA_LATA2_MASK;
    LATBSET = _LATB_LATB2_MASK | _LATB_LATB3_MASK;
    
    while(f_gets(buff, 2048, file) != 0){
        THexResult_t res = THEX_parseString(&fileInfo, buff, 0, 0);
        if(res == THEX_EOF) break;
        
        if((++flashCount & 0xff) == 0) LATBINV = _LATB_LATB2_MASK | _LATB_LATB3_MASK;
        if(res != THEX_OK && res < 0x1000){ 
            return 0;
        }
    }
    
    return ret;
}

//erase the program memory space
unsigned BL_eraseFlash(){
    uint32_t cp = BL_MEMSTART;
    
    //reset LEDs
    LATASET = _LATA_LATA2_MASK;
    LATBSET = _LATB_LATB2_MASK | _LATB_LATB3_MASK;
    
    //erase the flash we need to write page by page
    for(; cp < BL_MEMEND;cp += PAGE_SIZE){
        if(!NVM_erasePage((void*) cp)) return 0;
        if((++flashCount & 0xf) == 0){ 
            LATAINV = _LATA_LATA2_MASK;
            LATBINV = _LATB_LATB2_MASK;
        }
    }
    return 1;
}

//write the data from the file to PFM
unsigned BL_writeFlash(FIL * file){
    char buff[64];
    uint8_t dBuff[32];
    uint32_t lengthRead = 0;
    
    //stores all info about the current file
    THexFileInfo fileInfo;
    
    //clear LEDs
    LATASET = _LATA_LATA2_MASK;
    LATBSET = _LATB_LATB2_MASK | _LATB_LATB3_MASK;
    
    //read one line at a time, and write its contents into the flash
    while(f_gets(buff, 2048, file) != 0){
        uint32_t res = THEX_parseString(&fileInfo, buff, &lengthRead, dBuff);
        if(res == THEX_EOF) break;
        
        //blinky blinky yaaaay
        if((++flashCount & 0xff) == 0){ 
            LATBINV = _LATB_LATB2_MASK;
        }
        
        //check if the address is writable or if an error has occurred
        //there should never actually be an error here, as we have pre-verified the file at this point
        if(BL_isAddressWritable(res)){
            //if the address of the line we read is at a address we need to write, do so
            if(!NVM_memcpy4((void*) res, (void*) dBuff, lengthRead)) return 0;
        }else if(res == THEX_CHKSM_ERROR){ 
            return 0;
        }else if(res == THEX_INVALID_ADDRESS){ 
            return 0;
        }else if(res == THEX_INCOMPATIBLE_STRING){ 
            return 0;
        }
    }
    return 1;
}

//Wait function based on the core timer (running at Fcpu / 2)
void SYS_waitCP0(uint16_t length){
    uint32_t currCount = _CP0_GET_COUNT();
    uint32_t targetTime = currCount + length * (48000000 / 2000);
    while(_CP0_GET_COUNT() < targetTime);
}

void BL_startApplication(uint32_t code){
    TMR2 = code;            //hacky, but hey... at least it works and shouldn't affect existing code
    
    if(code > BOOTLOADER_EXIT_INVALID_BOOTFILE){
        f_close(&file);
    }
    if(code > BOOTLOADER_EXIT_SD_INIT_FAIL){
        f_unmount("");
    }
    
    asm volatile("j		0x9D000000");
    asm volatile("nop");    //do I even need this?
}

unsigned FS_isCardPresent(){
    return !PORTAbits.RA0;
}

unsigned BL_isAddressWritable(uint32_t addr){
    if(addr >= KVA_TO_PA(BL_MEMSTART) && addr < KVA_TO_PA(BL_MEMEND)) return 1;
    return 0;
}