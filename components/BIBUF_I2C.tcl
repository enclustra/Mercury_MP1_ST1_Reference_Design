# Creating SmartDesign BIBUF_I2C
set sd_name {BIBUF_I2C}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {BIBUF_I2C_SCL_E} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BIBUF_I2C_SDA_E} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {BIBUF_I2C_SCL_Y} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {BIBUF_I2C_SDA_Y} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_SDA} -port_direction {INOUT} -port_is_pad {1}


# Add BIBUF_I2C_SCL instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_I2C_SCL}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_I2C_SCL:D} -value {GND}



# Add BIBUF_I2C_SDA instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_I2C_SDA}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BIBUF_I2C_SDA:D} -value {GND}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C_SCL:E" "BIBUF_I2C_SCL_E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C_SCL:PAD" "I2C_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C_SCL:Y" "BIBUF_I2C_SCL_Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C_SDA:E" "BIBUF_I2C_SDA_E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C_SDA:PAD" "I2C_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_I2C_SDA:Y" "BIBUF_I2C_SDA_Y" }



# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign BIBUF_I2C
generate_component -component_name ${sd_name}
