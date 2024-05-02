// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xconv_w2.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XConv_w2_CfgInitialize(XConv_w2 *InstancePtr, XConv_w2_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Bus1_BaseAddress = ConfigPtr->Bus1_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XConv_w2_Start(XConv_w2 *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv_w2_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_AP_CTRL) & 0x80;
    XConv_w2_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_AP_CTRL, Data | 0x01);
}

u32 XConv_w2_IsDone(XConv_w2 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv_w2_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XConv_w2_IsIdle(XConv_w2 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv_w2_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XConv_w2_IsReady(XConv_w2 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv_w2_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XConv_w2_EnableAutoRestart(XConv_w2 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_w2_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_AP_CTRL, 0x80);
}

void XConv_w2_DisableAutoRestart(XConv_w2 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_w2_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_AP_CTRL, 0);
}

void XConv_w2_Set_numFilters(XConv_w2 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_w2_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_NUMFILTERS_DATA, Data);
}

u32 XConv_w2_Get_numFilters(XConv_w2 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv_w2_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_NUMFILTERS_DATA);
    return Data;
}

void XConv_w2_Set_numKernels(XConv_w2 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_w2_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_NUMKERNELS_DATA, Data);
}

u32 XConv_w2_Get_numKernels(XConv_w2 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv_w2_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_NUMKERNELS_DATA);
    return Data;
}

void XConv_w2_Set_inputMapSizeX(XConv_w2 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_w2_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_INPUTMAPSIZEX_DATA, Data);
}

u32 XConv_w2_Get_inputMapSizeX(XConv_w2 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv_w2_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_INPUTMAPSIZEX_DATA);
    return Data;
}

void XConv_w2_Set_inputMapSizeY(XConv_w2 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_w2_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_INPUTMAPSIZEY_DATA, Data);
}

u32 XConv_w2_Get_inputMapSizeY(XConv_w2 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv_w2_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_INPUTMAPSIZEY_DATA);
    return Data;
}

void XConv_w2_Set_ctrl(XConv_w2 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_w2_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_CTRL_DATA, Data);
}

u32 XConv_w2_Get_ctrl(XConv_w2 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv_w2_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_CTRL_DATA);
    return Data;
}

void XConv_w2_InterruptGlobalEnable(XConv_w2 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_w2_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_GIE, 1);
}

void XConv_w2_InterruptGlobalDisable(XConv_w2 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_w2_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_GIE, 0);
}

void XConv_w2_InterruptEnable(XConv_w2 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XConv_w2_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_IER);
    XConv_w2_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_IER, Register | Mask);
}

void XConv_w2_InterruptDisable(XConv_w2 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XConv_w2_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_IER);
    XConv_w2_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_IER, Register & (~Mask));
}

void XConv_w2_InterruptClear(XConv_w2 *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_w2_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_ISR, Mask);
}

u32 XConv_w2_InterruptGetEnabled(XConv_w2 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XConv_w2_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_IER);
}

u32 XConv_w2_InterruptGetStatus(XConv_w2 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XConv_w2_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_W2_BUS1_ADDR_ISR);
}

