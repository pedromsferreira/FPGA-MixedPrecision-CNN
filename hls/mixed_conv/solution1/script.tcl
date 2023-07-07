############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project mixed_conv
set_top conv
add_files ../Sources/conv/mixed_conv.h
add_files ../Sources/conv/mixed_conv.cpp
add_files -tb ../Sources/conv/tb_mixed_conv.cpp -cflags "-Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xczu3eg-sbva484-1-i}
create_clock -period 10 -name default
#source "./mixed_conv/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
