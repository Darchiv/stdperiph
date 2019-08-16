target_include_directories(stdperiph PRIVATE
	inc/
)

target_include_directories(stdperiph SYSTEM INTERFACE
	inc/
)

target_sources(stdperiph PRIVATE
	src/stm32f0xx_adc.c
	src/stm32f0xx_can.c
	src/stm32f0xx_cec.c
	src/stm32f0xx_comp.c
	src/stm32f0xx_crc.c
	src/stm32f0xx_crs.c
	src/stm32f0xx_dac.c
	src/stm32f0xx_dbgmcu.c
	src/stm32f0xx_dma.c
	src/stm32f0xx_exti.c
	src/stm32f0xx_flash.c
	src/stm32f0xx_gpio.c
	src/stm32f0xx_i2c.c
	src/stm32f0xx_iwdg.c
	src/stm32f0xx_misc.c
	src/stm32f0xx_pwr.c
	src/stm32f0xx_rcc.c
	src/stm32f0xx_rtc.c
	src/stm32f0xx_spi.c
	src/stm32f0xx_syscfg.c
	src/stm32f0xx_tim.c
	src/stm32f0xx_usart.c
	src/stm32f0xx_wwdg.c

	# Being IDE-friendly
	inc/stm32f0xx_adc.h
	inc/stm32f0xx_can.h
	inc/stm32f0xx_cec.h
	inc/stm32f0xx_comp.h
	inc/stm32f0xx_crc.h
	inc/stm32f0xx_crs.h
	inc/stm32f0xx_dac.h
	inc/stm32f0xx_dbgmcu.h
	inc/stm32f0xx_dma.h
	inc/stm32f0xx_exti.h
	inc/stm32f0xx_flash.h
	inc/stm32f0xx_gpio.h
	inc/stm32f0xx_i2c.h
	inc/stm32f0xx_iwdg.h
	inc/stm32f0xx_misc.h
	inc/stm32f0xx_pwr.h
	inc/stm32f0xx_rcc.h
	inc/stm32f0xx_rtc.h
	inc/stm32f0xx_spi.h
	inc/stm32f0xx_syscfg.h
	inc/stm32f0xx_tim.h
	inc/stm32f0xx_usart.h
	inc/stm32f0xx_wwdg.h
)
