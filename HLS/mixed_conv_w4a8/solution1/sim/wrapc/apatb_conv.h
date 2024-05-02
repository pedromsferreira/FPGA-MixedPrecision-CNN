// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================

extern "C" void AESL_WRAP_conv (
hls::stream<struct ap_axis<32, 0, 0, 0 > > (&strm_in),
hls::stream<struct ap_axis<32, 0, 0, 0 > > (&strm_out),
int numFilters,
int numKernels,
int inputMapSizeX,
int inputMapSizeY,
int ctrl);
