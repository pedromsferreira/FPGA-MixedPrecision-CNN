############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project mixed_conv_w2a8
set_top conv_w2
add_files sources/mixed_conv_w2/mixed_conv.h
add_files sources/mixed_conv_w2/mixed_conv.cpp
add_files -tb sources/mixed_conv_w2/tb_mixed_conv.cpp -cflags "-Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xczu7ev-ffvc1156-2-e}
create_clock -period 10 -name default
config_export -display_name mixed_conv_w2 -format ip_catalog -output /home/pferreira/HwSw/Vivado/IPs -rtl verilog -version 1.7
set_clock_uncertainty 0
source "./mixed_conv_w2a8/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design -trace_level all
export_design -rtl verilog -format ip_catalog -output /home/pferreira/HwSw/Vivado/IPs
