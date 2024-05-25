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
FINAL_IMAGE=${DISTDIR}/PIC32_SD_BL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/PIC32_SD_BL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/PIC32_SD_BL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/SPI.o: SPI.c  .generated_files/flags/default/c768940b6df987794e1bfadb70865b5d54d5cc75 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SPI.o.d 
	@${RM} ${OBJECTDIR}/SPI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/SPI.o.d" -o ${OBJECTDIR}/SPI.o SPI.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/mmcpic32.o: FatFs/mmcpic32.c  .generated_files/flags/default/305bd53ba961a27a922f4f34716301b960443899 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o.d 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/mmcpic32.o.d" -o ${OBJECTDIR}/FatFs/mmcpic32.o FatFs/mmcpic32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/newmain.o: newmain.c  .generated_files/flags/default/7400ffa32cbf16b6902e156ae3aa94373afc1a60 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/newmain.o.d 
	@${RM} ${OBJECTDIR}/newmain.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/newmain.o.d" -o ${OBJECTDIR}/newmain.o newmain.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/ff.o: FatFs/ff.c  .generated_files/flags/default/ae99d0774cb38f0e337b6b59c8244d7db11e6abd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ff.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/ff.o.d" -o ${OBJECTDIR}/FatFs/ff.o FatFs/ff.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/ffsystem.o: FatFs/ffsystem.c  .generated_files/flags/default/b1bdb9f64c75bb6ae67b21e5af5db93d01476908 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/ffsystem.o.d" -o ${OBJECTDIR}/FatFs/ffsystem.o FatFs/ffsystem.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/ffunicode.o: FatFs/ffunicode.c  .generated_files/flags/default/56542bb7a1831991bbf8bc083db50865d8b07d2a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/ffunicode.o.d" -o ${OBJECTDIR}/FatFs/ffunicode.o FatFs/ffunicode.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/THex/THex.o: THex/THex.c  .generated_files/flags/default/88748c4433dbcad483d815ae2b6c7d9cd6abc99c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/THex" 
	@${RM} ${OBJECTDIR}/THex/THex.o.d 
	@${RM} ${OBJECTDIR}/THex/THex.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/THex/THex.o.d" -o ${OBJECTDIR}/THex/THex.o THex/THex.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/NVM.o: NVM.c  .generated_files/flags/default/680499244862b9da20744cde64856c268bfeb6e7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/NVM.o.d 
	@${RM} ${OBJECTDIR}/NVM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/NVM.o.d" -o ${OBJECTDIR}/NVM.o NVM.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/SPI.o: SPI.c  .generated_files/flags/default/f8838c2c24e2af810911660e695186a2ec0b771c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SPI.o.d 
	@${RM} ${OBJECTDIR}/SPI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/SPI.o.d" -o ${OBJECTDIR}/SPI.o SPI.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/mmcpic32.o: FatFs/mmcpic32.c  .generated_files/flags/default/5e78a979d287bc3024be7bf0b39eb85d1d23c1c3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o.d 
	@${RM} ${OBJECTDIR}/FatFs/mmcpic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/mmcpic32.o.d" -o ${OBJECTDIR}/FatFs/mmcpic32.o FatFs/mmcpic32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/newmain.o: newmain.c  .generated_files/flags/default/c2291d678294f0b4e89caff24295c6a9445437c2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/newmain.o.d 
	@${RM} ${OBJECTDIR}/newmain.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/newmain.o.d" -o ${OBJECTDIR}/newmain.o newmain.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/ff.o: FatFs/ff.c  .generated_files/flags/default/ac5e6a7af952af18ea6b495366ef0f5ee10bd54a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ff.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/ff.o.d" -o ${OBJECTDIR}/FatFs/ff.o FatFs/ff.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/ffsystem.o: FatFs/ffsystem.c  .generated_files/flags/default/668ebbfd7214a28f5e9119be0881c48da0fddb9c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffsystem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/ffsystem.o.d" -o ${OBJECTDIR}/FatFs/ffsystem.o FatFs/ffsystem.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/FatFs/ffunicode.o: FatFs/ffunicode.c  .generated_files/flags/default/1f1b6d78f7ae30e43d672059691ef2fba22c000e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/FatFs" 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/FatFs/ffunicode.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/FatFs/ffunicode.o.d" -o ${OBJECTDIR}/FatFs/ffunicode.o FatFs/ffunicode.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/THex/THex.o: THex/THex.c  .generated_files/flags/default/a1709be148e2a3843e36332c8e52cfebc3ad2ed3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/THex" 
	@${RM} ${OBJECTDIR}/THex/THex.o.d 
	@${RM} ${OBJECTDIR}/THex/THex.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/THex/THex.o.d" -o ${OBJECTDIR}/THex/THex.o THex/THex.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/NVM.o: NVM.c  .generated_files/flags/default/1c0f61a8682450ef061e6ed5dd3ba9e969dd1b25 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/NVM.o.d 
	@${RM} ${OBJECTDIR}/NVM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -Os -MP -MMD -MF "${OBJECTDIR}/NVM.o.d" -o ${OBJECTDIR}/NVM.o NVM.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I ./FatFs -I ./THex   -I ./FatFs/include -I ./THex/Include -I . -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/PIC32_SD_BL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    BL_Linker.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/PIC32_SD_BL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/PIC32_SD_BL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   BL_Linker.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/PIC32_SD_BL.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/PIC32_SD_BL.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

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
