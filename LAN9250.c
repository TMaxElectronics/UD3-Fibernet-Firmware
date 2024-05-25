#include <xc.h>
#include <stdint.h>
#include <sys/kmem.h>

#include "FreeRTOS.h"
#include "FreeRTOS_IP.h"
#include "FreeRTOS_IP_Private.h"
#include "task.h"
#include "semphr.h"
#include "SPI.h"
#include "LAN9250.h"
#include "UART.h"
#include "LED.h"
#include "FiberComms.h"
#include "TTerm.h"
#include "startup.h"

static TaskHandle_t TXTask = NULL;
SemaphoreHandle_t ETH_commsSem;
SemaphoreHandle_t ETH_commsWaitSem;
uint16_t packetCount = 0;
SPI_HANDLE * ETH_spi;

void ETH_init(){
    //initialize our SPI handle
    ETH_spi = SPI_createHandle(2);
    SPI_init(ETH_spi, &RPB8R, 0b0011, 0, 400000);
    
    ETH_commsSem = xSemaphoreCreateBinary();
    ETH_commsWaitSem = xSemaphoreCreateBinary();
    xSemaphoreTake(ETH_commsSem, 0);
    xSemaphoreTake(ETH_commsWaitSem, 0);
    
    TERM_addCommand(CMD_getMacState, "getMacState", "reads MAC information", 0, &TERM_cmdListHead);
    
    while(1){
        //wait until we deassert reset after powerup
        vTaskDelay(pdMS_TO_TICKS(25));
        ETH_RST = 1;
        //wait for the chip to become ready after reset deassertion
        vTaskDelay(pdMS_TO_TICKS(25));
        
        //poll the HW_CFG register for the ready bit
        uint32_t result = 0;
        uint32_t currResetCount = 0;
        while(((currResetCount++) < 0x5)){
            result = ETH_readReg(LAN9250_HW_CFG);
            if(result & 0x08000000) break;
        }
        
        if(!(result & 0x08000000)){
            //we didn't get the ready flag. Try again after a little while
            ETH_RST = 0;
            COMMS_eventHook(ETH_INIT_FAIL);
            vTaskDelay(pdMS_TO_TICKS(1000));
            ETH_RST = 1;
            vTaskDelay(pdMS_TO_TICKS(1000));
            ETH_RST = 0;
            vTaskDelay(pdMS_TO_TICKS(1000));
            continue;
        }
        break;
    }
    
    //print debug information that tells us about the state of the chip
    UART_printDebug("SFP Chip ID & Revision number: 0x%08x\r\n", ETH_readReg(LAN9250_ID_REV));
    UART_printDebug("Phy is in %s mode\r\n", ((ETH_readPhy(LAN9250_PHY_SPECIAL_MODES) & 0x400) != 0) ? "fiber" : "copper");
    
    //write config registers
    ETH_writeMacAddress(MAC_ADDRESS);
    
    //set the SPI clock to the maximum possible
    SPI_setCLKFreq(ETH_spi, 24000000);
    
    ETH_setHWConf(5);
    ETH_setAutoFlowcontrol(0x6E, 0x37, 1);
    ETH_setInterruptConfiguration(0, 0, 0, 0, 0);   //hardware interrupts not supported
    ETH_clearIF(0xffffffff);
    ETH_enableInt(LAN9250_INTERRUPT_TX_STATUS_LEVEL | LAN9250_INTERRUPT_RX_STATUS_LEVEL);
    ETH_setFifoInt(0,0,0);
    ETH_setRxConf(0, 0x600, 0);
    ETH_setTxConf(0, 1);
    ETH_setPowermanagement(0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0);
    ETH_setMacControl(0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1);
    
    PHY_setBasicControl(0, 1, 0, 0, 0, 1, 0);
    PHY_setSpecialMode(0b011);
    PHY_setSpecialControlStatus(0, 0, 0, 1, 1, 0);
    PHY_enableInterrupts(1,0,0,0,1,0,0,0);
    ETH_writePhy(LAN9250_PHY_SPECIAL_CONTROL_STATUS, 0x0040); 
    ETH_writeReg(LAN9250_LED_CTRL, 0b00000000111);
    
    //setup dma for receive and transmit
    ETH_setupDMA();
    
    //create RTOS task for polling the LAN's registers
    xTaskCreate(ETH_run, "ethTask", configMINIMAL_STACK_SIZE + 125, NULL, tskIDLE_PRIORITY + 2, NULL );
    xSemaphoreGive(ETH_commsSem);
    xSemaphoreGive(ETH_commsWaitSem);
           
    COMMS_eventHook(ETH_INIT_DONE);
}

unsigned linkState = 0;
uint8_t linkCheckDivider = 0;

//running task. Checks for interrupts and services any that might have occured
static void ETH_run( void *pvParameters ){
    while(1){
        if(xSemaphoreTake(ETH_commsSem, 1000)){
            uint32_t intStatus = ETH_readReg(LAN9250_INT_STAT);
            uint32_t intClear = 0;
            
            if(intStatus == 0xffffffff){ 
                COMMS_pushAlarm(ALARM_PRIO_WARN, "LAN9250 communications error: could not read INT_STA ", intStatus);
                intStatus = 0;
            }
            
            if(intStatus & LAN9250_INTERRUPT_DEVICE_READY){
                intClear |= LAN9250_INTERRUPT_DEVICE_READY;
            }
            if(intStatus & LAN9250_INTERRUPT_PHY_EVENT){
                uint16_t phyIntStatus = ETH_readPhy(LAN9250_PHY_INTERRUPT_SOURCE);
                if(phyIntStatus & LAN9250_PHY_INTERRUPT_LINK_UP){
                    linkState = 1;
                    LED_ethLinkStateChangeHook(linkState);
                    COMMS_eventHook(ETH_LINK_UP);
                }else if(phyIntStatus & LAN9250_PHY_INTERRUPT_LINK_DOWN){
                    linkState = 0;
                    LED_ethLinkStateChangeHook(linkState);
                    COMMS_eventHook(ETH_LINK_DOWN);
                }
                intClear |= LAN9250_INTERRUPT_PHY_EVENT;
            }
            
            /* unused, this gets triggered as soon as the MAC loads a frame with the IOC (interrupt on completion) flag set, which we don't use
            if(intStatus & LAN9250_INTERRUPT_TX_IOC){
            
            }
            */
            
            if(intStatus & LAN9250_INTERRUPT_RX_DMA){
                intClear |= LAN9250_INTERRUPT_RX_DMA;
            }
            if(intStatus & LAN9250_INTERRUPT_TX_STATUS_OVERFLOW){
                intClear |= LAN9250_INTERRUPT_TX_STATUS_OVERFLOW;
            }
            if(intStatus & LAN9250_INTERRUPT_TX_DATA_OVERRUN){
                intClear |= LAN9250_INTERRUPT_TX_DATA_OVERRUN;
            }
            if(intStatus & LAN9250_INTERRUPT_TX_DATA_AVAILABLE){
                intClear |= LAN9250_INTERRUPT_TX_DATA_AVAILABLE;
            }
            if(intStatus & LAN9250_INTERRUPT_TX_STATUS_LEVEL){
                ETH_dumpTX();
                //TODO keep a list of enqueued frames, and clear those that were transmitted successfully, so we can detect any skipped ones
                intClear |= LAN9250_INTERRUPT_TX_STATUS_LEVEL;
            }
            if(intStatus & LAN9250_INTERRUPT_RX_DROPPED_FRAME){
                COMMS_pushAlarm(ALARM_PRIO_WARN, "LAN9250 rx FiFo overflow! Packet FiFo was reset ", intStatus);
                ETH_forceRXDiscard();
                
                COMMS_pushAlarm(ALARM_PRIO_CRITICAL, "LAN9250 rx fifo overrun", ALARM_NO_VALUE);
                //set a software breakpoint if this is a debug build, so we can explore the contents of registers and stuff
                configASSERT(0);
                
                intClear |= LAN9250_INTERRUPT_RX_DROPPED_FRAME;
            }
            if(intStatus & LAN9250_INTERRUPT_RX_STATUS_LEVEL){
                //there is at least one frame in the RX fifo that we can read, so poll the ETH_readFrame function until it returns NULL which indicates that no more frames can be read
                NetworkBufferDescriptor_t * currFrame = 0;
                
                while((currFrame = ETH_readFrame()) != NULL){
                    //check if the frame is for us and needs processing
                    if(eConsiderFrameForProcessing(currFrame->pucEthernetBuffer) == eProcessBuffer){
                        //if it is, then send an IPStackEvent to the stack
                        IPStackEvent_t xRxEvent;
                        xRxEvent.eEventType = eNetworkRxEvent;
                        xRxEvent.pvData = ( void * ) currFrame;
                        
                        if(xSendEventStructToIPTask(&xRxEvent, 0) == pdFALSE){
                            //the stack didn't like what we gave it, so we need to free stuff
                            vReleaseNetworkBufferAndDescriptor(currFrame);
                            iptraceETHERNET_RX_EVENT_LOST();
                        }else{
                            //the stack was happy, continue
                            iptraceNETWORK_INTERFACE_RECEIVE();
                        }
                    }else{
                        //the frame is not for us, so we release the buffer
                        vReleaseNetworkBufferAndDescriptor(currFrame);
                    }
                }
                intClear |= LAN9250_INTERRUPT_RX_STATUS_LEVEL;
            }
            
            /* 
             * these errors occur only if the driver makes a mistake, any other errors are handled be either the RX FiFo status, or the mac itself
             * so if we get here we fucked something up and either pulled to little or too much data out of the FiFos
             */
            
            if(intStatus & LAN9250_INTERRUPT_RX_ERROR){
                
                //set a software breakpoint if this is a debug build, so we can explore the contents of registers and stuff
                configASSERT(0);
                
                UART_printDebug("RX Error has occurred\r\n");
                intClear |= LAN9250_INTERRUPT_RX_ERROR;
            }
            if(intStatus & LAN9250_INTERRUPT_TX_ERROR){
                
                //set a software breakpoint if this is a debug build, so we can explore the contents of registers and stuff
                configASSERT(0);
                
                UART_printDebug("TX Error has occurred\r\n");
                intClear |= LAN9250_INTERRUPT_TX_ERROR;
            }
            
            //check if we have dealt with all interrupts 
            if((intStatus & (~intClear)) != 0){
                //set a software breakpoint if this is a debug build, so we can explore the contents of registers and stuff
                configASSERT(0);
                COMMS_pushAlarm(ALARM_PRIO_INFO, "LAN9250 interrupts handler error. Unexpected flag ", intStatus & (~intClear));
            }
            
            ETH_clearIF(0xffffffff);    //clear all int flags
            
            xSemaphoreGive(ETH_commsSem);
            vTaskDelay(1);
        }
    }
}

NetworkBufferDescriptor_t * ETH_readFrame(){
    //check if there is even a packet in the fifo, if not return NULL so the caller knows that we are done receiving anything
    if(!ETH_rxDataAvailable()) return NULL;
    
    //read the rx status FiFo, to get info on the next packet
    RX_STATUS_DATA * s = pvPortMalloc(sizeof(RX_STATUS_DATA));
    *((uint32_t *)s) = ETH_readReg(LAN9250_RX_STAT_FIFO); //your typecast protection is no match for my pointers old man
    
    //TODO check for errors in the RX_STATUS_DATA 
    
    //allocate a buffer for the new packet
    NetworkBufferDescriptor_t * ret = pxGetNetworkBufferWithDescriptor(s->packetSize, 0);
    if(ret == NULL){ 
        COMMS_pushAlarm(ALARM_PRIO_CRITICAL, "LAN9250 rx buffer failed", ALARM_NO_VALUE);
        UART_printDebug("RX buffer allocation failed!\r\n");
        return NULL;
    }
    
    //begin pulling in data
    ETH_CS = 0;
    
    //write the SPI command to start the read
    SPI_send(ETH_spi, LAN9250_INSTR_REGREAD_SINGLE);
    SPI_send(ETH_spi, LAN9250_RX_DATA_FIFO >> 8); SPI_send(ETH_spi, LAN9250_RX_DATA_FIFO);
    
    /*
     * why isn't this done with DMA anymore?
     * There were some cases in which the rx dma channel just "forgot" some bytes and the ETH_rxDmaFinishedCallback() was never called,
     * leaving the task stuck at the xSemaphoreTake for 1000 ticks (and us with a lost/corrupted packet). And since the DMA has plenty to do anyway (and this read doesn't 
     * take up too many cpu cycles) I changed this to be CPU based.
     */
    
    //perform the read
    uint8_t * dst = ret->pucEthernetBuffer;
    uint16_t currByte = 0;
    for(currByte = 0; currByte < s->packetSize;currByte++){
        SPI2BUF = 0xff;
        while(SPI2STAT & _SPI2STAT_SPIBUSY_MASK);
        dst[currByte] = SPI2BUF;
    }
    
    //the LAN only accepts communication in entire words, so we need to read any potential padding bytes
    uint8_t remaining = 4 - (s->packetSize % 4);
    if(remaining != 4) while(remaining--) SPI_send(ETH_spi, 0xff);
    
    
    //set the CS and free the data status data struct
    ETH_CS = 1;
    vPortFree(s);
    
    return ret;
}

void __ISR(_DMA0_VECTOR) ETH_txDmaFinishedCallback(){
    IFS1CLR = _IFS1_DMA0IF_MASK;
    
    if((DCH0INT & _DCH0INT_CHBCIF_MASK) != 0){
        //data has been sent -> clean up stuff
        DCH0INTCLR = 0xff;
        
        //because the DMA didn't read out any data there will be an overrun condition here. turning the module off and on again clears that error
        SPI2CONCLR = _SPI2CON_ON_MASK;
        SPI2CONSET = _SPI2CON_ON_MASK;
        
        //the LAN only accepts communication in entire words, so we need to read any potential padding bytes
        uint8_t remaining = 4 - (DCH0SSIZ % 4);
        if(remaining != 4) while(remaining--) SPI_send(ETH_spi, 0xff);
        
        ETH_CS = 1;
        
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;
        xSemaphoreGiveFromISR(ETH_commsSem, &xHigherPriorityTaskWoken);
        portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
        
        //CLEN (imagine meme man here)
    }
}

unsigned ETH_waitForTXSpace(uint16_t length){
    /*
     * to see if there is enough space for our packet we write the size of it into the TX FiFo data available level field, 
     * so the chips gives an interrupt once there is enough data free
     */
    
    //the tx data available level is in multiples of 64 bytes, so we set the field to (length rounded to 64 bytes) + 64 bytes
    uint32_t newLength = (((length / 64) + 1) << 24);
    
    //read the current value, as there are other settings we might have to preserve, and clear the TX Data Available Level field
    uint32_t currVal = (ETH_readReg(LAN9250_FIFO_INT) & ~0xff000000);
    
    //write the new value
    ETH_writeReg(LAN9250_FIFO_INT, currVal | newLength); 
    
    //clear the int flag so we can check it later
    ETH_clearIF(LAN9250_INTERRUPT_TX_DATA_AVAILABLE);
    
    //check if the flag is set again, indicating that enough space is available
    return (ETH_readReg(LAN9250_INT_STAT) & LAN9250_INTERRUPT_TX_DATA_AVAILABLE);
}

BaseType_t ETH_writePacket(uint8_t * data, uint16_t length){
    if(data == 0 || length == 0) return pdFALSE;
    
    if(!xSemaphoreTake(ETH_commsSem, 1000)){ 
        return pdFALSE; //SPI comms never became available
        COMMS_pushAlarm(ALARM_PRIO_CRITICAL, "LAN9250 couldn't get semaphore for tx", ALARM_NO_VALUE);
    }
    
    //return if no space is available
    if(!ETH_waitForTXSpace(length)){
        xSemaphoreGive(ETH_commsSem);
        COMMS_pushAlarm(ALARM_PRIO_CRITICAL, "LAN9250 never got tx fifo space", ALARM_NO_VALUE);
        return pdFALSE;
    }
    //TODO make sure that we never return here as we might drop frames if that happens
    
    //TODO re-implement dma in a way that actually works..., 
    //though It isn't cpu-cycle critical at all at the moment
    
    /*
    //set up the TX DMA channel to transfer [length] bytes from [data]
    DCH0SSA = KVA_TO_PA(data);
    DCH0SSIZ = length;
    
    //reset interrupt flags before enabling the interrupt again, as the DMA operation pulling data in from the LAN will leave these set
    DCH0INTCLR = 0xff;
    IFS1CLR = _IFS1_DMA0IF_MASK;
    
    //re enable the interrupt
    IEC1SET = _IEC1_DMA0IE_MASK;
    */
    
    //write the two TX Commands
    ETH_writeReg(LAN9250_TX_DATA_FIFO, LAN9250_TXCMD_A_FIRST_DATA | LAN9250_TXCMD_A_LAST_DATA | length); 
    ETH_writeReg(LAN9250_TX_DATA_FIFO, ((packetCount++) << 16) | length);

    //start the data write
    ETH_CS = 0;
    SPI_send(ETH_spi, LAN9250_INSTR_REGWRITE_SINGLE);
    SPI_send(ETH_spi, LAN9250_TX_DATA_FIFO >> 8); SPI_send(ETH_spi, LAN9250_TX_DATA_FIFO & 0xff);    
    
    uint16_t currByte = 0;
    for(currByte = 0; currByte < length;currByte++){
        SPI2BUF = data[currByte];
        while(SPI2STAT & _SPI2STAT_SPIBUSY_MASK);
    }
    
    //because the DMA didn't read out any data there will be an overrun condition here. turning the module off and on again clears that error
    SPI2CONCLR = _SPI2CON_ON_MASK;
    SPI2CONSET = _SPI2CON_ON_MASK;
        
    //the LAN only accepts communication in entire words, so we need to read any potential padding bytes
    uint8_t remaining = 4 - (length % 4);
    if(remaining != 4) while(remaining--) SPI_send(ETH_spi, 0xff);

    ETH_CS = 1;
    xSemaphoreGive(ETH_commsSem);
    
    /*//start the DMA transfer
    DCH0CONSET = _DCH0CON_CHEN_MASK;    
    DCH0ECONSET = _DCH0ECON_CFORCE_MASK;
    */
    
    return pdTRUE;
}

//software reset
void ETH_reset(){
    ETH_writeReg(LAN9250_RESET_CTL, 0x00000001);
}

unsigned ETH_rxDataAvailable(){
    //check if the RX_STATUS_LEVEL interrupt is active (which occurs when at least one packet is in the FiFo) 
    ETH_clearIF(LAN9250_INTERRUPT_RX_STATUS_LEVEL);
    return (ETH_readReg(LAN9250_INT_STAT) & LAN9250_INTERRUPT_RX_STATUS_LEVEL) != 0;
}

unsigned ETH_CheckLinkUp(){
    return linkState;
}

uint16_t ETH_getTXStatusCount(){
    return (ETH_readReg(LAN9250_TX_FIFO_INF) >> 16) & 0xffff;
}

uint32_t ETH_readReg(uint16_t addr){
    ETH_CS = 0;
    SPI_send(ETH_spi, LAN9250_INSTR_REGREAD_SINGLE);
    SPI_send(ETH_spi, addr >> 8); SPI_send(ETH_spi, addr);
    uint32_t ret = 0;
    ret |=  SPI_send(ETH_spi, 0xff)          & 0xff;
    ret |= (SPI_send(ETH_spi, 0xff) << 8)    & 0xff00;
    ret |= (SPI_send(ETH_spi, 0xff) << 16)   & 0xff0000;
    ret |= (SPI_send(ETH_spi, 0xff) << 24)   & 0xff000000;
    ETH_CS = 1;
    return ret;
}

void ETH_writeReg(uint32_t addr, uint32_t value){
    ETH_CS = 0;
    SPI_send(ETH_spi, LAN9250_INSTR_REGWRITE_SINGLE);
    SPI_send(ETH_spi, addr >> 8); SPI_send(ETH_spi, addr);
    SPI_send(ETH_spi, value);
    SPI_send(ETH_spi, value >> 8);
    SPI_send(ETH_spi, value >> 16);
    SPI_send(ETH_spi, value >> 24);
    ETH_CS = 1;
}

//check if we can communicate with the mac
unsigned ETH_CSRBusy(){
    return ETH_readReg(LAN9250_CSR_CMD) & 0x80000000;
}

//TODO add proper checks for valid reads and writes
void ETH_writeMac(uint32_t addr, uint32_t value){
    uint32_t timeout = 2000;
    while(--timeout && ETH_CSRBusy());
    if(!timeout) return;
    
    ETH_writeReg(LAN9250_CSR_DATA, value);
    
    ETH_writeReg(LAN9250_CSR_CMD, (0x80000000 | addr));
}

uint32_t ETH_readMac(uint32_t addr){
    uint32_t timeout = 2000;
    while(--timeout && ETH_CSRBusy());
    if(!timeout) return 0xffffffff;
    ETH_writeReg(LAN9250_CSR_CMD, 0x80000000 | 0x40000000 | addr);
    while(--timeout && ETH_CSRBusy());
    if(!timeout) return 0xffffffff;
    return ETH_readReg(LAN9250_CSR_DATA);
}

//Check if we can communicate with the PHY
unsigned ETH_MIIBusy(){
    return ETH_readMac(LAN9250_MAC_MII_ACC) & 1;
}

void ETH_writePhy(uint16_t index, uint16_t data){
    uint32_t cmd;
    cmd = ((LAN9250_PHY_ADDRESS & 0x1F) << 11) | ((index & 0x1F)<< 6) | 2;
    
    uint32_t timeout = 2000;
    while(--timeout && ETH_MIIBusy());
    if(!timeout) return;
    
    ETH_writeMac(LAN9250_MAC_MII_DATA, data);
    ETH_writeMac(LAN9250_MAC_MII_ACC, cmd);
}

uint32_t ETH_readPhy(uint8_t index){
    uint32_t cmd = ((LAN9250_PHY_ADDRESS & 0x1F) << 11) | ((index & 0x1F) << 6);
    
    uint32_t timeout = 2000;
    while(--timeout && ETH_MIIBusy());
    if(!timeout) return 0xffffffff;
    
    ETH_writeMac(LAN9250_MAC_MII_ACC, cmd);
    
    timeout = 2000;
    while(--timeout && ETH_MIIBusy());
    if(!timeout) return 0xffffffff;
    
    return ETH_readMac(LAN9250_MAC_MII_DATA);   
}

void ETH_setupDMA(){
    //TX channel
    DCH0CON = 0b00000001;                       //channel is off (enabled once transmission starts), no chaining, channel auto enable is off, prio 2
    DCH0ECON = (_SPI2_TX_IRQ << 8) | 0b10000;   //transmit byte on SPI TX done
    //DCH0SSA (source start) is to be set before each transfer
    DCH0DSA = KVA_TO_PA(&SPI2BUF);              //write into the SPI buffer
    
    //DCH0SSIZ (source size) is to be set before each transfer
    DCH0DSIZ = 1;                               // destination size - 1 byte
    DCH0CSIZ = 1;                               // Cell size - copy one byte every time the interrupt fires
    
    DCH0INT = _DCH0INT_CHBCIE_MASK;             //interrupt once the transfer is completed
    IEC1SET = _IEC1_DMA0IE_MASK;
    IPC10bits.DMA0IP = 4;
    IPC10bits.DMA0IS = 3;
    
    //RX channel
    DCH1CON = 0b00000011;                       //channel is off (enabled once transmission starts), no chaining, channel auto enable is off, prio 1
    DCH1ECON = (_SPI2_RX_IRQ << 8) | 0b10000;   //transmit byte on SPI TX done
    DCH1SSA = KVA_TO_PA(&SPI2BUF);
    //DCH1DSA (destination start) is to be set before each transfer
    
    DCH1SSIZ = 1;                               // source size - 1 byte
    //DCH1DSIZ (destination size) is to be set before each transfer
    DCH1CSIZ = 1;                               // Cell size - copy one byte every time the interrupt fires
    
    DCH1INT = _DCH1INT_CHBCIE_MASK; //interrupt once the transfer is completed
    IEC1SET = _IEC1_DMA1IE_MASK;
    IPC10bits.DMA1IP = 4;
    IPC10bits.DMA1IS = 3;
}

//Only register mapping functions after this point

void PHY_enableInterrupts(unsigned linkUp, unsigned energyOn, unsigned autoNegotiation, unsigned remoteFault, unsigned linkDown, unsigned autoNegotiationAck, unsigned parallelDetectionFault, unsigned autoNegotioationPageReceived){
    uint32_t writeVal = (linkUp << 9) | (energyOn << 7) | (autoNegotiation << 6) | (remoteFault << 5) | (linkDown << 4) | (autoNegotiationAck << 3) | (parallelDetectionFault << 2) | (autoNegotioationPageReceived << 1);
    ETH_writePhy(LAN9250_PHY_INTERRUPT_MASK, writeVal);
}

void PHY_setSpecialControlStatus(unsigned overrideStraps, unsigned enableAutoMDIX, unsigned autoMDIXState, unsigned disableSQE, unsigned enableFEFI, unsigned tenBaseTPolarity){
    uint32_t writeVal = (overrideStraps << 15) | (enableAutoMDIX << 14) | (autoMDIXState << 13) | (disableSQE << 11) | (enableFEFI << 5) | (tenBaseTPolarity << 4);
    ETH_writePhy(LAN9250_PHY_SPECIAL_CONTROL_STATUS_IND, writeVal);
}

void PHY_setSpecialMode(uint8_t phyMode){
    uint32_t currVal = ETH_readPhy(LAN9250_PHY_SPECIAL_MODES);
    currVal &= 0x400;   //bit 10 needs to get the default state written
    currVal |= (phyMode << 5) | LAN9250_PHY_ADDRESS;
    ETH_writePhy(LAN9250_PHY_SPECIAL_MODES, currVal);
}

void PHY_setAutoNegAbilities(unsigned nextPage, unsigned remoteFault, unsigned extendPage, unsigned asymmetricPause, unsigned symmetricPause, unsigned fd100BaseX, unsigned hd100BaseX, unsigned fd10BaseT, unsigned hd10BaseT, uint8_t selectorField){
    uint32_t writeVal = (nextPage << 15) | (remoteFault << 13) | (extendPage << 12) | (asymmetricPause << 11) | (symmetricPause << 10) | (fd100BaseX << 8) | (hd100BaseX << 7) | (fd10BaseT << 6) | (hd10BaseT << 5) | (selectorField);
    ETH_writePhy(LAN9250_PHY_AN_ADV, writeVal);
}

void PHY_setBasicControl(unsigned loopback, unsigned speedSelect, unsigned autoNegotiate, unsigned powerDown, unsigned restartAutoNegotioation, unsigned duplexMode, unsigned collisionTest){
    uint32_t writeVal = (loopback << 14) | (speedSelect << 13) | (autoNegotiate << 12) | (powerDown << 11) | (restartAutoNegotioation << 9) | (duplexMode << 8) | (collisionTest << 7);
    ETH_writePhy(LAN9250_PHY_BASIC_CONTROL, writeVal);
}

void ETH_setMacControl(unsigned receiveAll, unsigned enableEnergyEfficientMode, unsigned filterOwnPackets, unsigned enableLoopBack, unsigned enableFullDuplex, unsigned passAllMulticast, unsigned enablePromiscuousMode, unsigned enableInverseFilter, unsigned passBadFrames, unsigned hashOnly, unsigned enableHashcheck, unsigned disableBroadcast, unsigned disableRetry, unsigned stripPadding, uint8_t backOffLimit, unsigned enableDeferralCheck, unsigned TXEnable, unsigned RXEnable){
    uint32_t writeVal = (receiveAll << 31) | (enableEnergyEfficientMode << 25) | (filterOwnPackets << 23) | (enableLoopBack << 21) | (enableFullDuplex << 20) | (passAllMulticast << 19) | (enablePromiscuousMode << 18) | (enableInverseFilter << 17) | (passBadFrames << 16) | (hashOnly << 15) | (enableHashcheck << 13) | (disableBroadcast << 11) | (disableRetry << 10) | (stripPadding << 8) | (backOffLimit << 6) | (enableDeferralCheck << 5) | (TXEnable << 3) | (RXEnable << 2);
    ETH_writeMac(LAN9250_MAC_CR, writeVal);
}

void ETH_setMacChcksmControl(unsigned offloadEngineEnable, unsigned rxOffloadMode, unsigned rxOffloadEngineEnable){
    uint32_t writeVal = (offloadEngineEnable << 16) | (rxOffloadMode << 1) | (rxOffloadEngineEnable << 0);
    ETH_writeMac(LAN9250_MAC_COE_CR, writeVal);
}

void ETH_setPowermanagement(uint8_t pmtMode, unsigned sleep, unsigned autoWakeup, unsigned enableLEDs, unsigned enable1588Clock, unsigned enable1588Timestamp, unsigned enableClocking, unsigned enableEnergyDetect, unsigned enableWOL, unsigned bufferType, unsigned enablePMEPin){
    uint32_t currState = ETH_readReg(LAN9250_PMT_CTRL);
    currState &= ~(LAN9250_PME_WOL_STATUS | LAN9250_PME_ENERGY_DETECT);
    currState |= (pmtMode << 29) | (sleep << 28) | (autoWakeup << 27) | (!enableLEDs << 26) | (!enable1588Clock << 25) | (!enable1588Timestamp << 22) | (!enableClocking << 19) | (!enableClocking << 18) | (enableEnergyDetect << 14) | (enableWOL << 9) | (bufferType << 6) | (enablePMEPin << 1);
    ETH_writeReg(LAN9250_PMT_CTRL, currState);
    ETH_writeReg(LAN9250_PMT_CTRL, currState);
} 

void ETH_setTxConf(unsigned allowOverrun, unsigned enableTX){
    uint32_t writeVal = (allowOverrun << 2) | (enableTX << 1);
    ETH_writeReg(LAN9250_TX_CFG, writeVal);
}

void ETH_forceTXDiscard(){
    uint32_t currState = ETH_readReg(LAN9250_TX_CFG);
    currState |= LAN9250_TX_CFG_FORCE_DATA_DISCARD | LAN9250_TX_CFG_FORCE_STATUS_DISCARD;
    ETH_writeReg(LAN9250_TX_CFG, currState);
}

void ETH_setRxConf(uint8_t dataAlignment, uint16_t dmaCount, uint8_t dataOffset){
    uint32_t writeVal = (dataAlignment << 30) | (dmaCount << 16) | (dataOffset << 8);
    ETH_writeReg(LAN9250_RX_CFG, writeVal);
}

void ETH_forceRXDiscard(){
    uint32_t currState = ETH_readReg(LAN9250_RX_CFG);
    currState |= LAN9250_RX_CFG_FORCE_DISCARD;
    ETH_writeReg(LAN9250_RX_CFG, currState);
}

void ETH_setFifoInt(uint8_t txDataAvailableLevel, uint8_t txStatusLevel, uint8_t rxStatusLevel){
    uint32_t writeVal = (txDataAvailableLevel << 24) | (txStatusLevel << 16) | rxStatusLevel;
    ETH_writeReg(LAN9250_FIFO_INT, writeVal);
}

void ETH_enableInt(uint32_t intsToEnable){
    uint32_t currState = ETH_readReg(LAN9250_INT_EN);
    currState |= intsToEnable;
    ETH_writeReg(LAN9250_INT_EN, currState);
}

void ETH_disableInt(uint32_t intsToDisable){
    uint32_t currState = ETH_readReg(LAN9250_INT_EN);
    currState &= ~intsToDisable;
    ETH_writeReg(LAN9250_INT_EN, currState);
}

void ETH_clearIF(uint32_t flagsToClear){
    ETH_writeReg(LAN9250_INT_STAT, flagsToClear);
}

void ETH_setInterruptConfiguration(uint8_t deAssertTime, unsigned enableInterrups, unsigned interruptPolarity, unsigned clockSource, unsigned bufferType){
    uint32_t writeVal = (deAssertTime << 24) | (enableInterrups << 8) | (interruptPolarity << 4) | (clockSource << 1) | bufferType;//0xA0000111;//
    ETH_writeReg(LAN9250_IRQ_CFG, writeVal);
}

void ETH_setAutoFlowcontrol(uint8_t fcRisingThreshold, uint8_t fcFallingThreshold, unsigned fcAnyFrame){
    uint32_t writeVal = (fcRisingThreshold << 16) | (fcFallingThreshold << 8) | (4 << 4) | fcAnyFrame;
    ETH_writeReg(LAN9250_AFC_CFG, writeVal);
    UART_printDebug("\r\nAFC_CFG written: 0x%08x => 0x%08x\r\n", writeVal, ETH_readReg(LAN9250_AFC_CFG));
}

void ETH_setHWConf(uint8_t txFifoSizeKB){
    uint32_t writeVal = 0x00100000 | (txFifoSizeKB << 16);  //bit20 must be one (see datasheet page 395)
    ETH_writeReg(LAN9250_HW_CFG, writeVal);
}

void ETH_writeMacAddress(uint8_t * macAddr){
    uint32_t addrL = macAddr[0] | (macAddr[1] << 8) | (macAddr[2] << 16) | (macAddr[3] << 24);
    uint32_t addrH = macAddr[4] | (macAddr[5] << 8);
    UART_printDebug("mac address is %08x       ", addrH);
    ETH_writeMac(LAN9250_MAC_ADDR_H, addrH);
    ETH_writeMac(LAN9250_MAC_ADDR_L, addrL);
    UART_printDebug("Mac Address high=0x%04x    ", ETH_readMac(LAN9250_MAC_ADDR_H));
    UART_printDebug("Mac Address low=0x%08x\r\n", ETH_readMac(LAN9250_MAC_ADDR_L));
}

//TODO clean up the following functions

void ETH_dumpRX(){
    if(!xSemaphoreTake(ETH_commsSem, 100)) return;
    uint32_t info = ETH_readReg(LAN9250_RX_FIFO_INF);
    if(info != 0) UART_printDebug("RX info=0x%08x\r\n", info);
    UART_printDebug("TX info=0x%08x\r\n", ETH_readReg(LAN9250_TX_FIFO_INF));
    xSemaphoreGive(ETH_commsSem);
}

void ETH_dumpTX(){
    uint16_t count = ETH_getTXStatusCount();
    //UART_printDebug("TX info=0x%08x (%d available)\r\n", ETH_readReg(LAN9250_TX_FIFO_INF), count);
    ETH_readReg(LAN9250_TX_FIFO_INF);
    if(count < 0xfff){
        for(;count > 0; count --){
            //UART_printDebug("\t next status: 0x%08x\r\n", ETH_readReg(LAN9250_TX_STAT_FIFO));
            ETH_readReg(LAN9250_TX_STAT_FIFO);
        }
    }
}

uint8_t CMD_getMacState(TERMINAL_HANDLE * handle, uint8_t argCount, char ** args){
    uint8_t currArg = 0;
    unsigned printFull = 0;
    for(;currArg<argCount; currArg++){
        if(strcmp(args[currArg], "-?") == 0){
            ttprintf("shows the status of the mac\r\nusage: getMacState [-a]\r\n\t-a : prints all registers");
            return TERM_CMD_EXIT_SUCCESS;
        }
        if(strcmp(args[currArg], "-a") == 0) printFull = 1;
    }
    
    if(!xSemaphoreTake(ETH_commsSem, 100)){ 
        ttprintf("ERROR: Couldn't aquire ETH_commsSem semaphore. SPI was busy!\r\n");
        return TERM_CMD_EXIT_ERROR;
    }
    
    ttprintf("RX Fifo status: 0x%08x (dropped: %d)\r\n", ETH_readReg(LAN9250_RX_FIFO_INF), ETH_readReg(LAN9250_RX_DROP));
    ttprintf("TX Fifo status: 0x%08x\r\n", ETH_readReg(LAN9250_TX_FIFO_INF));
    
    if(!printFull){ 
        xSemaphoreGive(ETH_commsSem);
        return TERM_CMD_EXIT_SUCCESS;
    }
    
    ttprintf("HW_CFG=0x%08x\r\n", ETH_readReg(LAN9250_HW_CFG));
    ttprintf("AFC_CFG=0x%08x\r\n", ETH_readReg(LAN9250_AFC_CFG));
    ttprintf("IRQ_CFG=0x%08x\r\n", ETH_readReg(LAN9250_IRQ_CFG));
    ttprintf("INT_STS=0x%08x\r\n", ETH_readReg(LAN9250_INT_STAT));
    ttprintf("INT_EN=0x%08x\r\n", ETH_readReg(LAN9250_INT_EN));
    ttprintf("FIFO_INT=0x%08x\r\n", ETH_readReg(LAN9250_FIFO_INT));
    ttprintf("RX_CFG=0x%08x\r\n", ETH_readReg(LAN9250_RX_CFG));
    ttprintf("TX_CFG=0x%08x\r\n", ETH_readReg(LAN9250_TX_CFG));
    ttprintf("PMT_CTRL=0x%08x\r\n", ETH_readReg(LAN9250_PMT_CTRL));
    ttprintf("HMAC_CR=0x%08x\r\n", ETH_readMac(LAN9250_MAC_CR));
    ttprintf("PHY_BASIC_CONTROL=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_BASIC_CONTROL));
    ttprintf("PHY_BASIC_STATUS=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_BASIC_STATUS));
    ttprintf("PHY_AN_ADV=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_AN_ADV));
    ttprintf("PHY_SPECIAL_MODES=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_SPECIAL_MODES));
    ttprintf("PHY_SPECIAL_CONTROL_STATUS_IND=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_SPECIAL_CONTROL_STATUS_IND));
    ttprintf("PHY_INTERRUPT_MASK=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_INTERRUPT_MASK));
    ttprintf("PHY_CONTROL_STATUS=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_MODE_CONTROL_STATUS));
    ttprintf("PHY_SPECIAL_CONTROL_STATUS=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_SPECIAL_CONTROL_STATUS));
    ttprintf("PHY_SYM_ERR_COUNTER=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_SYM_ERR_COUNTER));
    ttprintf("PHY_MODE_CONTROL_STATUS=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_MODE_CONTROL_STATUS));
    ttprintf("Mac Address high=0x%04x    ", ETH_readMac(LAN9250_MAC_ADDR_H));
    ttprintf("Mac Address low=0x%08x\r\n", ETH_readMac(LAN9250_MAC_ADDR_L));
    ttprintf("Count: 0x%08x\r\n", ETH_readReg(LAN9250_25MHZ_COUNTER));
    xSemaphoreGive(ETH_commsSem);
    
    return TERM_CMD_EXIT_SUCCESS;
}