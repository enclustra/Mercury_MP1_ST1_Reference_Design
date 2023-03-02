# Family: PolarFireSoC
# Create and Configure the core component COREI2C_FPGA
create_and_configure_core -core_vlnv {Actel:DirectCore:COREI2C:*} -component_name {COREI2C_FPGA} -params {\
"ADD_SLAVE1_ADDRESS_EN:false"  \
"BAUD_RATE_FIXED:false"  \
"BAUD_RATE_VALUE:0"  \
"BCLK_ENABLED:false"  \
"FIXED_SLAVE0_ADDR_EN:false"  \
"FIXED_SLAVE0_ADDR_VALUE:0x0"  \
"FIXED_SLAVE1_ADDR_EN:false"  \
"FIXED_SLAVE1_ADDR_VALUE:0x0"  \
"FREQUENCY:30"  \
"GLITCHREG_NUM:3"  \
"I2C_NUM:1"  \
"IPMI_EN:false"  \
"OPERATING_MODE:0"  \
"SMB_EN:false"   }
