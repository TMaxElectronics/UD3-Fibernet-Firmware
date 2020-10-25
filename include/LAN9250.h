#include <xc.h>
#include <stdint.h>
#include "sys/attribs.h"

#include "FreeRTOS.h"
#include "semphr.h"
#include "FreeRTOS_IP.h"

#include "SPI.h"

#define ETH_CS LATBbits.LATB9
#define ETH_RST LATBbits.LATB7

#define LAN9250_INSTR_REGWRITE_SINGLE 0x02
#define LAN9250_INSTR_REGREAD_SINGLE 0x03

#define TX_FIFO_SIZE 0x00050000

#define LAN9250_ID_REV 0x50
#define LAN9250_IRQ_CFG 0x054
#define LAN9250_INT_STAT 0x058
#define LAN9250_INT_EN 0x05C
#define LAN9250_BYTE_TEST 0x64
#define LAN9250_FIFO_INT 0x068
#define LAN9250_RX_CFG 0x06C
#define LAN9250_TX_CFG 0x070
#define LAN9250_HW_CFG 0x074
#define LAN9250_RX_FIFO_INF 0x07C
#define LAN9250_TX_FIFO_INF 0x080
#define LAN9250_PMT_CTRL 0x084
#define LAN9250_25MHZ_COUNTER 0x09C
#define LAN9250_RX_DROP 0x0A0
#define LAN9250_AFC_CFG 0x0AC
#define LAN9250_LED_CTRL 0x1BC
#define LAN9250_RESET_CTL 0x1F8
#define HMAC_RX_LPI_TRANSITION 0x0B0

#define LAN9250_RX_STAT_FIFO 0x040
#define LAN9250_RX_DATA_FIFO 0x000
#define LAN9250_TX_STAT_FIFO 0x048
#define LAN9250_TX_DATA_FIFO 0x020

#define LAN9250_PHY_ADDRESS                             1
#define LAN9250_PHY_BASIC_CONTROL                       0x00
#define LAN9250_PHY_BASIC_STATUS                        0x01
#define LAN9250_PHY_ID_MSB                              0x02
#define LAN9250_PHY_ID_LSB                              0x03
#define LAN9250_PHY_AN_ADV                              0x04
#define LAN9250_PHY_AN_LP_BASE_ABILITY                  0x05
#define LAN9250_PHY_AN_EXP                              0x06
#define LAN9250_PHY_AN_NP_TX                            0x07
#define LAN9250_PHY_AN_NP_RX                            0x08
#define LAN9250_PHY_MMD_ACCESS                          0x0D
#define LAN9250_PHY_MMD_ADDR_DATA                       0x0E
#define LAN9250_PHY_EDPD_CFG                            0x10
#define LAN9250_PHY_MODE_CONTROL_STATUS                 0x11
#define LAN9250_PHY_SPECIAL_MODES                       0x12
#define LAN9250_PHY_TDR_PAT_DELAY                       0x18
#define LAN9250_PHY_TDR_CONTROL_STAT                    0x19
#define LAN9250_PHY_SYM_ERR_COUNTER                     0x1A
#define LAN9250_PHY_SPECIAL_CONTROL_STATUS_IND          0x1B
#define LAN9250_PHY_CABLE_LEN                           0x1C
#define LAN9250_PHY_INTERRUPT_SOURCE                    0x1D
#define LAN9250_PHY_INTERRUPT_MASK                      0x1E
#define LAN9250_PHY_SPECIAL_CONTROL_STATUS              0x1F


#define LAN9250_PHY_INTERRUPT_LINK_UP                   0b1000000000
#define LAN9250_PHY_INTERRUPT_LINK_DOWN                 0b10000

#define LAN9250_CSR_CMD                     0xa4
#define LAN9250_CSR_DATA                    0xa8

#define LAN9250_MAC_CR                      0x001
#define LAN9250_MAC_ADDR_H                  0x002
#define LAN9250_MAC_ADDR_L                  0x003
#define LAN9250_MAC_HASH_H                  0x004
#define LAN9250_MAC_HASH_L                  0x005
#define LAN9250_MAC_MII_ACC                 0x006
#define LAN9250_MAC_MII_DATA                0x007
#define LAN9250_MAC_FLOW                    0x008
#define LAN9250_MAC_VLAN1                   0x009
#define LAN9250_MAC_VLAN2                   0x00A
#define LAN9250_MAC_WUFF                    0x00B
#define LAN9250_MAC_WUCSR                   0x00C
#define LAN9250_MAC_COE_CR                  0x00D
#define LAN9250_MAC_EEE_TW_TX_SYS           0x00E
#define LAN9250_MAC_EEE_TX_LPI_REQ_DELAY    0x00F

#define LAN9250_INTERRUPT_SOFTWARE                  0x80000000
#define LAN9250_INTERRUPT_DEVICE_READY              0x40000000
#define LAN9250_INTERRUPT_1588_EVENT                0x20000000
#define LAN9250_INTERRUPT_PHY_EVENT                 0x04000000
#define LAN9250_INTERRUPT_TX_STOPPED                0x02000000
#define LAN9250_INTERRUPT_RX_STOPPED                0x01000000
#define LAN9250_INTERRUPT_RX_DROPPED_COUNTER_HW     0x00800000
#define LAN9250_INTERRUPT_TX_IOC                    0x00200000
#define LAN9250_INTERRUPT_RX_DMA                    0x00100000
#define LAN9250_INTERRUPT_TIMER                     0x00080000
#define LAN9250_INTERRUPT_PME                       0x00020000
#define LAN9250_INTERRUPT_TX_STATUS_OVERFLOW        0x00010000
#define LAN9250_INTERRUPT_RECEIVE_WATCHDOG          0x00008000
#define LAN9250_INTERRUPT_RX_ERROR                  0x00004000
#define LAN9250_INTERRUPT_TX_ERROR                  0x00002000
#define LAN9250_INTERRUPT_GPIO                      0x00001000
#define LAN9250_INTERRUPT_TX_DATA_OVERRUN           0x00000400
#define LAN9250_INTERRUPT_TX_DATA_AVAILABLE         0x00000200
#define LAN9250_INTERRUPT_TX_STATUS_FULL            0x00000100
#define LAN9250_INTERRUPT_TX_STATUS_LEVEL           0x00000080
#define LAN9250_INTERRUPT_RX_DROPPED_FRAME          0x00000040
#define LAN9250_INTERRUPT_RX_STATUS_FULL            0x00000010
#define LAN9250_INTERRUPT_RX_STATUS_LEVEL           0x00000008


#define LAN9250_RX_CFG_FORCE_DISCARD                0x8000
#define LAN9250_TX_CFG_FORCE_STATUS_DISCARD         0x8000
#define LAN9250_TX_CFG_FORCE_DATA_DISCARD           0x4000

#define LAN9250_PME_ENERGY_DETECT                   0x0100
#define LAN9250_PME_WOL_STATUS                      0x0020

#define LAN9250_TXCMD_A_FIRST_DATA                  0x00001000
#define LAN9250_TXCMD_A_LAST_DATA                   0x00002000

#define MAC_ADDR 0xde,0xad,0xbe,0xef,0xfe,0xed
#define DEF_IP_ADDRESS 0,0,0,0
#define DEF_NETMASK 0,0,0,0
#define DEF_DNSIP 0,0,0,0
#define DEF_GATEWAYIP 0,0,0,0

extern const uint8_t MAC_ADDRESS[6];
extern const uint8_t IP_ADDRESS[4];
extern const uint8_t NETMASK[4];
extern const uint8_t DNSIP[4];
extern const uint8_t GATEWAYIP[4];

extern SemaphoreHandle_t ETH_commsSem;
extern SemaphoreHandle_t ETH_commsWaitSem;

typedef struct{
    unsigned reserved3          :1;
    unsigned crcError           :1;
    unsigned dribblingBit       :1;
    unsigned MIIError           :1;
    unsigned watchdogTimeout    :1;
    unsigned frameType          :1;
    unsigned hasCollided        :1;
    unsigned isTooLong          :1;
    uint8_t  reserved2          :2;
    unsigned isMulticastFrame   :1;
    unsigned isRuntFrame        :1;
    unsigned lengthError        :1;
    unsigned isBroadCastFrame   :1;
    unsigned reserved1          :1;
    unsigned errorStatus        :1;
    uint16_t packetSize         :14;
    unsigned filterFail         :1;
    unsigned packetFilter       :1;
} RX_STATUS_DATA __attribute__((packed));

typedef struct{
    unsigned deferred           :1;
    unsigned reserved1          :1;
    unsigned excessiveDeferral  :1;
    uint8_t  collisionCount     :4;
    unsigned reserved2          :1;
    unsigned excessiveCollision :1;
    unsigned lateCollision      :1;
    unsigned noCarrier          :1;
    unsigned lossOfCarrier      :1;
    uint8_t  reserved3          :3;
    unsigned errorStatus        :1;
    uint16_t packetTag          :16;
} TX_STATUS_DATA_STRUCT __attribute__((packed));

void ETH_init();
uint32_t ETH_readReg(uint16_t addr);
void ETH_writeReg(uint32_t addr, uint32_t value);

inline unsigned ETH_CheckLinkUp();
void PHY_enableInterrupts(unsigned linkUp, unsigned energyOn, unsigned autoNegotiation, unsigned remoteFault, unsigned linkDown, unsigned autoNegotiationAck, unsigned parallelDetectionFault, unsigned autoNegotioationPageReceived);
void PHY_setSpecialControlStatus(unsigned overrideStraps, unsigned enableAutoMDIX, unsigned autoMDIXState, unsigned disableSQE, unsigned enableFEFI, unsigned tenBaseTPolarity);
void PHY_setSpecialMode(uint8_t phyMode);
void PHY_setAutoNegAbilities(unsigned nextPage, unsigned remoteFault, unsigned extendPage, unsigned asymmetricPause, unsigned symmetricPause, unsigned fd100BaseX, unsigned hd100BaseX, unsigned fd10BaseT, unsigned hd10BaseT, uint8_t selectorField);
void PHY_setBasicControl(unsigned loopback, unsigned speedSelect, unsigned autoNegotiate, unsigned powerDown, unsigned restartAutoNegotioation, unsigned duplexMode, unsigned collisionTest);
void ETH_setMacControl(unsigned receiveAll, unsigned enableEnergyEfficientMode, unsigned filterOwnPackets, unsigned enableLoopBack, unsigned enableFullDuplex, unsigned passAllMulticast, unsigned enablePromiscuousMode, unsigned enableInverseFilter, unsigned passBadFrames, unsigned hashOnly, unsigned enableHashcheck, unsigned disableBroadcast, unsigned disableRetry, unsigned stripPadding, uint8_t backOffLimit, unsigned enableDeferralCheck, unsigned TXEnable, unsigned RXEnable);
void ETH_setMacChcksmControl(unsigned offloadEngineEnable, unsigned rxOffloadMode, unsigned rxOffloadEngineEnable);
void ETH_setPowermanagement(uint8_t pmtMode, unsigned sleep, unsigned autoWakeup, unsigned enableLEDs, unsigned enable1588Clock, unsigned enable1588Timestamp, unsigned enableClocking, unsigned enableEnergyDetect, unsigned enableWOL, unsigned bufferType, unsigned enablePMEPin);
void ETH_setTxConf(unsigned allowOverrun, unsigned enableTX);
void ETH_forceTXDiscard();
void ETH_setRxConf(uint8_t dataAlignment, uint16_t dmaCount, uint8_t dataOffset);
void ETH_forceRXDiscard();
void ETH_setFifoInt(uint8_t txDataAvailableLevel, uint8_t txStatusLevel, uint8_t rxStatusLevel);
void ETH_enableInt(uint32_t intsToEnable);
void ETH_disableInt(uint32_t intsToDisable);
void ETH_clearIF(uint32_t flagsToClear);
void ETH_setInterruptConfiguration(uint8_t deAssertTime, unsigned enableInterrups, unsigned interruptPolarity, unsigned clockSource, unsigned bufferType);
void ETH_setAutoFlowcontrol(uint8_t fcRisingThreshold, uint8_t fcFallingThreshold, unsigned fcAnyFrame);
void ETH_setHWConf(uint8_t txFifoSizeKB);
void ETH_writeMacAddress(uint8_t * macAddr);
uint32_t ETH_readPhy(uint8_t index);
void ETH_writePhy(uint16_t index, uint16_t data);
unsigned ETH_MIIBusy();
uint32_t ETH_readMac(uint32_t addr);
void ETH_writeMac(uint32_t addr, uint32_t value);
unsigned ETH_CSRBusy();
unsigned ETH_rxDataAvailable();
void ETH_dumpConfig();
void ETH_reset();
NetworkBufferDescriptor_t * ETH_readFrame();
BaseType_t ETH_writePacket(uint8_t * data, uint16_t length);
void ETH_setupDMA();
uint16_t ETH_getTXStatusCount();
void ETH_dumpTX();
void ETH_dumpRX();
unsigned ETH_waitForTXSpace(uint16_t length);
static void ETH_run( void *pvParameters );