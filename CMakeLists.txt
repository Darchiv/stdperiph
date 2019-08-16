cmake_minimum_required(VERSION 3.13.5 FATAL_ERROR)

project(StdPeriph
	VERSION 1.0.0 # Not related to actual StdPeriph versions.
	DESCRIPTION "StdPeriph library by ST"
	LANGUAGES C
)

if(NOT STDPERIPH_TARGET)
	message(FATAL_ERROR "No STDPERIPH_TARGET provided.")
endif()

add_library(stdperiph STATIC)

function(chip_to_stdperiphdef TARGET_CHIP VAR_SERIES VAR_STDPERIPHDEF)
	if(TARGET_CHIP MATCHES "^STM32(F0)(30|31|51|72|42|91)")
		string(CONCAT STDPERIPHDEF "STM32F0" ${CMAKE_MATCH_2})
	elseif(TARGET_CHIP MATCHES "^STM32(F0)70.B")
		set(STDPERIPHDEF "STM32F070xB")
	elseif(TARGET_CHIP MATCHES "^STM32(F0)70.6")
		set(STDPERIPHDEF "STM32F070x6")
	elseif(TARGET_CHIP MATCHES "^STM32(F0)30.C")
		set(STDPERIPHDEF "STM32F030xC")

	elseif(TARGET_CHIP MATCHES "^STM32(F1)0[123].[46]")
		set(STDPERIPHDEF "STM32F10X_LD")
	elseif(TARGET_CHIP MATCHES "^STM32(F1)00.[46]")
		set(STDPERIPHDEF "STM32F10X_LD_VL")
	elseif(TARGET_CHIP MATCHES "^STM32(F1)0[123].[B8]")
		set(STDPERIPHDEF "STM32F10X_MD")
	elseif(TARGET_CHIP MATCHES "^STM32(F1)00.[B8]")
		set(STDPERIPHDEF "STM32F10X_MD_VL")
	elseif(TARGET_CHIP MATCHES "^STM32(F1)0[13].[CDE]")
		set(STDPERIPHDEF "STM32F10X_HD")
	elseif(TARGET_CHIP MATCHES "^STM32(F1)00.[CDE]")
		set(STDPERIPHDEF "STM32F10X_HD_VL")
	elseif(TARGET_CHIP MATCHES "^STM32(F1)0[13].[FG]")
		set(STDPERIPHDEF "STM32F10X_XL")
	elseif(TARGET_CHIP MATCHES "^STM32(F1)0[57]")
		set(STDPERIPHDEF "STM32F10X_CL")

	# TODO: STM32L1

	else()
		message(FATAL_ERROR "The '" ${TARGET_CHIP} "' target is not supported.")
	endif()

	set(${VAR_SERIES} ${CMAKE_MATCH_1} PARENT_SCOPE)
	set(${VAR_STDPERIPHDEF} ${STDPERIPHDEF} PARENT_SCOPE)
endfunction()

string(TOUPPER ${STDPERIPH_TARGET} STDPERIPH_TARGET)

chip_to_stdperiphdef(${STDPERIPH_TARGET} SERIES STDPERIPHDEF)

# TODO: Add cached variables or target properties: USE_FULL_ASSERT

target_compile_definitions(stdperiph PUBLIC ${STDPERIPHDEF})

if(SERIES STREQUAL "F0")
	target_include_directories(stdperiph PRIVATE
		CMSIS/Include
		CMSIS/Device/ST/STM32F0xx/Include
	)

	add_subdirectory(STM32F0xx_StdPeriph_Driver/)

elseif(SERIES STREQUAL "F1")
	target_include_directories(stdperiph PRIVATE
		CMSIS/Include
		CMSIS/Device/ST/STM32F10x/Include
	)

	add_subdirectory(STM32F10x_StdPeriph_Driver/)

elseif(SERIES STREQUAL "L1")
	target_include_directories(stdperiph PRIVATE
		CMSIS/Include
		CMSIS/Device/ST/STM32L1xx/Include
	)

	add_subdirectory(STM32L1xx_StdPeriph_Driver/)

else()
	message(FATAL_ERROR "Internal error. '" ${SERIES} "' series not handled.")
endif()
