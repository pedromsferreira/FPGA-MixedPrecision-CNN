// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XCONV_W2_H
#define XCONV_W2_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xconv_w2_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Bus1_BaseAddress;
} XConv_w2_Config;
#endif

typedef struct {
    u64 Bus1_BaseAddress;
    u32 IsReady;
} XConv_w2;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XConv_w2_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XConv_w2_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XConv_w2_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XConv_w2_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XConv_w2_Initialize(XConv_w2 *InstancePtr, u16 DeviceId);
XConv_w2_Config* XConv_w2_LookupConfig(u16 DeviceId);
int XConv_w2_CfgInitialize(XConv_w2 *InstancePtr, XConv_w2_Config *ConfigPtr);
#else
int XConv_w2_Initialize(XConv_w2 *InstancePtr, const char* InstanceName);
int XConv_w2_Release(XConv_w2 *InstancePtr);
#endif

void XConv_w2_Start(XConv_w2 *InstancePtr);
u32 XConv_w2_IsDone(XConv_w2 *InstancePtr);
u32 XConv_w2_IsIdle(XConv_w2 *InstancePtr);
u32 XConv_w2_IsReady(XConv_w2 *InstancePtr);
void XConv_w2_EnableAutoRestart(XConv_w2 *InstancePtr);
void XConv_w2_DisableAutoRestart(XConv_w2 *InstancePtr);

void XConv_w2_Set_numFilters(XConv_w2 *InstancePtr, u32 Data);
u32 XConv_w2_Get_numFilters(XConv_w2 *InstancePtr);
void XConv_w2_Set_numKernels(XConv_w2 *InstancePtr, u32 Data);
u32 XConv_w2_Get_numKernels(XConv_w2 *InstancePtr);
void XConv_w2_Set_inputMapSizeX(XConv_w2 *InstancePtr, u32 Data);
u32 XConv_w2_Get_inputMapSizeX(XConv_w2 *InstancePtr);
void XConv_w2_Set_inputMapSizeY(XConv_w2 *InstancePtr, u32 Data);
u32 XConv_w2_Get_inputMapSizeY(XConv_w2 *InstancePtr);
void XConv_w2_Set_ctrl(XConv_w2 *InstancePtr, u32 Data);
u32 XConv_w2_Get_ctrl(XConv_w2 *InstancePtr);

void XConv_w2_InterruptGlobalEnable(XConv_w2 *InstancePtr);
void XConv_w2_InterruptGlobalDisable(XConv_w2 *InstancePtr);
void XConv_w2_InterruptEnable(XConv_w2 *InstancePtr, u32 Mask);
void XConv_w2_InterruptDisable(XConv_w2 *InstancePtr, u32 Mask);
void XConv_w2_InterruptClear(XConv_w2 *InstancePtr, u32 Mask);
u32 XConv_w2_InterruptGetEnabled(XConv_w2 *InstancePtr);
u32 XConv_w2_InterruptGetStatus(XConv_w2 *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
