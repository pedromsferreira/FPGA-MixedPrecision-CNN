// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xconv_w2.h"

extern XConv_w2_Config XConv_w2_ConfigTable[];

XConv_w2_Config *XConv_w2_LookupConfig(u16 DeviceId) {
	XConv_w2_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XCONV_W2_NUM_INSTANCES; Index++) {
		if (XConv_w2_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XConv_w2_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XConv_w2_Initialize(XConv_w2 *InstancePtr, u16 DeviceId) {
	XConv_w2_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XConv_w2_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XConv_w2_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

