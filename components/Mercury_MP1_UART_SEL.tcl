# Creating SmartDesign MERCURY_MP1_UART_SEL
set sd_name {MERCURY_MP1_UART_SEL}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART_TX_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART_TX_1} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {TX} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART_RX_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART_RX_1} -port_direction {OUT}



# Add AND_UART_TX instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND_UART_TX}



# Add OR_UART_SEL_UART_RX_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OR2} -instance_name {OR_UART_SEL_UART_RX_0}



# Add OR_UART_SEL_UART_RX_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OR2} -instance_name {OR_UART_SEL_UART_RX_1}
sd_invert_pins -sd_name ${sd_name} -pin_names {OR_UART_SEL_UART_RX_1:B}



# Add OR_UART_SEL_UART_TX_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OR2} -instance_name {OR_UART_SEL_UART_TX_0}



# Add OR_UART_SEL_UART_TX_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OR2} -instance_name {OR_UART_SEL_UART_TX_1}
sd_invert_pins -sd_name ${sd_name} -pin_names {OR_UART_SEL_UART_TX_1:B}



# Add scalar net connections
sd_create_scalar_net -sd_name ${sd_name} -net_name {SEL}
sd_connect_net_to_pins -sd_name ${sd_name} -net_name {SEL} -pin_names {"OR_UART_SEL_UART_RX_0:B" "OR_UART_SEL_UART_RX_1:B" "OR_UART_SEL_UART_TX_0:B" "OR_UART_SEL_UART_TX_1:B" "SEL" }

sd_connect_pins -sd_name ${sd_name} -pin_names {"AND_UART_TX:A" "OR_UART_SEL_UART_TX_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND_UART_TX:B" "OR_UART_SEL_UART_TX_1:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND_UART_TX:Y" "TX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"OR_UART_SEL_UART_RX_0:A" "OR_UART_SEL_UART_RX_1:A" "RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"OR_UART_SEL_UART_RX_0:Y" "UART_RX_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"OR_UART_SEL_UART_RX_1:Y" "UART_RX_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"OR_UART_SEL_UART_TX_0:A" "UART_TX_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"OR_UART_SEL_UART_TX_1:A" "UART_TX_1" }



# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign MERCURY_MP1_UART_SEL
generate_component -component_name ${sd_name}
