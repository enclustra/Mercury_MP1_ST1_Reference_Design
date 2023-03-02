# Creating SmartDesign Mercury_MP1_CLOCKS_AND_RESETS
set sd_name {Mercury_MP1_CLOCKS_AND_RESETS}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {EXT_RST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK50} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FABRIC_RESET_N} -port_direction {OUT}



# Add CLOCK_CONDITIONING_CIRCUITRY_i instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CLOCK_CONDITIONING_CIRCUITRY} -instance_name {CLOCK_CONDITIONING_CIRCUITRY_i}



# Add CORERESET_i instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET} -instance_name {CORERESET_i}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_i:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_i:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_i:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_i:FF_US_RESTORE} -value {GND}



# Add INIT_MONITOR_i instance
sd_instantiate_component -sd_name ${sd_name} -component_name {INIT_MONITOR} -instance_name {INIT_MONITOR_i}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_i:PCIE_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_i:USRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_i:SRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_i:XCVR_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_i:USRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_i:USRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_i:USRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_i:SRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_i:SRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_i:SRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_i:AUTOCALIB_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_i:BANK_0_CALIB_STATUS}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {INIT_MONITOR_i:BANK_8_CALIB_STATUS}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK50" "CLOCK_CONDITIONING_CIRCUITRY_i:OUT0_FABCLK_0" "CORERESET_i:CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCK_CONDITIONING_CIRCUITRY_i:PLL_LOCK_0" "CORERESET_i:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCK_CONDITIONING_CIRCUITRY_i:PLL_POWERDOWN_N_0" "CORERESET_i:PLL_POWERDOWN_B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCK_CONDITIONING_CIRCUITRY_i:REF_CLK_0" "REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_i:EXT_RST_N" "EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_i:FABRIC_RESET_N" "FABRIC_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_i:FPGA_POR_N" "INIT_MONITOR_i:FABRIC_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_i:INIT_DONE" "INIT_MONITOR_i:DEVICE_INIT_DONE" }



# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign Mercury_MP1_CLOCKS_AND_RESETS
generate_component -component_name ${sd_name}