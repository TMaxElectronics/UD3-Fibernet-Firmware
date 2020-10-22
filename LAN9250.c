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

const uint8_t MAC_ADDRESS[6] = {MAC_ADDR};
const uint8_t IP_ADDRESS[4] = {192, 168, 1, 244};
const uint8_t NETMASK[4] = {255, 255, 255, 0};
const uint8_t DNSIP[4] = {192, 168, 1, 254};
const uint8_t GATEWAYIP[4] = {192, 168, 1, 254};

static TaskHandle_t TXTask = NULL;
SemaphoreHandle_t ETH_commsSem;
SemaphoreHandle_t ETH_commsWaitSem;
uint16_t packetCount = 0;

void ETH_init(){
    ETH_commsSem = xSemaphoreCreateBinary();
    ETH_commsWaitSem = xSemaphoreCreateBinary();
    xSemaphoreTake(ETH_commsSem, 0);
    xSemaphoreTake(ETH_commsWaitSem, 0);
    
    while(1){
        //wait until we deassert reset after powerup
        vTaskDelay(25);
        ETH_RST = 1;
        vTaskDelay(25);
        
        uint32_t result = 0;
        uint32_t currResetCount = 0;
        while(((currResetCount++) < 0x5)){
            result = ETH_readReg(LAN9250_HW_CFG);
            if(result & 0x08000000) break;
        }

        if(!(result & 0x08000000)){
            //UART_print("LAN9250 initialisation failed!\r\n");
            ETH_RST = 0;
            vTaskDelay(25);
            continue;
        }
        break;
    }
    
    SPI_setCLKFreq(24000000);
    
    //UART_print("SFP Chip ID & Revision number: 0x%08x\r\n", ETH_readReg(LAN9250_ID_REV));
    //UART_print("Phy strap is %s\r\n", (( & 0x400) != 0) ? "on" : "off");
    //UART_print("data size is %d\r\n", sizeof(RX_STATUS_DATA));
    
    ETH_readReg(LAN9250_ID_REV);
    ETH_readPhy(LAN9250_PHY_SPECIAL_MODES);
    
    ETH_writeMacAddress(MAC_ADDRESS);
    
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
    //ETH_setMacChcksmControl(1, 0, 1);
    
    PHY_setBasicControl(0, 1, 0, 0, 0, 1, 0);
    PHY_setSpecialMode(0b011);
    PHY_setSpecialControlStatus(0, 0, 0, 1, 1, 0);
    PHY_enableInterrupts(0,0,0,0,0,0,0,0);
    ETH_writePhy(LAN9250_PHY_SPECIAL_CONTROL_STATUS, 0x0040); 
    ETH_writeReg(LAN9250_LED_CTRL, 0b111);
    
    ETH_setupDMA();
    
    xTaskCreate(ETH_run, "ethTask", configMINIMAL_STACK_SIZE, NULL , tskIDLE_PRIORITY + 2, NULL );
    xSemaphoreGive(ETH_commsSem);
    xSemaphoreGive(ETH_commsWaitSem);
}

unsigned linkState = 0;
uint8_t linkCheckDivider = 0;

//running task. Checks for interrupts and services any that might have occured
static void ETH_run( void *pvParameters ){
    while(1){
        if(xSemaphoreTake(ETH_commsSem, 1000)){
            uint32_t intStatus = ETH_readReg(LAN9250_INT_STAT);
            
            if(!--linkCheckDivider){
                unsigned currLinkState = ETH_CheckLinkUp();

                if(currLinkState != linkState){
                    linkState = currLinkState;
                    LED_ethLinkStateChangeHook(linkState);
                    UART_printDebug(linkState ? "Ethernet connected\r\n" : "Ethernet lost\r\n");
                    //IPStackEvent_t xNetworkEvent;
                    //xNetworkEvent.eEventType = linkState ? eNoEvent : eNetworkDownEvent;
                    //xSendEventStructToIPTask(&xNetworkEvent, 0);
                }
            }
            
            if(intStatus == 0xffffffff) intStatus = 0;
            //if(intStatus != 0x00000200) UART_print("INT_STS=0x%08x\r\n", intStatus);
            if(intStatus & LAN9250_INTERRUPT_DEVICE_READY){
                
            }
            if(intStatus & LAN9250_INTERRUPT_PHY_EVENT){
                uint16_t phyIntStatus = ETH_readPhy(LAN9250_PHY_INTERRUPT_SOURCE);
            }
            if(intStatus & LAN9250_INTERRUPT_TX_IOC){
                
            }
            if(intStatus & LAN9250_INTERRUPT_RX_DMA){
                
            }
            if(intStatus & LAN9250_INTERRUPT_TX_STATUS_OVERFLOW){
                
            }
            if(intStatus & LAN9250_INTERRUPT_TX_DATA_OVERRUN){
                
            }
            if(intStatus & LAN9250_INTERRUPT_TX_DATA_AVAILABLE){
                //We don't need this here. We check for space when writing a new packet
            }
            if(intStatus & LAN9250_INTERRUPT_TX_STATUS_LEVEL){
                ETH_dumpTX();
            }
            if(intStatus & LAN9250_INTERRUPT_RX_DROPPED_FRAME){
                UART_printDebug("RX Frames were dropped\r\n");
                ETH_forceRXDiscard();
            }
            if(intStatus & LAN9250_INTERRUPT_RX_STATUS_LEVEL){
                NetworkBufferDescriptor_t * currFrame = 0;
                while((currFrame = ETH_readFrame()) != 0){
                    IPStackEvent_t xRxEvent;
                    /*UART_print("WE GOT ONE (MAYBE??); target MAC = %02x:%02x:%02x:%02x:%02x:%02x\r\n", currFrame->pucEthernetBuffer[0], currFrame->pucEthernetBuffer[1], currFrame->pucEthernetBuffer[2], currFrame->pucEthernetBuffer[3], currFrame->pucEthernetBuffer[4], currFrame->pucEthernetBuffer[5]);
                            UART_print("\r\nReceived packet dump:\r\n");
                            ETH_dumpPackt(currFrame->pucEthernetBuffer, currFrame->xDataLength);
                            UART_print("\r\n-------------\r\n");*/
                    if(eConsiderFrameForProcessing(currFrame->pucEthernetBuffer) == eProcessBuffer){
                        //UART_print("WE GOT ONE!!!!!\r\n");
                        xRxEvent.eEventType = eNetworkRxEvent;

                        xRxEvent.pvData = ( void * ) currFrame;
                        
                        if(xSendEventStructToIPTask(&xRxEvent, 0) == pdFALSE ){
                            
                            vReleaseNetworkBufferAndDescriptor( currFrame );
                            iptraceETHERNET_RX_EVENT_LOST();
                        }else{
                            iptraceNETWORK_INTERFACE_RECEIVE();
                        }
                    }else{
                        //UART_print("(not actually though)\r\n");
                        vReleaseNetworkBufferAndDescriptor( currFrame );
                    }
                }
                //UART_print("processing done\r\n");
            }
            if(intStatus & LAN9250_INTERRUPT_RX_ERROR){
                configASSERT(0);
                UART_printDebug("RX Error has occurred\r\n");
            }
            if(intStatus & LAN9250_INTERRUPT_TX_ERROR){
                configASSERT(0);
                UART_printDebug("TX Error has occurred\r\n");
            }
            
            ETH_clearIF(0xffffffff);    //clear all int flags
            
            xSemaphoreGive(ETH_commsSem);
            vTaskDelay(3);
        }
    }
}

void __ISR(_DMA1_VECTOR) ETH_rxDmaFinishedCallback(){
    IFS1CLR = _IFS1_DMA1IF_MASK;
    
    if((DCH1INT & _DCH1INT_CHBCIF_MASK) != 0){
        //data has been sent -> clean up stuff
        DCH1INTCLR = 0xff;
        
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;
        xSemaphoreGiveFromISR(ETH_commsWaitSem, &xHigherPriorityTaskWoken);
        portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
        
        //CLEN (imagine meme man here)
    }
    //TODO handle errors
}

NetworkBufferDescriptor_t * ETH_readFrame(){
    if(!xSemaphoreTake(ETH_commsWaitSem, 1000)){
        UART_printDebug("failed to load new packet!\r\n");
        return 0;
    }
        
    if(!ETH_rxDataAvailable()){ 
        xSemaphoreGive(ETH_commsWaitSem);
        return 0;
    }
    
    LATBCLR = _LATB_LATB3_MASK;
    
    RX_STATUS_DATA * s = pvPortMalloc(sizeof(RX_STATUS_DATA));
    *((uint32_t *)s) = ETH_readReg(LAN9250_RX_STAT_FIFO);
    
    //if(s->packetSize > 500) UART_print("loading new packet with size %d\r\n", s->packetSize);
    
    NetworkBufferDescriptor_t * ret = pxGetNetworkBufferWithDescriptor(s->packetSize, 0);
    
    if(ret == 0){ 
        xSemaphoreGive(ETH_commsWaitSem);
        UART_printDebug("buffer allocation failed!\r\n");
        return 0;
    }
    
    IEC1CLR = _IEC1_DMA0IE_MASK;
    DCH0SSA = KVA_TO_PA(ret->pucEthernetBuffer);  //convert virtual to physical address
    DCH0SSIZ = s->packetSize;
    
    DCH1DSA = KVA_TO_PA(ret->pucEthernetBuffer);
    DCH1DSIZ = s->packetSize;
    
    ETH_CS = 0;
    SPI_send(LAN9250_INSTR_REGREAD_SINGLE);
    SPI_send(LAN9250_RX_DATA_FIFO >> 8); SPI_send(LAN9250_RX_DATA_FIFO);
    
    DCH1CONSET = _DCH1CON_CHEN_MASK;
    DCH0CONSET = _DCH1CON_CHEN_MASK;
    DCH0ECONSET = _DCH1ECON_CFORCE_MASK;
    LATBSET = _LATB_LATB3_MASK;
    
    if(!xSemaphoreTake(ETH_commsWaitSem, 1000)){
        UART_printDebug("receive dma timeout!\r\n");
        
        DCH1CONCLR = _DCH1CON_CHEN_MASK;
        DCH0CONCLR = _DCH0CON_CHEN_MASK;
        
        SPI2CONCLR = _SPI2CON_ON_MASK;
        SPI2CONSET = _SPI2CON_ON_MASK;
        
        ETH_forceRXDiscard();
        
        ETH_CS = 1;
        xSemaphoreGive(ETH_commsWaitSem);
        return 0;
    }
    LATBCLR = _LATB_LATB3_MASK;
        
    uint8_t remaining = 4 - (DCH0SSIZ % 4);
    if(remaining != 4) while(remaining--) SPI_send(0xff);
    
    ETH_CS = 1;
        
    xSemaphoreGive(ETH_commsWaitSem);
    
    
    vPortFree(s);
    LATBSET = _LATB_LATB3_MASK;
    
    uint32_t fifoStatus = ETH_readReg(LAN9250_RX_FIFO_INF);
    if(((fifoStatus >> 16) * 1500) < (fifoStatus & 0xffff)){
        UART_printDebug("RX FiFo misalignment detected! all packages were dropped (0x%08x)\r\n", fifoStatus);
        ETH_forceRXDiscard();
        return 0;
    }
    
    return ret;
}

void __ISR(_DMA0_VECTOR) ETH_txDmaFinishedCallback(){
    IFS1CLR = _IFS1_DMA0IF_MASK;
    
    if((DCH0INT & _DCH0INT_CHBCIF_MASK) != 0){
        //data has been sent -> clean up stuff
        DCH0INTCLR = 0xff;
        //LATBCLR = _LATB_LATB3_MASK;
        
        //lastLength = DCH0SPTR;
        
        //because the DMA didn't read out any data there will be an overrun condition here. turning the module off and on again clears that error
        SPI2CONCLR = _SPI2CON_ON_MASK;
        SPI2CONSET = _SPI2CON_ON_MASK;
        
        uint8_t remaining = 4 - (DCH0SSIZ % 4);
        if(remaining != 4) while(remaining--) SPI_send(0xff);
        
        ETH_CS = 1;
        
        //LATBSET = _LATB_LATB3_MASK;
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;
        xSemaphoreGiveFromISR(ETH_commsSem, &xHigherPriorityTaskWoken);
        portEND_SWITCHING_ISR(xHigherPriorityTaskWoken);
        
        //CLEN (imagine meme man here)
    }
    //TODO handle errors
}

unsigned ETH_waitForTXSpace(uint16_t length){
    uint32_t newLength = (((length / 64) + 1) << 24);
    uint32_t currVal = (ETH_readReg(LAN9250_FIFO_INT) & ~0xff000000);
    
    ETH_writeReg(LAN9250_FIFO_INT, currVal | newLength); //modify the tx data available level to be (length rounded to 64 bytes) + 64 bytes
    
    ETH_clearIF(LAN9250_INTERRUPT_TX_DATA_AVAILABLE);
    
    return (ETH_readReg(LAN9250_INT_STAT) & LAN9250_INTERRUPT_TX_DATA_AVAILABLE);    //wait until enough data is free in the FIFO
}

BaseType_t ETH_writePacket(uint8_t * data, uint16_t length){
    if(data == 0 || length == 0) return pdFALSE;
    
    if(!xSemaphoreTake(ETH_commsSem, 1000)) return pdFALSE; //SPI comms never became available
    
    //LATBCLR = _LATB_LATB3_MASK;
    
    if(!ETH_waitForTXSpace(length)){
        xSemaphoreGive(ETH_commsSem);
        //LATBSET = _LATB_LATB3_MASK;
        return pdFALSE;
    }
    
    //UART_print("Checksum in packet: 0x%02x%02x", data[24], data[25]);
    //prepare the checksum offload engine
    //ETH_writeReg(LAN9250_TX_DATA_FIFO, 0x2004);    //TX a
    //ETH_writeReg(LAN9250_TX_DATA_FIFO, (((packetCount) << 16) | 0x4000 | (length+4)));
    //ETH_writeReg(LAN9250_TX_DATA_FIFO, (24 << 16) | 14);    //checksum starts at beginning of packet, is inserted at 24 bytes (IP checksum offset)
    //UART_print("actual length: %d\r\n", DCH0SSIZ);
    
    //vTaskEnterCritical();
    
    //set up the TX DMA channel to transfer [length] bytes from [data]
    DCH0SSA = KVA_TO_PA(data);  //convert virtual to physical address
    DCH0SSIZ = length;
    DCH0INTCLR = 0xff;
    IFS1CLR = _IFS1_DMA0IF_MASK;
    IEC1SET = _IEC1_DMA0IE_MASK;
    
    uint32_t txstatus;
    uint16_t cmd;
    uint8_t cmd0;
    uint8_t cmd1;
    cmd = LAN9250_TX_DATA_FIFO;
    cmd0 = cmd >> 8;
    cmd1 = cmd & 0xFF;
    
    uint32_t txCmdA = ((0x00003000) | (length));
    uint32_t txCmdB = (((packetCount++) << 16) | 0x4000 | (length));
    
    ETH_writeReg(LAN9250_TX_DATA_FIFO, txCmdA); 
    ETH_writeReg(LAN9250_TX_DATA_FIFO, txCmdB);

    ETH_CS = 0;
    SPI_send(LAN9250_INSTR_REGWRITE_SINGLE);
    SPI_send(cmd0);
    SPI_send(cmd1);    
    
    //vTaskExitCritical();
    DCH0CONSET = _DCH0CON_CHEN_MASK;    //start the transfer
    DCH0ECONSET = _DCH0ECON_CFORCE_MASK;
    
    configASSERT(DCH0SSIZ == (txCmdB & 0x3ff));
    
    //LATBSET = _LATB_LATB3_MASK;
    return pdTRUE;
}

void ETH_reset(){
    ETH_writeReg(LAN9250_RESET_CTL, 0x00000001);
}

unsigned ETH_rxDataAvailable(){
    uint32_t fifoStatus = ETH_readReg(LAN9250_RX_FIFO_INF);
    if(((fifoStatus >> 16) * 1500) < (fifoStatus & 0xffff)){
        UART_printDebug("RX FiFo misalignment detected! all packages were dropped (0x%08x)\r\n", fifoStatus);
        ETH_forceRXDiscard();
        return 0;
    }
    ETH_clearIF(LAN9250_INTERRUPT_RX_STATUS_LEVEL);
    return (ETH_readReg(LAN9250_INT_STAT) & LAN9250_INTERRUPT_RX_STATUS_LEVEL) != 0;
}

unsigned ETH_txSpaceAvailable(){
    return (ETH_readReg(LAN9250_INT_STAT) & LAN9250_INTERRUPT_TX_STATUS_LEVEL) != 0;
}

unsigned ETH_CheckLinkUp(){
    unsigned state = (ETH_readPhy(LAN9250_PHY_BASIC_STATUS) >> 2) & 1;
    if(state == 0xffffffff) return 0;
    return state;
}

uint16_t ETH_getTXStatusCount(){
    return (ETH_readReg(LAN9250_TX_FIFO_INF) >> 16) & 0xffff;
}

uint32_t ETH_readReg(uint16_t addr){
    ETH_CS = 0;
    SPI_send(LAN9250_INSTR_REGREAD_SINGLE);
    SPI_send(addr >> 8); SPI_send(addr);
    uint32_t ret = 0;
    ret |=  SPI_send(0xff)          & 0xff;
    ret |= (SPI_send(0xff) << 8)    & 0xff00;
    ret |= (SPI_send(0xff) << 16)   & 0xff0000;
    ret |= (SPI_send(0xff) << 24)   & 0xff000000;
    ETH_CS = 1;
    return ret;
}

void ETH_writeReg(uint32_t addr, uint32_t value){
    //if(uxSemaphoreGetCount(ETH_commsSem)) return; // the coms were never properly reserved
    ETH_CS = 0;
    SPI_send(LAN9250_INSTR_REGWRITE_SINGLE);
    SPI_send(addr >> 8); SPI_send(addr);
    SPI_send(value);
    SPI_send(value >> 8);
    SPI_send(value >> 16);
    SPI_send(value >> 24);
    ETH_CS = 1;
}

unsigned ETH_CSRBusy(){
    return ETH_readReg(LAN9250_CSR_CMD) & 0x80000000;
}

void ETH_writeMac(uint32_t addr, uint32_t value){
    uint32_t timeout = 100;
    while(--timeout && ETH_CSRBusy());//return 0xffffffff;
    if(!timeout) return;
    
    ETH_writeReg(LAN9250_CSR_DATA, value);
    
    ETH_writeReg(LAN9250_CSR_CMD, (0x80000000 | addr));
}

uint32_t ETH_readMac(uint32_t addr){
    uint32_t timeout = 100;
    while(--timeout && ETH_CSRBusy());//return 0xffffffff;
    if(!timeout) return 0xffffffff;
    ETH_writeReg(LAN9250_CSR_CMD, 0x80000000 | 0x40000000 | addr); //start a read operation
    while(--timeout && ETH_CSRBusy());//return 0xffffffff;
    if(!timeout) return 0xffffffff;
    return ETH_readReg(LAN9250_CSR_DATA);
}

unsigned ETH_MIIBusy(){
    return ETH_readMac(LAN9250_MAC_MII_ACC) & 1;
}

void ETH_writePhy(uint16_t index, uint16_t data){
    uint32_t cmd;
    cmd = ((LAN9250_PHY_ADDRESS & 0x1F) << 11) | ((index & 0x1F)<< 6) | 2;
    
    uint32_t timeout = 100;
    while(--timeout && ETH_MIIBusy());//return 0xffffffff;
    if(!timeout) return;
    
    ETH_writeMac(LAN9250_MAC_MII_DATA, data);
    ETH_writeMac(LAN9250_MAC_MII_ACC, cmd);
}

uint32_t ETH_readPhy(uint8_t index){
    uint32_t cmd = ((LAN9250_PHY_ADDRESS & 0x1F) << 11) | ((index & 0x1F) << 6);
    
    uint32_t timeout = 100;
    while(--timeout && ETH_MIIBusy());//return 0xffffffff;
    if(!timeout) return 0xffffffff;
    
    ETH_writeMac(LAN9250_MAC_MII_ACC, cmd);
    
    timeout = 100;
    while(--timeout && ETH_MIIBusy());//return 0xffffffff;
    if(!timeout) return 0xffffffff;
    
    return ETH_readMac(LAN9250_MAC_MII_DATA);   
}

void ETH_setupDMA(){
    //TX channel
    DCH0CON = 0b00000001;   //channel is off (enabled once transmission starts), no chaining, channel auto enable is off, prio 2
    DCH0ECON = (_SPI2_TX_IRQ << 8) | 0b10000;       //transmit byte on SPI TX done
    //DCH0SSA (source start) is to be set before each transfer
    DCH0DSA = KVA_TO_PA(&SPI2BUF);   //write into the SPI buffer
    
    //DCH0SSIZ (source size) is to be set before each transfer
    DCH0DSIZ = 1;   // destination size - 1 byte
    DCH0CSIZ = 1;   // Cell size - copy one byte every time the interrupt fires
    
    DCH0INT = _DCH0INT_CHBCIE_MASK; //interrupt once the transfer is completed
    IEC1SET = _IEC1_DMA0IE_MASK;
    IPC10bits.DMA0IP = 4;
    IPC10bits.DMA0IS = 4;
    
    //RX channel
    DCH1CON = 0b00000011;   //channel is off (enabled once transmission starts), no chaining, channel auto enable is off, prio 1
    DCH1ECON = (_SPI2_RX_IRQ << 8) | 0b10000;       //transmit byte on SPI TX done
    DCH1SSA = KVA_TO_PA(&SPI2BUF);
    //DCH1DSA (destination start) is to be set before each transfer
    
    DCH1SSIZ = 1;   // source size - 1 byte
    //DCH1DSIZ (destination size) is to be set before each transfer
    DCH1CSIZ = 1;   // Cell size - copy one byte every time the interrupt fires
    
    DCH1INT = _DCH1INT_CHBCIE_MASK; //interrupt once the transfer is completed
    IEC1SET = _IEC1_DMA1IE_MASK;
    IPC10bits.DMA1IP = 4;
    IPC10bits.DMA1IS = 4;
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
    uint32_t writeVal = 0xA0000111;//(deAssertTime << 24) | (enableInterrups << 8) | (interruptPolarity << 4) | (clockSource << 1) | bufferType;
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

void ETH_dumpRX(){
    if(!xSemaphoreTake(ETH_commsSem, 100)) return;
    uint32_t info = ETH_readReg(LAN9250_RX_FIFO_INF);
    if(info != 0) UART_printDebug("RX info=0x%08x\r\n", info);
    UART_printDebug("TX info=0x%08x\r\n", ETH_readReg(LAN9250_TX_FIFO_INF));
    xSemaphoreGive(ETH_commsSem);
}

void ETH_dumpTX(){
    uint16_t count = ETH_getTXStatusCount();
    UART_printDebug("TX info=0x%08x (%d available)\r\n", ETH_readReg(LAN9250_TX_FIFO_INF), count);
    if(count < 0xfff){
        for(;count > 0; count --){
            UART_printDebug("\t next status: 0x%08x\r\n", ETH_readReg(LAN9250_TX_STAT_FIFO));
        }
    }
}

void ETH_dumpPackt(uint8_t * data, uint16_t length){
    uint16_t currPos = 0;
    UART_print("\r\nPacket dump:\r\n");
    for(;currPos < length; currPos++){
        UART_print(" %02x%s%s", data[currPos], (((currPos % 8) == 0) && currPos != 0) ? " " : "", (((currPos % 16) == 0) && currPos != 0) ? "\r\n" : "");
    }
    UART_print("\r\n---------\r\n");
}

void ETH_dumpConfig(){
    if(!xSemaphoreTake(ETH_commsSem, 1000)) return; //SPI comms never became available
    UART_printDebug("HW_CFG=0x%08x\r\n", ETH_readReg(LAN9250_HW_CFG));
    UART_printDebug("AFC_CFG=0x%08x\r\n", ETH_readReg(LAN9250_AFC_CFG));
    UART_printDebug("IRQ_CFG=0x%08x\r\n", ETH_readReg(LAN9250_IRQ_CFG));
    UART_printDebug("INT_STS=0x%08x\r\n", ETH_readReg(LAN9250_INT_STAT));
    UART_printDebug("INT_EN=0x%08x\r\n", ETH_readReg(LAN9250_INT_EN));
    UART_printDebug("FIFO_INT=0x%08x\r\n", ETH_readReg(LAN9250_FIFO_INT));
    UART_printDebug("RX_CFG=0x%08x\r\n", ETH_readReg(LAN9250_RX_CFG));
    UART_printDebug("TX_CFG=0x%08x\r\n", ETH_readReg(LAN9250_TX_CFG));
    UART_printDebug("PMT_CTRL=0x%08x\r\n", ETH_readReg(LAN9250_PMT_CTRL));
    UART_printDebug("HMAC_CR=0x%08x\r\n", ETH_readMac(LAN9250_MAC_CR));
    UART_printDebug("PHY_BASIC_CONTROL=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_BASIC_CONTROL));
    UART_printDebug("PHY_BASIC_STATUS=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_BASIC_STATUS));
    UART_printDebug("PHY_AN_ADV=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_AN_ADV));
    UART_printDebug("PHY_SPECIAL_MODES=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_SPECIAL_MODES));
    UART_printDebug("PHY_SPECIAL_CONTROL_STATUS_IND=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_SPECIAL_CONTROL_STATUS_IND));
    UART_printDebug("PHY_INTERRUPT_MASK=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_INTERRUPT_MASK));
    UART_printDebug("PHY_CONTROL_STATUS=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_MODE_CONTROL_STATUS));
    UART_printDebug("PHY_SPECIAL_CONTROL_STATUS=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_SPECIAL_CONTROL_STATUS));
    UART_printDebug("PHY_SYM_ERR_COUNTER=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_SYM_ERR_COUNTER));
    UART_printDebug("PHY_MODE_CONTROL_STATUS=0x%04x\r\n", ETH_readPhy(LAN9250_PHY_MODE_CONTROL_STATUS));
    UART_printDebug("Mac Address high=0x%04x    ", ETH_readMac(LAN9250_MAC_ADDR_H));
    UART_printDebug("Mac Address low=0x%08x\r\n", ETH_readMac(LAN9250_MAC_ADDR_L));
    UART_printDebug("\r\n\n\nRX Fifo status: 0x%08x (dropped: %d)\r\n", ETH_readReg(LAN9250_RX_FIFO_INF), ETH_readReg(LAN9250_RX_DROP));
    UART_printDebug("\r\n\n\nTX Fifo status: 0x%08x\r\n", ETH_readReg(LAN9250_TX_FIFO_INF));
    UART_printDebug("\r\n\n\nCount: 0x%08x\r\n", ETH_readReg(LAN9250_25MHZ_COUNTER));
    //UART_print("\r\n\n\nRX Fifo status: 0x%08x\r\n", ETH_readReg(LAN9250_RX_STAT_FIFO_PORT));
    UART_printDebug("SFP Chip ID & Revision number: 0x%08x\r\n", ETH_readReg(HMAC_RX_LPI_TRANSITION));
    UART_printDebug("\r\n\n\n\n");
    xSemaphoreGive(ETH_commsSem);
}