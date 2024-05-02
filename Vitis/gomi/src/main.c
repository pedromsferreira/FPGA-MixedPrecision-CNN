#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "xtime_l.h"
#include "xparameters_ps.h"
#include "xparameters.h"
#include "xconv.h"
#include "xconv_hw.h"
#include "xconv_w2.h"
#include "xconv_w2_hw.h"
#include "xaxidma.h"
#include "xil_cache.h"
#include <math.h>

#include "mixed_parameters.h"
//#include "simulation.h"

XAxiDma DMA_W4;
XAxiDma DMA_W2;

#define DEBUG_OK 0

#define TB_NUM_KERNEL 64
#define TB_INPUT_MAP_SIZE 32
#define TB_OUTPUT_MAP_SIZE 32
#define TB_PADDING 1
#define TB_NUM_WEIGHTS_IN_STREAM NUM_WEIGHTS_IN_STREAM_1
#define TB_KERNEL_SIZE 3
#define TB_NUM_FILTERS 64
#define TB_WEIGHT_WIDTH 4
//int inMap_sw[TB_NUM_KERNEL][(TB_INPUT_MAP_SIZE+2*TB_PADDING)*(TB_INPUT_MAP_SIZE+2*TB_PADDING)];
int filter_sw[TB_NUM_FILTERS][TB_NUM_KERNEL][TB_KERNEL_SIZE*TB_KERNEL_SIZE];
//char outputMap_sw[TB_NUM_FILTERS][TB_OUTPUT_MAP_SIZE*TB_OUTPUT_MAP_SIZE];

char search_map_value(int kn, int x, int y, int size, int numChannels, int padding, __int128_t *mapPtr) {
    char value = 0;
    int c = kn % NUM_ACTS_IN_STREAM;
    int c_bus = kn / NUM_ACTS_IN_STREAM;
    int actShifting = (numChannels-1)/NUM_ACTS_IN_STREAM+1;
    int addr = 0;

    if(x < padding || x >= padding + size || y < padding || y >= padding + size) {
        value = 0;
    }
    else {
    	if(padding > 0)
    		addr = c_bus + ((y-1)*size + (x-1))*actShifting;
    	else
    		addr = c_bus + (y*size + x)*actShifting;

        value = (mapPtr[addr] >> ((NUM_ACTS_IN_STREAM-1-c)*ACTS_WIDTH)) & 0xFF;
    }

    return value;
}

char search_weight_value(int wWidth, int f, int kn, int kx, int ky, int size, int numChannels, int padding, __int128_t *wPtr) {
    char value = 0;
    int c = kn % NUM_WEIGHTS_IN_STREAM_1;
    int c_bus = kn / NUM_WEIGHTS_IN_STREAM_1;
    int wShifting = (numChannels-1)/NUM_WEIGHTS_IN_STREAM_1+1;
    
    if(wWidth == 2) {
        c = kn % NUM_WEIGHTS_IN_STREAM_2;
        c_bus = kn / NUM_WEIGHTS_IN_STREAM_2;
        wShifting = (numChannels-1)/NUM_WEIGHTS_IN_STREAM_2+1;
    }

    int addr = c_bus + (f*size*size + (ky*size + kx))*wShifting;

    if(wWidth == 2) {
        value = (wPtr[addr] >> ((NUM_WEIGHTS_IN_STREAM_2-1-c)*wWidth)) & 0x3;
        if(value & 0x2){
        	value |= 0xFC;
        }
    }
    else if(wWidth == 4) {
        value = (wPtr[addr] >> ((NUM_WEIGHTS_IN_STREAM_1-1-c)*wWidth)) & 0xF;
        if(value & 0x8){
        	value |= 0xF0;
        }
    }

    return value;
}

void compare_with_hw_out_map(signed char accumSW, int kn, int x, int y, int size, int numChannels, int padding, __int128_t *mapPtr) {
    signed char value = 0;
    int c = kn % NUM_ACTS_IN_STREAM;
    int c_bus = kn / NUM_ACTS_IN_STREAM;
    int actShifting = numChannels/NUM_ACTS_IN_STREAM;
    int addr = c_bus + (y*size + x)*actShifting;

    value = (mapPtr[addr] >> ((NUM_ACTS_IN_STREAM-1-c)*ACTS_WIDTH)) & 0xFF;

    if(accumSW != value) {
        printf("kn = %d, x = %d, y = %d, accumSW = %X, valueHW = %X\n", kn, x, y, accumSW, value);
    }

    return;
}

void sw_conv_3D(int wWidth,
                int inMapSize,
                int outMapSize,
                int nFilters,
                int nKernels,
                int kernelSize,
                int padding,
                int stride,
                int scale,
                int relu,
                __int128_t *mapPtr,
                __int128_t *wPtr,
                __int128_t *hwOutPtr) 
{
	signed char valueMap_sw = 0;
    signed char valueFilter_sw = 0;

	for (int f = 0; f < nFilters; f++)
	{
		for (int i = 0; i < outMapSize; i++)
		{
			for (int j = 0; j < outMapSize; j++)
			{
				int accum = 0;
				for (int k = 0; k < nKernels; k++)
				{
					for (int ky = 0; ky < kernelSize; ky++)
					{
						for (int kx = 0; kx < kernelSize; kx++)
						{
							//int inputMap_idx = (ky + i*stride) * (TB_INPUT_MAP_SIZE+2*TB_PADDING) + (kx + j*stride);
                            
                            valueMap_sw = search_map_value(k, (kx + j*stride), (ky + i*stride), inMapSize, nKernels, padding, mapPtr);
//                            if(valueMap_sw != 0 && j == 3)
//                            	printf("\n");
                            valueFilter_sw = search_weight_value(wWidth, f, k, kx, ky, kernelSize, nKernels, 1, wPtr);

//                            if(valueFilter_sw != filter_sw[f][k][ky*TB_KERNEL_SIZE+kx]) {
//                            	printf("old cook %d, new cook %d \n", filter_sw[f][k][ky*TB_KERNEL_SIZE+kx], valueFilter_sw);
//                                valueFilter_sw = search_weight_value(TB_WEIGHT_WIDTH, f, k, kx, ky, TB_KERNEL_SIZE, TB_NUM_KERNEL, 1, wPtr);
//                            }

                            accum += valueFilter_sw * valueMap_sw;

//                            if(j == 3 && i == 0 && f == 0)
//                            printf("f (%d) * m (%d) += accum (%d)\n", valueFilter_sw, valueMap_sw, accum);
						}
					}
				}

				if(relu && accum < 0)
					accum = 0;
				else
					accum >>= scale;

				if(accum >= ((1<<(8-1))-1)) {
					accum = (1<<(8-1))-1;
				}
				else if(accum <= -(1<<(8-1))) {
					accum = -(1<<(8-1));
				}

				char result = accum & 0xFF;

                compare_with_hw_out_map(result, f, j, i, outMapSize, nFilters, 1, hwOutPtr);

				//outputMap_sw[f][i*TB_OUTPUT_MAP_SIZE+j] = result;
			}
		}
	}

}

int conv(int weightWidth,
         int numFilters,
         int numKernels,
         int kernelSize,
         int inputMapSizeX,
         int inputMapSizeY,
         int stride,
         int padding,
         int isMapSigned,
         int biasScale,
         int scale,
         int relu,
         uintptr_t weightAddr,
         uintptr_t biasAddr,
         uintptr_t inMapAddr,
         uintptr_t outMapAddr
         ) {
    int totalWeightsStreams = 0;
    if(weightWidth == 4) {
        totalWeightsStreams = numFilters * ((numKernels-1)/NUM_WEIGHTS_IN_STREAM_1+1) * (kernelSize*kernelSize);
    }
    else if(weightWidth == 2) {
        totalWeightsStreams = numFilters * ((numKernels-1)/NUM_WEIGHTS_IN_STREAM_2+1) * (kernelSize*kernelSize);
    }
    else {
        printf("Error: weightWidth must be 2 or 4\n");
        return 1;
    }
    
    int totalStreamsPerZValuesIn = ((numKernels-1)/NUM_ACTS_IN_STREAM+1);
    int totalStreamsPerZValuesOut = ((numFilters-1)/NUM_ACTS_IN_STREAM+1);
    int totalBiasStreams = ((numFilters-1)/NUM_BIAS_IN_STREAM+1);
    int totalStreamsInFM = totalStreamsPerZValuesIn * inputMapSizeX * inputMapSizeY;

    int outputMapSizeX = (inputMapSizeX - kernelSize + 2*padding)/stride + 1;
    int outputMapSizeY = (inputMapSizeY - kernelSize + 2*padding)/stride + 1;

    int numOutValuesPerFM = outputMapSizeX * outputMapSizeY;

    // AXI-Lite registers setup
    if(weightWidth == 4) {
        *(int *)(XPAR_XCONV_0_S_AXI_BUS1_BASEADDR + XCONV_BUS1_ADDR_NUMFILTERS_DATA) = numFilters;
        *(int *)(XPAR_XCONV_0_S_AXI_BUS1_BASEADDR + XCONV_BUS1_ADDR_NUMKERNELS_DATA) = numKernels;
        *(int *)(XPAR_XCONV_0_S_AXI_BUS1_BASEADDR + XCONV_BUS1_ADDR_INPUTMAPSIZEX_DATA) = inputMapSizeX;
        *(int *)(XPAR_XCONV_0_S_AXI_BUS1_BASEADDR + XCONV_BUS1_ADDR_INPUTMAPSIZEY_DATA) = inputMapSizeY;

        //ctrl bus splitting
	    // 0-2: padding, 3-5: kernelSize, 6-7: stride, 8-11: biasScale, 12: mapSigned, 13: relu, 14-16: scale
        int ctrlBus = (padding) + (kernelSize << 3) + (stride << 6) + (biasScale << 8) + (isMapSigned << 12) + (relu << 13) + (scale << 14);
        *(int *)(XPAR_XCONV_0_S_AXI_BUS1_BASEADDR + XCONV_BUS1_ADDR_CTRL_DATA) = ctrlBus;
        *(int *)(XPAR_XCONV_0_S_AXI_BUS1_BASEADDR + XCONV_BUS1_ADDR_AP_CTRL) = 0X01;
    }
    else if(weightWidth == 2) {
        *(int *)(XPAR_XCONV_W2_0_S_AXI_BUS1_BASEADDR + XCONV_W2_BUS1_ADDR_NUMFILTERS_DATA) = numFilters;
        *(int *)(XPAR_XCONV_W2_0_S_AXI_BUS1_BASEADDR + XCONV_W2_BUS1_ADDR_NUMKERNELS_DATA) = numKernels;
        *(int *)(XPAR_XCONV_W2_0_S_AXI_BUS1_BASEADDR + XCONV_W2_BUS1_ADDR_INPUTMAPSIZEX_DATA) = inputMapSizeX;
        *(int *)(XPAR_XCONV_W2_0_S_AXI_BUS1_BASEADDR + XCONV_W2_BUS1_ADDR_INPUTMAPSIZEY_DATA) = inputMapSizeY;

        //ctrl bus splitting
        // 0-2: padding, 3-5: kernelSize, 6-7: stride, 8-11: biasScale, 12: mapSigned, 13: relu, 14-16: scale
        int ctrlBus = (padding) + (kernelSize << 3) + (stride << 6) + (biasScale << 8) + (isMapSigned << 12) + (relu << 13) + (scale << 14);
        *(int *)(XPAR_XCONV_W2_0_S_AXI_BUS1_BASEADDR + XCONV_W2_BUS1_ADDR_CTRL_DATA) = ctrlBus;
        *(int *)(XPAR_XCONV_W2_0_S_AXI_BUS1_BASEADDR + XCONV_W2_BUS1_ADDR_AP_CTRL) = 0x01;
    }



    // DMA setup
    uintptr_t *TxBufferPtr, *RxBufferPtr;
    int status = 1;

    if(weightWidth == 4) {
        TxBufferPtr = (uintptr_t *) biasAddr;
        status = XAxiDma_SimpleTransfer(&DMA_W4, (UINTPTR) TxBufferPtr, totalBiasStreams*DMA_WIDTH_IN_B, XAXIDMA_DMA_TO_DEVICE);
        if(status != XST_SUCCESS) {
            printf("Error: DMA bias transfer schedule failed\n");
            return status;
        }
        while (XAxiDma_Busy(&DMA_W4, XAXIDMA_DMA_TO_DEVICE)) { /* Wait for Tx*/ }
        //printf("Sent bias! \r\n");


        TxBufferPtr = (uintptr_t *) weightAddr;
        status = XAxiDma_SimpleTransfer(&DMA_W4, (UINTPTR) TxBufferPtr, totalWeightsStreams*DMA_WIDTH_IN_B, XAXIDMA_DMA_TO_DEVICE);
        if(status != XST_SUCCESS) {
            printf("Error: DMA weights transfer schedule failed\n");
            return status;
        }
        while (XAxiDma_Busy(&DMA_W4, XAXIDMA_DMA_TO_DEVICE)) { /* Wait for Tx*/ }
        //printf("Sent filters! \r\n");



        RxBufferPtr = (uintptr_t *) outMapAddr;
        status = XAxiDma_SimpleTransfer(&DMA_W4, (UINTPTR) RxBufferPtr, totalStreamsPerZValuesOut*numOutValuesPerFM*DMA_WIDTH_IN_B, XAXIDMA_DEVICE_TO_DMA);
        if(status != XST_SUCCESS) {
            printf("Error: DMA output map transfer schedule failed\n");
            return status;
        }
        //printf("Setup for output map transfer done \r\n");

        TxBufferPtr = (uintptr_t *) inMapAddr;
        status = XAxiDma_SimpleTransfer(&DMA_W4, (UINTPTR) TxBufferPtr, totalStreamsInFM*DMA_WIDTH_IN_B, XAXIDMA_DMA_TO_DEVICE);
        if(status != XST_SUCCESS) {
            printf("Error: DMA input map transfer schedule failed\n");
            return status;
        }
        //printf("Sending input feature map.. \r\n");

        while(XAxiDma_Busy(&DMA_W4, XAXIDMA_DEVICE_TO_DMA)) {
            // Wait Rx
        };

        //printf("Now only waiting for done signal \r\n");

        while(!(*(int *)(XPAR_XCONV_0_S_AXI_BUS1_BASEADDR + XCONV_BUS1_ADDR_AP_CTRL) & 2)) {
            // Wait for done signal
        };
    }
    else if(weightWidth == 2) {
        TxBufferPtr = (uintptr_t *) biasAddr;
        status = XAxiDma_SimpleTransfer(&DMA_W2, (UINTPTR) TxBufferPtr, totalBiasStreams*DMA_WIDTH_IN_B, XAXIDMA_DMA_TO_DEVICE);
        if(status != XST_SUCCESS) {
            printf("Error: DMA bias transfer schedule failed\n");
            return status;
        }
        while (XAxiDma_Busy(&DMA_W2, XAXIDMA_DMA_TO_DEVICE)) { /* Wait for Tx*/ }

        TxBufferPtr = (uintptr_t *) weightAddr;
        status = XAxiDma_SimpleTransfer(&DMA_W2, (UINTPTR) TxBufferPtr, totalWeightsStreams*DMA_WIDTH_IN_B, XAXIDMA_DMA_TO_DEVICE);
        if(status != XST_SUCCESS) {
            printf("Error: DMA weights transfer schedule failed\n");
            return status;
        }
        while (XAxiDma_Busy(&DMA_W2, XAXIDMA_DMA_TO_DEVICE)) { /* Wait for Tx*/ }

        RxBufferPtr = (uintptr_t *) outMapAddr;
        status = XAxiDma_SimpleTransfer(&DMA_W2, (UINTPTR) RxBufferPtr, totalStreamsPerZValuesOut*numOutValuesPerFM*DMA_WIDTH_IN_B, XAXIDMA_DEVICE_TO_DMA);
        if(status != XST_SUCCESS) {
            printf("Error: DMA output map transfer schedule failed\n");
            return status;
        }


        TxBufferPtr = (uintptr_t *) inMapAddr;
        status = XAxiDma_SimpleTransfer(&DMA_W2, (UINTPTR) TxBufferPtr, totalStreamsInFM*DMA_WIDTH_IN_B, XAXIDMA_DMA_TO_DEVICE);
        if(status != XST_SUCCESS) {
            printf("Error: DMA input map transfer schedule failed\n");
            return status;
        }

        while(XAxiDma_Busy(&DMA_W2, XAXIDMA_DMA_TO_DEVICE)) {
            // Wait Rx
        };

        while(!(*(int *)(XPAR_XCONV_W2_0_S_AXI_BUS1_BASEADDR + XCONV_W2_BUS1_ADDR_AP_CTRL) & 2)) {
            // Wait for done signal
        };
    }
    //printf("Conv done!\r\n");
    return 0;
}

/* 
    Initialize DMA devices and set up the DMA buffers
*/
int init_DMAs() {
    // Lookup DMA configuration
    XAxiDma_Config *CfgPtr_W2;
    XAxiDma_Config *CfgPtr_W4;

    CfgPtr_W2 = XAxiDma_LookupConfig(XPAR_AXIDMA_0_DEVICE_ID);
    CfgPtr_W4 = XAxiDma_LookupConfig(XPAR_AXIDMA_1_DEVICE_ID);

    if(!CfgPtr_W2) {
        printf("Error: DMA_W2 device config not found\r\n");
        return XST_FAILURE;
    }
    else if(!CfgPtr_W4) {
        printf("Error: DMA_W4 device config not found\r\n");
        return XST_FAILURE;
    }

    // Initialize DMA devices and confirm SG mode is disabled
    int status = XAxiDma_CfgInitialize(&DMA_W2, CfgPtr_W2);
    if(status != XST_SUCCESS) {
        printf("Error: DMA_W2 initialization failed\r\n");
        return XST_FAILURE;
    }
    if(XAxiDma_HasSg(&DMA_W2)) {
        printf("Error: DMA_W2 configured as SG mode\r\n");
        return XST_FAILURE;
    }

    status = XAxiDma_CfgInitialize(&DMA_W4, CfgPtr_W4);
    if(status != XST_SUCCESS) {
        printf("Error: DMA_W4 initialization failed\r\n");
        return XST_FAILURE;
    }
    if(XAxiDma_HasSg(&DMA_W4)) {
        printf("Error: DMA_W4 configured as SG mode\r\n");
        return XST_FAILURE;
    }

    // Disable interrupts
    XAxiDma_IntrDisable(&DMA_W2, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
    XAxiDma_IntrDisable(&DMA_W2, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
    XAxiDma_IntrDisable(&DMA_W4, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
    XAxiDma_IntrDisable(&DMA_W4, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

    // Flush cache ?



    printf("DMA initialization complete!\n\n");
    return 0;
}

uintptr_t BasicBlock(int weightWidth,
                        int numFilters,
                        int inChannels,
                        int kernelSize,
                        int inputMapSizeX,
                        int inputMapSizeY,
                        int stride,
                        int isMapSigned,
                        int scale_idx,
                        int wAddrOff_idx,
						uintptr_t inMapAddr_start,
						uintptr_t outMapAddr_start,
                        int reluScale_idx
                        ) {
    int status = 0;
    uintptr_t weightAddr;
    uintptr_t biasAddr;
    uintptr_t inMapAddr;
    uintptr_t outMapAddr;

    int totalStreamsPerZValuesOut = ((numFilters-1)/NUM_ACTS_IN_STREAM+1);
    int outMapSizeX = (inputMapSizeX - kernelSize + 2*1)/stride + 1;
    int outMapSizeY = (inputMapSizeY - kernelSize + 2*1)/stride + 1;
    int outMapMemAlloced = totalStreamsPerZValuesOut*outMapSizeX*outMapSizeY*DMA_WIDTH_IN_B;
    
    int relu_c2;

    if (stride != 1 || inChannels != numFilters) {
        relu_c2 = 0;
    }
    else {
        relu_c2 = 1;
    }

    //Conv1
    weightAddr = W_ADDR + WEIGHTS_ADDR_OFF_RN18[wAddrOff_idx];
    biasAddr = PADDING_ADDR;
    inMapAddr = inMapAddr_start;
    outMapAddr = outMapAddr_start;
    status = conv(weightWidth, numFilters, inChannels,
                  kernelSize, inputMapSizeX, inputMapSizeY, stride,
                  1, isMapSigned, 0, ACT_SCALE[scale_idx], 1, 
                  weightAddr, biasAddr, inMapAddr, outMapAddr);
    if(status != 0){
        printf("Error: conv1 failed\n");
        return -1;
    }

    if(DEBUG_OK && numFilters > 256 && inputMapSizeX < 16) {
        sw_conv_3D(weightWidth, inputMapSizeX, outMapSizeX,
                   numFilters, inChannels, kernelSize,
                   1, stride, ACT_SCALE[scale_idx], 1,
                   (__int128_t *) inMapAddr,
                   (__int128_t *) weightAddr,
                   (__int128_t *) outMapAddr);
    }

    //Conv2
    weightAddr = W_ADDR + WEIGHTS_ADDR_OFF_RN18[wAddrOff_idx+1];
    biasAddr = PADDING_ADDR;
    inMapAddr = outMapAddr;
    outMapAddr += outMapMemAlloced;
    status = conv(weightWidth, numFilters, numFilters,
                  kernelSize, outMapSizeX, outMapSizeY, 1,
                  1, isMapSigned, 0, ACT_SCALE[scale_idx+1], relu_c2, 
                  weightAddr, biasAddr, inMapAddr, outMapAddr);
    if(status != 0){
        printf("Error: conv2 failed\n");
        return -1;
    }

    if(DEBUG_OK && numFilters > 256 && inputMapSizeX < 16) {
    	sw_conv_3D(weightWidth, outMapSizeX, outMapSizeX,
                   numFilters, numFilters, kernelSize,
                   1, 1, ACT_SCALE[scale_idx+1], relu_c2,
                   (__int128_t *) inMapAddr, 
                   (__int128_t *) weightAddr, 
                   (__int128_t *) outMapAddr);
    }

    outMapMemAlloced = totalStreamsPerZValuesOut*outMapSizeX*outMapSizeY*DMA_WIDTH_IN_B;

    //Shortcut
    if(stride != 1 || inChannels != numFilters) {
        int8_t *a, *b, *c;
        int prod;

        a = (int8_t *) (outMapAddr);
        weightAddr = W_ADDR + WEIGHTS_ADDR_OFF_RN18[wAddrOff_idx+2];
        biasAddr = PADDING_ADDR;
        inMapAddr = inMapAddr_start;
        outMapAddr += outMapMemAlloced;
        status = conv(weightWidth, numFilters, inChannels,
                      1, inputMapSizeX, inputMapSizeY, stride,
                      0, isMapSigned, 0, ACT_SCALE[scale_idx+2], 0,
                      weightAddr, biasAddr, inMapAddr, outMapAddr);
        if(status != 0){
            printf("Error: shortcut conv in layer 1, block 0 failed\n");
            return -1;
        }

        if(DEBUG_OK && numFilters > 256) {
			sw_conv_3D(weightWidth, inputMapSizeX, outMapSizeX,
					   numFilters, inChannels, 1,
					   0, stride, ACT_SCALE[scale_idx+2], 0,
					   (__int128_t *) inMapAddr,
					   (__int128_t *) weightAddr,
					   (__int128_t *) outMapAddr);
        }

        //Sum shortcut conv with conv2
        b = (int8_t *) (outMapAddr);
        c = (int8_t *) (outMapAddr+outMapMemAlloced);

        for(int i = 0; i < outMapMemAlloced; i++) {
            prod = a[i] + b[i];

            if(prod > 127)
            	c[i] = 127;
            else if(prod <= 0)
            	c[i] = 0;
            else
            	c[i] = (int8_t) prod;
        }
        outMapAddr = (uintptr_t) c;
    }
    else {
//        int shift_a = 0, shift_b = 0, shift_prod = 0;
        int8_t *a = (int8_t *) inMapAddr_start,
               *b = (int8_t *) outMapAddr, 
               *c = (int8_t *) (outMapAddr+outMapMemAlloced);
        float bufA, bufB;
        int prod;

        //Find shift needed to sum a and b
//        if(RELU_SCALE[reluScale_idx-1] > RELU_SCALE[reluScale_idx+1]) {
//            shift_b = RELU_SCALE[reluScale_idx-1] - RELU_SCALE[reluScale_idx+1];
//            shift_prod = RELU_SCALE[reluScale_idx-1] - RELU_SCALE[reluScale_idx+1];
//        }
//        else {
//            shift_a = RELU_SCALE[reluScale_idx+1] - RELU_SCALE[reluScale_idx-1];
//            shift_prod = RELU_SCALE[reluScale_idx+1] - RELU_SCALE[reluScale_idx-1];
//        }

        for(int i = 0; i < outMapMemAlloced; i++) {
        	bufA = (float) a[i]/(1<<RELU_SCALE[reluScale_idx-1]);
        	bufB = (float) b[i]/(1<<RELU_SCALE[reluScale_idx+1]);
        	prod = (int) ((bufA + bufB)*(1<<RELU_SCALE[reluScale_idx+1]));
            //prod = ((a[i]<<shift_a) + (b[i]<<shift_b))>>shift_prod;

            if(prod > 127)
            	c[i] = 127;
            else
            	c[i] = (int8_t) prod;
        }
        outMapAddr = (uintptr_t) c;
    }
    
    return outMapAddr;
}

// void AveragePooling(int kernelSize,
//                     int in_channels,
// 					int inputMapSizeX,
// 					int inputMapSizeY,
//                     int inMapAddr,
// 					int outMapAddr
//                     ) {
//     char *inMapPtr  = (char *)(intptr_t) inMapAddr;
//     char *outMapPtr = (char *)(intptr_t) outMapAddr;
    
//     int totalStreamsPerZValuesIn = ((in_channels-1)/NUM_ACTS_IN_STREAM+1);

//     for(int i = 0; i < totalStreamsPerZValuesIn; i++) {
//         int accum = 0;
//         for(int j = 0; j < inputMapSizeX*inputMapSizeY; j++) {
//             accum += inMapPtr[i + j*totalStreamsPerZValuesIn];
//         }
// //        if(accum > 0)
// //          printf("non zero accum %d\n", accum);
//         //accum = (int) (accum/(inputMapSizeX*inputMapSizeY));

//         outMapPtr[i] = accum & 0xFF;
//     }
    
//     return;
// }

void AveragePooling(int kernelSize,
                    int in_channels,
					int inputMapSizeX,
					int inputMapSizeY,
                    uintptr_t inMapAddr,
					uintptr_t outMapAddr
                    ) {
    char *inMapPtr  = (char *) inMapAddr;
    float *outMapPtr = (float *) outMapAddr;
    float buffer = 0;
    
    int totalStreamsPerZValuesIn = ((in_channels-1)/NUM_ACTS_IN_STREAM+1);

    for(int i = 0; i < totalStreamsPerZValuesIn; i++) {
        float accum = 0;
        for(int j = 0; j < inputMapSizeX*inputMapSizeY; j++) {
//            buffer = inMapPtr[i + j*totalStreamsPerZValuesIn]/ACT_SCALE[19];
        	buffer = inMapPtr[i + j*totalStreamsPerZValuesIn]/(1<<ACT_SCALE[19]);
            accum += buffer;
        }
//        if(accum > 0)
//          printf("non zero accum %d\n", accum);
        //accum = (int) (accum/(inputMapSizeX*inputMapSizeY));

        outMapPtr[i] = accum;
    }
    
    return;
}

// int Linear(int numClasses,
//            int in_channels,
// 		   uintptr_t inMapAddr,
//            uintptr_t wAddr
//            ){

//     int8_t *linWeights = (int8_t *) wAddr;
//     int *accum, predClass = 0;
//     char* inMapPtr = (char*) inMapAddr;

//     accum = (int *) malloc(numClasses*sizeof(int));
//     if(accum == NULL) {
//         printf("Error: malloc failed\n");
//         return -1;
//     }

//     for(int i = 0; i < numClasses; i++) {
//         accum[i] = 0;
//         for(int j = 0; j < in_channels; j++) {
//             accum[i] += inMapPtr[j]*linWeights[i*in_channels + j];
//         }
//         //accum[i]>>=4;

//         printf("Likelihood of class %s: %d %f\n", CIFAR_10_LABELS[i], accum[i], (float) accum[i]*pow(2.0,-9.0));
//     }

//     for(int i = 0; i < numClasses; i++) {
//         if(accum[i] > accum[predClass]) {
//             predClass = i;
//         }
//     }
    
//     free(accum);
    
//     return predClass;
// }

int Linear(int numClasses,
           int in_channels,
		   uintptr_t inMapAddr,
           uintptr_t wAddr
           ){

    int8_t *linWeights = (int8_t *) wAddr;
    int predClass = 0;
    float *accum;
    float* inMapPtr = (float*) inMapAddr;

    accum = (float *) malloc(numClasses*sizeof(float));
    if(accum == NULL) {
        printf("Error: malloc failed\n");
        return -1;
    }

    for(int i = 0; i < numClasses; i++) {
        accum[i] = 0;
        for(int j = 0; j < in_channels; j++) {
            accum[i] += inMapPtr[j]*linWeights[i*in_channels + j]/4;
        }
        //accum[i]>>=4;

        // printf("Likelihood of class %s: %d %f\n", CIFAR_10_LABELS[i], accum[i], (float) accum[i]*pow(2.0,-9.0));
        printf("Likelihood of class %s: %f\n", CIFAR_10_LABELS[i], accum[i]);
    }

    for(int i = 0; i < numClasses; i++) {
        if(accum[i] > accum[predClass]) {
            predClass = i;
        }
    }
    
    free(accum);
    
    return predClass;
}


int ResNet18() {
    int stride[2] = {2,1};
    int numConvLayers[2] = {3,2};

    int wAddrOff_idx = 1;
    int actScale_idx = 0, reluScale_idx = 1;
    int status = 0;

    int in_planes = 64;

    uintptr_t weightAddr = W_ADDR;
    uintptr_t biasAddr = PADDING_ADDR;
    uintptr_t inMapAddr = FM_ADDR;
    uintptr_t outMapAddr = OUTPUT_ADDR;
    

    //Conv
    status = conv(4, 64, IMAGE_DEPTH, 3,
                  IMAGE_WIDTH, IMAGE_WIDTH, 1, 1,
                  1, 0, ACT_SCALE[actScale_idx],
                  1, weightAddr, biasAddr,
                  inMapAddr, outMapAddr);
    if(status != 0){
        printf("Error: conv failed\n");
        return status;
    }

    // if(DEBUG_OK) {
    //     sw_conv_3D(4, IMAGE_WIDTH, IMAGE_WIDTH,
    //                64, IMAGE_DEPTH, 3,
    //                1, 1, ACT_SCALE[actScale_idx], 1,
    //                (__int128_t *) inMapAddr, 
    //                (__int128_t *) weightAddr, 
    //                (__int128_t *) outMapAddr);
    // }

    inMapAddr = outMapAddr;
    outMapAddr += ((64-1)/NUM_ACTS_IN_STREAM+1)*IMAGE_WIDTH*IMAGE_WIDTH*DMA_WIDTH_IN_B;
    actScale_idx += 1;

    //Layer 1
    for(int i = 0; i < 2; i++) {
        inMapAddr = BasicBlock(4, 64, in_planes, 3,
                               32, 32, stride[1], 1,
                               actScale_idx, wAddrOff_idx,
                               inMapAddr, outMapAddr, reluScale_idx);
        if(inMapAddr == -1) {
            return -1;
        }
        outMapAddr = inMapAddr + ((64-1)/NUM_ACTS_IN_STREAM+1)*IMAGE_WIDTH*IMAGE_WIDTH*DMA_WIDTH_IN_B;
        actScale_idx += numConvLayers[1];
        wAddrOff_idx += numConvLayers[1];
        reluScale_idx += 2;
        printf("Layer 1 block %d done\n", i);
    }
    printf("Layer 1 done\n");

    //Layer 2
    in_planes = 64;
    for(int i = 0, inMapSize = 32; i < 2; i++, inMapSize /= 2) {
        inMapAddr = BasicBlock(4, 128, in_planes,
                               3, inMapSize, inMapSize, stride[i],
                               1, actScale_idx, wAddrOff_idx,
                               inMapAddr, outMapAddr, reluScale_idx);
        if(inMapAddr == -1) {
            return -1;
        }
        outMapAddr = inMapAddr + ((128-1)/NUM_ACTS_IN_STREAM+1)*16*16*DMA_WIDTH_IN_B;
        actScale_idx += numConvLayers[i];
        wAddrOff_idx += numConvLayers[i];
        reluScale_idx += 2;
        in_planes = 128;
        printf("Layer 2 block %d done\n", i);
    }
    printf("Layer 2 done\n");

    //Layer 3
    for(int i = 0, inMapSize = 16; i < 2; i++, inMapSize /= 2) {
        inMapAddr = BasicBlock(2, 256, in_planes,
                               3, inMapSize, inMapSize, stride[i],
                               1, actScale_idx, wAddrOff_idx,
                               inMapAddr, outMapAddr, reluScale_idx);
        if(inMapAddr == -1) {
            return -1;
        }
        outMapAddr = inMapAddr + ((256-1)/NUM_ACTS_IN_STREAM+1)*8*8*DMA_WIDTH_IN_B;
        actScale_idx += numConvLayers[i];
        wAddrOff_idx += numConvLayers[i];
        reluScale_idx += 2;
        in_planes = 256;
        printf("Layer 3 block %d done\n", i);
    }
    printf("Layer 3 done\n");

    //Layer 4
    for(int i = 0, inMapSize = 8; i < 2; i++, inMapSize /= 2) {
        inMapAddr = BasicBlock(2, 512, in_planes,
                               3, inMapSize, inMapSize, stride[i],
                               1, actScale_idx, wAddrOff_idx,
                               inMapAddr, outMapAddr, reluScale_idx);
        if(inMapAddr == -1) {
            return -1;
        }
        outMapAddr = inMapAddr + ((512-1)/NUM_ACTS_IN_STREAM+1)*4*4*DMA_WIDTH_IN_B;
        actScale_idx += numConvLayers[i];
        wAddrOff_idx += numConvLayers[i];
        reluScale_idx += 2;
        in_planes = 512;
        printf("Layer 4 block %d done\n", i);
    }
    printf("Layer 4 done\n");
    
    //Average Pooling
    int totalStreamsPerZValuesIn = ((512-1)/NUM_ACTS_IN_STREAM+1);

    uintptr_t avgPoolMapAddr = (inMapAddr + totalStreamsPerZValuesIn*4*4*DMA_WIDTH_IN_B);
    AveragePooling(4, 512, 4, 4, inMapAddr, avgPoolMapAddr);

    //Fully Connected
    int predClass = Linear(10, 512, avgPoolMapAddr, W_LINEAR_ADDR);

    printf("Predicted class: %s\n", CIFAR_10_LABELS[predClass]);

    return 0;
}

int main() {
    /*
    ------------------HWSW SOLUTION------------------
    */
	int status = 0;

	Xil_DCacheDisable();
    // Startup routine
    //printf("Setting DMAs...\n\n");
    status = init_DMAs();
    if(status != 0){
    	return status;
    }

    //status = conv(4, 4, 3, 2, 32, 32, 1, 1, 1, 0, 3, 0, W_ADDR, PADDING_ADDR, FM_ADDR, OUTPUT_ADDR);
    ResNet18();

    return 0;
}

// int main() {
//     /*
//     ------------------SIMULATION------------------
//     */
// //    char ***filter, ***outMap;
// //    image_t *inMap;

//     // // Read weights
//     // printf("Reading weights...\n");
//     // filter = read_weights(4, WEIGHTS_TEST_FILE, 3, 3, 3);
   
//     // // Read input maps
//     // printf("Reading input maps...\n");
//     // inMap = read_maps(TOTAL_IMAGES, DATASET_PATH, MAPS_FILE, LABELS_FILE);

//     // // Convolution
//     // printf("Starting convolution...\n");
//     // outMap = (char ***) malloc(sizeof(char **)*TOTAL_IMAGES);

//     /*
//     ------------------HWSW SOLUTION------------------
//     */
// 	int status = 0;
//     char *a = (char *) (OUTPUT_ADDR);
//     char *b = (char *) (OUTPUT_ADDR+0x500);
//     char *mapSum = (char *) (OUTPUT_ADDR+0x1000);

// 	//Xil_DCacheDisable();
//     // Startup routine
//     //printf("Setting DMAs...\n\n");
//     status = init_DMAs();
//     if(status != 0){
//     	return status;
//     }

//     status = 0;
//     //status = conv(4, 4, 3, 2, 4, 4, 1, 0, 1, 0, 3, 0, W_ADDR, PADDING_ADDR, FM_ADDR, OUTPUT_ADDR);
//     status = conv(4, 4, 3, 2, 4, 4, 1, 1, 1, 0, 3, 0, W_ADDR, PADDING_ADDR, FM_ADDR, OUTPUT_ADDR);
//     if(status != 0){
//     	return status;
//     }

//     status = conv(4, 4, 4, 2, 4, 4, 1, 1, 1, 0, 3, 0, W_ADDR, PADDING_ADDR, OUTPUT_ADDR, OUTPUT_ADDR+0x500);

//     //printf("Obtained the output matrix!\n\n");

//     return 0;
// }

// int ResNet18() {
//     int status = 0;
//     uintptr_t weightAddr = W_ADDR;
//     uintptr_t biasAddr = PADDING_ADDR;
//     uintptr_t inMapAddr = FM_ADDR;
//     uintptr_t outMapAddr = OUTPUT_ADDR;
//     uintptr_t skipMapAddr = 0;

//     //Conv
//     status = conv(4, 64, 3, 3, 32, 32, 1, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: conv failed\n");
//         return status;
//     }

//     /*
//     ------------------LAYER 1------------------
//     */
//     //  ------------------BLOCK 0------------------
//     //Conv1
//     weightAddr = W_ADDR + WEIGHTS_ADDR_OFF_RN18[1];
//     biasAddr = PADDING_ADDR;
//     inMapAddr = ;
//     outMapAddr = ;
//     status = conv(4, 64, 64, 3, 32, 32, 1, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: conv1 in layer 1, block 0 failed\n");
//         return status;
//     }

//     //Conv2
//     weightAddr = W_ADDR + WEIGHTS_ADDR_OFF_RN18[2];
//     biasAddr = PADDING_ADDR;
//     inMapAddr = ;
//     outMapAddr = ;
//     status = conv(4, 64, 64, 3, 32, 32, 1, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: conv2 in layer 1, block 0 failed\n");
//         return status;
//     }

//     //Shortcut
//     //Do nothing

//     //  ------------------BLOCK 1------------------
//     //Conv1
//     weightAddr = ;
//     biasAddr = PADDING_ADDR;
//     inMapAddr = ;
//     outMapAddr = ;
//     status = conv(4, 64, 64, 3, 32, 32, 1, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: conv1 in layer 1, block 1 failed\n");
//         return status;
//     }

//     //Conv2
//     weightAddr = ;
//     biasAddr = PADDING_ADDR;
//     inMapAddr = ;
//     outMapAddr = ;
//     status = conv(4, 64, 64, 3, 32, 32, 1, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: conv2 in layer 1, block 1 failed\n");
//         return status;
//     }

//     //Shortcut
//     //Do nothing

//     /*
//     ------------------LAYER 2------------------
//     */
//     //  ------------------BLOCK 0------------------
//     skipMapAddr ;

//     //Conv1
//     weightAddr = ;
//     biasAddr = PADDING_ADDR;
//     inMapAddr = ;
//     outMapAddr = ;
//     status = conv(4, 128, 64, 3, 16, 16, 2, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: conv1 in layer 2, block 0 failed\n");
//         return status;
//     }

//     //Conv2
//     weightAddr = ;
//     biasAddr = PADDING_ADDR;
//     inMapAddr = ;
//     outMapAddr = ;
//     status = conv(4, 128, 128, 3, 16, 16, 2, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: conv2 in layer 2, block 0 failed\n");
//         return status;
//     }

//     //Shortcut
//     weightAddr = ;
//     biasAddr = PADDING_ADDR;
//     inMapAddr = ;
//     outMapAddr = ;
//     status = conv(4, 128, 64, 1, 16, 16, 2, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: shortcut conv in layer 2, block 0 failed\n");
//         return status;
//     }

//     //SUM OUTPUT OF SKIP WITH CONV2 (also no forgor de desligar as RELUs de ambos)

//     //  ------------------BLOCK 1------------------
//     //Conv1
//     weightAddr = ;
//     biasAddr = PADDING_ADDR;
//     inMapAddr = ;
//     outMapAddr = ;
//     status = conv(4, 128, 128, 3, 16, 16, 2, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: conv1 in layer 2, block 1 failed\n");
//         return status;
//     }

//     //Conv2
//     weightAddr = ;
//     biasAddr = PADDING_ADDR;
//     inMapAddr = ;
//     outMapAddr = ;
//     status = conv(4, 128, 128, 3, 16, 16, 2, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: conv2 in layer 2, block 1 failed\n");
//         return status;
//     }

//     //Shortcut
//     //Do nothing

//     /*
//     ------------------LAYER 3------------------
//     */
//     //  ------------------BLOCK 0------------------
//     //Conv1
//     weightAddr = ;
//     biasAddr = PADDING_ADDR;
//     inMapAddr = ;
//     outMapAddr = ;
//     status = conv(2, 256, 128, 3, 8, 8, 2, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: conv1 in layer 3, block 0 failed\n");
//         return status;
//     }

//     //Conv2
//     weightAddr = ;
//     biasAddr = PADDING_ADDR;
//     inMapAddr = ;
//     outMapAddr = ;
//     status = conv(2, 256, 256, 3, 8, 8, 2, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: conv2 in layer 3, block 0 failed\n");
//         return status;
//     }

//     //Shortcut
//     weightAddr = ;
//     biasAddr = PADDING_ADDR;
//     inMapAddr = ;
//     outMapAddr = ;
//     status = conv(2, 256, 128, 1, 8, 8, 2, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: shortcut conv in layer 3, block 0 failed\n");
//         return status;
//     }

//     //SUM OUTPUT OF SKIP WITH CONV2 (also no forgor de desligar as RELUs de ambos)

//     //  ------------------BLOCK 1------------------
//     //Conv1
//     weightAddr = ;
//     biasAddr = PADDING_ADDR;
//     inMapAddr = ;
//     outMapAddr = ;
//     status = conv(2, 256, 256, 3, 8, 8, 2, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: conv1 in layer 3, block 1 failed\n");
//         return status;
//     }

//     //Conv2
//     weightAddr = ;
//     biasAddr = PADDING_ADDR;
//     inMapAddr = ;
//     outMapAddr = ;
//     status = conv(2, 256, 256, 3, 8, 8, 2, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: conv2 in layer 3, block 1 failed\n");
//         return status;
//     }

//     //Shortcut
//     //Do nothing

//     /*
//     ------------------LAYER 4------------------
//     */
//     //  ------------------BLOCK 0------------------
//     //Conv1
//     weightAddr = ;
//     biasAddr = PADDING_ADDR;
//     inMapAddr = ;
//     outMapAddr = ;
//     status = conv(2, 512, 256, 3, 4, 4, 2, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: conv1 in layer 4, block 0 failed\n");
//         return status;
//     }

//     //Conv2
//     weightAddr = ;
//     biasAddr = PADDING_ADDR;
//     inMapAddr = ;
//     outMapAddr = ;
//     status = conv(2, 512, 512, 3, 4, 4, 2, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: conv2 in layer 4, block 0 failed\n");
//         return status;
//     }

//     //Shortcut
//     weightAddr = ;
//     biasAddr = PADDING_ADDR;
//     inMapAddr = ;
//     outMapAddr = ;
//     status = conv(2, 512, 256, 1, 4, 4, 2, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: shortcut conv in layer 4, block 0 failed\n");
//         return status;
//     }

//     //SUM OUTPUT OF SKIP WITH CONV2 (also no forgor de desligar as RELUs de ambos)

//     //  ------------------BLOCK 1------------------
//     //Conv1
//     weightAddr = ;
//     biasAddr = PADDING_ADDR;
//     inMapAddr = ;
//     outMapAddr = ;
//     status = conv(2, 512, 512, 3, 4, 4, 2, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: conv1 in layer 4, block 1 failed\n");
//         return status;
//     }

//     //Conv2
//     weightAddr = ;
//     biasAddr = PADDING_ADDR;
//     inMapAddr = ;
//     outMapAddr = ;
//     status = conv(2, 512, 512, 3, 4, 4, 2, 1, 0, 0, , 1, weightAddr, biasAddr, inMapAddr, outMapAddr);
//     if(status != 0){
//         printf("Error: conv2 in layer 4, block 1 failed\n");
//         return status;
//     }

//     //Shortcut
//     //Do nothing

//     /*
//     ------------------AVERAGE POOLING------------------
//     */


//     /*
//     ------------------FULLY CONNECTED------------------
//     */


//     return 0;
// }

//void hw_to_sw_comparison(uintptr_t mapAddr, uintptr_t hwOutAddr, uintptr_t wAddr, int relu) {
//     __int128_t *mapPtr = (__int128_t *) mapAddr;
//     __int128_t *wPtr = (__int128_t *) wAddr;
//     __int128_t *hwOutPtr = (__int128_t *) hwOutAddr;
//     int shifting = NUM_ACTS_IN_STREAM-1;

//     sw_conv_3D(1, 5, 1, mapPtr, wPtr, hwOutPtr);

//    //Map conversion
//     // int inMap_buffer[TB_NUM_KERNEL][TB_INPUT_MAP_SIZE*TB_INPUT_MAP_SIZE];
//     // shifting = NUM_ACTS_IN_STREAM-1;
// //    for(int c = TB_NUM_KERNEL-1; c >= 0; c--) {
// //        int addr = (TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM - c/NUM_ACTS_IN_STREAM;
// //        int value = 0;
// //        if(shifting <0) {
// //        	shifting=NUM_ACTS_IN_STREAM-1;
// //        }
// //
// //        if(TB_NUM_KERNEL-1 - c == 55){
// //        	printf("ok");
// //        }
// //
// //		for (int i=0; i<TB_INPUT_MAP_SIZE; i++) {
// //			for (int j=0; j<TB_INPUT_MAP_SIZE; j++) {
// //				value=((mapPtr[addr])>>(shifting*ACTS_WIDTH))&(((long)1<<ACTS_WIDTH)-1);
// //				signed bit=(value&((1<<ACTS_WIDTH)-1))>>(ACTS_WIDTH-1);
// //				if(bit&&relu){
// //					value=(int)(((1<<32-ACTS_WIDTH)-1)<<ACTS_WIDTH)+(int)value;
// //				}
// //				inMap_buffer[TB_NUM_KERNEL-1 - c][i*TB_INPUT_MAP_SIZE+j] = value;
// //				addr+=((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1);
// //			}
// //		}
// //		shifting--;
// //		if(shifting == -1)
// //			shifting = NUM_ACTS_IN_STREAM-1;
// //	}
// //
// //    for(int k = 0; k < TB_NUM_KERNEL; k++) {
// //		int idx = 0;
// //		for(int i = 0; i < (TB_INPUT_MAP_SIZE+2*TB_PADDING); i++) {
// //			for(int j = 0; j < (TB_INPUT_MAP_SIZE+2*TB_PADDING); j++) {
// //				if(i < TB_PADDING || i >= TB_PADDING + TB_INPUT_MAP_SIZE ||
// //				j < TB_PADDING || j >= TB_PADDING + TB_INPUT_MAP_SIZE) {
// //					inMap_sw[k][i*(TB_INPUT_MAP_SIZE+2*TB_PADDING) + j] = 0;
// //				}
// //				else {
// //					inMap_sw[k][i*(TB_INPUT_MAP_SIZE+2*TB_PADDING) + j] = inMap_buffer[k][idx++];
// //				}
// //			}
// //		}
// //	}

// //    //Weight conversion
// //    int sizeOfFilter = TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/TB_NUM_WEIGHTS_IN_STREAM+1);
// //    for(int f = 0; f < TB_NUM_FILTERS; f++) {
// //		shifting = TB_NUM_WEIGHTS_IN_STREAM-1;
// //		for(int c = TB_NUM_KERNEL-1; c >= 0; c--) {
// //			int addr = (TB_NUM_KERNEL-1)/TB_NUM_WEIGHTS_IN_STREAM - c/TB_NUM_WEIGHTS_IN_STREAM;
// //			int value = 0;
// //
// //			for(int ky = 0; ky < TB_KERNEL_SIZE; ky++) {
// //				for(int kx = 0; kx < TB_KERNEL_SIZE; kx++) {
// //					value = ((wPtr[f*sizeOfFilter + addr])
// //							>> (shifting*TB_WEIGHT_WIDTH)) & (((long)1<<TB_WEIGHT_WIDTH)-1);
// //					signed bit = (value & ((1<<TB_WEIGHT_WIDTH)-1)) >> (TB_WEIGHT_WIDTH-1);
// //					if(bit) {
// //						value = (int)(((1<<32-TB_WEIGHT_WIDTH)-1)<<TB_WEIGHT_WIDTH)+(int)value;
// //					}
// //					filter_sw[f][TB_NUM_KERNEL-1 - c][ky*TB_KERNEL_SIZE+kx] = value;
// //					addr += (TB_NUM_KERNEL-1)/TB_NUM_WEIGHTS_IN_STREAM+1;
// //				}
// //			}
// //			shifting--;
// //			if(shifting == -1)
// //				shifting = TB_NUM_WEIGHTS_IN_STREAM-1;
// //		}
// //	}

    

// //    printf("new cook passed\n");

// //    shifting = NUM_ACTS_IN_STREAM-1;
// //    for(int c = TB_NUM_KERNEL-1; c >= 0; c--) {
// //    	int addr = (TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM - c/NUM_ACTS_IN_STREAM;
// //        int value = 0;
// //        if(shifting < 0) {
// //        	shifting=NUM_ACTS_IN_STREAM-1;
// //        }
// //
// //    	for (int i=0; i<TB_OUTPUT_MAP_SIZE; i++) {
// //    		for (int j=0; j<TB_OUTPUT_MAP_SIZE; j++) {
// //    			value=((hwOutPtr[addr]>>ACTS_REMAINDER)
// //    			>>(shifting)*ACTS_WIDTH)&(((long)1<<ACTS_WIDTH)-1);
// //    			signed bit=(value&((1<<ACTS_WIDTH)-1))>>(ACTS_WIDTH-1);
// //    			if(bit&&relu){
// //    				value=(int)(((1<<32-ACTS_WIDTH)-1)<<ACTS_WIDTH)+(int)value;
// //    			}
// //    			int comparison = outputMap_sw[TB_NUM_KERNEL-1 - c][i*TB_OUTPUT_MAP_SIZE+j] - value;
// //    			if(comparison != 0) {
// //    				printf("c = %d, y = %d, x = %d ----> sw (%d) - hw (%d) = comparison = %d\n", TB_NUM_KERNEL-1 - c, i, j , outputMap_sw[TB_NUM_KERNEL-1 - c][i*TB_OUTPUT_MAP_SIZE+j], value, comparison);
// //    			}
// //    			addr+=((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1);
// //    		}
// //    	}
// //    	shifting--;
// //    	if(shifting == -1)
// //    		shifting = NUM_ACTS_IN_STREAM-1;
// //    }

// }
