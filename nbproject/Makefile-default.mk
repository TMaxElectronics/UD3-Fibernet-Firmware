#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/UD3_Fibernet.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/UD3_Fibernet.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=cybtldr_api.c cybtldr_command.c cybtldr_parse.c communication_api.c FatFs/ff.c FatFs/ffsystem.c FatFs/ffunicode.c FatFs/mmcpic32.c FreeRTOS/Core/event_groups.c FreeRTOS/Core/list.c FreeRTOS/Core/queue.c FreeRTOS/Core/stream_buffer.c FreeRTOS/Core/tasks.c FreeRTOS/Core/timers.c FreeRTOS/Core/portable/MemMang/heap_4.c FreeRTOS/Core/portable/MPLAB/PIC32MX/port.c FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.S FreeRTOS/TCPIP/FreeRTOS_ARP.c FreeRTOS/TCPIP/FreeRTOS_DHCP.c FreeRTOS/TCPIP/FreeRTOS_DNS.c FreeRTOS/TCPIP/FreeRTOS_IP.c FreeRTOS/TCPIP/FreeRTOS_Sockets.c FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.c FreeRTOS/TCPIP/FreeRTOS_TCP_IP.c FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.c FreeRTOS/TCPIP/FreeRTOS_UDP_IP.c FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.c service.c FTP.c THex/THex.c apps/top.c apps/iotop.c apps/apps.c apps/tte.c ConfigPerformance.c LAN9250.c NetworkInterface_LAN9250.c SPI.c UART.c main.c LED.c FiberComms.c min.c System.c UD3_Wrapper.c TTerm.c TTerm_cmd.c startup.c FS.c TTerm_AC.c TTerm_cwd.c ini.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/cybtldr_api.o ${OBJECTDIR}/cybtldr_command.o ${OBJECTDIR}/cybtldr_parse.o ${OBJECTDIR}/communication_api.o ${OBJECTDIR}/FatFs/ff.o ${OBJECTDIR}/FatFs/ffsystem.o ${OBJECTDIR}/FatFs/ffunicode.o ${OBJECTDIR}/FatFs/mmcpic32.o ${OBJECTDIR}/FreeRTOS/Core/event_groups.o ${OBJECTDIR}/FreeRTOS/Core/list.o ${OBJECTDIR}/FreeRTOS/Core/queue.o ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o ${OBJECTDIR}/FreeRTOS/Core/tasks.o ${OBJECTDIR}/FreeRTOS/Core/timers.o ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o ${OBJECTDIR}/service.o ${OBJECTDIR}/FTP.o ${OBJECTDIR}/THex/THex.o ${OBJECTDIR}/apps/top.o ${OBJECTDIR}/apps/iotop.o ${OBJECTDIR}/apps/apps.o ${OBJECTDIR}/apps/tte.o ${OBJECTDIR}/ConfigPerformance.o ${OBJECTDIR}/LAN9250.o ${OBJECTDIR}/NetworkInterface_LAN9250.o ${OBJECTDIR}/SPI.o ${OBJECTDIR}/UART.o ${OBJECTDIR}/main.o ${OBJECTDIR}/LED.o ${OBJECTDIR}/FiberComms.o ${OBJECTDIR}/min.o ${OBJECTDIR}/System.o ${OBJECTDIR}/UD3_Wrapper.o ${OBJECTDIR}/TTerm.o ${OBJECTDIR}/TTerm_cmd.o ${OBJECTDIR}/startup.o ${OBJECTDIR}/FS.o ${OBJECTDIR}/TTerm_AC.o ${OBJECTDIR}/TTerm_cwd.o ${OBJECTDIR}/ini.o
POSSIBLE_DEPFILES=${OBJECTDIR}/cybtldr_api.o.d ${OBJECTDIR}/cybtldr_command.o.d ${OBJECTDIR}/cybtldr_parse.o.d ${OBJECTDIR}/communication_api.o.d ${OBJECTDIR}/FatFs/ff.o.d ${OBJECTDIR}/FatFs/ffsystem.o.d ${OBJECTDIR}/FatFs/ffunicode.o.d ${OBJECTDIR}/FatFs/mmcpic32.o.d ${OBJECTDIR}/FreeRTOS/Core/event_groups.o.d ${OBJECTDIR}/FreeRTOS/Core/list.o.d ${OBJECTDIR}/FreeRTOS/Core/queue.o.d ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o.d ${OBJECTDIR}/FreeRTOS/Core/tasks.o.d ${OBJECTDIR}/FreeRTOS/Core/timers.o.d ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o.d ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o.d ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.d ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o.d ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o.d ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o.d ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o.d ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o.d ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o.d ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o.d ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o.d ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o.d ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o.d ${OBJECTDIR}/service.o.d ${OBJECTDIR}/FTP.o.d ${OBJECTDIR}/THex/THex.o.d ${OBJECTDIR}/apps/top.o.d ${OBJECTDIR}/apps/iotop.o.d ${OBJECTDIR}/apps/apps.o.d ${OBJECTDIR}/apps/tte.o.d ${OBJECTDIR}/ConfigPerformance.o.d ${OBJECTDIR}/LAN9250.o.d ${OBJECTDIR}/NetworkInterface_LAN9250.o.d ${OBJECTDIR}/SPI.o.d ${OBJECTDIR}/UART.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/LED.o.d ${OBJECTDIR}/FiberComms.o.d ${OBJECTDIR}/min.o.d ${OBJECTDIR}/System.o.d ${OBJECTDIR}/UD3_Wrapper.o.d ${OBJECTDIR}/TTerm.o.d ${OBJECTDIR}/TTerm_cmd.o.d ${OBJECTDIR}/startup.o.d ${OBJECTDIR}/FS.o.d ${OBJECTDIR}/TTerm_AC.o.d ${OBJECTDIR}/TTerm_cwd.o.d ${OBJECTDIR}/ini.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/cybtldr_api.o ${OBJECTDIR}/cybtldr_command.o ${OBJECTDIR}/cybtldr_parse.o ${OBJECTDIR}/communication_api.o ${OBJECTDIR}/FatFs/ff.o ${OBJECTDIR}/FatFs/ffsystem.o ${OBJECTDIR}/FatFs/ffunicode.o ${OBJECTDIR}/FatFs/mmcpic32.o ${OBJECTDIR}/FreeRTOS/Core/event_groups.o ${OBJECTDIR}/FreeRTOS/Core/list.o ${OBJECTDIR}/FreeRTOS/Core/queue.o ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o ${OBJECTDIR}/FreeRTOS/Core/tasks.o ${OBJECTDIR}/FreeRTOS/Core/timers.o ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o ${OBJECTDIR}/service.o ${OBJECTDIR}/FTP.o ${OBJECTDIR}/THex/THex.o ${OBJECTDIR}/apps/top.o ${OBJECTDIR}/apps/iotop.o ${OBJECTDIR}/apps/apps.o ${OBJECTDIR}/apps/tte.o ${OBJECTDIR}/ConfigPerformance.o ${OBJECTDIR}/LAN9250.o ${OBJECTDIR}/NetworkInterface_LAN9250.o ${OBJECTDIR}/SPI.o ${OBJECTDIR}/UART.o ${OBJECTDIR}/main.o ${OBJECTDIR}/LED.o ${OBJECTDIR}/FiberComms.o ${OBJECTDIR}/min.o ${OBJECTDIR}/System.o ${OBJECTDIR}/UD3_Wrapper.o ${OBJECTDIR}/TTerm.o ${OBJECTDIR}/TTerm_cmd.o ${OBJECTDIR}/startup.o ${OBJECTDIR}/FS.o ${OBJECTDIR}/TTerm_AC.o ${OBJECTDIR}/TTerm_cwd.o ${OBJECTDIR}/ini.o

# Source Files
SOURCEFILES=cybtldr_api.c cybtldr_command.c cybtldr_parse.c communication_api.c FatFs/ff.c FatFs/ffsystem.c FatFs/ffunicode.c FatFs/mmcpic32.c FreeRTOS/Core/event_groups.c FreeRTOS/Core/list.c FreeRTOS/Core/queue.c FreeRTOS/Core/stream_buffer.c FreeRTOS/Core/tasks.c FreeRTOS/Core/timers.c FreeRTOS/Core/portable/MemMang/heap_4.c FreeRTOS/Core/portable/MPLAB/PIC32MX/port.c FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.S FreeRTOS/TCPIP/FreeRTOS_ARP.c FreeRTOS/TCPIP/FreeRTOS_DHCP.c FreeRTOS/TCPIP/FreeRTOS_DNS.c FreeRTOS/TCPIP/FreeRTOS_IP.c FreeRTOS/TCPIP/FreeRTOS_Sockets.c FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.c FreeRTOS/TCPIP/FreeRTOS_TCP_IP.c FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.c FreeRTOS/TCPIP/FreeRTOS_UDP_IP.c FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.c service.c FTP.c THex/THex.c apps/top.c apps/iotop.c apps/apps.c apps/tte.c ConfigPerformance.c LAN9250.c NetworkInterface_LAN9250.c SPI.c UART.c main.c LED.c FiberComms.c min.c System.c UD3_Wrapper.c TTerm.c TTerm_cmd.c startup.c FS.c TTerm_AC.c TTerm_cwd.c ini.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/UD3_Fibernet.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX270F256B
MP_LINKER_FILE_OPTION=,--script="p32MX270F256B.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o: FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.S  .generated_files/flags/default/21e41fa89988dc0ee090ae2a2531aba0a9921e7a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.ok ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.d"  -o ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.d" "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o: FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.S  .generated_files/flags/default/7e0fc0084de87b033243cfaeccdbe1c6bd96d9c8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.ok ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.d"  -o ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.asm.d",--gdwarf-2 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.d" "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/cybtldr_api.o: cybtldr_api.c  .generated_files/flags/default/2269c5ceae119709c9ce9f1295e8ccfe9c3bfcc0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cybtldr_api.o.d 
	@${RM} ${OBJECTDIR}/cybtldr_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/cybtldr_api.o.d" -o ${OBJECTDIR}/cybtldr_api.o cybtldr_api.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cybtldr_command.o: cybtldr_command.c  .generated_files/flags/default/2bd10d132c5f2806ae7f429265845330bbdd14a6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cybtldr_command.o.d 
	@${RM} ${OBJECTDIR}/cybtldr_command.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/cybtldr_command.o.d" -o ${OBJECTDIR}/cybtldr_command.o cybtldr_command.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cybtldr_parse.o: cybtldr_parse.c  .generated_files/flags/default/aebd8dace1566e9ab231115266cf74ce316c8fe6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cybtldr_parse.o.d 
	@${RM} ${OBJECTDIR}/cybtldr_parse.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/cybtldr_parse.o.d" -o ${OBJECTDIR}/cybtldr_parse.o cybtldr_parse.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/communication_api.o: communication_api.c  .generated_files/flags/default/75a3c36dcb4f643812ade2c922bd3ad187396072 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/communication_api.o.d 
	@${RM} ${OBJECTDIR}/communication_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/communication_api.o.d" -o ${OBJECTDIR}/communication_api.o communication_api.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/ff.o: FatFs/ff.c  .generated_files/flags/default/9cbb47561e5a9ca5afad7f4243ab5f7fddd1aa9a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ff.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/ff.o.d" -o ${OBJECTDIR}/FatFs/ff.o FatFs/ff.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/ffsystem.o: FatFs/ffsystem.c  .generated_files/flags/default/8abe8ef43e13a446ec9e41dcfbdf56dcfbf79336 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/ffsystem.o.d" -o ${OBJECTDIR}/FatFs/ffsystem.o FatFs/ffsystem.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/ffunicode.o: FatFs/ffunicode.c  .generated_files/flags/default/c3da05b44683f1f6c683533166771b4747c0ad31 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/ffunicode.o.d" -o ${OBJECTDIR}/FatFs/ffunicode.o FatFs/ffunicode.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/mmcpic32.o: FatFs/mmcpic32.c  .generated_files/flags/default/768d64068450e8c0089cb74afc971949dab04de2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o.d 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/mmcpic32.o.d" -o ${OBJECTDIR}/FatFs/mmcpic32.o FatFs/mmcpic32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/event_groups.o: FreeRTOS/Core/event_groups.c  .generated_files/flags/default/876f7dbb4fe02ab1a45e2a705acd6ead8de2cc71 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/event_groups.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/event_groups.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/event_groups.o FreeRTOS/Core/event_groups.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/list.o: FreeRTOS/Core/list.c  .generated_files/flags/default/90af65780ab1d28a792016afd566ac9e4439e298 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/list.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/list.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/list.o FreeRTOS/Core/list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/queue.o: FreeRTOS/Core/queue.c  .generated_files/flags/default/8ee3f9401c5c3efd46571445e5118f6ac36e2f5b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/queue.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/queue.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/queue.o FreeRTOS/Core/queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o: FreeRTOS/Core/stream_buffer.c  .generated_files/flags/default/4c6ce7b886ea9a1d52475539e50be5d5a508c095 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o FreeRTOS/Core/stream_buffer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/tasks.o: FreeRTOS/Core/tasks.c  .generated_files/flags/default/57e6ce861bbeb1eb4b6f209a40ab47058cd6be94 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/tasks.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/tasks.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/tasks.o FreeRTOS/Core/tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/timers.o: FreeRTOS/Core/timers.c  .generated_files/flags/default/9d58055c1282360106a23e04cca5775f17ba7f3d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/timers.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/timers.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/timers.o FreeRTOS/Core/timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o: FreeRTOS/Core/portable/MemMang/heap_4.c  .generated_files/flags/default/d7958e1ec30f6bbf30f161a3850e827faff79018 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core/portable/MemMang" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o FreeRTOS/Core/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o: FreeRTOS/Core/portable/MPLAB/PIC32MX/port.c  .generated_files/flags/default/80f4811bc888badd9664fda4a1a71b53aaa3e14d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o FreeRTOS/Core/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o: FreeRTOS/TCPIP/FreeRTOS_ARP.c  .generated_files/flags/default/5e2ebf9eac9302c14851c7a6f6795237e18c85ac .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o FreeRTOS/TCPIP/FreeRTOS_ARP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o: FreeRTOS/TCPIP/FreeRTOS_DHCP.c  .generated_files/flags/default/8a755e02bfbe31c5886009800fa79fe2fe5ac82b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o FreeRTOS/TCPIP/FreeRTOS_DHCP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o: FreeRTOS/TCPIP/FreeRTOS_DNS.c  .generated_files/flags/default/cbd5206a1f12b0892961ec1ef7b17319c59fce3c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o FreeRTOS/TCPIP/FreeRTOS_DNS.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o: FreeRTOS/TCPIP/FreeRTOS_IP.c  .generated_files/flags/default/d33b7cbc19c14e3099186fc0ff9cab6cbf4e61f5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o FreeRTOS/TCPIP/FreeRTOS_IP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o: FreeRTOS/TCPIP/FreeRTOS_Sockets.c  .generated_files/flags/default/cbcafd9f7e03f84994e0db90ab7b2f257dd441 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o FreeRTOS/TCPIP/FreeRTOS_Sockets.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o: FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.c  .generated_files/flags/default/2b9e53600fef270eb421a17d07f6105f2adf3b07 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o: FreeRTOS/TCPIP/FreeRTOS_TCP_IP.c  .generated_files/flags/default/ef1f380b44801b9a1593a6476d7769eac940726b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o FreeRTOS/TCPIP/FreeRTOS_TCP_IP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o: FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.c  .generated_files/flags/default/aeb550ddb6f5a8852e748ca66c87fa293e7c233d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o: FreeRTOS/TCPIP/FreeRTOS_UDP_IP.c  .generated_files/flags/default/77130e42c9ffc0341123e9f89e1e54ecb4ae12b0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o FreeRTOS/TCPIP/FreeRTOS_UDP_IP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o: FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.c  .generated_files/flags/default/fc5ff3c776f78f9e8237e9904aa01511b257b653 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/service.o: service.c  .generated_files/flags/default/b73d246b29d4c10cc0f02efb10e9c7f77fb35413 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/service.o.d 
	@${RM} ${OBJECTDIR}/service.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/service.o.d" -o ${OBJECTDIR}/service.o service.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FTP.o: FTP.c  .generated_files/flags/default/3174b3bfdb0125dd28dcea24f8bf2e2618ba0f28 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FTP.o.d 
	@${RM} ${OBJECTDIR}/FTP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FTP.o.d" -o ${OBJECTDIR}/FTP.o FTP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/THex/THex.o: THex/THex.c  .generated_files/flags/default/34b9e52154094f0424d4617dd6ebdea413f8b0eb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/THex" 
	@${RM} ${OBJECTDIR}/THex/THex.o.d 
	@${RM} ${OBJECTDIR}/THex/THex.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/THex/THex.o.d" -o ${OBJECTDIR}/THex/THex.o THex/THex.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/apps/top.o: apps/top.c  .generated_files/flags/default/eb40100b28550f356c206df8cc7237732f98af94 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/top.o.d 
	@${RM} ${OBJECTDIR}/apps/top.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/apps/top.o.d" -o ${OBJECTDIR}/apps/top.o apps/top.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/apps/iotop.o: apps/iotop.c  .generated_files/flags/default/4ae651bd55424f6628eca55d53754d6a32486288 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/iotop.o.d 
	@${RM} ${OBJECTDIR}/apps/iotop.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/apps/iotop.o.d" -o ${OBJECTDIR}/apps/iotop.o apps/iotop.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/apps/apps.o: apps/apps.c  .generated_files/flags/default/5f4cb625aac81d7580701e17f8bdf1aab12c21d7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/apps.o.d 
	@${RM} ${OBJECTDIR}/apps/apps.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/apps/apps.o.d" -o ${OBJECTDIR}/apps/apps.o apps/apps.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/apps/tte.o: apps/tte.c  .generated_files/flags/default/9d678c903578e344fbe64bc9ca173c0b599e0179 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/tte.o.d 
	@${RM} ${OBJECTDIR}/apps/tte.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/apps/tte.o.d" -o ${OBJECTDIR}/apps/tte.o apps/tte.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ConfigPerformance.o: ConfigPerformance.c  .generated_files/flags/default/304c17a34ad92a1c955edcb0867a8380831a1671 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ConfigPerformance.o.d 
	@${RM} ${OBJECTDIR}/ConfigPerformance.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/ConfigPerformance.o.d" -o ${OBJECTDIR}/ConfigPerformance.o ConfigPerformance.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/LAN9250.o: LAN9250.c  .generated_files/flags/default/11f70875da4b1db1472305c236432f7045cd3679 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LAN9250.o.d 
	@${RM} ${OBJECTDIR}/LAN9250.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/LAN9250.o.d" -o ${OBJECTDIR}/LAN9250.o LAN9250.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/NetworkInterface_LAN9250.o: NetworkInterface_LAN9250.c  .generated_files/flags/default/b395328ceaed8001340fd5066061907c2198d89f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/NetworkInterface_LAN9250.o.d 
	@${RM} ${OBJECTDIR}/NetworkInterface_LAN9250.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/NetworkInterface_LAN9250.o.d" -o ${OBJECTDIR}/NetworkInterface_LAN9250.o NetworkInterface_LAN9250.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SPI.o: SPI.c  .generated_files/flags/default/6732c5b58ae37149bc6fc6a145890439a8e33ba4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SPI.o.d 
	@${RM} ${OBJECTDIR}/SPI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/SPI.o.d" -o ${OBJECTDIR}/SPI.o SPI.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/UART.o: UART.c  .generated_files/flags/default/aa2c06973c142b5ae0cde32d8488875bf7c2a4d6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UART.o.d 
	@${RM} ${OBJECTDIR}/UART.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/UART.o.d" -o ${OBJECTDIR}/UART.o UART.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/7bf3e6fe7f7254278cbad965ca638d1d4dd372e6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/LED.o: LED.c  .generated_files/flags/default/a8ef5d37d8691797dcd2c73de4b49dd2e9a98336 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LED.o.d 
	@${RM} ${OBJECTDIR}/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/LED.o.d" -o ${OBJECTDIR}/LED.o LED.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FiberComms.o: FiberComms.c  .generated_files/flags/default/5911020de74b4e6b162bbf759d88a07b32e7eadb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FiberComms.o.d 
	@${RM} ${OBJECTDIR}/FiberComms.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FiberComms.o.d" -o ${OBJECTDIR}/FiberComms.o FiberComms.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/min.o: min.c  .generated_files/flags/default/2c2777ffac4eb6866b83c12d57f5fb4388cdb24 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/min.o.d 
	@${RM} ${OBJECTDIR}/min.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/min.o.d" -o ${OBJECTDIR}/min.o min.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/System.o: System.c  .generated_files/flags/default/55d2c0f7a11723f801d488cffae2c0bcb6f5dc1d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/System.o.d 
	@${RM} ${OBJECTDIR}/System.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/System.o.d" -o ${OBJECTDIR}/System.o System.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/UD3_Wrapper.o: UD3_Wrapper.c  .generated_files/flags/default/fae1165b15d9c3a4482b2f5db0405348d24f604f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UD3_Wrapper.o.d 
	@${RM} ${OBJECTDIR}/UD3_Wrapper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/UD3_Wrapper.o.d" -o ${OBJECTDIR}/UD3_Wrapper.o UD3_Wrapper.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TTerm.o: TTerm.c  .generated_files/flags/default/d9ffdcce85008d83ecf2d3224a97d6085e26b456 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm.o.d 
	@${RM} ${OBJECTDIR}/TTerm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/TTerm.o.d" -o ${OBJECTDIR}/TTerm.o TTerm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TTerm_cmd.o: TTerm_cmd.c  .generated_files/flags/default/7fd34fe0415f1a9c5f3e4939ead1e9e2d30a48f9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm_cmd.o.d 
	@${RM} ${OBJECTDIR}/TTerm_cmd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/TTerm_cmd.o.d" -o ${OBJECTDIR}/TTerm_cmd.o TTerm_cmd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/startup.o: startup.c  .generated_files/flags/default/71153d98b2d827b89023d24ceae719cd00882a76 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/startup.o.d 
	@${RM} ${OBJECTDIR}/startup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/startup.o.d" -o ${OBJECTDIR}/startup.o startup.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FS.o: FS.c  .generated_files/flags/default/8af2710166c21757af5f39c5a90bd02a4923b6f4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FS.o.d 
	@${RM} ${OBJECTDIR}/FS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FS.o.d" -o ${OBJECTDIR}/FS.o FS.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TTerm_AC.o: TTerm_AC.c  .generated_files/flags/default/7b68aec08d3e9557236810cc90fd7c066d8ec992 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm_AC.o.d 
	@${RM} ${OBJECTDIR}/TTerm_AC.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/TTerm_AC.o.d" -o ${OBJECTDIR}/TTerm_AC.o TTerm_AC.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TTerm_cwd.o: TTerm_cwd.c  .generated_files/flags/default/e1e0d35bb62cd8ca18c42ea78ff4f047f8778006 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm_cwd.o.d 
	@${RM} ${OBJECTDIR}/TTerm_cwd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/TTerm_cwd.o.d" -o ${OBJECTDIR}/TTerm_cwd.o TTerm_cwd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ini.o: ini.c  .generated_files/flags/default/4ef549894105fead90efff3c32d37ac931ea6210 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ini.o.d 
	@${RM} ${OBJECTDIR}/ini.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/ini.o.d" -o ${OBJECTDIR}/ini.o ini.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/cybtldr_api.o: cybtldr_api.c  .generated_files/flags/default/3b27d4929e81b480658fe913cc49251af06d1eb6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cybtldr_api.o.d 
	@${RM} ${OBJECTDIR}/cybtldr_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/cybtldr_api.o.d" -o ${OBJECTDIR}/cybtldr_api.o cybtldr_api.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cybtldr_command.o: cybtldr_command.c  .generated_files/flags/default/cfdb32c9a6ba29645ecef94278659f94ce7525d5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cybtldr_command.o.d 
	@${RM} ${OBJECTDIR}/cybtldr_command.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/cybtldr_command.o.d" -o ${OBJECTDIR}/cybtldr_command.o cybtldr_command.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cybtldr_parse.o: cybtldr_parse.c  .generated_files/flags/default/437f69f6c41084ea58503e87c55083ae4c423866 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cybtldr_parse.o.d 
	@${RM} ${OBJECTDIR}/cybtldr_parse.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/cybtldr_parse.o.d" -o ${OBJECTDIR}/cybtldr_parse.o cybtldr_parse.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/communication_api.o: communication_api.c  .generated_files/flags/default/622cd4273d03c1eae9fdefc5b9d4e82e91bcce17 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/communication_api.o.d 
	@${RM} ${OBJECTDIR}/communication_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/communication_api.o.d" -o ${OBJECTDIR}/communication_api.o communication_api.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/ff.o: FatFs/ff.c  .generated_files/flags/default/57a92b0e80dc57c28822804247c777768cd98fb8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ff.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/ff.o.d" -o ${OBJECTDIR}/FatFs/ff.o FatFs/ff.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/ffsystem.o: FatFs/ffsystem.c  .generated_files/flags/default/9179896dc366c299ae70bf06b26f813a04982b7a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/ffsystem.o.d" -o ${OBJECTDIR}/FatFs/ffsystem.o FatFs/ffsystem.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/ffunicode.o: FatFs/ffunicode.c  .generated_files/flags/default/6af6c4185b9312ba99c20e3edc71613252ee1769 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/ffunicode.o.d" -o ${OBJECTDIR}/FatFs/ffunicode.o FatFs/ffunicode.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/mmcpic32.o: FatFs/mmcpic32.c  .generated_files/flags/default/c836e3342650858e1b71e078809bbc428374fb4e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o.d 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/mmcpic32.o.d" -o ${OBJECTDIR}/FatFs/mmcpic32.o FatFs/mmcpic32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/event_groups.o: FreeRTOS/Core/event_groups.c  .generated_files/flags/default/60eec7439a965be3a17a4d56cabdf3ff5ac014d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/event_groups.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/event_groups.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/event_groups.o FreeRTOS/Core/event_groups.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/list.o: FreeRTOS/Core/list.c  .generated_files/flags/default/f6c9fe723e025f4364c8254034a9636cd61bed84 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/list.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/list.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/list.o FreeRTOS/Core/list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/queue.o: FreeRTOS/Core/queue.c  .generated_files/flags/default/26de19c4f9800cc880e35623b70f721657ed9ffa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/queue.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/queue.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/queue.o FreeRTOS/Core/queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o: FreeRTOS/Core/stream_buffer.c  .generated_files/flags/default/788e3366d03ee2cf2f3b5015049453aa0032d651 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o FreeRTOS/Core/stream_buffer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/tasks.o: FreeRTOS/Core/tasks.c  .generated_files/flags/default/4728bc0438f3d32790daaacfec26eaa51e0d2349 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/tasks.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/tasks.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/tasks.o FreeRTOS/Core/tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/timers.o: FreeRTOS/Core/timers.c  .generated_files/flags/default/e14bc6100a3172f6eaa0db0a9356c66636a4c798 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/timers.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/timers.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/timers.o FreeRTOS/Core/timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o: FreeRTOS/Core/portable/MemMang/heap_4.c  .generated_files/flags/default/a18ccf2dad40192c9b6563b3b0246a3579782d2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core/portable/MemMang" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o FreeRTOS/Core/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o: FreeRTOS/Core/portable/MPLAB/PIC32MX/port.c  .generated_files/flags/default/c432e0b047a0db649a929ef74b3f758e98e606b6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o FreeRTOS/Core/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o: FreeRTOS/TCPIP/FreeRTOS_ARP.c  .generated_files/flags/default/b87b72205f83c8f0337d3d8c5a8fe342086dfd4b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o FreeRTOS/TCPIP/FreeRTOS_ARP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o: FreeRTOS/TCPIP/FreeRTOS_DHCP.c  .generated_files/flags/default/5e7a82c98001d8121cbdaf4799c80aa0426da499 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o FreeRTOS/TCPIP/FreeRTOS_DHCP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o: FreeRTOS/TCPIP/FreeRTOS_DNS.c  .generated_files/flags/default/e7f78c15a3012d59dc9bdff5b95fe7fc522df75f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o FreeRTOS/TCPIP/FreeRTOS_DNS.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o: FreeRTOS/TCPIP/FreeRTOS_IP.c  .generated_files/flags/default/5b6555bb77a47bf28e5110519f83fd04c38c819b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o FreeRTOS/TCPIP/FreeRTOS_IP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o: FreeRTOS/TCPIP/FreeRTOS_Sockets.c  .generated_files/flags/default/70cfa94b176463ebf6ce5697b6b6b85370019875 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o FreeRTOS/TCPIP/FreeRTOS_Sockets.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o: FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.c  .generated_files/flags/default/ee8bdbda4b6b7ef9af70ffc6474b5c591d51f628 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o: FreeRTOS/TCPIP/FreeRTOS_TCP_IP.c  .generated_files/flags/default/1b9dea393655843f38c6b7b4c115aece5f775306 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o FreeRTOS/TCPIP/FreeRTOS_TCP_IP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o: FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.c  .generated_files/flags/default/888aa201ff10880aa39c9403aa664c4f89115c33 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o: FreeRTOS/TCPIP/FreeRTOS_UDP_IP.c  .generated_files/flags/default/432226ae50258dda752114f8b6007ffeadd33aff .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o FreeRTOS/TCPIP/FreeRTOS_UDP_IP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o: FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.c  .generated_files/flags/default/99c3e3b242f035f8d87722a301a45584393b37bb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/service.o: service.c  .generated_files/flags/default/7c4a057423b0e307809c9e2ef6088e56b4f50714 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/service.o.d 
	@${RM} ${OBJECTDIR}/service.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/service.o.d" -o ${OBJECTDIR}/service.o service.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FTP.o: FTP.c  .generated_files/flags/default/645dacdd51b6f60d4e0cebab971cf318976a1185 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FTP.o.d 
	@${RM} ${OBJECTDIR}/FTP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FTP.o.d" -o ${OBJECTDIR}/FTP.o FTP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/THex/THex.o: THex/THex.c  .generated_files/flags/default/44596c728a9edb2224c4d50ecd7ce633e69e31b9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/THex" 
	@${RM} ${OBJECTDIR}/THex/THex.o.d 
	@${RM} ${OBJECTDIR}/THex/THex.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/THex/THex.o.d" -o ${OBJECTDIR}/THex/THex.o THex/THex.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/apps/top.o: apps/top.c  .generated_files/flags/default/df2f0474dd2134e10af11047e9e5b3235eef5979 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/top.o.d 
	@${RM} ${OBJECTDIR}/apps/top.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/apps/top.o.d" -o ${OBJECTDIR}/apps/top.o apps/top.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/apps/iotop.o: apps/iotop.c  .generated_files/flags/default/45aa766b297646638f1dc60818cc69ce88382b42 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/iotop.o.d 
	@${RM} ${OBJECTDIR}/apps/iotop.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/apps/iotop.o.d" -o ${OBJECTDIR}/apps/iotop.o apps/iotop.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/apps/apps.o: apps/apps.c  .generated_files/flags/default/1268a8c4aba98928fef22181eca86a9b56c766cb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/apps.o.d 
	@${RM} ${OBJECTDIR}/apps/apps.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/apps/apps.o.d" -o ${OBJECTDIR}/apps/apps.o apps/apps.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/apps/tte.o: apps/tte.c  .generated_files/flags/default/c3f9a232d17ba0f56c97316374f5605050bd59a1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/tte.o.d 
	@${RM} ${OBJECTDIR}/apps/tte.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/apps/tte.o.d" -o ${OBJECTDIR}/apps/tte.o apps/tte.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ConfigPerformance.o: ConfigPerformance.c  .generated_files/flags/default/ff6eeb438417030e7c603c146ad7852411976a09 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ConfigPerformance.o.d 
	@${RM} ${OBJECTDIR}/ConfigPerformance.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/ConfigPerformance.o.d" -o ${OBJECTDIR}/ConfigPerformance.o ConfigPerformance.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/LAN9250.o: LAN9250.c  .generated_files/flags/default/41db1eb99c88ac16adc35c206752348fb74991d0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LAN9250.o.d 
	@${RM} ${OBJECTDIR}/LAN9250.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/LAN9250.o.d" -o ${OBJECTDIR}/LAN9250.o LAN9250.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/NetworkInterface_LAN9250.o: NetworkInterface_LAN9250.c  .generated_files/flags/default/9828169478b9a4bc25d6ec9a07366a94d9b8610e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/NetworkInterface_LAN9250.o.d 
	@${RM} ${OBJECTDIR}/NetworkInterface_LAN9250.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/NetworkInterface_LAN9250.o.d" -o ${OBJECTDIR}/NetworkInterface_LAN9250.o NetworkInterface_LAN9250.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SPI.o: SPI.c  .generated_files/flags/default/b6ea21277b287c04130c40b586cf1ddb6b0533af .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SPI.o.d 
	@${RM} ${OBJECTDIR}/SPI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/SPI.o.d" -o ${OBJECTDIR}/SPI.o SPI.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/UART.o: UART.c  .generated_files/flags/default/bcdb7945c8aad6bd7f0b153838b3a35f8c0f1d87 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UART.o.d 
	@${RM} ${OBJECTDIR}/UART.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/UART.o.d" -o ${OBJECTDIR}/UART.o UART.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/d37d3fdb811db8fe9ef4051c5be35e39c485f683 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/LED.o: LED.c  .generated_files/flags/default/393c38cbe4eb22cc61180be44ab402a33664d661 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LED.o.d 
	@${RM} ${OBJECTDIR}/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/LED.o.d" -o ${OBJECTDIR}/LED.o LED.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FiberComms.o: FiberComms.c  .generated_files/flags/default/b470789334e9425dfb9da256d8e60904931a0fd9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FiberComms.o.d 
	@${RM} ${OBJECTDIR}/FiberComms.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FiberComms.o.d" -o ${OBJECTDIR}/FiberComms.o FiberComms.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/min.o: min.c  .generated_files/flags/default/c73d4cc989ec343292f506965de208acd4007ff7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/min.o.d 
	@${RM} ${OBJECTDIR}/min.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/min.o.d" -o ${OBJECTDIR}/min.o min.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/System.o: System.c  .generated_files/flags/default/fdc61f3f66d36c972e5886dcd1772edc2889be51 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/System.o.d 
	@${RM} ${OBJECTDIR}/System.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/System.o.d" -o ${OBJECTDIR}/System.o System.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/UD3_Wrapper.o: UD3_Wrapper.c  .generated_files/flags/default/62b5795bc179ec18b8713597474b64f26f885f0b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UD3_Wrapper.o.d 
	@${RM} ${OBJECTDIR}/UD3_Wrapper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/UD3_Wrapper.o.d" -o ${OBJECTDIR}/UD3_Wrapper.o UD3_Wrapper.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TTerm.o: TTerm.c  .generated_files/flags/default/72f6dd77163bd48915e0dde620fb9f5ed8e6c6e6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm.o.d 
	@${RM} ${OBJECTDIR}/TTerm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/TTerm.o.d" -o ${OBJECTDIR}/TTerm.o TTerm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TTerm_cmd.o: TTerm_cmd.c  .generated_files/flags/default/ee2e4ec9d550f67d69d4fa18ee8572ce0143fdde .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm_cmd.o.d 
	@${RM} ${OBJECTDIR}/TTerm_cmd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/TTerm_cmd.o.d" -o ${OBJECTDIR}/TTerm_cmd.o TTerm_cmd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/startup.o: startup.c  .generated_files/flags/default/ad246ae4680ea933d7d76c36c824a7099a0d132e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/startup.o.d 
	@${RM} ${OBJECTDIR}/startup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/startup.o.d" -o ${OBJECTDIR}/startup.o startup.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FS.o: FS.c  .generated_files/flags/default/faf00b61f17187bb4927278c56f223d1a6baa889 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FS.o.d 
	@${RM} ${OBJECTDIR}/FS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FS.o.d" -o ${OBJECTDIR}/FS.o FS.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TTerm_AC.o: TTerm_AC.c  .generated_files/flags/default/cda4f3071a923e249f83a89bda1af2e8ca737c43 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm_AC.o.d 
	@${RM} ${OBJECTDIR}/TTerm_AC.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/TTerm_AC.o.d" -o ${OBJECTDIR}/TTerm_AC.o TTerm_AC.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TTerm_cwd.o: TTerm_cwd.c  .generated_files/flags/default/bf3e905299c5e0959ee0bc96ee050221e080a88b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm_cwd.o.d 
	@${RM} ${OBJECTDIR}/TTerm_cwd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/TTerm_cwd.o.d" -o ${OBJECTDIR}/TTerm_cwd.o TTerm_cwd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ini.o: ini.c  .generated_files/flags/default/14fc6148bd75af6df909d848fd2b0b570037b6e1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ini.o.d 
	@${RM} ${OBJECTDIR}/ini.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/ini.o.d" -o ${OBJECTDIR}/ini.o ini.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/UD3_Fibernet.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    p32MX270F256B.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/UD3_Fibernet.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--no-check-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--cref,--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/UD3_Fibernet.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   p32MX270F256B.ld PIC32_SD_BL.X/dist/default/production/PIC32_SD_BL.X.production.hex
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/UD3_Fibernet.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-check-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--cref,--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/UD3_Fibernet.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
	@echo "Creating unified hex file"
	@"C:/Program Files/Microchip/MPLABX/v6.05/mplab_platform/platform/../mplab_ide/modules/../../bin/hexmate" --edf="C:/Program Files/Microchip/MPLABX/v6.05/mplab_platform/platform/../mplab_ide/modules/../../dat/en_msgs.txt" ${DISTDIR}/UD3_Fibernet.X.${IMAGE_TYPE}.hex PIC32_SD_BL.X/dist/default/production/PIC32_SD_BL.X.production.hex -odist/${CND_CONF}/production/UD3_Fibernet.X.production.unified.hex

endif


# Subprojects
.build-subprojects:
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
	cd PIC32_SD_BL.X && ${MAKE}  -f Makefile CONF=default TYPE_IMAGE=DEBUG_RUN
else
	cd PIC32_SD_BL.X && ${MAKE}  -f Makefile CONF=default
endif


# Subprojects
.clean-subprojects:
	cd PIC32_SD_BL.X && rm -rf "build/default" "dist/default"

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
