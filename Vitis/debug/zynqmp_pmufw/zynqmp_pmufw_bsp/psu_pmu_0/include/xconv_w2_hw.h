// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// BUS1
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of numFilters
//        bit 31~0 - numFilters[31:0] (Read/Write)
// 0x14 : reserved
// 0x18 : Data signal of numKernels
//        bit 31~0 - numKernels[31:0] (Read/Write)
// 0x1c : reserved
// 0x20 : Data signal of inputMapSizeX
//        bit 31~0 - inputMapSizeX[31:0] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of inputMapSizeY
//        bit 31~0 - inputMapSizeY[31:0] (Read/Write)
// 0x2c : reserved
// 0x30 : Data signal of ctrl
//        bit 31~0 - ctrl[31:0] (Read/Write)
// 0x34 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XCONV_W2_BUS1_ADDR_AP_CTRL            0x00
#define XCONV_W2_BUS1_ADDR_GIE                0x04
#define XCONV_W2_BUS1_ADDR_IER                0x08
#define XCONV_W2_BUS1_ADDR_ISR                0x0c
#define XCONV_W2_BUS1_ADDR_NUMFILTERS_DATA    0x10
#define XCONV_W2_BUS1_BITS_NUMFILTERS_DATA    32
#define XCONV_W2_BUS1_ADDR_NUMKERNELS_DATA    0x18
#define XCONV_W2_BUS1_BITS_NUMKERNELS_DATA    32
#define XCONV_W2_BUS1_ADDR_INPUTMAPSIZEX_DATA 0x20
#define XCONV_W2_BUS1_BITS_INPUTMAPSIZEX_DATA 32
#define XCONV_W2_BUS1_ADDR_INPUTMAPSIZEY_DATA 0x28
#define XCONV_W2_BUS1_BITS_INPUTMAPSIZEY_DATA 32
#define XCONV_W2_BUS1_ADDR_CTRL_DATA          0x30
#define XCONV_W2_BUS1_BITS_CTRL_DATA          32

