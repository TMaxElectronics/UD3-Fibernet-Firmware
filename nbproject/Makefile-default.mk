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
${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o: FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.S  .generated_files/flags/default/845b99a2a2349bbe7f364c09d15e63021c4de18c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.ok ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.d"  -o ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -std=gnu11 -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.d" "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o: FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.S  .generated_files/flags/default/b29e0eb6bc5c59fe190298f1910b6636bfc1b58c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.ok ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.d"  -o ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -std=gnu11 -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.asm.d",--gdwarf-2 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.d" "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/cybtldr_api.o: cybtldr_api.c  .generated_files/flags/default/fe65c736c3432baa260e0c31dec2c4fb411893b0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cybtldr_api.o.d 
	@${RM} ${OBJECTDIR}/cybtldr_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/cybtldr_api.o.d" -o ${OBJECTDIR}/cybtldr_api.o cybtldr_api.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cybtldr_command.o: cybtldr_command.c  .generated_files/flags/default/d687a2408847df934798558e48d01056525579b0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cybtldr_command.o.d 
	@${RM} ${OBJECTDIR}/cybtldr_command.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/cybtldr_command.o.d" -o ${OBJECTDIR}/cybtldr_command.o cybtldr_command.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cybtldr_parse.o: cybtldr_parse.c  .generated_files/flags/default/97ff4f310a1848c2997827a0a75e43cfa7c04189 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cybtldr_parse.o.d 
	@${RM} ${OBJECTDIR}/cybtldr_parse.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/cybtldr_parse.o.d" -o ${OBJECTDIR}/cybtldr_parse.o cybtldr_parse.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/communication_api.o: communication_api.c  .generated_files/flags/default/543259f67f7445585b94e0e99c83e2681e5e8338 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/communication_api.o.d 
	@${RM} ${OBJECTDIR}/communication_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/communication_api.o.d" -o ${OBJECTDIR}/communication_api.o communication_api.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/ff.o: FatFs/ff.c  .generated_files/flags/default/13d4a0435b8ffe40ac51700fb19dce95d4d1da58 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ff.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/ff.o.d" -o ${OBJECTDIR}/FatFs/ff.o FatFs/ff.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/ffsystem.o: FatFs/ffsystem.c  .generated_files/flags/default/243df9c57a5936d892f5e50a5936a41e5cb2b41c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/ffsystem.o.d" -o ${OBJECTDIR}/FatFs/ffsystem.o FatFs/ffsystem.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/ffunicode.o: FatFs/ffunicode.c  .generated_files/flags/default/736f0241b5f1413d898dae957356aaa22bd4506f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/ffunicode.o.d" -o ${OBJECTDIR}/FatFs/ffunicode.o FatFs/ffunicode.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/mmcpic32.o: FatFs/mmcpic32.c  .generated_files/flags/default/9c29454ebab34ab5f73ec33c97280a42ad6c0458 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o.d 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/mmcpic32.o.d" -o ${OBJECTDIR}/FatFs/mmcpic32.o FatFs/mmcpic32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/event_groups.o: FreeRTOS/Core/event_groups.c  .generated_files/flags/default/a6b32ba4a1777f4212f7e197b82bc3b3cea425d9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/event_groups.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/event_groups.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/event_groups.o FreeRTOS/Core/event_groups.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/list.o: FreeRTOS/Core/list.c  .generated_files/flags/default/abc538f2b3fc204947c1b8c31e24f959282cba0d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/list.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/list.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/list.o FreeRTOS/Core/list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/queue.o: FreeRTOS/Core/queue.c  .generated_files/flags/default/f32e4ae97b42d8810bb929e7f2e0c1e289c5ddf4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/queue.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/queue.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/queue.o FreeRTOS/Core/queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o: FreeRTOS/Core/stream_buffer.c  .generated_files/flags/default/3c4081c6fe7c878c93d42d2ce97f3306ea387f2d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o FreeRTOS/Core/stream_buffer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/tasks.o: FreeRTOS/Core/tasks.c  .generated_files/flags/default/ebe8eceaf0d0ede8215ebfb911480e6d6ed2d5e2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/tasks.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/tasks.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/tasks.o FreeRTOS/Core/tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/timers.o: FreeRTOS/Core/timers.c  .generated_files/flags/default/122ef0d8d92b7976fe5030d1b1885d5684cc9a66 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/timers.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/timers.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/timers.o FreeRTOS/Core/timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o: FreeRTOS/Core/portable/MemMang/heap_4.c  .generated_files/flags/default/aeb18c82009d4ded9f784f6aa484017a4a823345 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core/portable/MemMang" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o FreeRTOS/Core/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o: FreeRTOS/Core/portable/MPLAB/PIC32MX/port.c  .generated_files/flags/default/797e6567de9e69704710ae64928a69f2c3b7f509 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o FreeRTOS/Core/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o: FreeRTOS/TCPIP/FreeRTOS_ARP.c  .generated_files/flags/default/6dc4aa43761ee7503a5e7b0fce0582b6335cf28b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o FreeRTOS/TCPIP/FreeRTOS_ARP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o: FreeRTOS/TCPIP/FreeRTOS_DHCP.c  .generated_files/flags/default/2632bb98abace425ff13b4f952ca4c9b8cd2f04 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o FreeRTOS/TCPIP/FreeRTOS_DHCP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o: FreeRTOS/TCPIP/FreeRTOS_DNS.c  .generated_files/flags/default/9b799151cc71ab801d76db6f79146cde92dc6c84 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o FreeRTOS/TCPIP/FreeRTOS_DNS.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o: FreeRTOS/TCPIP/FreeRTOS_IP.c  .generated_files/flags/default/e9cd19f1c799a8827ed4f57f0a353743410dbefa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o FreeRTOS/TCPIP/FreeRTOS_IP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o: FreeRTOS/TCPIP/FreeRTOS_Sockets.c  .generated_files/flags/default/9061f88fadf25bcf7aa10b4f90101544cba6f323 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o FreeRTOS/TCPIP/FreeRTOS_Sockets.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o: FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.c  .generated_files/flags/default/2e835ab83ece7c61b415d1b7f24e38be633564d0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o: FreeRTOS/TCPIP/FreeRTOS_TCP_IP.c  .generated_files/flags/default/260afa4315d2389ddcff702951d11adbce91b2ad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o FreeRTOS/TCPIP/FreeRTOS_TCP_IP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o: FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.c  .generated_files/flags/default/8cc1b09c943e9a14dafe2fb660f00fdcfb68822d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o: FreeRTOS/TCPIP/FreeRTOS_UDP_IP.c  .generated_files/flags/default/cfcfa11f7ab156c27f764ae262512272718238ca .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o FreeRTOS/TCPIP/FreeRTOS_UDP_IP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o: FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.c  .generated_files/flags/default/2552940bbc24b5c465afc91debf96d4ebc972111 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/service.o: service.c  .generated_files/flags/default/1418a85cee7313dacff1b47288de2d582f7c9d1f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/service.o.d 
	@${RM} ${OBJECTDIR}/service.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/service.o.d" -o ${OBJECTDIR}/service.o service.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FTP.o: FTP.c  .generated_files/flags/default/850a7217b2bc6a6e21970d01acfa4b6f6821c7ad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FTP.o.d 
	@${RM} ${OBJECTDIR}/FTP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FTP.o.d" -o ${OBJECTDIR}/FTP.o FTP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/THex/THex.o: THex/THex.c  .generated_files/flags/default/d1ef30750a950400cd8c4fb44f30c99b9ff7919b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/THex" 
	@${RM} ${OBJECTDIR}/THex/THex.o.d 
	@${RM} ${OBJECTDIR}/THex/THex.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/THex/THex.o.d" -o ${OBJECTDIR}/THex/THex.o THex/THex.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/apps/top.o: apps/top.c  .generated_files/flags/default/1edeb5622d0b750a87893e8486612ad0fdf7914b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/top.o.d 
	@${RM} ${OBJECTDIR}/apps/top.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/apps/top.o.d" -o ${OBJECTDIR}/apps/top.o apps/top.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/apps/iotop.o: apps/iotop.c  .generated_files/flags/default/e5cd90ec8e021293bcb271a7201ca057fdc7bbbe .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/iotop.o.d 
	@${RM} ${OBJECTDIR}/apps/iotop.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/apps/iotop.o.d" -o ${OBJECTDIR}/apps/iotop.o apps/iotop.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/apps/apps.o: apps/apps.c  .generated_files/flags/default/ff69e4b3f502c4537a3bb1252828a209e77ff19 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/apps.o.d 
	@${RM} ${OBJECTDIR}/apps/apps.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/apps/apps.o.d" -o ${OBJECTDIR}/apps/apps.o apps/apps.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/apps/tte.o: apps/tte.c  .generated_files/flags/default/e45830c58bdf00d3a1ce9c573328e3a9331d92bc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/tte.o.d 
	@${RM} ${OBJECTDIR}/apps/tte.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/apps/tte.o.d" -o ${OBJECTDIR}/apps/tte.o apps/tte.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ConfigPerformance.o: ConfigPerformance.c  .generated_files/flags/default/5a1643972dc35205c45a40b91e1d55568dd9343a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ConfigPerformance.o.d 
	@${RM} ${OBJECTDIR}/ConfigPerformance.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/ConfigPerformance.o.d" -o ${OBJECTDIR}/ConfigPerformance.o ConfigPerformance.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/LAN9250.o: LAN9250.c  .generated_files/flags/default/f7a03f0bdc0ab014ddf43a12257721898c9e2997 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LAN9250.o.d 
	@${RM} ${OBJECTDIR}/LAN9250.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/LAN9250.o.d" -o ${OBJECTDIR}/LAN9250.o LAN9250.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/NetworkInterface_LAN9250.o: NetworkInterface_LAN9250.c  .generated_files/flags/default/f7a0e39637e916aee41c7b5148b170155d45a750 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/NetworkInterface_LAN9250.o.d 
	@${RM} ${OBJECTDIR}/NetworkInterface_LAN9250.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/NetworkInterface_LAN9250.o.d" -o ${OBJECTDIR}/NetworkInterface_LAN9250.o NetworkInterface_LAN9250.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SPI.o: SPI.c  .generated_files/flags/default/82471c558c82b425f62ba6fac17a5b4269ab05fc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SPI.o.d 
	@${RM} ${OBJECTDIR}/SPI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/SPI.o.d" -o ${OBJECTDIR}/SPI.o SPI.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/UART.o: UART.c  .generated_files/flags/default/4deb687c6672af32e6ea8984ec9e3e8e275f0ad5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UART.o.d 
	@${RM} ${OBJECTDIR}/UART.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/UART.o.d" -o ${OBJECTDIR}/UART.o UART.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/3bef7d658ccea78546ecae50f9ef80c68c7babc3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/LED.o: LED.c  .generated_files/flags/default/5ab0a06b3aef32f1efe145c27e2708fc53d9188f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LED.o.d 
	@${RM} ${OBJECTDIR}/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/LED.o.d" -o ${OBJECTDIR}/LED.o LED.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FiberComms.o: FiberComms.c  .generated_files/flags/default/28ce0c35e5214e2468066489a61aa0d2f4b7bbf4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FiberComms.o.d 
	@${RM} ${OBJECTDIR}/FiberComms.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FiberComms.o.d" -o ${OBJECTDIR}/FiberComms.o FiberComms.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/min.o: min.c  .generated_files/flags/default/203de71f8f0b12bb82caf6293e4529e7bf6b78ec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/min.o.d 
	@${RM} ${OBJECTDIR}/min.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/min.o.d" -o ${OBJECTDIR}/min.o min.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/System.o: System.c  .generated_files/flags/default/494dc087ecdc8e83ec5f214c5e3b7e1757e7b9f8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/System.o.d 
	@${RM} ${OBJECTDIR}/System.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/System.o.d" -o ${OBJECTDIR}/System.o System.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/UD3_Wrapper.o: UD3_Wrapper.c  .generated_files/flags/default/48e3673204e18d87050fa6e081d465a2ee2010a4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UD3_Wrapper.o.d 
	@${RM} ${OBJECTDIR}/UD3_Wrapper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/UD3_Wrapper.o.d" -o ${OBJECTDIR}/UD3_Wrapper.o UD3_Wrapper.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TTerm.o: TTerm.c  .generated_files/flags/default/1808e14da0517e70380e3b9ca0efc79bcf1bdf1d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm.o.d 
	@${RM} ${OBJECTDIR}/TTerm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/TTerm.o.d" -o ${OBJECTDIR}/TTerm.o TTerm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TTerm_cmd.o: TTerm_cmd.c  .generated_files/flags/default/a91f66a917751c94e1916128cb67f01222be8a52 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm_cmd.o.d 
	@${RM} ${OBJECTDIR}/TTerm_cmd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/TTerm_cmd.o.d" -o ${OBJECTDIR}/TTerm_cmd.o TTerm_cmd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/startup.o: startup.c  .generated_files/flags/default/b8fc03eb77c78559ab3f5966db8247e94488c899 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/startup.o.d 
	@${RM} ${OBJECTDIR}/startup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/startup.o.d" -o ${OBJECTDIR}/startup.o startup.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FS.o: FS.c  .generated_files/flags/default/6f9c96fc8f1db7963c8616069791d7d5700587ea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FS.o.d 
	@${RM} ${OBJECTDIR}/FS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FS.o.d" -o ${OBJECTDIR}/FS.o FS.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TTerm_AC.o: TTerm_AC.c  .generated_files/flags/default/1924eba677466263dd2e12f7eb2226812ca47254 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm_AC.o.d 
	@${RM} ${OBJECTDIR}/TTerm_AC.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/TTerm_AC.o.d" -o ${OBJECTDIR}/TTerm_AC.o TTerm_AC.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TTerm_cwd.o: TTerm_cwd.c  .generated_files/flags/default/562b0270427c7e2f05fd5c4a8d8d1955123ed36b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm_cwd.o.d 
	@${RM} ${OBJECTDIR}/TTerm_cwd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/TTerm_cwd.o.d" -o ${OBJECTDIR}/TTerm_cwd.o TTerm_cwd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ini.o: ini.c  .generated_files/flags/default/bbe0988786e252b043778d3b91375e115111513a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ini.o.d 
	@${RM} ${OBJECTDIR}/ini.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/ini.o.d" -o ${OBJECTDIR}/ini.o ini.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/cybtldr_api.o: cybtldr_api.c  .generated_files/flags/default/de63f433de0a14ba00846f76eace2664b4bc42fc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cybtldr_api.o.d 
	@${RM} ${OBJECTDIR}/cybtldr_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/cybtldr_api.o.d" -o ${OBJECTDIR}/cybtldr_api.o cybtldr_api.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cybtldr_command.o: cybtldr_command.c  .generated_files/flags/default/89fe973263ee13644c50e4780051e3dd2ad7ec79 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cybtldr_command.o.d 
	@${RM} ${OBJECTDIR}/cybtldr_command.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/cybtldr_command.o.d" -o ${OBJECTDIR}/cybtldr_command.o cybtldr_command.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/cybtldr_parse.o: cybtldr_parse.c  .generated_files/flags/default/52670de974f123f490052d3d42ebb6c1a7d6846b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cybtldr_parse.o.d 
	@${RM} ${OBJECTDIR}/cybtldr_parse.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/cybtldr_parse.o.d" -o ${OBJECTDIR}/cybtldr_parse.o cybtldr_parse.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/communication_api.o: communication_api.c  .generated_files/flags/default/1b6abec428927c41035292ed4ee196832c899f6f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/communication_api.o.d 
	@${RM} ${OBJECTDIR}/communication_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/communication_api.o.d" -o ${OBJECTDIR}/communication_api.o communication_api.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/ff.o: FatFs/ff.c  .generated_files/flags/default/263997342f67162216cc90bcb0dbd6eb40184cd6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ff.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/ff.o.d" -o ${OBJECTDIR}/FatFs/ff.o FatFs/ff.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/ffsystem.o: FatFs/ffsystem.c  .generated_files/flags/default/f375ab183bdd3c1552618cb514ff24fb1a69871c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/ffsystem.o.d" -o ${OBJECTDIR}/FatFs/ffsystem.o FatFs/ffsystem.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/ffunicode.o: FatFs/ffunicode.c  .generated_files/flags/default/2365cb04b452c2887009ed053aa8119d071a9992 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/ffunicode.o.d" -o ${OBJECTDIR}/FatFs/ffunicode.o FatFs/ffunicode.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/mmcpic32.o: FatFs/mmcpic32.c  .generated_files/flags/default/ea9e8e54ce2dac2713ddfc3b7df118b944f50193 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o.d 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/mmcpic32.o.d" -o ${OBJECTDIR}/FatFs/mmcpic32.o FatFs/mmcpic32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/event_groups.o: FreeRTOS/Core/event_groups.c  .generated_files/flags/default/8495e464ff03cece56659cb58dcb9c7c47fce708 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/event_groups.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/event_groups.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/event_groups.o FreeRTOS/Core/event_groups.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/list.o: FreeRTOS/Core/list.c  .generated_files/flags/default/e5f9bea7247fb711cac4d6a35662910e2812e1cf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/list.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/list.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/list.o FreeRTOS/Core/list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/queue.o: FreeRTOS/Core/queue.c  .generated_files/flags/default/8af8de2d9b1c7f292607b57b86240176ef78ef42 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/queue.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/queue.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/queue.o FreeRTOS/Core/queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o: FreeRTOS/Core/stream_buffer.c  .generated_files/flags/default/c7fd23c70f9374c8956db438cb636b6b35b51309 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/stream_buffer.o FreeRTOS/Core/stream_buffer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/tasks.o: FreeRTOS/Core/tasks.c  .generated_files/flags/default/1a23915c8609de65d3c6712269b341a390a467f0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/tasks.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/tasks.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/tasks.o FreeRTOS/Core/tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/timers.o: FreeRTOS/Core/timers.c  .generated_files/flags/default/140e0bffa5cbc19777048e0e97a292f263a0fd43 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/timers.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/timers.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/timers.o FreeRTOS/Core/timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o: FreeRTOS/Core/portable/MemMang/heap_4.c  .generated_files/flags/default/1a81c17f28b13fa294e7b23954c678459c0282ec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core/portable/MemMang" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/portable/MemMang/heap_4.o FreeRTOS/Core/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o: FreeRTOS/Core/portable/MPLAB/PIC32MX/port.c  .generated_files/flags/default/ecb2a7feb8d55fda5a6efcb729b172d8a4a5df62 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX" 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o.d" -o ${OBJECTDIR}/FreeRTOS/Core/portable/MPLAB/PIC32MX/port.o FreeRTOS/Core/portable/MPLAB/PIC32MX/port.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o: FreeRTOS/TCPIP/FreeRTOS_ARP.c  .generated_files/flags/default/64001433375bb246f7da377820c91e614a2ca9b4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_ARP.o FreeRTOS/TCPIP/FreeRTOS_ARP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o: FreeRTOS/TCPIP/FreeRTOS_DHCP.c  .generated_files/flags/default/6964ca9e6f7917a31ef8b979292e455f876b3c2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DHCP.o FreeRTOS/TCPIP/FreeRTOS_DHCP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o: FreeRTOS/TCPIP/FreeRTOS_DNS.c  .generated_files/flags/default/108e7f3b86e4ab2e315d1f35fdd7b4feb2f6feb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_DNS.o FreeRTOS/TCPIP/FreeRTOS_DNS.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o: FreeRTOS/TCPIP/FreeRTOS_IP.c  .generated_files/flags/default/286ceca842dc55b2787182096c3427e1ea54fb98 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_IP.o FreeRTOS/TCPIP/FreeRTOS_IP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o: FreeRTOS/TCPIP/FreeRTOS_Sockets.c  .generated_files/flags/default/b69d57660a2cc3d7bf0872c6b4c69e756991ba80 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Sockets.o FreeRTOS/TCPIP/FreeRTOS_Sockets.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o: FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.c  .generated_files/flags/default/202f7ab45c9687cb60d3f1ad855a477ac93c9d20 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.o FreeRTOS/TCPIP/FreeRTOS_Stream_Buffer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o: FreeRTOS/TCPIP/FreeRTOS_TCP_IP.c  .generated_files/flags/default/ab1de7a878aff1852e76f010617d7f23942fe6b9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_IP.o FreeRTOS/TCPIP/FreeRTOS_TCP_IP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o: FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.c  .generated_files/flags/default/ba0baf885e1c357768331e365093c1cc506d6ae9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.o FreeRTOS/TCPIP/FreeRTOS_TCP_WIN.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o: FreeRTOS/TCPIP/FreeRTOS_UDP_IP.c  .generated_files/flags/default/49ff81f1a147d14e3256bba8a623fc48a55daecf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/FreeRTOS_UDP_IP.o FreeRTOS/TCPIP/FreeRTOS_UDP_IP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o: FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.c  .generated_files/flags/default/3ec473d6f58c8505deb32b40bf9b6b9de2a956e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement" 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o.d 
	@${RM} ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o.d" -o ${OBJECTDIR}/FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.o FreeRTOS/TCPIP/portable/BufferManagement/BufferAllocation_2.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/service.o: service.c  .generated_files/flags/default/53246b8a28978eb0dc75a3d91bfee27e626948a5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/service.o.d 
	@${RM} ${OBJECTDIR}/service.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/service.o.d" -o ${OBJECTDIR}/service.o service.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FTP.o: FTP.c  .generated_files/flags/default/daf76299a36bd9465f2118d4ce050121770f4076 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FTP.o.d 
	@${RM} ${OBJECTDIR}/FTP.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FTP.o.d" -o ${OBJECTDIR}/FTP.o FTP.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/THex/THex.o: THex/THex.c  .generated_files/flags/default/5aed58406efc7c924a8471adff6e5b0b75842885 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/THex" 
	@${RM} ${OBJECTDIR}/THex/THex.o.d 
	@${RM} ${OBJECTDIR}/THex/THex.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/THex/THex.o.d" -o ${OBJECTDIR}/THex/THex.o THex/THex.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/apps/top.o: apps/top.c  .generated_files/flags/default/87670894a08678a0faf10bf2d3899b7cf7a05428 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/top.o.d 
	@${RM} ${OBJECTDIR}/apps/top.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/apps/top.o.d" -o ${OBJECTDIR}/apps/top.o apps/top.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/apps/iotop.o: apps/iotop.c  .generated_files/flags/default/cd7ab70d8a8008cab461d53d16a10099e0d3afe8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/iotop.o.d 
	@${RM} ${OBJECTDIR}/apps/iotop.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/apps/iotop.o.d" -o ${OBJECTDIR}/apps/iotop.o apps/iotop.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/apps/apps.o: apps/apps.c  .generated_files/flags/default/a16aa1cb9ae86d4ad628d6f5d9364c918b3f1f69 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/apps.o.d 
	@${RM} ${OBJECTDIR}/apps/apps.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/apps/apps.o.d" -o ${OBJECTDIR}/apps/apps.o apps/apps.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/apps/tte.o: apps/tte.c  .generated_files/flags/default/1cb9bab615d222c2b439a89aa54061e7df4d008b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/apps" 
	@${RM} ${OBJECTDIR}/apps/tte.o.d 
	@${RM} ${OBJECTDIR}/apps/tte.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/apps/tte.o.d" -o ${OBJECTDIR}/apps/tte.o apps/tte.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ConfigPerformance.o: ConfigPerformance.c  .generated_files/flags/default/a0e42d5ea8395daf7902c18de60a3cc4d42e8677 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ConfigPerformance.o.d 
	@${RM} ${OBJECTDIR}/ConfigPerformance.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/ConfigPerformance.o.d" -o ${OBJECTDIR}/ConfigPerformance.o ConfigPerformance.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/LAN9250.o: LAN9250.c  .generated_files/flags/default/b3114e66147f849754470b2174ff4f88a1524b9f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LAN9250.o.d 
	@${RM} ${OBJECTDIR}/LAN9250.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/LAN9250.o.d" -o ${OBJECTDIR}/LAN9250.o LAN9250.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/NetworkInterface_LAN9250.o: NetworkInterface_LAN9250.c  .generated_files/flags/default/2c9a64938edde3ab6982b27cdc1e854cfb14fac0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/NetworkInterface_LAN9250.o.d 
	@${RM} ${OBJECTDIR}/NetworkInterface_LAN9250.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/NetworkInterface_LAN9250.o.d" -o ${OBJECTDIR}/NetworkInterface_LAN9250.o NetworkInterface_LAN9250.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/SPI.o: SPI.c  .generated_files/flags/default/a2be66cea4b1d3a49adef3f653f0d6002d0e7b86 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SPI.o.d 
	@${RM} ${OBJECTDIR}/SPI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/SPI.o.d" -o ${OBJECTDIR}/SPI.o SPI.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/UART.o: UART.c  .generated_files/flags/default/5dc5bb7a05d8372c655850cb2794eecbff7f1443 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UART.o.d 
	@${RM} ${OBJECTDIR}/UART.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/UART.o.d" -o ${OBJECTDIR}/UART.o UART.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/ca5bdc25ec9086ecb33a817fbc3435378eda09b4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/LED.o: LED.c  .generated_files/flags/default/24e7b3eb881a0af5bc6b2479341b6018bf2691bb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LED.o.d 
	@${RM} ${OBJECTDIR}/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/LED.o.d" -o ${OBJECTDIR}/LED.o LED.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FiberComms.o: FiberComms.c  .generated_files/flags/default/829c534a0309f840274b5d425f122502e551bac6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FiberComms.o.d 
	@${RM} ${OBJECTDIR}/FiberComms.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FiberComms.o.d" -o ${OBJECTDIR}/FiberComms.o FiberComms.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/min.o: min.c  .generated_files/flags/default/755269588cfa0c28ba62c82cf6badc310a57287c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/min.o.d 
	@${RM} ${OBJECTDIR}/min.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/min.o.d" -o ${OBJECTDIR}/min.o min.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/System.o: System.c  .generated_files/flags/default/6ea07b6176f4bc8faabe096294a1d34407f058f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/System.o.d 
	@${RM} ${OBJECTDIR}/System.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/System.o.d" -o ${OBJECTDIR}/System.o System.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/UD3_Wrapper.o: UD3_Wrapper.c  .generated_files/flags/default/2daf0fbbf547b47b57763c8f73abbca1d8e33260 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UD3_Wrapper.o.d 
	@${RM} ${OBJECTDIR}/UD3_Wrapper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/UD3_Wrapper.o.d" -o ${OBJECTDIR}/UD3_Wrapper.o UD3_Wrapper.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TTerm.o: TTerm.c  .generated_files/flags/default/2a8aad966846d61784c76e21b0b5a70e9d9e1b64 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm.o.d 
	@${RM} ${OBJECTDIR}/TTerm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/TTerm.o.d" -o ${OBJECTDIR}/TTerm.o TTerm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TTerm_cmd.o: TTerm_cmd.c  .generated_files/flags/default/1e1eeeacce428af6bf107d9593736acb47b9151e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm_cmd.o.d 
	@${RM} ${OBJECTDIR}/TTerm_cmd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/TTerm_cmd.o.d" -o ${OBJECTDIR}/TTerm_cmd.o TTerm_cmd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/startup.o: startup.c  .generated_files/flags/default/dab3a6d640e2ff2d546fcc3506be91e866aae1c1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/startup.o.d 
	@${RM} ${OBJECTDIR}/startup.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/startup.o.d" -o ${OBJECTDIR}/startup.o startup.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FS.o: FS.c  .generated_files/flags/default/30045b29a104d3b8c1155391552a9564292a0f39 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FS.o.d 
	@${RM} ${OBJECTDIR}/FS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FS.o.d" -o ${OBJECTDIR}/FS.o FS.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TTerm_AC.o: TTerm_AC.c  .generated_files/flags/default/23dedfb2850acff68e0e4bf81395dadee0de14e5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm_AC.o.d 
	@${RM} ${OBJECTDIR}/TTerm_AC.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/TTerm_AC.o.d" -o ${OBJECTDIR}/TTerm_AC.o TTerm_AC.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/TTerm_cwd.o: TTerm_cwd.c  .generated_files/flags/default/1ca7c3535b870022d29ccca26597589cc20daad5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TTerm_cwd.o.d 
	@${RM} ${OBJECTDIR}/TTerm_cwd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/TTerm_cwd.o.d" -o ${OBJECTDIR}/TTerm_cwd.o TTerm_cwd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/ini.o: ini.c  .generated_files/flags/default/1322896538e733b8d53a688df23e712c97a0ce65 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ini.o.d 
	@${RM} ${OBJECTDIR}/ini.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/ini.o.d" -o ${OBJECTDIR}/ini.o ini.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=gnu11 -I ./include -I ./FreeRTOS/Core/include -I ./FreeRTOS/ -I ./FreeRTOS/TCPIP/include -I ./FatFs -I ./FatFs/include -I ./THex/Include -I ./FreeRTOS/Core/portable/MPLAB/PIC32MX -I ./FreeRTOS/TCPIP/portable/Compiler/GCC -mdfp="${DFP_DIR}"  
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/UD3_Fibernet.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  -std=gnu11 $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--no-check-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--cref,--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/UD3_Fibernet.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   p32MX270F256B.ld PIC32_SD_BL.X/dist/default/production/PIC32_SD_BL.X.production.hex
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/UD3_Fibernet.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  -std=gnu11 $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-check-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--cref,--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
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
