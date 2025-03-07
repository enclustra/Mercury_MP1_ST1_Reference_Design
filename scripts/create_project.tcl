# ----------------------------------------------------------------------------------------------------
# Copyright (c) 2025 by Enclustra GmbH, Switzerland.
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
#
# create_project.tcl: Tcl script for re-creating Libero project
#
# ########################################################################################

puts "INFO: BEGIN of [info script]"

if {[file exists [file join scripts settings.tcl]] } { source [file join scripts settings.tcl] }
if {![info exists libero_dir]} { set libero_dir [file join build Libero ${module_name}] }

# Check path length on Windows machines to verify project can be created
if { [lindex $tcl_platform(os) 0]  == "Windows" } {
    if {[string length [pwd]] < 60} {
        puts "Project path length ok."
    } else {
        error "Path to project is too long, please reduce the path and try again."
    }
}

# Create project
new_project \
    -location ${libero_dir} \
    -name ${project_name} \
    -project_description "${project_name} Reference Design" \
    -block_mode 0 \
    -standalone_peripheral_initialization 0 \
    -instantiate_in_smartdesign 1 \
    -ondemand_build_dh 1 \
    -use_relative_path 0 \
    -linked_files_root_dir_env {} \
    -hdl {VHDL} \
    -family ${family} \
    -die ${die} \
    -package ${package} \
    -speed ${speed} \
    -die_voltage {1.05} \
    -part_range ${range} \
    -adv_options {IO_DEFT_STD:LVCMOS 1.8V} \
    -adv_options {RESTRICTPROBEPINS:1} \
    -adv_options {RESTRICTSPIPINS:0} \
    -adv_options {SYSTEM_CONTROLLER_SUSPEND_MODE:0} \
    -adv_options TEMPR:${range} \
    -adv_options VCCI_1.2_VOLTR:${range} \
    -adv_options VCCI_1.5_VOLTR:${range} \
    -adv_options VCCI_1.8_VOLTR:${range} \
    -adv_options VCCI_2.5_VOLTR:${range} \
    -adv_options VCCI_3.3_VOLTR:${range} \
    -adv_options VOLTR:${range}

# Link VHDL top file and set as root
create_links -library {work} -hdl_source [file join ${local_dir} src ${project_name}.vhd]
check_hdl -file [file join ${local_dir} src ${project_name}.vhd]
build_design_hierarchy
set_root -module ${project_name}::work

# Add IO constraint files
create_links -library {work} -io_pdc [file join ${local_dir} constraints io Anios_0.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io Anios_1.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io BUTTONS.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io CLK_USR.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io Clk50.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io FMC.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io GigabitEthernet0.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io GigabitEthernet1.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io HDMI.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io I2C_FPGA.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io I2C_MIPI_SEL.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io I2C_PL.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io IO3.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io IO4.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io LED.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io MIPI0.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io MIPI1.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io MISC.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io OSC_100M.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io SDIO_SEL.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io ST1_LED.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io TPM.pdc]
create_links -library {work} -io_pdc [file join ${local_dir} constraints io UART.pdc]

# Organize IO and timing constraint management files
organize_tool_files -tool {PLACEROUTE} \
    -file [file join ${local_dir} constraints io Anios_0.pdc] \
    -file [file join ${local_dir} constraints io Anios_1.pdc] \
    -file [file join ${local_dir} constraints io BUTTONS.pdc] \
    -file [file join ${local_dir} constraints io CLK_USR.pdc] \
    -file [file join ${local_dir} constraints io Clk50.pdc] \
    -file [file join ${local_dir} constraints io FMC.pdc] \
    -file [file join ${local_dir} constraints io GigabitEthernet0.pdc] \
    -file [file join ${local_dir} constraints io GigabitEthernet1.pdc] \
    -file [file join ${local_dir} constraints io HDMI.pdc] \
    -file [file join ${local_dir} constraints io I2C_FPGA.pdc] \
    -file [file join ${local_dir} constraints io I2C_MIPI_SEL.pdc] \
    -file [file join ${local_dir} constraints io I2C_PL.pdc] \
    -file [file join ${local_dir} constraints io IO3.pdc] \
    -file [file join ${local_dir} constraints io IO4.pdc] \
    -file [file join ${local_dir} constraints io LED.pdc] \
    -file [file join ${local_dir} constraints io MIPI0.pdc] \
    -file [file join ${local_dir} constraints io MIPI1.pdc] \
    -file [file join ${local_dir} constraints io MISC.pdc] \
    -file [file join ${local_dir} constraints io OSC_100M.pdc] \
    -file [file join ${local_dir} constraints io SDIO_SEL.pdc] \
    -file [file join ${local_dir} constraints io ST1_LED.pdc] \
    -file [file join ${local_dir} constraints io TPM.pdc] \
    -file [file join ${local_dir} constraints io UART.pdc] \
    -module ${project_name}::work -input_type {constraint}

# Add additional HDL cores
create_links -library {work} -hdl_source [file join ${local_dir} src SdioSel.vhd]
check_hdl -file [file join ${local_dir} src SdioSel.vhd]
build_design_hierarchy

# Download required IP cores
download_core -vlnv {Actel:SgCore:PF_CCC:*} -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv {Actel:DirectCore:CORERESET_PF:*} -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv {Microsemi:SgCore:PFSOC_INIT_MONITOR:*} -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv {Actel:DirectCore:CoreAPB3:*} -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv {Actel:DirectCore:CoreGPIO:*} -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv {Actel:DirectCore:COREI2C:*} -location {www.microchip-ip.com/repositories/DirectCore}

# Source all individual components
source [file join components Mercury_MP1_CORE_APB3_INTERCONNECT.tcl]
source [file join components CLOCK_CONDITIONING_CIRCUITRY.tcl]
source [file join components CORERESET.tcl]
source [file join components INIT_MONITOR.tcl]
source [file join components Mercury_MP1_GPIO_LED.tcl]
source [file join components Mercury_MP1_GPIO_UART_SEL.tcl]
source [file join components COREI2C_FPGA.tcl]
build_design_hierarchy

# Source all SmartDesign components
source [file join components BIBUF_I2C.tcl]
source [file join components Mercury_MP1_UART_SEL.tcl]
source [file join components Mercury_MP1_CLOCKS_AND_RESETS.tcl]
source [file join components SdioSel.tcl]
build_design_hierarchy

# re-create smart design
# contains MSS settings, IP instances, DDR settings
# ----------------------------------------------------------------------------------------------------
source [file join scripts ${project_name}_sd.tcl]
# ----------------------------------------------------------------------------------------------------

puts "INFO: END of [info script]"
