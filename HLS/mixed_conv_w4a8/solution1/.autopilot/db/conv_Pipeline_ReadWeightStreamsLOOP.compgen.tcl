# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 32 \
    name filter_V \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_V \
    op interface \
    ports { filter_V_address0 { O 10 vector } filter_V_ce0 { O 1 bit } filter_V_we0 { O 1 bit } filter_V_d0 { O 64 vector } filter_V_address1 { O 10 vector } filter_V_ce1 { O 1 bit } filter_V_we1 { O 1 bit } filter_V_d1 { O 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 33 \
    name filter_V_15 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_V_15 \
    op interface \
    ports { filter_V_15_address0 { O 10 vector } filter_V_15_ce0 { O 1 bit } filter_V_15_we0 { O 1 bit } filter_V_15_d0 { O 64 vector } filter_V_15_address1 { O 10 vector } filter_V_15_ce1 { O 1 bit } filter_V_15_we1 { O 1 bit } filter_V_15_d1 { O 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 34 \
    name filter_V_14 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_V_14 \
    op interface \
    ports { filter_V_14_address0 { O 10 vector } filter_V_14_ce0 { O 1 bit } filter_V_14_we0 { O 1 bit } filter_V_14_d0 { O 64 vector } filter_V_14_address1 { O 10 vector } filter_V_14_ce1 { O 1 bit } filter_V_14_we1 { O 1 bit } filter_V_14_d1 { O 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 35 \
    name filter_V_13 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_V_13 \
    op interface \
    ports { filter_V_13_address0 { O 10 vector } filter_V_13_ce0 { O 1 bit } filter_V_13_we0 { O 1 bit } filter_V_13_d0 { O 64 vector } filter_V_13_address1 { O 10 vector } filter_V_13_ce1 { O 1 bit } filter_V_13_we1 { O 1 bit } filter_V_13_d1 { O 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 36 \
    name filter_V_12 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_V_12 \
    op interface \
    ports { filter_V_12_address0 { O 10 vector } filter_V_12_ce0 { O 1 bit } filter_V_12_we0 { O 1 bit } filter_V_12_d0 { O 64 vector } filter_V_12_address1 { O 10 vector } filter_V_12_ce1 { O 1 bit } filter_V_12_we1 { O 1 bit } filter_V_12_d1 { O 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 37 \
    name filter_V_11 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_V_11 \
    op interface \
    ports { filter_V_11_address0 { O 10 vector } filter_V_11_ce0 { O 1 bit } filter_V_11_we0 { O 1 bit } filter_V_11_d0 { O 64 vector } filter_V_11_address1 { O 10 vector } filter_V_11_ce1 { O 1 bit } filter_V_11_we1 { O 1 bit } filter_V_11_d1 { O 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 38 \
    name filter_V_10 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_V_10 \
    op interface \
    ports { filter_V_10_address0 { O 10 vector } filter_V_10_ce0 { O 1 bit } filter_V_10_we0 { O 1 bit } filter_V_10_d0 { O 64 vector } filter_V_10_address1 { O 10 vector } filter_V_10_ce1 { O 1 bit } filter_V_10_we1 { O 1 bit } filter_V_10_d1 { O 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 39 \
    name filter_V_9 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_V_9 \
    op interface \
    ports { filter_V_9_address0 { O 10 vector } filter_V_9_ce0 { O 1 bit } filter_V_9_we0 { O 1 bit } filter_V_9_d0 { O 64 vector } filter_V_9_address1 { O 10 vector } filter_V_9_ce1 { O 1 bit } filter_V_9_we1 { O 1 bit } filter_V_9_d1 { O 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 40 \
    name filter_V_8 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_V_8 \
    op interface \
    ports { filter_V_8_address0 { O 10 vector } filter_V_8_ce0 { O 1 bit } filter_V_8_we0 { O 1 bit } filter_V_8_d0 { O 64 vector } filter_V_8_address1 { O 10 vector } filter_V_8_ce1 { O 1 bit } filter_V_8_we1 { O 1 bit } filter_V_8_d1 { O 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 41 \
    name filter_V_7 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_V_7 \
    op interface \
    ports { filter_V_7_address0 { O 10 vector } filter_V_7_ce0 { O 1 bit } filter_V_7_we0 { O 1 bit } filter_V_7_d0 { O 64 vector } filter_V_7_address1 { O 10 vector } filter_V_7_ce1 { O 1 bit } filter_V_7_we1 { O 1 bit } filter_V_7_d1 { O 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 42 \
    name filter_V_6 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_V_6 \
    op interface \
    ports { filter_V_6_address0 { O 10 vector } filter_V_6_ce0 { O 1 bit } filter_V_6_we0 { O 1 bit } filter_V_6_d0 { O 64 vector } filter_V_6_address1 { O 10 vector } filter_V_6_ce1 { O 1 bit } filter_V_6_we1 { O 1 bit } filter_V_6_d1 { O 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 43 \
    name filter_V_5 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_V_5 \
    op interface \
    ports { filter_V_5_address0 { O 10 vector } filter_V_5_ce0 { O 1 bit } filter_V_5_we0 { O 1 bit } filter_V_5_d0 { O 64 vector } filter_V_5_address1 { O 10 vector } filter_V_5_ce1 { O 1 bit } filter_V_5_we1 { O 1 bit } filter_V_5_d1 { O 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 44 \
    name filter_V_4 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_V_4 \
    op interface \
    ports { filter_V_4_address0 { O 10 vector } filter_V_4_ce0 { O 1 bit } filter_V_4_we0 { O 1 bit } filter_V_4_d0 { O 64 vector } filter_V_4_address1 { O 10 vector } filter_V_4_ce1 { O 1 bit } filter_V_4_we1 { O 1 bit } filter_V_4_d1 { O 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 45 \
    name filter_V_3 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_V_3 \
    op interface \
    ports { filter_V_3_address0 { O 10 vector } filter_V_3_ce0 { O 1 bit } filter_V_3_we0 { O 1 bit } filter_V_3_d0 { O 64 vector } filter_V_3_address1 { O 10 vector } filter_V_3_ce1 { O 1 bit } filter_V_3_we1 { O 1 bit } filter_V_3_d1 { O 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 46 \
    name filter_V_2 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_V_2 \
    op interface \
    ports { filter_V_2_address0 { O 10 vector } filter_V_2_ce0 { O 1 bit } filter_V_2_we0 { O 1 bit } filter_V_2_d0 { O 64 vector } filter_V_2_address1 { O 10 vector } filter_V_2_ce1 { O 1 bit } filter_V_2_we1 { O 1 bit } filter_V_2_d1 { O 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 47 \
    name filter_V_1 \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename filter_V_1 \
    op interface \
    ports { filter_V_1_address0 { O 10 vector } filter_V_1_ce0 { O 1 bit } filter_V_1_we0 { O 1 bit } filter_V_1_d0 { O 64 vector } filter_V_1_address1 { O 10 vector } filter_V_1_ce1 { O 1 bit } filter_V_1_we1 { O 1 bit } filter_V_1_d1 { O 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_1'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 48 \
    name strm_in_V_data_V \
    reset_level 1 \
    sync_rst true \
    corename {strm_in} \
    metadata {  } \
    op interface \
    ports { strm_in_TVALID { I 1 bit } strm_in_TDATA { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'strm_in_V_data_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 49 \
    name strm_in_V_keep_V \
    reset_level 1 \
    sync_rst true \
    corename {strm_in} \
    metadata {  } \
    op interface \
    ports { strm_in_TKEEP { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'strm_in_V_keep_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 50 \
    name strm_in_V_strb_V \
    reset_level 1 \
    sync_rst true \
    corename {strm_in} \
    metadata {  } \
    op interface \
    ports { strm_in_TSTRB { I 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'strm_in_V_strb_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 51 \
    name strm_in_V_last_V \
    reset_level 1 \
    sync_rst true \
    corename {strm_in} \
    metadata {  } \
    op interface \
    ports { strm_in_TREADY { O 1 bit } strm_in_TLAST { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'strm_in_V_last_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name sext_ln190 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln190 \
    op interface \
    ports { sext_ln190 { I 30 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name totalWeightStreams \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_totalWeightStreams \
    op interface \
    ports { totalWeightStreams { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
    name streamsPerFilter \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_streamsPerFilter \
    op interface \
    ports { streamsPerFilter { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName conv_flow_control_loop_pipe_sequential_init_U
set CompName conv_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix conv_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


