# This script segment is generated automatically by AutoPilot

set name conv_mul_10ns_2ns_12_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name conv_urem_12ns_4ns_4_16_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {urem} IMPL {auto} LATENCY 15 ALLOW_PRAGMA 1
}


set name conv_mul_10ns_3ns_13_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name conv_mul_13ns_3ns_16_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name conv_mul_16ns_30s_32_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name conv_mul_3ns_30s_32_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name conv_mul_32s_2ns_32_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name conv_mul_8ns_4s_12_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set name conv_mul_9s_4s_13_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set id 315
set name conv_mac_muladd_8ns_4s_12s_13_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 8
set in0_signed 0
set in1_width 4
set in1_signed 1
set in2_width 12
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 13
set arg_lists {i0 {8 0 +} i1 {4 1 +} m {12 1 +} i2 {12 1 +} p {13 1 +} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp48} LATENCY 3 ALLOW_PRAGMA 1
}


set op mac
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


set id 316
set name conv_mac_muladd_9s_4s_13s_14_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 9
set in0_signed 1
set in1_width 4
set in1_signed 1
set in2_width 13
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 14
set arg_lists {i0 {9 1 +} i1 {4 1 +} m {13 1 +} i2 {13 1 +} p {14 1 +} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp48} LATENCY 3 ALLOW_PRAGMA 1
}


set op mac
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


set id 347
set name conv_mac_muladd_8ns_4s_32s_32_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 8
set in0_signed 0
set in1_width 4
set in1_signed 1
set in2_width 32
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 32
set arg_lists {i0 {8 0 +} i1 {4 1 +} m {12 1 +} i2 {32 1 +} p {32 1 +} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp48} LATENCY 3 ALLOW_PRAGMA 1
}


set op mac
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


set id 354
set name conv_mac_muladd_8ns_4s_13s_14_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 8
set in0_signed 0
set in1_width 4
set in1_signed 1
set in2_width 13
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 14
set arg_lists {i0 {8 0 +} i1 {4 1 +} m {12 1 +} i2 {13 1 +} p {14 1 +} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp48} LATENCY 3 ALLOW_PRAGMA 1
}


set op mac
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


set id 355
set name conv_mac_muladd_9s_4s_32s_32_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 9
set in0_signed 1
set in1_width 4
set in1_signed 1
set in2_width 32
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 32
set arg_lists {i0 {9 1 +} i1 {4 1 +} m {13 1 +} i2 {32 1 +} p {32 1 +} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp48} LATENCY 3 ALLOW_PRAGMA 1
}


set op mac
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


set id 362
set name conv_mac_muladd_9s_4s_14s_14_4_1
set corename simcore_mac
set op mac
set stage_num 4
set clk_width 1
set clk_signed 0
set reset_width 1
set reset_signed 0
set in0_width 9
set in0_signed 1
set in1_width 4
set in1_signed 1
set in2_width 14
set in2_signed 1
set ce_width 1
set ce_signed 0
set out_width 14
set arg_lists {i0 {9 1 +} i1 {4 1 +} m {13 1 +} i2 {14 1 +} p {14 1 +} c_reg {1} rnd {0} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {all} IMPL {dsp48} LATENCY 3 ALLOW_PRAGMA 1
}


set op mac
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    clk_width ${clk_width} \
    clk_signed ${clk_signed} \
    reset_width ${reset_width} \
    reset_signed ${reset_signed} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    ce_width ${ce_width} \
    ce_signed ${ce_signed} \
    out_width ${out_width} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


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
    id 685 \
    name bias_V \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bias_V \
    op interface \
    ports { bias_V_address0 { O 3 vector } bias_V_ce0 { O 1 bit } bias_V_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bias_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 687 \
    name bias_V_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bias_V_1 \
    op interface \
    ports { bias_V_1_address0 { O 3 vector } bias_V_1_ce0 { O 1 bit } bias_V_1_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bias_V_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 688 \
    name bias_V_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bias_V_2 \
    op interface \
    ports { bias_V_2_address0 { O 3 vector } bias_V_2_ce0 { O 1 bit } bias_V_2_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bias_V_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 689 \
    name bias_V_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bias_V_3 \
    op interface \
    ports { bias_V_3_address0 { O 3 vector } bias_V_3_ce0 { O 1 bit } bias_V_3_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bias_V_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 690 \
    name bias_V_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bias_V_4 \
    op interface \
    ports { bias_V_4_address0 { O 3 vector } bias_V_4_ce0 { O 1 bit } bias_V_4_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bias_V_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 691 \
    name bias_V_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bias_V_5 \
    op interface \
    ports { bias_V_5_address0 { O 3 vector } bias_V_5_ce0 { O 1 bit } bias_V_5_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bias_V_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 692 \
    name bias_V_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bias_V_6 \
    op interface \
    ports { bias_V_6_address0 { O 3 vector } bias_V_6_ce0 { O 1 bit } bias_V_6_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bias_V_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 693 \
    name bias_V_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bias_V_7 \
    op interface \
    ports { bias_V_7_address0 { O 3 vector } bias_V_7_ce0 { O 1 bit } bias_V_7_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bias_V_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 694 \
    name bias_V_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bias_V_8 \
    op interface \
    ports { bias_V_8_address0 { O 3 vector } bias_V_8_ce0 { O 1 bit } bias_V_8_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bias_V_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 695 \
    name bias_V_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bias_V_9 \
    op interface \
    ports { bias_V_9_address0 { O 3 vector } bias_V_9_ce0 { O 1 bit } bias_V_9_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bias_V_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 696 \
    name bias_V_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bias_V_10 \
    op interface \
    ports { bias_V_10_address0 { O 3 vector } bias_V_10_ce0 { O 1 bit } bias_V_10_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bias_V_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 697 \
    name bias_V_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bias_V_11 \
    op interface \
    ports { bias_V_11_address0 { O 3 vector } bias_V_11_ce0 { O 1 bit } bias_V_11_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bias_V_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 698 \
    name bias_V_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bias_V_12 \
    op interface \
    ports { bias_V_12_address0 { O 3 vector } bias_V_12_ce0 { O 1 bit } bias_V_12_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bias_V_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 699 \
    name bias_V_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bias_V_13 \
    op interface \
    ports { bias_V_13_address0 { O 3 vector } bias_V_13_ce0 { O 1 bit } bias_V_13_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bias_V_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 700 \
    name bias_V_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bias_V_14 \
    op interface \
    ports { bias_V_14_address0 { O 3 vector } bias_V_14_ce0 { O 1 bit } bias_V_14_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bias_V_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 701 \
    name bias_V_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename bias_V_15 \
    op interface \
    ports { bias_V_15_address0 { O 3 vector } bias_V_15_ce0 { O 1 bit } bias_V_15_q0 { I 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bias_V_15'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 702 \
    name inputMap_V \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename inputMap_V \
    op interface \
    ports { inputMap_V_address0 { O 11 vector } inputMap_V_ce0 { O 1 bit } inputMap_V_we0 { O 1 bit } inputMap_V_d0 { O 128 vector } inputMap_V_address1 { O 11 vector } inputMap_V_ce1 { O 1 bit } inputMap_V_q1 { I 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'inputMap_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 703 \
    name filter_V \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename filter_V \
    op interface \
    ports { filter_V_address0 { O 10 vector } filter_V_ce0 { O 1 bit } filter_V_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 704 \
    name filter_V_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename filter_V_1 \
    op interface \
    ports { filter_V_1_address0 { O 10 vector } filter_V_1_ce0 { O 1 bit } filter_V_1_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 705 \
    name filter_V_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename filter_V_2 \
    op interface \
    ports { filter_V_2_address0 { O 10 vector } filter_V_2_ce0 { O 1 bit } filter_V_2_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 706 \
    name filter_V_3 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename filter_V_3 \
    op interface \
    ports { filter_V_3_address0 { O 10 vector } filter_V_3_ce0 { O 1 bit } filter_V_3_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 707 \
    name filter_V_4 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename filter_V_4 \
    op interface \
    ports { filter_V_4_address0 { O 10 vector } filter_V_4_ce0 { O 1 bit } filter_V_4_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 708 \
    name filter_V_5 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename filter_V_5 \
    op interface \
    ports { filter_V_5_address0 { O 10 vector } filter_V_5_ce0 { O 1 bit } filter_V_5_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 709 \
    name filter_V_6 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename filter_V_6 \
    op interface \
    ports { filter_V_6_address0 { O 10 vector } filter_V_6_ce0 { O 1 bit } filter_V_6_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 710 \
    name filter_V_7 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename filter_V_7 \
    op interface \
    ports { filter_V_7_address0 { O 10 vector } filter_V_7_ce0 { O 1 bit } filter_V_7_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 711 \
    name filter_V_8 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename filter_V_8 \
    op interface \
    ports { filter_V_8_address0 { O 10 vector } filter_V_8_ce0 { O 1 bit } filter_V_8_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 712 \
    name filter_V_9 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename filter_V_9 \
    op interface \
    ports { filter_V_9_address0 { O 10 vector } filter_V_9_ce0 { O 1 bit } filter_V_9_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_9'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 713 \
    name filter_V_10 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename filter_V_10 \
    op interface \
    ports { filter_V_10_address0 { O 10 vector } filter_V_10_ce0 { O 1 bit } filter_V_10_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_10'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 714 \
    name filter_V_11 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename filter_V_11 \
    op interface \
    ports { filter_V_11_address0 { O 10 vector } filter_V_11_ce0 { O 1 bit } filter_V_11_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_11'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 715 \
    name filter_V_12 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename filter_V_12 \
    op interface \
    ports { filter_V_12_address0 { O 10 vector } filter_V_12_ce0 { O 1 bit } filter_V_12_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_12'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 716 \
    name filter_V_13 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename filter_V_13 \
    op interface \
    ports { filter_V_13_address0 { O 10 vector } filter_V_13_ce0 { O 1 bit } filter_V_13_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_13'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 717 \
    name filter_V_14 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename filter_V_14 \
    op interface \
    ports { filter_V_14_address0 { O 10 vector } filter_V_14_ce0 { O 1 bit } filter_V_14_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_14'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 718 \
    name filter_V_15 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename filter_V_15 \
    op interface \
    ports { filter_V_15_address0 { O 10 vector } filter_V_15_ce0 { O 1 bit } filter_V_15_q0 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'filter_V_15'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 732 \
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
    id 733 \
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
    id 734 \
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
    id 735 \
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


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 738 \
    name strm_out_V_data_V \
    reset_level 1 \
    sync_rst true \
    corename {strm_out} \
    metadata {  } \
    op interface \
    ports { strm_out_TREADY { I 1 bit } strm_out_TDATA { O 128 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'strm_out_V_data_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 739 \
    name strm_out_V_keep_V \
    reset_level 1 \
    sync_rst true \
    corename {strm_out} \
    metadata {  } \
    op interface \
    ports { strm_out_TKEEP { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'strm_out_V_keep_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 740 \
    name strm_out_V_strb_V \
    reset_level 1 \
    sync_rst true \
    corename {strm_out} \
    metadata {  } \
    op interface \
    ports { strm_out_TSTRB { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'strm_out_V_strb_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 741 \
    name strm_out_V_last_V \
    reset_level 1 \
    sync_rst true \
    corename {strm_out} \
    metadata {  } \
    op interface \
    ports { strm_out_TVALID { O 1 bit } strm_out_TLAST { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'strm_out_V_last_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 618 \
    name read_OK \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_read_OK \
    op interface \
    ports { read_OK { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 619 \
    name readLines_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_readLines_reload \
    op interface \
    ports { readLines_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 620 \
    name id_save_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_id_save_reload \
    op interface \
    ports { id_save_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 621 \
    name idx_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_idx_reload \
    op interface \
    ports { idx_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 622 \
    name y_limit_V_1_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_y_limit_V_1_cast \
    op interface \
    ports { y_limit_V_1_cast { I 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 623 \
    name stride_V_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_stride_V_cast \
    op interface \
    ports { stride_V_cast { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 624 \
    name sub_i_i \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub_i_i \
    op interface \
    ports { sub_i_i { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 625 \
    name x_limit_V_1_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_x_limit_V_1_cast \
    op interface \
    ports { x_limit_V_1_cast { I 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 626 \
    name sub_i_i41 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub_i_i41 \
    op interface \
    ports { sub_i_i41 { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 627 \
    name zext_ln376 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln376 \
    op interface \
    ports { zext_ln376 { I 4 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 628 \
    name zext_ln319_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln319_1 \
    op interface \
    ports { zext_ln319_1 { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 629 \
    name numFilters \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_numFilters \
    op interface \
    ports { numFilters { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 630 \
    name sub_i_i72 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub_i_i72 \
    op interface \
    ports { sub_i_i72 { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 631 \
    name signedOp \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_signedOp \
    op interface \
    ports { signedOp { I 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 632 \
    name ky_limit_V_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ky_limit_V_cast \
    op interface \
    ports { ky_limit_V_cast { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 633 \
    name sub_i_i195 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub_i_i195 \
    op interface \
    ports { sub_i_i195 { I 4 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 634 \
    name zext_ln319 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln319 \
    op interface \
    ports { zext_ln319 { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 635 \
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
    id 636 \
    name mul_ln329_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mul_ln329_4 \
    op interface \
    ports { mul_ln329_4 { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 637 \
    name mul_ln329_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mul_ln329_3 \
    op interface \
    ports { mul_ln329_3 { I 54 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 638 \
    name cmp_i_i523_mid1954 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp_i_i523_mid1954 \
    op interface \
    ports { cmp_i_i523_mid1954 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 639 \
    name notrhs_mid1960 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_notrhs_mid1960 \
    op interface \
    ports { notrhs_mid1960 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 640 \
    name cmp_i_i530_mid1972 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp_i_i530_mid1972 \
    op interface \
    ports { cmp_i_i530_mid1972 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 641 \
    name cmp243_mid1986 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp243_mid1986 \
    op interface \
    ports { cmp243_mid1986 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 642 \
    name cmp243_1_mid1994 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp243_1_mid1994 \
    op interface \
    ports { cmp243_1_mid1994 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 643 \
    name cmp243_2_mid11006 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp243_2_mid11006 \
    op interface \
    ports { cmp243_2_mid11006 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 644 \
    name cmp243_3_mid11018 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp243_3_mid11018 \
    op interface \
    ports { cmp243_3_mid11018 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 645 \
    name cmp243_4_mid11030 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp243_4_mid11030 \
    op interface \
    ports { cmp243_4_mid11030 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 646 \
    name cmp243_5_mid11042 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp243_5_mid11042 \
    op interface \
    ports { cmp243_5_mid11042 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 647 \
    name cmp243_6_mid11054 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp243_6_mid11054 \
    op interface \
    ports { cmp243_6_mid11054 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 648 \
    name cmp243_7_mid11066 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp243_7_mid11066 \
    op interface \
    ports { cmp243_7_mid11066 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 649 \
    name cmp243_8_mid11078 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp243_8_mid11078 \
    op interface \
    ports { cmp243_8_mid11078 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 650 \
    name cmp243_9_mid11090 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp243_9_mid11090 \
    op interface \
    ports { cmp243_9_mid11090 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 651 \
    name cmp243_10_mid11102 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp243_10_mid11102 \
    op interface \
    ports { cmp243_10_mid11102 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 652 \
    name cmp243_11_mid11114 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp243_11_mid11114 \
    op interface \
    ports { cmp243_11_mid11114 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 653 \
    name cmp243_12_mid11126 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp243_12_mid11126 \
    op interface \
    ports { cmp243_12_mid11126 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 654 \
    name cmp243_13_mid11138 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp243_13_mid11138 \
    op interface \
    ports { cmp243_13_mid11138 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 655 \
    name cmp243_14_mid11150 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp243_14_mid11150 \
    op interface \
    ports { cmp243_14_mid11150 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 656 \
    name cmp243_15_mid11162 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp243_15_mid11162 \
    op interface \
    ports { cmp243_15_mid11162 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 657 \
    name notlhs_mid11170 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_notlhs_mid11170 \
    op interface \
    ports { notlhs_mid11170 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 658 \
    name and_ln279_16 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln279_16 \
    op interface \
    ports { and_ln279_16 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 659 \
    name and_ln279_17 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln279_17 \
    op interface \
    ports { and_ln279_17 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 660 \
    name and_ln279_18 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln279_18 \
    op interface \
    ports { and_ln279_18 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 661 \
    name and_ln279_19 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln279_19 \
    op interface \
    ports { and_ln279_19 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 662 \
    name and_ln279_20 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln279_20 \
    op interface \
    ports { and_ln279_20 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 663 \
    name and_ln279_21 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln279_21 \
    op interface \
    ports { and_ln279_21 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 664 \
    name and_ln279_22 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln279_22 \
    op interface \
    ports { and_ln279_22 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 665 \
    name and_ln279_23 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln279_23 \
    op interface \
    ports { and_ln279_23 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 666 \
    name and_ln279_24 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln279_24 \
    op interface \
    ports { and_ln279_24 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 667 \
    name and_ln279_25 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln279_25 \
    op interface \
    ports { and_ln279_25 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 668 \
    name and_ln279_26 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln279_26 \
    op interface \
    ports { and_ln279_26 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 669 \
    name and_ln279_27 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln279_27 \
    op interface \
    ports { and_ln279_27 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 670 \
    name and_ln279_28 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln279_28 \
    op interface \
    ports { and_ln279_28 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 671 \
    name and_ln279_29 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln279_29 \
    op interface \
    ports { and_ln279_29 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 672 \
    name and_ln279_30 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln279_30 \
    op interface \
    ports { and_ln279_30 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 673 \
    name and_ln279_31 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln279_31 \
    op interface \
    ports { and_ln279_31 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 674 \
    name cmp_i_i537_mid11214 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp_i_i537_mid11214 \
    op interface \
    ports { cmp_i_i537_mid11214 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 675 \
    name cmp_i_i172_mid11224 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp_i_i172_mid11224 \
    op interface \
    ports { cmp_i_i172_mid11224 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 676 \
    name numKernels \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_numKernels \
    op interface \
    ports { numKernels { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 677 \
    name empty \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty \
    op interface \
    ports { empty { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 678 \
    name mul_ln329 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mul_ln329 \
    op interface \
    ports { mul_ln329 { I 31 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 679 \
    name icmp_ln1027_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_icmp_ln1027_4 \
    op interface \
    ports { icmp_ln1027_4 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 680 \
    name mul_ln329_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mul_ln329_1 \
    op interface \
    ports { mul_ln329_1 { I 34 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 681 \
    name icmp_ln1027_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_icmp_ln1027_5 \
    op interface \
    ports { icmp_ln1027_5 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 682 \
    name mul_ln329_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mul_ln329_2 \
    op interface \
    ports { mul_ln329_2 { I 44 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 683 \
    name icmp_ln1027_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_icmp_ln1027_6 \
    op interface \
    ports { icmp_ln1027_6 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 684 \
    name kn_limit \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_kn_limit \
    op interface \
    ports { kn_limit { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 686 \
    name biasScale_V_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_biasScale_V_cast \
    op interface \
    ports { biasScale_V_cast { I 4 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 719 \
    name inputMapSizeY_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inputMapSizeY_1 \
    op interface \
    ports { inputMapSizeY_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 720 \
    name inputMapLineAddr_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inputMapLineAddr_reload \
    op interface \
    ports { inputMapLineAddr_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 721 \
    name inputMapLineAddr_1_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inputMapLineAddr_1_reload \
    op interface \
    ports { inputMapLineAddr_1_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 722 \
    name inputMapLineAddr_2_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inputMapLineAddr_2_reload \
    op interface \
    ports { inputMapLineAddr_2_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 723 \
    name inputMapLineAddr_3_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inputMapLineAddr_3_reload \
    op interface \
    ports { inputMapLineAddr_3_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 724 \
    name inputMapLineAddr_4_reload \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_inputMapLineAddr_4_reload \
    op interface \
    ports { inputMapLineAddr_4_reload { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 725 \
    name zext_ln1494_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln1494_1 \
    op interface \
    ports { zext_ln1494_1 { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 726 \
    name streamsPerInputLine \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_streamsPerInputLine \
    op interface \
    ports { streamsPerInputLine { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 727 \
    name mul_i_i258 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mul_i_i258 \
    op interface \
    ports { mul_i_i258 { I 34 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 728 \
    name zext_ln298 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln298 \
    op interface \
    ports { zext_ln298 { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 729 \
    name paddingIters \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_paddingIters \
    op interface \
    ports { paddingIters { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 730 \
    name xPadUpperLimit \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_xPadUpperLimit \
    op interface \
    ports { xPadUpperLimit { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 731 \
    name yPadUpperLimit \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_yPadUpperLimit \
    op interface \
    ports { yPadUpperLimit { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 736 \
    name tobool10_not \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tobool10_not \
    op interface \
    ports { tobool10_not { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 737 \
    name conv_i_i125 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_conv_i_i125 \
    op interface \
    ports { conv_i_i125 { I 3 vector } } \
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


