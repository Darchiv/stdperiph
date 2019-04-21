DST = dist/

AR = arm-none-eabi-ar
AS = arm-none-eabi-as
CC = arm-none-eabi-gcc

QUIET = @

TARGETS := stm32f10x stm32f0xx stm32l1xx

.PHONY: all clean $(TARGETS)
all: $(TARGETS)


ifeq ($(DEBUG), 1)
  CFLAGS := -Os -g
else
  CFLAGS := -O2 -s
endif

# Disable implicit rules.
.SUFFIXES:

# Creating directories.
%/:
	@echo -e "Creating directory \e[32m$@\e[39m"
	$(QUIET) mkdir -p $@

#
# STM32F10x
#

stm32f10x: $(DST)/libstm32f10x.a

# As defined in CMSIS/Device/ST/STM32F10x/Include/stm32f10x.h
STM32F10x_TYPE ?= STM32F10X_MD

ifneq ($(DEBUG), 1)
  EMPTY_ASSERT := -Dassert_param=''
endif

SRCS_STM32F10x += $(wildcard STM32F10x_StdPeriph_Driver/src/*.c)
SRCS_STM32F10x += $(wildcard CMSIS/Device/ST/STM32F10x/Source/Templates/*.c) 
ASMS_STM32F10x += CMSIS/Device/ST/STM32F10x/Source/Templates/gcc_ride7/startup_$(shell echo $(STM32F10x_TYPE) | tr A-Z a-z).s
INC_STM32F10x += CMSIS/Include
INC_STM32F10x += CMSIS/Device/ST/STM32F10x/Include
INC_STM32F10x += STM32F10x_StdPeriph_Driver/inc

CFLAGS_STM32F10x += -std=c99 -mthumb -mcpu=cortex-m3
OBJS_STM32F10x := $(patsubst %.c, %.o, $(SRCS_STM32F10x))
ASMOBJS_STM32F10x := $(patsubst %.s, %.o, $(ASMS_STM32F10x))

$(OBJS_STM32F10x): %.o: %.c
	@echo -e "Compiling \e[32m$<\e[39m"
	$(QUIET) $(CC) $(CFLAGS) $(CFLAGS_STM32F10x) $(patsubst %, -I %, $(INC_STM32F10x)) -D$(STM32F10x_TYPE) $(EMPTY_ASSERT) -c -o $@ $<

$(ASMOBJS_STM32F10x): %.o: %.s
	@echo -e "Assembling \e[32m$<\e[39m"
	$(QUIET) $(CC) $(CFLAGS) $(CFLAGS_STM32F10x) -c -o $@ $<

$(DST)/libstm32f10x.a: $(OBJS_STM32F10x) $(ASMOBJS_STM32F10x) | $(DST)
	@echo -e "Creating \e[32m$@\e[39m"
	$(QUIET) $(AR) crs $@ $^

TO_CLEAN += $(OBJS_STM32F10x) $(ASMOBJS_STM32F10x) $(DST)/libstm32f10x.a


#
# STM32F0xx
#

stm32f0xx: $(DST)/libstm32f0xx.a

# As defined in CMSIS/Device/ST/STM32F0xx/Include/stm32f0xx.h
STM32F0xx_TYPE ?= STM32F030

ifneq ($(DEBUG), 1)
  EMPTY_ASSERT := -Dassert_param=''
endif

SRCS_STM32F0xx += $(wildcard STM32F0xx_StdPeriph_Driver/src/*.c)
SRCS_STM32F0xx += $(wildcard CMSIS/Device/ST/STM32F0xx/Source/Templates/*.c) 
ASMS_STM32F0xx += CMSIS/Device/ST/STM32F0xx/Source/Templates/gcc_ride7/startup_$(shell echo $(STM32F0xx_TYPE) | tr A-Z a-z).s
INC_STM32F0xx += CMSIS/Include
INC_STM32F0xx += CMSIS/Device/ST/STM32F0xx/Include
INC_STM32F0xx += STM32F0xx_StdPeriph_Driver/inc

CFLAGS_STM32F0xx += -std=c99 -mthumb -mcpu=cortex-m0
OBJS_STM32F0xx := $(patsubst %.c, %.o, $(SRCS_STM32F0xx))
ASMOBJS_STM32F0xx := $(patsubst %.s, %.o, $(ASMS_STM32F0xx))

$(OBJS_STM32F0xx): %.o: %.c
	@echo -e "Compiling \e[32m$<\e[39m"
	$(QUIET) $(CC) $(CFLAGS) $(CFLAGS_STM32F0xx) $(patsubst %, -I %, $(INC_STM32F0xx)) -D$(STM32F0xx_TYPE) $(EMPTY_ASSERT) -c -o $@ $<

$(ASMOBJS_STM32F0xx): %.o: %.s
	@echo -e "Assembling \e[32m$<\e[39m"
	$(QUIET) $(CC) $(CFLAGS) $(CFLAGS_STM32F0xx) -c -o $@ $<

$(DST)/libstm32f0xx.a: $(OBJS_STM32F0xx) $(ASMOBJS_STM32F0xx) | $(DST)
	@echo -e "Creating \e[32m$@\e[39m"
	$(QUIET) $(AR) crs $@ $^

TO_CLEAN += $(OBJS_STM32F0xx) $(ASMOBJS_STM32F0xx) $(DST)/libstm32f0xx.a


#
# STM32L1xx
#

stm32l1xx: $(DST)/libstm32l1xx.a

# As defined in CMSIS/Device/ST/STM32L1xx/Include/stm32l1xx.h
STM32L1xx_TYPE ?= STM32L1XX_MD

ifneq ($(DEBUG), 1)
  EMPTY_ASSERT := -Dassert_param=''
endif

SRCS_STM32L1xx += $(wildcard STM32L1xx_StdPeriph_Driver/src/*.c)
SRCS_STM32L1xx += $(wildcard CMSIS/Device/ST/STM32L1xx/Source/Templates/*.c) 
ASMS_STM32L1xx += CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc_ride7/startup_$(shell echo $(STM32L1xx_TYPE) | tr A-Z a-z).s
INC_STM32L1xx += CMSIS/Include
INC_STM32L1xx += CMSIS/Device/ST/STM32L1xx/Include
INC_STM32L1xx += STM32L1xx_StdPeriph_Driver/inc

CFLAGS_STM32L1xx += -std=c99 -mthumb -mcpu=cortex-m3
OBJS_STM32L1xx := $(patsubst %.c, %.o, $(SRCS_STM32L1xx))
ASMOBJS_STM32L1xx := $(patsubst %.s, %.o, $(ASMS_STM32L1xx))

$(OBJS_STM32L1xx): %.o: %.c
	@echo -e "Compiling \e[32m$<\e[39m"
	$(QUIET) $(CC) $(CFLAGS) $(CFLAGS_STM32L1xx) $(patsubst %, -I %, $(INC_STM32L1xx)) -D$(STM32L1xx_TYPE) $(EMPTY_ASSERT) -c -o $@ $<

$(ASMOBJS_STM32L1xx): %.o: %.s
	@echo -e "Assembling \e[32m$<\e[39m"
	$(QUIET) $(CC) $(CFLAGS) $(CFLAGS_STM32L1xx) -c -o $@ $<

$(DST)/libstm32l1xx.a: $(OBJS_STM32L1xx) $(ASMOBJS_STM32L1xx) | $(DST)
	@echo -e "Creating \e[32m$@\e[39m"
	$(QUIET) $(AR) crs $@ $^

TO_CLEAN += $(OBJS_STM32L1xx) $(ASMOBJS_STM32L1xx) $(DST)/libstm32l1xx.a


# Remove only files and folders created by this Makefile.
clean:
	$(QUIET) rm -f $(TO_CLEAN)
	$(QUIET) rmdir --ignore-fail-on-non-empty -p $(DST) 2>/dev/null ; true
