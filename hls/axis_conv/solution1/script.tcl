############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project axis_conv
add_files ../Sources/MiguelAReis/conv/conv-og.cpp
add_files ../Sources/conv/conv.cpp
add_files ../Sources/MiguelAReis/conv/convParameters-og.h
add_files ../Sources/conv/convParameters.h
add_files -tb ../Sources/MiguelAReis/conv/tb_conv-og.cpp
add_files -tb ../Sources/conv/tb_conv.cpp
open_solution "solution1" -flow_target vivado
set_part {xczu1eg-ubva494-1-e}
create_clock -period 10 -name default
#source "./axis_conv/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
