create_hdl_core -file [file join ${local_dir} src SdioSel.vhd ] -module {SdioSel} -library {work} -package {}
hdl_core_add_bif -hdl_core_name {SdioSel} -bif_definition {APB:AMBA:AMBA2:slave} -bif_name {APB_bif} -signal_map {}
hdl_core_assign_bif_signal -hdl_core_name {SdioSel} -bif_name {APB_bif} -bif_signal_name {PADDR} -core_signal_name {PAddr}
hdl_core_assign_bif_signal -hdl_core_name {SdioSel} -bif_name {APB_bif} -bif_signal_name {PENABLE} -core_signal_name {PEnable}
hdl_core_assign_bif_signal -hdl_core_name {SdioSel} -bif_name {APB_bif} -bif_signal_name {PWRITE} -core_signal_name {PWrite}
hdl_core_assign_bif_signal -hdl_core_name {SdioSel} -bif_name {APB_bif} -bif_signal_name {PRDATA} -core_signal_name {PReadData}
hdl_core_assign_bif_signal -hdl_core_name {SdioSel} -bif_name {APB_bif} -bif_signal_name {PWDATA} -core_signal_name {PWriteData}
hdl_core_assign_bif_signal -hdl_core_name {SdioSel} -bif_name {APB_bif} -bif_signal_name {PREADY} -core_signal_name {PReady}
hdl_core_assign_bif_signal -hdl_core_name {SdioSel} -bif_name {APB_bif} -bif_signal_name {PSLVERR} -core_signal_name {PSlvError}
hdl_core_assign_bif_signal -hdl_core_name {SdioSel} -bif_name {APB_bif} -bif_signal_name {PSELx} -core_signal_name {PSel}