target_include_directories(stdperiph PRIVATE
	inc/
)

target_include_directories(stdperiph SYSTEM INTERFACE
	inc/
)

target_sources(stdperiph PRIVATE
	src/stm32l1xx_adc.c
	src/stm32l1xx_aes.c
	src/stm32l1xx_aes_util.c
	src/stm32l1xx_comp.c
	src/stm32l1xx_crc.c
	src/stm32l1xx_dac.c
	src/stm32l1xx_dbgmcu.c
	src/stm32l1xx_dma.c
	src/stm32l1xx_exti.c
	src/stm32l1xx_flash.c
	src/stm32l1xx_flash_ramfunc.c
	src/stm32l1xx_fsmc.c
	src/stm32l1xx_gpio.c
	src/stm32l1xx_i2c.c
	src/stm32l1xx_iwdg.c
	src/stm32l1xx_lcd.c
	src/stm32l1xx_misc.c
	src/stm32l1xx_opamp.c
	src/stm32l1xx_pwr.c
	src/stm32l1xx_rcc.c
	src/stm32l1xx_rtc.c
	src/stm32l1xx_sdio.c
	src/stm32l1xx_spi.c
	src/stm32l1xx_syscfg.c
	src/stm32l1xx_tim.c
	src/stm32l1xx_usart.c
	src/stm32l1xx_wwdg.c

	# Being IDE-friendly
	inc/stm32l1xx_adc.h
	inc/stm32l1xx_aes.h
	inc/stm32l1xx_comp.h
	inc/stm32l1xx_crc.h
	inc/stm32l1xx_dac.h
	inc/stm32l1xx_dbgmcu.h
	inc/stm32l1xx_dma.h
	inc/stm32l1xx_exti.h
	inc/stm32l1xx_flash.h
	inc/stm32l1xx_fsmc.h
	inc/stm32l1xx_gpio.h
	inc/stm32l1xx_i2c.h
	inc/stm32l1xx_iwdg.h
	inc/stm32l1xx_lcd.h
	inc/stm32l1xx_misc.h
	inc/stm32l1xx_opamp.h
	inc/stm32l1xx_pwr.h
	inc/stm32l1xx_rcc.h
	inc/stm32l1xx_rtc.h
	inc/stm32l1xx_sdio.h
	inc/stm32l1xx_spi.h
	inc/stm32l1xx_syscfg.h
	inc/stm32l1xx_tim.h
	inc/stm32l1xx_usart.h
	inc/stm32l1xx_wwdg.h
)
