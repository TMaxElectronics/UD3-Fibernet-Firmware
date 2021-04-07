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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_SD_BL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_SD_BL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=SPI.c FatFs/mmcpic32.c newmain.c FatFs/ff.c FatFs/ffsystem.c FatFs/ffunicode.c THex/THex.c NVM.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/SPI.o ${OBJECTDIR}/FatFs/mmcpic32.o ${OBJECTDIR}/newmain.o ${OBJECTDIR}/FatFs/ff.o ${OBJECTDIR}/FatFs/ffsystem.o ${OBJECTDIR}/FatFs/ffunicode.o ${OBJECTDIR}/THex/THex.o ${OBJECTDIR}/NVM.o
POSSIBLE_DEPFILES=${OBJECTDIR}/SPI.o.d ${OBJECTDIR}/FatFs/mmcpic32.o.d ${OBJECTDIR}/newmain.o.d ${OBJECTDIR}/FatFs/ff.o.d ${OBJECTDIR}/FatFs/ffsystem.o.d ${OBJECTDIR}/FatFs/ffunicode.o.d ${OBJECTDIR}/THex/THex.o.d ${OBJECTDIR}/NVM.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/SPI.o ${OBJECTDIR}/FatFs/mmcpic32.o ${OBJECTDIR}/newmain.o ${OBJECTDIR}/FatFs/ff.o ${OBJECTDIR}/FatFs/ffsystem.o ${OBJECTDIR}/FatFs/ffunicode.o ${OBJECTDIR}/THex/THex.o ${OBJECTDIR}/NVM.o

# Source Files
SOURCEFILES=SPI.c FatFs/mmcpic32.c newmain.c FatFs/ff.c FatFs/ffsystem.c FatFs/ffunicode.c THex/THex.c NVM.c



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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_SD_BL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX270F256B
MP_LINKER_FILE_OPTION=,--script="BL_Linker.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/SPI.o: SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SPI.o.d 
	@${RM} ${OBJECTDIR}/SPI.o 
	@${FIXDEPS} "${OBJECTDIR}/SPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/SPI.o.d" -o ${OBJECTDIR}/SPI.o SPI.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp=${DFP_DIR}
	
${OBJECTDIR}/FatFs/mmcpic32.o: FatFs/mmcpic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o.d 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o 
	@${FIXDEPS} "${OBJECTDIR}/FatFs/mmcpic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FatFs/mmcpic32.o.d" -o ${OBJECTDIR}/FatFs/mmcpic32.o FatFs/mmcpic32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp=${DFP_DIR}
	
${OBJECTDIR}/newmain.o: newmain.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/newmain.o.d 
	@${RM} ${OBJECTDIR}/newmain.o 
	@${FIXDEPS} "${OBJECTDIR}/newmain.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/newmain.o.d" -o ${OBJECTDIR}/newmain.o newmain.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp=${DFP_DIR}
	
${OBJECTDIR}/FatFs/ff.o: FatFs/ff.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ff.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ff.o 
	@${FIXDEPS} "${OBJECTDIR}/FatFs/ff.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FatFs/ff.o.d" -o ${OBJECTDIR}/FatFs/ff.o FatFs/ff.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp=${DFP_DIR}
	
${OBJECTDIR}/FatFs/ffsystem.o: FatFs/ffsystem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o 
	@${FIXDEPS} "${OBJECTDIR}/FatFs/ffsystem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FatFs/ffsystem.o.d" -o ${OBJECTDIR}/FatFs/ffsystem.o FatFs/ffsystem.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp=${DFP_DIR}
	
${OBJECTDIR}/FatFs/ffunicode.o: FatFs/ffunicode.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o 
	@${FIXDEPS} "${OBJECTDIR}/FatFs/ffunicode.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FatFs/ffunicode.o.d" -o ${OBJECTDIR}/FatFs/ffunicode.o FatFs/ffunicode.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp=${DFP_DIR}
	
${OBJECTDIR}/THex/THex.o: THex/THex.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/THex" 
	@${RM} ${OBJECTDIR}/THex/THex.o.d 
	@${RM} ${OBJECTDIR}/THex/THex.o 
	@${FIXDEPS} "${OBJECTDIR}/THex/THex.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/THex/THex.o.d" -o ${OBJECTDIR}/THex/THex.o THex/THex.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp=${DFP_DIR}
	
${OBJECTDIR}/NVM.o: NVM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/NVM.o.d 
	@${RM} ${OBJECTDIR}/NVM.o 
	@${FIXDEPS} "${OBJECTDIR}/NVM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/NVM.o.d" -o ${OBJECTDIR}/NVM.o NVM.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp=${DFP_DIR}
	
else
${OBJECTDIR}/SPI.o: SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SPI.o.d 
	@${RM} ${OBJECTDIR}/SPI.o 
	@${FIXDEPS} "${OBJECTDIR}/SPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/SPI.o.d" -o ${OBJECTDIR}/SPI.o SPI.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp=${DFP_DIR}
	
${OBJECTDIR}/FatFs/mmcpic32.o: FatFs/mmcpic32.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o.d 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o 
	@${FIXDEPS} "${OBJECTDIR}/FatFs/mmcpic32.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FatFs/mmcpic32.o.d" -o ${OBJECTDIR}/FatFs/mmcpic32.o FatFs/mmcpic32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp=${DFP_DIR}
	
${OBJECTDIR}/newmain.o: newmain.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/newmain.o.d 
	@${RM} ${OBJECTDIR}/newmain.o 
	@${FIXDEPS} "${OBJECTDIR}/newmain.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/newmain.o.d" -o ${OBJECTDIR}/newmain.o newmain.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp=${DFP_DIR}
	
${OBJECTDIR}/FatFs/ff.o: FatFs/ff.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ff.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ff.o 
	@${FIXDEPS} "${OBJECTDIR}/FatFs/ff.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FatFs/ff.o.d" -o ${OBJECTDIR}/FatFs/ff.o FatFs/ff.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp=${DFP_DIR}
	
${OBJECTDIR}/FatFs/ffsystem.o: FatFs/ffsystem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o 
	@${FIXDEPS} "${OBJECTDIR}/FatFs/ffsystem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FatFs/ffsystem.o.d" -o ${OBJECTDIR}/FatFs/ffsystem.o FatFs/ffsystem.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp=${DFP_DIR}
	
${OBJECTDIR}/FatFs/ffunicode.o: FatFs/ffunicode.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o 
	@${FIXDEPS} "${OBJECTDIR}/FatFs/ffunicode.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/FatFs/ffunicode.o.d" -o ${OBJECTDIR}/FatFs/ffunicode.o FatFs/ffunicode.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp=${DFP_DIR}
	
${OBJECTDIR}/THex/THex.o: THex/THex.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/THex" 
	@${RM} ${OBJECTDIR}/THex/THex.o.d 
	@${RM} ${OBJECTDIR}/THex/THex.o 
	@${FIXDEPS} "${OBJECTDIR}/THex/THex.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/THex/THex.o.d" -o ${OBJECTDIR}/THex/THex.o THex/THex.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp=${DFP_DIR}
	
${OBJECTDIR}/NVM.o: NVM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/NVM.o.d 
	@${RM} ${OBJECTDIR}/NVM.o 
	@${FIXDEPS} "${OBJECTDIR}/NVM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MMD -MF "${OBJECTDIR}/NVM.o.d" -o ${OBJECTDIR}/NVM.o NVM.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp=${DFP_DIR}
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_SD_BL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    BL_Linker.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_SD_BL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp=${DFP_DIR}
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_SD_BL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   BL_Linker.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_SD_BL.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp=${DFP_DIR}
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/PIC32_SD_BL.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

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
