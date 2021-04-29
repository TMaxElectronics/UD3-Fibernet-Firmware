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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/UD3-Fibernet-Firmware.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/UD3-Fibernet-Firmware.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/UD3-Fibernet-Firmware.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o: FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.ok ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.d"  -o ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.d" "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o: FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
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
${OBJECTDIR}/cybtldr_api.o: cybtldr_api.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cybtldr_api.o.d 
	@${RM} ${OBJECTDIR}/cybtldr_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/cybtldr_api.o.d" -o ${OBJECTDIR}/cybtldr_api.o cybtldr_api.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/cybtldr_api.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/cybtldr_command.o: cybtldr_command.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cybtldr_command.o.d 
	@${RM} ${OBJECTDIR}/cybtldr_command.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/cybtldr_command.o.d" -o ${OBJECTDIR}/cybtldr_command.o cybtldr_command.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/cybtldr_command.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/cybtldr_parse.o: cybtldr_parse.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cybtldr_parse.o.d 
	@${RM} ${OBJECTDIR}/cybtldr_parse.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/cybtldr_parse.o.d" -o ${OBJECTDIR}/cybtldr_parse.o cybtldr_parse.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/cybtldr_parse.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/communication_api.o: communication_api.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/communication_api.o.d 
	@${RM} ${OBJECTDIR}/communication_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/communication_api.o.d" -o ${OBJECTDIR}/communication_api.o communication_api.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/communication_api.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FatFs/ff.o: FatFs/ff.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ff.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FatFs/ff.o.d" -o ${OBJECTDIR}/FatFs/ff.o FatFs/ff.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FatFs/ff.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FatFs/ffsystem.o: FatFs/ffsystem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FatFs/ffsystem.o.d" -o ${OBJECTDIR}/FatFs/ffsystem.o FatFs/ffsystem.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FatFs/ffsystem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FatFs/ffunicode.o: FatFs/ffunicode.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FatFs/ffunicode.o.d" -o ${OBJECTDIR}/FatFs/ffunicode.o FatFs/ffunicode.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FatFs/ffunicode.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FatFs/mmcpic32.o: FatFs/mmcpic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o.d 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FatFs/mmcpic32.o.d" -o ${OBJECTDIR}/FatFs/mmcpic32.o FatFs/mmcpic32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FatFs/mmcpic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/Core/event_groups.o: FreeRTOS/Core/event_groups.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/event_groups.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/event_groups.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/event_groups.o FreeRTOS/Core/event_groups.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/event_groups.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/Core/list.o: FreeRTOS/Core/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/list.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/list.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/list.o FreeRTOS/Core/list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/Core/queue.o: FreeRTOS/Core/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/queue.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/queue.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/queue.o FreeRTOS/Core/queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o: FreeRTOS/Core/stream_buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o FreeRTOS/Core/stream_buffer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/Core/tasks.o: FreeRTOS/Core/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/tasks.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/tasks.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/tasks.o FreeRTOS/Core/tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/Core/timers.o: FreeRTOS/Core/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/timers.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/timers.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/timers.o FreeRTOS/Core/timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o: FreeRTOS/Core/portable/MemMang/heap_4.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core/portable/MemMang" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o FreeRTOS/Core/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o: FreeRTOS/Core/portable/MPLAB/PIC32MX/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o FreeRTOS/Core/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o: FreeRTOS/TCPIP/FreeRTOS_ARP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o FreeRTOS/TCPIP/FreeRTOS_ARP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o: FreeRTOS/TCPIP/FreeRTOS_DHCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o FreeRTOS/TCPIP/FreeRTOS_DHCP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o: FreeRTOS/TCPIP/FreeRTOS_DNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o FreeRTOS/TCPIP/FreeRTOS_DNS.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o: FreeRTOS/TCPIP/FreeRTOS_IP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o FreeRTOS/TCPIP/FreeRTOS_IP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o: FreeRTOS/TCPIP/FreeRTOS_Sockets.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o FreeRTOS/TCPIP/FreeRTOS_Sockets.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o: FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o: FreeRTOS/TCPIP/FreeRTOS_TCP_IP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o FreeRTOS/TCPIP/FreeRTOS_TCP_IP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o: FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o: FreeRTOS/TCPIP/FreeRTOS_UDP_IP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o FreeRTOS/TCPIP/FreeRTOS_UDP_IP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o: FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/service.o: service.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/service.o.d 
	@${RM} ${OBJECTDIR}/service.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/service.o.d" -o ${OBJECTDIR}/service.o service.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/service.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FTP.o: FTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FTP.o.d 
	@${RM} ${OBJECTDIR}/FTP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FTP.o.d" -o ${OBJECTDIR}/FTP.o FTP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/THex/THex.o: THex/THex.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/THex" 
	@${RM} ${OBJECTDIR}/THex/THex.o.d 
	@${RM} ${OBJECTDIR}/THex/THex.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/THex/THex.o.d" -o ${OBJECTDIR}/THex/THex.o THex/THex.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/THex/THex.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/apps/top.o: apps/top.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/top.o.d 
	@${RM} ${OBJECTDIR}/apps/top.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/apps/top.o.d" -o ${OBJECTDIR}/apps/top.o apps/top.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/apps/top.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/apps/iotop.o: apps/iotop.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/iotop.o.d 
	@${RM} ${OBJECTDIR}/apps/iotop.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/apps/iotop.o.d" -o ${OBJECTDIR}/apps/iotop.o apps/iotop.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/apps/iotop.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/apps/apps.o: apps/apps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/apps.o.d 
	@${RM} ${OBJECTDIR}/apps/apps.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/apps/apps.o.d" -o ${OBJECTDIR}/apps/apps.o apps/apps.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/apps/apps.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/apps/tte.o: apps/tte.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/tte.o.d 
	@${RM} ${OBJECTDIR}/apps/tte.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/apps/tte.o.d" -o ${OBJECTDIR}/apps/tte.o apps/tte.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/apps/tte.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ConfigPerformance.o: ConfigPerformance.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ConfigPerformance.o.d 
	@${RM} ${OBJECTDIR}/ConfigPerformance.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/ConfigPerformance.o.d" -o ${OBJECTDIR}/ConfigPerformance.o ConfigPerformance.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/ConfigPerformance.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/LAN9250.o: LAN9250.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LAN9250.o.d 
	@${RM} ${OBJECTDIR}/LAN9250.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/LAN9250.o.d" -o ${OBJECTDIR}/LAN9250.o LAN9250.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/LAN9250.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/NetworkInterface_LAN9250.o: NetworkInterface_LAN9250.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/NetworkInterface_LAN9250.o.d 
	@${RM} ${OBJECTDIR}/NetworkInterface_LAN9250.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/NetworkInterface_LAN9250.o.d" -o ${OBJECTDIR}/NetworkInterface_LAN9250.o NetworkInterface_LAN9250.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/NetworkInterface_LAN9250.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/SPI.o: SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SPI.o.d 
	@${RM} ${OBJECTDIR}/SPI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/SPI.o.d" -o ${OBJECTDIR}/SPI.o SPI.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/SPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/UART.o: UART.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UART.o.d 
	@${RM} ${OBJECTDIR}/UART.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/UART.o.d" -o ${OBJECTDIR}/UART.o UART.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/UART.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/LED.o: LED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LED.o.d 
	@${RM} ${OBJECTDIR}/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/LED.o.d" -o ${OBJECTDIR}/LED.o LED.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/LED.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FiberComms.o: FiberComms.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FiberComms.o.d 
	@${RM} ${OBJECTDIR}/FiberComms.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FiberComms.o.d" -o ${OBJECTDIR}/FiberComms.o FiberComms.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FiberComms.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/min.o: min.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/min.o.d 
	@${RM} ${OBJECTDIR}/min.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/min.o.d" -o ${OBJECTDIR}/min.o min.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/min.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/System.o: System.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/System.o.d 
	@${RM} ${OBJECTDIR}/System.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/System.o.d" -o ${OBJECTDIR}/System.o System.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/System.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/UD3_Wrapper.o: UD3_Wrapper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UD3_Wrapper.o.d 
	@${RM} ${OBJECTDIR}/UD3_Wrapper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/UD3_Wrapper.o.d" -o ${OBJECTDIR}/UD3_Wrapper.o UD3_Wrapper.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/UD3_Wrapper.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/TTerm.o: TTerm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm.o.d 
	@${RM} ${OBJECTDIR}/TTerm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/TTerm.o.d" -o ${OBJECTDIR}/TTerm.o TTerm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/TTerm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/TTerm_cmd.o: TTerm_cmd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm_cmd.o.d 
	@${RM} ${OBJECTDIR}/TTerm_cmd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/TTerm_cmd.o.d" -o ${OBJECTDIR}/TTerm_cmd.o TTerm_cmd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/TTerm_cmd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/startup.o: startup.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/startup.o.d 
	@${RM} ${OBJECTDIR}/startup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/startup.o.d" -o ${OBJECTDIR}/startup.o startup.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/startup.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FS.o: FS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FS.o.d 
	@${RM} ${OBJECTDIR}/FS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FS.o.d" -o ${OBJECTDIR}/FS.o FS.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/TTerm_AC.o: TTerm_AC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm_AC.o.d 
	@${RM} ${OBJECTDIR}/TTerm_AC.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/TTerm_AC.o.d" -o ${OBJECTDIR}/TTerm_AC.o TTerm_AC.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/TTerm_AC.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/TTerm_cwd.o: TTerm_cwd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm_cwd.o.d 
	@${RM} ${OBJECTDIR}/TTerm_cwd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/TTerm_cwd.o.d" -o ${OBJECTDIR}/TTerm_cwd.o TTerm_cwd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/TTerm_cwd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ini.o: ini.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ini.o.d 
	@${RM} ${OBJECTDIR}/ini.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/ini.o.d" -o ${OBJECTDIR}/ini.o ini.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/ini.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/cybtldr_api.o: cybtldr_api.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cybtldr_api.o.d 
	@${RM} ${OBJECTDIR}/cybtldr_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/cybtldr_api.o.d" -o ${OBJECTDIR}/cybtldr_api.o cybtldr_api.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/cybtldr_api.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/cybtldr_command.o: cybtldr_command.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cybtldr_command.o.d 
	@${RM} ${OBJECTDIR}/cybtldr_command.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/cybtldr_command.o.d" -o ${OBJECTDIR}/cybtldr_command.o cybtldr_command.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/cybtldr_command.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/cybtldr_parse.o: cybtldr_parse.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cybtldr_parse.o.d 
	@${RM} ${OBJECTDIR}/cybtldr_parse.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/cybtldr_parse.o.d" -o ${OBJECTDIR}/cybtldr_parse.o cybtldr_parse.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/cybtldr_parse.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/communication_api.o: communication_api.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/communication_api.o.d 
	@${RM} ${OBJECTDIR}/communication_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/communication_api.o.d" -o ${OBJECTDIR}/communication_api.o communication_api.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/communication_api.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FatFs/ff.o: FatFs/ff.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ff.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FatFs/ff.o.d" -o ${OBJECTDIR}/FatFs/ff.o FatFs/ff.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FatFs/ff.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FatFs/ffsystem.o: FatFs/ffsystem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FatFs/ffsystem.o.d" -o ${OBJECTDIR}/FatFs/ffsystem.o FatFs/ffsystem.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FatFs/ffsystem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FatFs/ffunicode.o: FatFs/ffunicode.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FatFs/ffunicode.o.d" -o ${OBJECTDIR}/FatFs/ffunicode.o FatFs/ffunicode.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FatFs/ffunicode.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FatFs/mmcpic32.o: FatFs/mmcpic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o.d 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FatFs/mmcpic32.o.d" -o ${OBJECTDIR}/FatFs/mmcpic32.o FatFs/mmcpic32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FatFs/mmcpic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/Core/event_groups.o: FreeRTOS/Core/event_groups.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/event_groups.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/event_groups.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/event_groups.o FreeRTOS/Core/event_groups.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/event_groups.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/Core/list.o: FreeRTOS/Core/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/list.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/list.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/list.o FreeRTOS/Core/list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/Core/queue.o: FreeRTOS/Core/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/queue.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/queue.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/queue.o FreeRTOS/Core/queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o: FreeRTOS/Core/stream_buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o FreeRTOS/Core/stream_buffer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/Core/tasks.o: FreeRTOS/Core/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/tasks.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/tasks.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/tasks.o FreeRTOS/Core/tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/Core/timers.o: FreeRTOS/Core/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/timers.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/timers.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/timers.o FreeRTOS/Core/timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o: FreeRTOS/Core/portable/MemMang/heap_4.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core/portable/MemMang" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o FreeRTOS/Core/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o: FreeRTOS/Core/portable/MPLAB/PIC32MX/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o FreeRTOS/Core/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o: FreeRTOS/TCPIP/FreeRTOS_ARP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o FreeRTOS/TCPIP/FreeRTOS_ARP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o: FreeRTOS/TCPIP/FreeRTOS_DHCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o FreeRTOS/TCPIP/FreeRTOS_DHCP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o: FreeRTOS/TCPIP/FreeRTOS_DNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o FreeRTOS/TCPIP/FreeRTOS_DNS.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o: FreeRTOS/TCPIP/FreeRTOS_IP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o FreeRTOS/TCPIP/FreeRTOS_IP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o: FreeRTOS/TCPIP/FreeRTOS_Sockets.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o FreeRTOS/TCPIP/FreeRTOS_Sockets.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o: FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o: FreeRTOS/TCPIP/FreeRTOS_TCP_IP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o FreeRTOS/TCPIP/FreeRTOS_TCP_IP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o: FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o: FreeRTOS/TCPIP/FreeRTOS_UDP_IP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o FreeRTOS/TCPIP/FreeRTOS_UDP_IP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o: FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/service.o: service.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/service.o.d 
	@${RM} ${OBJECTDIR}/service.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/service.o.d" -o ${OBJECTDIR}/service.o service.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/service.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FTP.o: FTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FTP.o.d 
	@${RM} ${OBJECTDIR}/FTP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FTP.o.d" -o ${OBJECTDIR}/FTP.o FTP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/THex/THex.o: THex/THex.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/THex" 
	@${RM} ${OBJECTDIR}/THex/THex.o.d 
	@${RM} ${OBJECTDIR}/THex/THex.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/THex/THex.o.d" -o ${OBJECTDIR}/THex/THex.o THex/THex.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/THex/THex.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/apps/top.o: apps/top.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/top.o.d 
	@${RM} ${OBJECTDIR}/apps/top.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/apps/top.o.d" -o ${OBJECTDIR}/apps/top.o apps/top.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/apps/top.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/apps/iotop.o: apps/iotop.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/iotop.o.d 
	@${RM} ${OBJECTDIR}/apps/iotop.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/apps/iotop.o.d" -o ${OBJECTDIR}/apps/iotop.o apps/iotop.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/apps/iotop.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/apps/apps.o: apps/apps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/apps.o.d 
	@${RM} ${OBJECTDIR}/apps/apps.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/apps/apps.o.d" -o ${OBJECTDIR}/apps/apps.o apps/apps.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/apps/apps.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/apps/tte.o: apps/tte.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/tte.o.d 
	@${RM} ${OBJECTDIR}/apps/tte.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/apps/tte.o.d" -o ${OBJECTDIR}/apps/tte.o apps/tte.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/apps/tte.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ConfigPerformance.o: ConfigPerformance.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ConfigPerformance.o.d 
	@${RM} ${OBJECTDIR}/ConfigPerformance.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/ConfigPerformance.o.d" -o ${OBJECTDIR}/ConfigPerformance.o ConfigPerformance.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/ConfigPerformance.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/LAN9250.o: LAN9250.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LAN9250.o.d 
	@${RM} ${OBJECTDIR}/LAN9250.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/LAN9250.o.d" -o ${OBJECTDIR}/LAN9250.o LAN9250.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/LAN9250.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/NetworkInterface_LAN9250.o: NetworkInterface_LAN9250.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/NetworkInterface_LAN9250.o.d 
	@${RM} ${OBJECTDIR}/NetworkInterface_LAN9250.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/NetworkInterface_LAN9250.o.d" -o ${OBJECTDIR}/NetworkInterface_LAN9250.o NetworkInterface_LAN9250.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/NetworkInterface_LAN9250.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/SPI.o: SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SPI.o.d 
	@${RM} ${OBJECTDIR}/SPI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/SPI.o.d" -o ${OBJECTDIR}/SPI.o SPI.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/SPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/UART.o: UART.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UART.o.d 
	@${RM} ${OBJECTDIR}/UART.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/UART.o.d" -o ${OBJECTDIR}/UART.o UART.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/UART.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/LED.o: LED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LED.o.d 
	@${RM} ${OBJECTDIR}/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/LED.o.d" -o ${OBJECTDIR}/LED.o LED.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/LED.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FiberComms.o: FiberComms.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FiberComms.o.d 
	@${RM} ${OBJECTDIR}/FiberComms.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FiberComms.o.d" -o ${OBJECTDIR}/FiberComms.o FiberComms.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FiberComms.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/min.o: min.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/min.o.d 
	@${RM} ${OBJECTDIR}/min.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/min.o.d" -o ${OBJECTDIR}/min.o min.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/min.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/System.o: System.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/System.o.d 
	@${RM} ${OBJECTDIR}/System.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/System.o.d" -o ${OBJECTDIR}/System.o System.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/System.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/UD3_Wrapper.o: UD3_Wrapper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UD3_Wrapper.o.d 
	@${RM} ${OBJECTDIR}/UD3_Wrapper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/UD3_Wrapper.o.d" -o ${OBJECTDIR}/UD3_Wrapper.o UD3_Wrapper.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/UD3_Wrapper.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/TTerm.o: TTerm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm.o.d 
	@${RM} ${OBJECTDIR}/TTerm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/TTerm.o.d" -o ${OBJECTDIR}/TTerm.o TTerm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/TTerm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/TTerm_cmd.o: TTerm_cmd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm_cmd.o.d 
	@${RM} ${OBJECTDIR}/TTerm_cmd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/TTerm_cmd.o.d" -o ${OBJECTDIR}/TTerm_cmd.o TTerm_cmd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/TTerm_cmd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/startup.o: startup.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/startup.o.d 
	@${RM} ${OBJECTDIR}/startup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/startup.o.d" -o ${OBJECTDIR}/startup.o startup.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/startup.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/FS.o: FS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FS.o.d 
	@${RM} ${OBJECTDIR}/FS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FS.o.d" -o ${OBJECTDIR}/FS.o FS.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/FS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/TTerm_AC.o: TTerm_AC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm_AC.o.d 
	@${RM} ${OBJECTDIR}/TTerm_AC.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/TTerm_AC.o.d" -o ${OBJECTDIR}/TTerm_AC.o TTerm_AC.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/TTerm_AC.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/TTerm_cwd.o: TTerm_cwd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm_cwd.o.d 
	@${RM} ${OBJECTDIR}/TTerm_cwd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/TTerm_cwd.o.d" -o ${OBJECTDIR}/TTerm_cwd.o TTerm_cwd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/TTerm_cwd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ini.o: ini.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ini.o.d 
	@${RM} ${OBJECTDIR}/ini.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/ini.o.d" -o ${OBJECTDIR}/ini.o ini.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	@${FIXDEPS} "${OBJECTDIR}/ini.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/UD3-Fibernet-Firmware.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    p32MX270F256B.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/UD3-Fibernet-Firmware.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--no-check-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--cref,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/UD3-Fibernet-Firmware.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   p32MX270F256B.ld PIC32_SD_BL.X/dist/default/production/PIC32_SD_BL.X.production.hex
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/UD3-Fibernet-Firmware.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-check-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--cref,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/UD3-Fibernet-Firmware.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
	@echo "Creating unified hex file"
	@"C:/Program Files (x86)/Microchip/MPLABX/v5.40/mplab_platform/platform/../mplab_ide/modules/../../bin/hexmate" --edf="C:/Program Files (x86)/Microchip/MPLABX/v5.40/mplab_platform/platform/../mplab_ide/modules/../../dat/en_msgs.txt" dist/${CND_CONF}/${IMAGE_TYPE}/UD3-Fibernet-Firmware.${IMAGE_TYPE}.hex PIC32_SD_BL.X/dist/default/production/PIC32_SD_BL.X.production.hex -odist/${CND_CONF}/production/UD3-Fibernet-Firmware.production.unified.hex

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
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
