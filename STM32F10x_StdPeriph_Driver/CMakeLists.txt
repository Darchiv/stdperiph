target_include_directories(stdperiph PRIVATE
	inc/
)

target_include_directories(stdperiph SYSTEM INTERFACE
	inc/
)

target_sources(stdperiph PRIVATE
	src/stm32f10x_adc.c
	src/stm32f10x_bkp.c
	src/stm32f10x_can.c
	src/stm32f10x_cec.c
	src/stm32f10x_crc.c
	src/stm32f10x_dac.c
	src/stm32f10x_dbgmcu.c
	src/stm32f10x_dma.c
	src/stm32f10x_exti.c
	src/stm32f10x_flash.c
	src/stm32f10x_fsmc.c
	src/stm32f10x_gpio.c
	src/stm32f10x_i2c.c
	src/stm32f10x_iwdg.c
	src/stm32f10x_misc.c
	src/stm32f10x_pwr.c
	src/stm32f10x_rcc.c
	src/stm32f10x_rtc.c
	src/stm32f10x_sdio.c
	src/stm32f10x_spi.c
	src/stm32f10x_tim.c
	src/stm32f10x_usart.c
	src/stm32f10x_wwdg.c

	# Being IDE-friendly
	inc/stm32f10x_adc.h
	inc/stm32f10x_bkp.h
	inc/stm32f10x_can.h
	inc/stm32f10x_cec.h
	inc/stm32f10x_crc.h
	inc/stm32f10x_dac.h
	inc/stm32f10x_dbgmcu.h
	inc/stm32f10x_dma.h
	inc/stm32f10x_exti.h
	inc/stm32f10x_flash.h
	inc/stm32f10x_fsmc.h
	inc/stm32f10x_gpio.h
	inc/stm32f10x_i2c.h
	inc/stm32f10x_iwdg.h
	inc/stm32f10x_misc.h
	inc/stm32f10x_pwr.h
	inc/stm32f10x_rcc.h
	inc/stm32f10x_rtc.h
	inc/stm32f10x_sdio.h
	inc/stm32f10x_spi.h
	inc/stm32f10x_tim.h
	inc/stm32f10x_usart.h
	inc/stm32f10x_wwdg.h
)
