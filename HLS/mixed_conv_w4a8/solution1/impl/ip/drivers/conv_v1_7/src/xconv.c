// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xconv.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XConv_CfgInitialize(XConv *InstancePtr, XConv_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Bus1_BaseAddress = ConfigPtr->Bus1_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XConv_Start(XConv *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_AP_CTRL) & 0x80;
    XConv_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_AP_CTRL, Data | 0x01);
}

u32 XConv_IsDone(XConv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XConv_IsIdle(XConv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XConv_IsReady(XConv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XConv_EnableAutoRestart(XConv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_AP_CTRL, 0x80);
}

void XConv_DisableAutoRestart(XConv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_AP_CTRL, 0);
}

void XConv_Set_numFilters(XConv *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_NUMFILTERS_DATA, Data);
}

u32 XConv_Get_numFilters(XConv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_NUMFILTERS_DATA);
    return Data;
}

void XConv_Set_numKernels(XConv *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_NUMKERNELS_DATA, Data);
}

u32 XConv_Get_numKernels(XConv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_NUMKERNELS_DATA);
    return Data;
}

void XConv_Set_inputMapSizeX(XConv *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_INPUTMAPSIZEX_DATA, Data);
}

u32 XConv_Get_inputMapSizeX(XConv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_INPUTMAPSIZEX_DATA);
    return Data;
}

void XConv_Set_inputMapSizeY(XConv *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_INPUTMAPSIZEY_DATA, Data);
}

u32 XConv_Get_inputMapSizeY(XConv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_INPUTMAPSIZEY_DATA);
    return Data;
}

void XConv_Set_ctrl(XConv *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_CTRL_DATA, Data);
}

u32 XConv_Get_ctrl(XConv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XConv_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_CTRL_DATA);
    return Data;
}

void XConv_InterruptGlobalEnable(XConv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_GIE, 1);
}

void XConv_InterruptGlobalDisable(XConv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_GIE, 0);
}

void XConv_InterruptEnable(XConv *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XConv_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_IER);
    XConv_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_IER, Register | Mask);
}

void XConv_InterruptDisable(XConv *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XConv_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_IER);
    XConv_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_IER, Register & (~Mask));
}

void XConv_InterruptClear(XConv *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XConv_WriteReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_ISR, Mask);
}

u32 XConv_InterruptGetEnabled(XConv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XConv_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_IER);
}

u32 XConv_InterruptGetStatus(XConv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XConv_ReadReg(InstancePtr->Bus1_BaseAddress, XCONV_BUS1_ADDR_ISR);
}

