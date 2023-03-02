# Creating SmartDesign Mercury_MP1_PL_DDR
set sd_name {Mercury_MP1_PL_DDR}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_wlast} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BANK_0_CALIB_STATUS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BANK_8_CALIB_STATUS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4FPGA_ALERT_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FPGA_POR_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {INIT_DONE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PLL_POWERDOWN_N_0_PL_DDR} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK_PL_DDR} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_rlast} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4FPGA_ACT_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4FPGA_CAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4FPGA_CKE} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4FPGA_CK_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4FPGA_CK_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4FPGA_CS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4FPGA_ODT} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4FPGA_PAR} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4FPGA_RAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4FPGA_RESET_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4FPGA_WE_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FABRIC_RESET_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD1} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD2} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD3} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD4} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD5} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD6} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD7} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SYS_CLK} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_arburst} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_arcache} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_arid} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_arlen} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_arlock} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_arprot} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_arsize} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_awburst} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_awcache} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_awid} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_awlen} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_awlock} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_awprot} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_awsize} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_wdata} -port_direction {IN} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_wstrb} -port_direction {IN} -port_range {[63:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_bid} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_rdata} -port_direction {OUT} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_rid} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4slave0_axi0_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4FPGA_A} -port_direction {OUT} -port_range {[13:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4FPGA_BA} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4FPGA_BG} -port_direction {OUT} -port_range {[0:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4FPGA_DM} -port_direction {OUT} -port_range {[7:0]} -port_is_pad {1}

sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4FPGA_DQS_N} -port_direction {INOUT} -port_range {[7:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4FPGA_DQS_P} -port_direction {INOUT} -port_range {[7:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4FPGA_DQ} -port_direction {INOUT} -port_range {[63:0]} -port_is_pad {1}

# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4slave0} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWID:AXI4slave0_axi0_awid" \
"AWADDR:AXI4slave0_axi0_awaddr" \
"AWLEN:AXI4slave0_axi0_awlen" \
"AWSIZE:AXI4slave0_axi0_awsize" \
"AWBURST:AXI4slave0_axi0_awburst" \
"AWLOCK:AXI4slave0_axi0_awlock" \
"AWCACHE:AXI4slave0_axi0_awcache" \
"AWPROT:AXI4slave0_axi0_awprot" \
"AWVALID:AXI4slave0_axi0_awvalid" \
"AWREADY:AXI4slave0_axi0_awready" \
"WDATA:AXI4slave0_axi0_wdata" \
"WSTRB:AXI4slave0_axi0_wstrb" \
"WLAST:AXI4slave0_axi0_wlast" \
"WVALID:AXI4slave0_axi0_wvalid" \
"WREADY:AXI4slave0_axi0_wready" \
"BID:AXI4slave0_axi0_bid" \
"BRESP:AXI4slave0_axi0_bresp" \
"BVALID:AXI4slave0_axi0_bvalid" \
"BREADY:AXI4slave0_axi0_bready" \
"ARID:AXI4slave0_axi0_arid" \
"ARADDR:AXI4slave0_axi0_araddr" \
"ARLEN:AXI4slave0_axi0_arlen" \
"ARSIZE:AXI4slave0_axi0_arsize" \
"ARBURST:AXI4slave0_axi0_arburst" \
"ARLOCK:AXI4slave0_axi0_arlock" \
"ARCACHE:AXI4slave0_axi0_arcache" \
"ARPROT:AXI4slave0_axi0_arprot" \
"ARVALID:AXI4slave0_axi0_arvalid" \
"ARREADY:AXI4slave0_axi0_arready" \
"RID:AXI4slave0_axi0_rid" \
"RDATA:AXI4slave0_axi0_rdata" \
"RRESP:AXI4slave0_axi0_rresp" \
"RLAST:AXI4slave0_axi0_rlast" \
"RVALID:AXI4slave0_axi0_rvalid" \
"RREADY:AXI4slave0_axi0_rready" }

# Add AND_PL_DDR_RESET instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND4} -instance_name {AND_PL_DDR_RESET}



# Add CLOCK_CONDITIONING_CIRCUITRY_PL_DDR_i instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CLOCK_CONDITIONING_CIRCUITRY_PL_DDR} -instance_name {CLOCK_CONDITIONING_CIRCUITRY_PL_DDR_i}



# Add CORERESET_PL_DDR_AXI_INTERCONNECT_i instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET} -instance_name {CORERESET_PL_DDR_AXI_INTERCONNECT_i}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PL_DDR_AXI_INTERCONNECT_i:EXT_RST_N} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PL_DDR_AXI_INTERCONNECT_i:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PL_DDR_AXI_INTERCONNECT_i:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PL_DDR_AXI_INTERCONNECT_i:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PL_DDR_AXI_INTERCONNECT_i:FF_US_RESTORE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORERESET_PL_DDR_AXI_INTERCONNECT_i:PLL_POWERDOWN_B}



# Add Mercury_MP1_DDR4_FPGA_i instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Mercury_MP1_DDR4_FPGA} -instance_name {Mercury_MP1_DDR4_FPGA_i}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Mercury_MP1_DDR4_FPGA_i:CTRLR_READY}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Mercury_MP1_DDR4_FPGA_i:stat_ca_parity_error}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND_PL_DDR_RESET:A" "CLOCK_CONDITIONING_CIRCUITRY_PL_DDR_i:PLL_LOCK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND_PL_DDR_RESET:B" "CORERESET_PL_DDR_AXI_INTERCONNECT_i:INIT_DONE" "INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND_PL_DDR_RESET:C" "BANK_0_CALIB_STATUS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND_PL_DDR_RESET:D" "BANK_8_CALIB_STATUS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND_PL_DDR_RESET:Y" "Mercury_MP1_DDR4_FPGA_i:SYS_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCK_CONDITIONING_CIRCUITRY_PL_DDR_i:OUT0_FABCLK_0" "Mercury_MP1_DDR4_FPGA_i:PLL_REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCK_CONDITIONING_CIRCUITRY_PL_DDR_i:PLL_POWERDOWN_N_0" "PLL_POWERDOWN_N_0_PL_DDR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCK_CONDITIONING_CIRCUITRY_PL_DDR_i:REF_CLK_0" "REF_CLK_PL_DDR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PL_DDR_AXI_INTERCONNECT_i:CLK" "Mercury_MP1_DDR4_FPGA_i:SYS_CLK" "SYS_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PL_DDR_AXI_INTERCONNECT_i:FABRIC_RESET_N" "FABRIC_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PL_DDR_AXI_INTERCONNECT_i:FPGA_POR_N" "FPGA_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PL_DDR_AXI_INTERCONNECT_i:PLL_LOCK" "Mercury_MP1_DDR4_FPGA_i:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_ACT_N" "Mercury_MP1_DDR4_FPGA_i:ACT_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_ALERT_N" "Mercury_MP1_DDR4_FPGA_i:ALERT_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_BG" "Mercury_MP1_DDR4_FPGA_i:BG" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_CAS_N" "Mercury_MP1_DDR4_FPGA_i:CAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_CKE" "Mercury_MP1_DDR4_FPGA_i:CKE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_CK_N" "Mercury_MP1_DDR4_FPGA_i:CK0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_CK_P" "Mercury_MP1_DDR4_FPGA_i:CK0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_CS_N" "Mercury_MP1_DDR4_FPGA_i:CS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_ODT" "Mercury_MP1_DDR4_FPGA_i:ODT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_PAR" "Mercury_MP1_DDR4_FPGA_i:PAR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_RAS_N" "Mercury_MP1_DDR4_FPGA_i:RAS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_RESET_N" "Mercury_MP1_DDR4_FPGA_i:RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_WE_N" "Mercury_MP1_DDR4_FPGA_i:WE_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_DDR4_FPGA_i:SHIELD0" "SHIELD0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_DDR4_FPGA_i:SHIELD1" "SHIELD1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_DDR4_FPGA_i:SHIELD2" "SHIELD2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_DDR4_FPGA_i:SHIELD3" "SHIELD3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_DDR4_FPGA_i:SHIELD4" "SHIELD4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_DDR4_FPGA_i:SHIELD5" "SHIELD5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_DDR4_FPGA_i:SHIELD6" "SHIELD6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_DDR4_FPGA_i:SHIELD7" "SHIELD7" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_A" "Mercury_MP1_DDR4_FPGA_i:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_BA" "Mercury_MP1_DDR4_FPGA_i:BA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_DM" "Mercury_MP1_DDR4_FPGA_i:DM_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_DQ" "Mercury_MP1_DDR4_FPGA_i:DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_DQS_N" "Mercury_MP1_DDR4_FPGA_i:DQS_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_DQS_P" "Mercury_MP1_DDR4_FPGA_i:DQS" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4slave0" "Mercury_MP1_DDR4_FPGA_i:AXI4slave0" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign Mercury_MP1_PL_DDR
generate_component -component_name ${sd_name}
