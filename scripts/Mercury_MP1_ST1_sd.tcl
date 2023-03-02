# ----------------------------------------------------------------------------------------------------
# Copyright (c) 2022 by Enclustra GmbH, Switzerland.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this hardware, software, firmware, and associated documentation files (the
# "Product"), to deal in the Product without restriction, including without
# limitation the rights to use, copy, modify, merge, publish, distribute,
# sublicense, and/or sell copies of the Product, and to permit persons to whom the
# Product is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Product.
#
# THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# PRODUCT OR THE USE OR OTHER DEALINGS IN THE PRODUCT.
# ----------------------------------------------------------------------------------------------------

# --------------------------------Creating SmartDesign Mercury_MP1_ST1--------------------------------
set sd_name ${module}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0
# ---------------------------------Generate and import MSS component----------------------------------
file mkdir [file join ${libero_dir} component MSS_${part}]
exec ${mss_config_loc} -GENERATE -CONFIGURATION_FILE:[file join ${local_dir} src MSS_${part}.cfg] -OUTPUT_DIR:[file join ${libero_dir} component MSS_${part}]
import_mss_component -file [file join ${libero_dir} component MSS_${part} ${die}.cxz]

# -------------Instantiate IPs and hierarchical SmartDesign in the top level SmartDesign--------------
# Add Mercury_MP1_CLOCKS_AND_RESETS_i instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Mercury_MP1_CLOCKS_AND_RESETS} -instance_name {Mercury_MP1_CLOCKS_AND_RESETS_i}
# Add Mercury_MP1_CORE_APB3_INTERCONNECT_i instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Mercury_MP1_CORE_APB3_INTERCONNECT} -instance_name {Mercury_MP1_CORE_APB3_INTERCONNECT_i}
# Add MSS instance
sd_instantiate_component -sd_name ${sd_name} -component_name ${die} -instance_name {MSS}
# Add Mercury_MP1_PL_DDR_i instance
if { $PL_DDR == "DDR4_FPGA"} {
    sd_instantiate_component -sd_name ${sd_name} -component_name {Mercury_MP1_PL_DDR} -instance_name {Mercury_MP1_PL_DDR_i}
}

# Add Mercury_MP1_CORE_AXI4_INTERCONNECT_i instance
if { $PL_DDR == "DDR4_FPGA"} {
    sd_instantiate_component -sd_name ${sd_name} -component_name {DDR4_FPGA_CORE_AXI4_INTERCONNECT} -instance_name {Mercury_MP1_CORE_AXI4_INTERCONNECT_i}
}

# Add COREI2C_FPGA_i instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREI2C_FPGA} -instance_name {COREI2C_FPGA_i}
# Add BIBUF_I2C_FPGA_i instance
sd_instantiate_component -sd_name ${sd_name} -component_name {BIBUF_I2C} -instance_name {BIBUF_I2C_FPGA_i}
# Add BIBUF_I2C_PL_i instance
sd_instantiate_component -sd_name ${sd_name} -component_name {BIBUF_I2C} -instance_name {BIBUF_I2C_PL_i}
# Add Mercury_MP1_GPIO_LED_i instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Mercury_MP1_GPIO_LED} -instance_name {Mercury_MP1_GPIO_LED_i}
# Add HDL core SdioSel_i instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {SdioSel} -instance_name {SdioSel_i}
# Add Mercury_MP1_UART_SEL_i instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Mercury_MP1_UART_SEL} -instance_name {Mercury_MP1_UART_SEL_i}
# Add Mercury_MP1_GPIO_UART_SEL_i instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Mercury_MP1_GPIO_UART_SEL} -instance_name {Mercury_MP1_GPIO_UART_SEL_i}

# --------------------------------Configure all HDL cores if necessary--------------------------------

# -------------------------------------Create all top level ports-------------------------------------
# Top level scalar ports for Clk50
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK50} -port_direction {IN}

# Top level scalar ports for FPGA
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_CLK_EMMC_CLK} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_CMD_EMMC_CMD} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA0_EMMC_DATA0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA1_EMMC_DATA1} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA2_EMMC_DATA2} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA3_EMMC_DATA3} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSSIO7_EMMC_RST_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSSIO8_EMMC_IO4} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VSEL_EMMC_IO5} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSSIO10_EMMC_IO6} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSSIO11_EMMC_IO7} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_CD_N_EMMC_STRB} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_MSS_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_MSS_SDA} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_INT_N_MSS} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {QSPI_CLK} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {QSPI_SS0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {QSPI_DATA0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {QSPI_DATA1} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {QSPI_DATA2} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {QSPI_DATA3} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ETH_MDC} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ETH_MDIO} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_SGMII_TX0_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_SGMII_TX0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_SGMII_TX1_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_SGMII_TX1_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_SGMII_RX0_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_SGMII_RX0_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_SGMII_RX1_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_SGMII_RX1_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_LED0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_LED1_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_RST_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_CLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DIR} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_NXT} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_STP} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA1} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA2} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA3} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA4} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA5} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA6} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA7} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_REFCLK_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_REFCLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4MSS_A} -port_direction {OUT} -port_range {[13:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4MSS_BA} -port_direction {OUT} -port_range {[1:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4MSS_DQ} -port_direction {INOUT} -port_range {[35:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4MSS_DQS_P} -port_direction {INOUT} -port_range {[4:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4MSS_DQS_N} -port_direction {INOUT} -port_range {[4:0]} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4MSS_ACT_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4MSS_BG0} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4MSS_CAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4MSS_CK_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4MSS_CK_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4MSS_CKE} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4MSS_CS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4MSS_ODT} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4MSS_RAS_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4MSS_RESET_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4MSS_WE_N} -port_direction {OUT} -port_is_pad {1}

# Top level scalar ports for FPGA_DDR4_SDRAM
if { $PL_DDR == "DDR4_FPGA"} {
    sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4FPGA_ALERT_N} -port_direction {IN}
    sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4FPGA_WE_N} -port_direction {OUT}
    sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4FPGA_ACT_N} -port_direction {OUT}
    sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4FPGA_CAS_N} -port_direction {OUT}
    sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4FPGA_RAS_N} -port_direction {OUT}
    sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4FPGA_RESET_N} -port_direction {OUT}
    sd_create_scalar_port -sd_name ${sd_name} -port_name {DDR4FPGA_PAR} -port_direction {OUT}
    sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD0} -port_direction {OUT}
    sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD1} -port_direction {OUT}
    sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD2} -port_direction {OUT}
    sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD3} -port_direction {OUT}
    sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD4} -port_direction {OUT}
    sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD5} -port_direction {OUT}
    sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD6} -port_direction {OUT}
    sd_create_scalar_port -sd_name ${sd_name} -port_name {SHIELD7} -port_direction {OUT}
    sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4FPGA_BA} -port_direction {OUT} -port_range {[1:0]}
    sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4FPGA_BG} -port_direction {OUT} -port_range {[0:0]}
    sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4FPGA_CKE} -port_direction {OUT} -port_range {[0:0]}
    sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4FPGA_DQ} -port_direction {INOUT} -port_range {[63:0]}
    sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4FPGA_ODT} -port_direction {OUT} -port_range {[0:0]}
    sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4FPGA_A} -port_direction {OUT} -port_range {[13:0]}
    sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4FPGA_CK_N} -port_direction {OUT} -port_range {[0:0]}
    sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4FPGA_CK_P} -port_direction {OUT} -port_range {[0:0]}
    sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4FPGA_CS_N} -port_direction {OUT} -port_range {[0:0]}
    sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4FPGA_DM} -port_direction {INOUT} -port_range {[7:0]}
    sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4FPGA_DQS_P} -port_direction {INOUT} -port_range {[7:0]}
    sd_create_bus_port -sd_name ${sd_name} -port_name {DDR4FPGA_DQS_N} -port_direction {INOUT} -port_range {[7:0]}
}

# Top level scalar ports for I2C_FPGA
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_SCL_FPGA} -port_direction {INOUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_SDA_FPGA} -port_direction {INOUT}

# Top level scalar ports for I2C_PL
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_SCL} -port_direction {INOUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_SDA} -port_direction {INOUT}

# Top level scalar ports for LED
sd_create_scalar_port -sd_name ${sd_name} -port_name {FPGA_LED0_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FPGA_LED1_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FPGA_LED2_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FPGA_LED3_N} -port_direction {OUT}

# Top level scalar ports for SDIO_SEL
sd_create_scalar_port -sd_name ${sd_name} -port_name {SDIO_SEL} -port_direction {OUT}

# Top level scalar ports for TPM
sd_create_scalar_port -sd_name ${sd_name} -port_name {TPM_SPI_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TPM_SPI_MISO} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TPM_SPI_MOSI} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TPM_SPI_CS_N} -port_direction {OUT}

# Top level scalar ports for UART
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART_RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART_SEL} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART_TX} -port_direction {OUT}

# ---------------------------------------Configure all IP ports---------------------------------------
# Port configuration for FPGA
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND_RESET}

# Port configuration for FPGA
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:FIC_3_APB_M_PSTRB}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:MMUART_0_TXD_OE_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:MMUART_1_TXD_OE_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:PLL_SGMII_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:PLL_CPU_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:PLL_DDR_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:MSS_INT_M2F}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MSS:MSS_INT_F2M} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MSS:MSS_RESET_N_F2M} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:MSS_RESET_N_M2F}

# Port configuration for FPGA
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:FIC_0_AXI4_INITIATOR}

# Port configuration for FPGA_DDR4_SDRAM
if { $PL_DDR == "DDR4_FPGA"} {
    sd_clear_pin_attributes -sd_name ${sd_name} -pin_names {MSS:FIC_0_AXI4_INITIATOR}
}

# Port configuration for I2C_FPGA
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREI2C_FPGA_i:INT}

# Port configuration for LED
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Mercury_MP1_GPIO_LED_i:GPIO_OUT} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Mercury_MP1_GPIO_LED_i:GPIO_OUT} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Mercury_MP1_GPIO_LED_i:GPIO_OUT} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Mercury_MP1_GPIO_LED_i:GPIO_OUT} -pin_slices {[3:3]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Mercury_MP1_GPIO_LED_i:INT}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Mercury_MP1_GPIO_LED_i:GPIO_IN} -value {GND}

# Port configuration for TPM
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:SPI_0_SS1_OE_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:SPI_0_CLK_OE_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MSS:SPI_0_DO_OE_M2F}

# Port configuration for UART
sd_create_pin_slices -sd_name ${sd_name} -pin_name {Mercury_MP1_GPIO_UART_SEL_i:GPIO_OUT} -pin_slices {"[0:0]"}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Mercury_MP1_GPIO_UART_SEL_i:INT}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Mercury_MP1_GPIO_UART_SEL_i:GPIO_IN} -value {GND}

# ---------------------------------------Create all connections---------------------------------------
# Connections for Clk50
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK50" "Mercury_MP1_CLOCKS_AND_RESETS_i:REF_CLK"}

# Connections for FPGA
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND_RESET:Y" "Mercury_MP1_CLOCKS_AND_RESETS_i:EXT_RST_N"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND_RESET:A" "MSS:FIC_0_DLL_LOCK_M2F"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND_RESET:B" "MSS:FIC_3_DLL_LOCK_M2F"}

# Connections for FPGA
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_DATA0_EMMC_DATA0" "SD_DATA0_EMMC_DATA0"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_DATA1_EMMC_DATA1" "SD_DATA1_EMMC_DATA1"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_DATA2_EMMC_DATA2" "SD_DATA2_EMMC_DATA2"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_DATA3_EMMC_DATA3" "SD_DATA3_EMMC_DATA3"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_UNUSED_EMMC_RSTN" "MSSIO7_EMMC_RST_N"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_UNUSED_EMMC_DATA4" "MSSIO8_EMMC_IO4"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_UNUSED_EMMC_DATA5" "SD_VSEL_EMMC_IO5"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_UNUSED_EMMC_DATA6" "MSSIO10_EMMC_IO6"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_UNUSED_EMMC_DATA7" "MSSIO11_EMMC_IO7"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_CLK_EMMC_CLK" "SD_CLK_EMMC_CLK"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_CMD_EMMC_CMD" "SD_CMD_EMMC_CMD"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SD_CD_EMMC_STRB" "SD_CD_N_EMMC_STRB"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C_MSS_SCL" "MSS:I2C_1_SCL"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C_MSS_SDA" "MSS:I2C_1_SDA"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C_INT_N_MSS" "MSS:GPIO_0_13"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:QSPI_CLK" "QSPI_CLK"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:QSPI_SS0" "QSPI_SS0"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:QSPI_DATA0" "QSPI_DATA0"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:QSPI_DATA1" "QSPI_DATA1"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:QSPI_DATA2" "QSPI_DATA2"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:QSPI_DATA3" "QSPI_DATA3"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"ETH_MDC" "MSS:MAC_1_MDC"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"ETH_MDIO" "MSS:MAC_1_MDIO"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SGMII_TX0_P" "MSS_SGMII_TX0_P"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SGMII_TX0_N" "MSS_SGMII_TX0_N"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SGMII_TX1_P" "MSS_SGMII_TX1_P"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SGMII_TX1_N" "MSS_SGMII_TX1_N"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SGMII_RX0_P" "MSS_SGMII_RX0_P"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SGMII_RX0_N" "MSS_SGMII_RX0_N"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SGMII_RX1_P" "MSS_SGMII_RX1_P"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SGMII_RX1_N" "MSS_SGMII_RX1_N"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:GPIO_1_22_OUT" "MSS_LED0_N"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:GPIO_1_23_OUT" "MSS_LED1_N"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:GPIO_0_12_OUT" "MSS_RST_N"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_NXT" "USB_NXT"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_DIR" "USB_DIR"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_CLK" "USB_CLK"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_STP" "USB_STP"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_DATA0" "USB_DATA0"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_DATA1" "USB_DATA1"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_DATA2" "USB_DATA2"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_DATA3" "USB_DATA3"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_DATA4" "USB_DATA4"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_DATA5" "USB_DATA5"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_DATA6" "USB_DATA6"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:USB_DATA7" "USB_DATA7"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:REFCLK" "MSS_REFCLK_P"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:REFCLK_N" "MSS_REFCLK_N"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4MSS_A" "MSS:A"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4MSS_ACT_N" "MSS:ACT_N"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4MSS_BA" "MSS:BA"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4MSS_BG0" "MSS:BG0"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4MSS_CAS_N" "MSS:CAS_N"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4MSS_CK_P" "MSS:CK0"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4MSS_CK_N" "MSS:CK0_N"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4MSS_CKE" "MSS:CKE0"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4MSS_DQ" "MSS:DQ"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4MSS_DQS_P" "MSS:DQS"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4MSS_DQS_N" "MSS:DQS_N"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4MSS_RAS_N" "MSS:RAS_N"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4MSS_ODT" "MSS:ODT0"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4MSS_RESET_N" "MSS:RESET_N"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4MSS_WE_N" "MSS:WE_N"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4MSS_CS_N" "MSS:CS0_N"}

# Connections for FPGA
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:FIC_0_ACLK" "Mercury_MP1_CLOCKS_AND_RESETS_i:CLK50"}

# Connections for FPGA_DDR4_SDRAM
if { $PL_DDR == "DDR4_FPGA"} {
    sd_connect_pin_to_port -sd_name {Mercury_MP1_CLOCKS_AND_RESETS} -pin_name {INIT_MONITOR_i:DEVICE_INIT_DONE} -port_name {}
    sd_connect_pin_to_port -sd_name {Mercury_MP1_CLOCKS_AND_RESETS} -pin_name {INIT_MONITOR_i:FABRIC_POR_N} -port_name {}
    sd_connect_pin_to_port -sd_name {Mercury_MP1_CLOCKS_AND_RESETS} -pin_name {INIT_MONITOR_i:BANK_0_CALIB_STATUS} -port_name {}
    sd_connect_pin_to_port -sd_name {Mercury_MP1_CLOCKS_AND_RESETS} -pin_name {INIT_MONITOR_i:BANK_8_CALIB_STATUS} -port_name {}
    sd_connect_pin_to_port -sd_name {Mercury_MP1_CLOCKS_AND_RESETS} -pin_name {CORERESET_i:PLL_POWERDOWN_B} -port_name {}
    save_smartdesign -sd_name {Mercury_MP1_CLOCKS_AND_RESETS}
    sd_update_instance -sd_name ${sd_name} -instance_name {Mercury_MP1_CLOCKS_AND_RESETS_i}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_ACT_N" "Mercury_MP1_PL_DDR_i:DDR4FPGA_ACT_N"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_ALERT_N" "Mercury_MP1_PL_DDR_i:DDR4FPGA_ALERT_N"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CLOCKS_AND_RESETS_i:FABRIC_POR_N" "Mercury_MP1_PL_DDR_i:FPGA_POR_N"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CLOCKS_AND_RESETS_i:DEVICE_INIT_DONE" "Mercury_MP1_PL_DDR_i:INIT_DONE"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CLOCKS_AND_RESETS_i:PLL_POWERDOWN_B" "Mercury_MP1_PL_DDR_i:PLL_POWERDOWN_N_0_PL_DDR"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CLOCKS_AND_RESETS_i:BANK_0_CALIB_STATUS" "Mercury_MP1_PL_DDR_i:BANK_0_CALIB_STATUS"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CLOCKS_AND_RESETS_i:BANK_8_CALIB_STATUS" "Mercury_MP1_PL_DDR_i:BANK_8_CALIB_STATUS"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK50" "Mercury_MP1_PL_DDR_i:REF_CLK_PL_DDR"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_CAS_N" "Mercury_MP1_PL_DDR_i:DDR4FPGA_CAS_N"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_CKE" "Mercury_MP1_PL_DDR_i:DDR4FPGA_CKE"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_CK_N" "Mercury_MP1_PL_DDR_i:DDR4FPGA_CK_N"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_CK_P" "Mercury_MP1_PL_DDR_i:DDR4FPGA_CK_P"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_CS_N" "Mercury_MP1_PL_DDR_i:DDR4FPGA_CS_N"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_ODT" "Mercury_MP1_PL_DDR_i:DDR4FPGA_ODT"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_PAR" "Mercury_MP1_PL_DDR_i:DDR4FPGA_PAR"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_RAS_N" "Mercury_MP1_PL_DDR_i:DDR4FPGA_RAS_N"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_RESET_N" "Mercury_MP1_PL_DDR_i:DDR4FPGA_RESET_N"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_WE_N" "Mercury_MP1_PL_DDR_i:DDR4FPGA_WE_N"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"SHIELD0" "Mercury_MP1_PL_DDR_i:SHIELD0"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"SHIELD1" "Mercury_MP1_PL_DDR_i:SHIELD1"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"SHIELD2" "Mercury_MP1_PL_DDR_i:SHIELD2"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"SHIELD3" "Mercury_MP1_PL_DDR_i:SHIELD3"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"SHIELD4" "Mercury_MP1_PL_DDR_i:SHIELD4"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"SHIELD5" "Mercury_MP1_PL_DDR_i:SHIELD5"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"SHIELD6" "Mercury_MP1_PL_DDR_i:SHIELD6"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"SHIELD7" "Mercury_MP1_PL_DDR_i:SHIELD7"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_A" "Mercury_MP1_PL_DDR_i:DDR4FPGA_A"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_BA" "Mercury_MP1_PL_DDR_i:DDR4FPGA_BA"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_BG" "Mercury_MP1_PL_DDR_i:DDR4FPGA_BG"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_DM" "Mercury_MP1_PL_DDR_i:DDR4FPGA_DM"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_DQS_N" "Mercury_MP1_PL_DDR_i:DDR4FPGA_DQS_N"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_DQS_P" "Mercury_MP1_PL_DDR_i:DDR4FPGA_DQS_P"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR4FPGA_DQ" "Mercury_MP1_PL_DDR_i:DDR4FPGA_DQ"}
}

# Connections for FPGA_DDR4_SDRAM
if { $PL_DDR == "DDR4_FPGA"} {
    sd_disconnect_pins -sd_name ${sd_name} -pin_names {"MSS:FIC_0_ACLK"}
}

# Connections for I2C_FPGA
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C_FPGA_i:BIBUF_I2C_SCL_E" "COREI2C_FPGA_i:SCLO"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C_FPGA_i:BIBUF_I2C_SDA_E" "COREI2C_FPGA_i:SDAO"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C_FPGA_i:BIBUF_I2C_SCL_Y" "COREI2C_FPGA_i:SCLI"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C_FPGA_i:BIBUF_I2C_SDA_Y" "COREI2C_FPGA_i:SDAI"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C_FPGA_i:I2C_SCL" "I2C_SCL_FPGA"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C_FPGA_i:I2C_SDA" "I2C_SDA_FPGA"}

# Connections for I2C_PL
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C_PL_i:BIBUF_I2C_SCL_E" "MSS:I2C_0_SCL_OE_M2F"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C_PL_i:BIBUF_I2C_SDA_E" "MSS:I2C_0_SDA_OE_M2F"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C_PL_i:BIBUF_I2C_SCL_Y" "MSS:I2C_0_SCL_F2M"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C_PL_i:BIBUF_I2C_SDA_Y" "MSS:I2C_0_SDA_F2M"}

# Connections for I2C_PL
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C_PL_i:I2C_SCL" "I2C_SCL"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C_PL_i:I2C_SDA" "I2C_SDA"}

# Connections for LED
sd_connect_pins -sd_name ${sd_name} -pin_names {"FPGA_LED0_N" "Mercury_MP1_GPIO_LED_i:GPIO_OUT[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FPGA_LED1_N" "Mercury_MP1_GPIO_LED_i:GPIO_OUT[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FPGA_LED2_N" "Mercury_MP1_GPIO_LED_i:GPIO_OUT[2:2]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FPGA_LED3_N" "Mercury_MP1_GPIO_LED_i:GPIO_OUT[3:3]" }

# Connections for SDIO_SEL
sd_connect_pins -sd_name ${sd_name} -pin_names {"SdioSel_i:SdioControl" "SDIO_SEL"}

# Connections for TPM
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SPI_0_CLK_F2M" "MSS:SPI_0_CLK_M2F"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SPI_0_CLK_M2F" "TPM_SPI_CLK"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SPI_0_DO_M2F" "TPM_SPI_MOSI"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SPI_0_SS1_M2F" "TPM_SPI_CS_N"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SPI_0_SS1_M2F" "MSS:SPI_0_SS_F2M"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:SPI_0_DI_F2M" "TPM_SPI_MISO"}

# Connections for UART
sd_connect_pins -sd_name ${sd_name} -pin_names {"MERCURY_MP1_UART_SEL_i:RX" "UART_RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MERCURY_MP1_UART_SEL_i:SEL" "UART_SEL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MERCURY_MP1_UART_SEL_i:TX" "UART_TX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MERCURY_MP1_UART_SEL_i:UART_RX_0" "MSS:MMUART_0_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MERCURY_MP1_UART_SEL_i:UART_RX_1" "MSS:MMUART_1_RXD_F2M" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MERCURY_MP1_UART_SEL_i:UART_TX_0" "MSS:MMUART_0_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MERCURY_MP1_UART_SEL_i:UART_TX_1" "MSS:MMUART_1_TXD_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_GPIO_UART_SEL_i:GPIO_OUT[0:0]" "UART_SEL"}

# -------------------------------------Create all APB connections-------------------------------------
sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:FIC_3_PCLK" "Mercury_MP1_CLOCKS_AND_RESETS_i:CLK50"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CORE_APB3_INTERCONNECT_i:APB3mmaster" "MSS:FIC_3_APB_INITIATOR"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CORE_APB3_INTERCONNECT_i:APBmslave0" "SdioSel_i:APB_bif"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CLOCKS_AND_RESETS_i:CLK50" "SdioSel_i:PClk"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CLOCKS_AND_RESETS_i:FABRIC_RESET_N" "SdioSel_i:PRstN"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CORE_APB3_INTERCONNECT_i:APBmslave1" "Mercury_MP1_GPIO_UART_SEL_i:APB_bif"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CLOCKS_AND_RESETS_i:CLK50" "Mercury_MP1_GPIO_UART_SEL_i:PCLK"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CLOCKS_AND_RESETS_i:FABRIC_RESET_N" "Mercury_MP1_GPIO_UART_SEL_i:PRESETN"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CORE_APB3_INTERCONNECT_i:APBmslave2" "COREI2C_FPGA_i:APBslave"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CLOCKS_AND_RESETS_i:CLK50" "COREI2C_FPGA_i:PCLK"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CLOCKS_AND_RESETS_i:FABRIC_RESET_N" "COREI2C_FPGA_i:PRESETN"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CORE_APB3_INTERCONNECT_i:APBmslave3" "Mercury_MP1_GPIO_LED_i:APB_bif"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CLOCKS_AND_RESETS_i:CLK50" "Mercury_MP1_GPIO_LED_i:PCLK"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CLOCKS_AND_RESETS_i:FABRIC_RESET_N" "Mercury_MP1_GPIO_LED_i:PRESETN"}

# -------------------------------------Create all AXI connections-------------------------------------
if { $PL_DDR == "DDR4_FPGA"} {
    sd_connect_pins -sd_name ${sd_name} -pin_names {"MSS:FIC_0_ACLK" "Mercury_MP1_PL_DDR_i:SYS_CLK"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CORE_AXI4_INTERCONNECT_i:AXI4mmaster0" "MSS:FIC_0_AXI4_INITIATOR"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CORE_AXI4_INTERCONNECT_i:ACLK" "Mercury_MP1_PL_DDR_i:SYS_CLK"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CORE_AXI4_INTERCONNECT_i:ARESETN" "Mercury_MP1_PL_DDR_i:FABRIC_RESET_N"}
    sd_connect_pins -sd_name ${sd_name} -pin_names {"Mercury_MP1_CORE_AXI4_INTERCONNECT_i:AXI4mslave0" "Mercury_MP1_PL_DDR_i:AXI4slave0"}
}
# Organize everything
sd_reset_layout -sd_name ${sd_name}

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1

# Save the SmartDesign
save_smartdesign -sd_name ${sd_name}

# Generate SmartDesign Mercury_MP1_ST1
generate_component -component_name ${sd_name}

# Re-generate all components and build design hierarchy
generate_component -component_name ${module} -recursive 1
build_design_hierarchy
