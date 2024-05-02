#include <stdio.h>
#include <stdlib.h>
#include <ap_int.h>
#include <cmath>
#include <hls_stream.h>
#include "ap_axi_sdata.h"
#include "mixed_conv.h"

#define TB_NUM_FILTERS 64
#define TB_NUM_KERNEL 64
#define TB_KERNEL_SIZE 3
#define TB_INPUT_MAP_SIZE 32
#define TB_STRIDE 1
#define TB_PADDING 1
#define TB_OUTPUT_MAP_SIZE ((TB_INPUT_MAP_SIZE - TB_KERNEL_SIZE+ 2*TB_PADDING)/TB_STRIDE + 1)
#define TB_SCALE 5
#define TB_BIAS_SCALE 0
#define TB_RELU_OK 1
#define TB_MAP_SIGNED_OK 0
#define TB_LAST_PIXEL_OK 1
#define PRINT_OK_SW false
#define PRINT_OK_RESULT false
#define PRINT_OK true
#define HW_ON 1
#define DO_SHORTCUT 0

//char*	weights_file = "/home/pferreira/deepL/pytorch-cifar/weightsExtractor/output/0003layer1[1].conv1.weight.bin";
char*	weights_file = "/home/pferreira/deepL/pytorch-cifar/weightsExtractor/output/0002layer1[0].conv2.weight.bin";
//char*	acts_file = "/home/pferreira/HwSw/HLS/outputs/output_L1_B0_C2_hw.bin";
//char*	acts_file_python = "/home/pferreira/deepL/pytorch-cifar/maps/layer1_block0_relu2.bin";
char*	acts_file = "/home/pferreira/HwSw/HLS/outputs/output_L1_B0_C1_hw.bin";
char*	acts_file_python = "/home/pferreira/deepL/pytorch-cifar/maps/layer1_block0_relu1.bin";
char*	acts_file_sum = "/home/pferreira/HwSw/HLS/outputs/output_L2_B0_shortcut_hw.bin";
//char*	weights_file = "/home/pferreira/deepL/pytorch-cifar/weightsExtractor/output/0000conv1.weight.bin";
//char*	acts_file = "/home/pferreira/deepL/pytorch-cifar/img17_horse.bin";
char*   output_map_file = "/home/pferreira/HwSw/HLS/outputs/output_L1_B0_C2_hw.bin";
char*   output_map_file_sw = "/home/pferreira/HwSw/HLS/outputs/output_L1_B0_C2_sw.bin";
//char*   output_map_file = "/home/pferreira/HwSw/HLS/outputs/output_L1_B1_C1_hw.bin";
//char*   output_map_file_sw = "/home/pferreira/HwSw/HLS/outputs/output_L1_B1_C1_sw.bin";

static  int filter_sw[TB_NUM_FILTERS][TB_NUM_KERNEL][TB_KERNEL_SIZE*TB_KERNEL_SIZE];
static  int inputMap_sw[TB_NUM_KERNEL][(TB_INPUT_MAP_SIZE+2*TB_PADDING)*(TB_INPUT_MAP_SIZE+2*TB_PADDING)];

static  ap_int<DMA_WIDTH> filter[TB_NUM_FILTERS*TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1)];
static  ap_int<DMA_WIDTH> inputMap[TB_INPUT_MAP_SIZE*TB_INPUT_MAP_SIZE*((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1)];
static  ap_int<DMA_WIDTH> bias[TB_NUM_FILTERS];

// ap_int<DMA_WIDTH> outputMap[(((2*TB_NUM_FILTERS)-1)/NUM_ACTS_IN_STREAM+1)*TB_OUTPUT_MAP_SIZE*TB_OUTPUT_MAP_SIZE];
ap_int<DMA_WIDTH> *outputMap;
act_t **outputMap_sw, **outputMap_hw_to_sw;
// act_t outputMap_hw_to_sw[TB_NUM_FILTERS][TB_OUTPUT_MAP_SIZE*TB_OUTPUT_MAP_SIZE];
// act_t outputMap_sw[TB_NUM_FILTERS][TB_OUTPUT_MAP_SIZE*TB_OUTPUT_MAP_SIZE];

void read_weights_simple(int bitWidth, char *weightsFile, int nFilters, int nChannels, int filterSize) {
    FILE *fp;
	char buffer[16];
	ap_int<DMA_WIDTH> buf=0;

    // Open weights file for reading
    fp = fopen(weightsFile, "rb");
    if(fp == NULL) {
        printf("Error: could not open weights file\n");
        exit(1);
    }

	for(int f = 0, counter = 0; f < nFilters*filterSize*filterSize*((nChannels-1)/NUM_WEIGHTS_IN_STREAM+1); f++) {
		fread(buffer, sizeof(char), 16, fp);
		for(int i = 15; i >= 0; i--) {
			buf = buf << 8;
			if(counter < TB_NUM_KERNEL)
				buf = buf | (buffer[i]&0xFF);
			counter++;
		}
		if(counter >= TB_NUM_KERNEL)
			counter=0;
		filter[f] = buf;
	}

    fclose(fp);
    return;
}

void read_map_simple(int bitWidth, char *mapFile, int nFilters, int nChannels, int mapSize) {
    FILE *fp,*fp2;
	char buffer[16], buffer2[16];
	ap_int<DMA_WIDTH> buf=0;

    // Open weights file for reading
    fp = fopen(mapFile, "rb");
    if(fp == NULL) {
        printf("Error: could not open acts file\n");
        exit(1);
    }

    fp2 = fopen(acts_file_python, "rb");
    if(fp2 == NULL) {
        printf("Error: could not open acts file\n");
        exit(1);
    }

	for(int m = 0, counter = 0; m < mapSize*mapSize*((nChannels-1)/NUM_ACTS_IN_STREAM+1); m++) {
		fread(buffer, sizeof(char), 16, fp);
		fread(buffer2, sizeof(char), 16, fp2);
		for(int i = 15; i >= 0; i--) {
			buf = buf << 8;
			if(counter < nChannels)
				buf = buf | (buffer[i]&0xFF);
			counter++;

			if(buffer[i] != buffer2[i]){
				printf("-->line %X column %X mismatch ---> HW: %d Python: %d\n", m, i, buffer[i], buffer2[i]);
			}
		}
		if(counter >= TB_NUM_KERNEL)
			counter = 0;
		inputMap[m] = buf;
	}

    fclose(fp);
    fclose(fp2);
    return;
}

void read_maps_and_sum_simple(int bitWidth, char *mapFile, char *mapFile2, int nFilters, int nChannels, int mapSize) {
    FILE *fp, *fp2;
	char buffer[16], buffer2[16];
	ap_int<DMA_WIDTH> buf=0;

    // Open weights file for reading
    fp = fopen(mapFile, "rb");
    if(fp == NULL) {
        printf("Error: could not open acts file\n");
        exit(1);
    }

    fp2 = fopen(mapFile2, "rb");
    if(fp == NULL) {
        printf("Error: could not open acts file\n");
        exit(1);
    }

	for(int m = 0, counter = 0; m < mapSize*mapSize*((nChannels-1)/NUM_ACTS_IN_STREAM+1); m++) {
		fread(buffer, sizeof(char), 16, fp);
		fread(buffer2, sizeof(char), 16, fp2);
		for(int i = 15; i >= 0; i--) {
			buf = buf << 8;
			if(counter < nChannels) {
				int accum = buffer[i] + buffer2[i];
				if(accum > 127)
					accum = 127;
				else if(accum < 0)
					accum = 0;
				buf = buf | (accum&0xFF);
			}
			counter++;
		}
		if(counter >= TB_NUM_KERNEL)
			counter = 0;
		inputMap[m] = buf;
	}

    fclose(fp);
    return;
}

void conv(hls::stream<stream_in_t> &strm_in,
		  hls::stream<stream_out_t> &strm_out,
		  int numFilters,
		  int numKernels,
		  int inputMapSizeX,
		  int inputMapSizeY,
		  int ctrl// 0-2: padding, 3-5: kernelSize
		  );


void print_mat(int *x, int rows, int cols)
{
	int i;
	for (i=0; i<rows; i++) {
		for (int j=0; j<cols; j++) {
			printf("%5d ", x[i*cols+j]);
		}
		printf("\n");
	}
	printf("\n");
}

void print_inputMat(act_t *x, int rows, int cols, int channels){
	int i;
	for(int c=0;c<channels;c++){
		for (i=0; i<rows; i++) {
			for (int j=0; j<cols; j++) {
				printf("%5d ", (int)x[3*(i*rows+j)+c]);
			}
			printf("\n");
		}
		printf("\n\n\n");
	}
}

void print_Map(ap_int<DMA_WIDTH> *x, int rows, int cols, int channels, bool relud){
	int i;
	int addrSuplement =0;
	int shifting= NUM_ACTS_IN_STREAM;
	int addr=0;
	//printf("starting shifting is %d\n",shifting);
	for(int c=0; c<channels ;c++){ //(TB_NUM_KERNEL/NUM_ACTS_IN_STREAM+1)  ((channels-1)/NUM_ACTS_IN_STREAM+1)*NUM_ACTS_IN_STREAM;c>((~(channels-1)&(NUM_ACTS_IN_STREAM-1)))
		shifting--;
		addr=0;
		int value=0;
		int signedBit=0;
		if(shifting <0) shifting=NUM_ACTS_IN_STREAM-1;
		printf("channel = %d:\n", c);
		for (i=0; i<rows; i++) {
			for (int j=0; j<cols; j++) {
				printf("(%d,%d): ", i,j);
				//printf("shifting is %d   addr suplement is %d",shifting  , addrSuplement);
				//printf(" addr+addrSuplement is %d ",addr+addrSuplement);//(i*rows*((channels/NUM_ACTS_IN_STREAM+1)/NUM_ACTS_IN_STREAM)+j*((channels/NUM_ACTS_IN_STREAM+1)/NUM_ACTS_IN_STREAM))+addrSuplement

				value=((x[addr+addrSuplement]>>ACTS_REMAINDER)>>((shifting)*ACTS_WIDTH))&(((long)1<<ACTS_WIDTH)-1);
				//int offset = DMA_WIDTH - (shifting)*ACTS_WIDTH;
				signed bit=(value&((1<<ACTS_WIDTH)-1))>>(ACTS_WIDTH-1);
				//printf("bit is %d for value %d\n",bit,value);
				if(bit&&relud){
					value=(int)(((1<<32-ACTS_WIDTH)-1)<<ACTS_WIDTH)+(int)value;
				}
				printf("value = %hd  ",value);//(x[(i*rows+j)+c/actsPerStream]>>(ACTS_WIDTH*(c&(actsPerStream-1))))&((1<<ACTS_WIDTH)-1)  &(((long)1<<ACTS_WIDTH)-1)
				addr+=((channels-1)/NUM_ACTS_IN_STREAM+1);
			}
			printf("\n");
		}
		printf("\n\n\n");
		if(shifting%NUM_ACTS_IN_STREAM== 0) addrSuplement++;

	}
}

void print_Filter(ap_int<DMA_WIDTH> *x, int rows, int cols, int channels){
	int i;
	int addrSuplement =0;
	int shifting= NUM_WEIGHTS_IN_STREAM;
	int addr=0;
	//printf("starting shifting is %d\n",shifting);
	for(int c = 0; c < channels ;c++){ //(TB_NUM_KERNEL/NUM_WEIGHTS_IN_STREAM+1)  ((channels-1)/NUM_WEIGHTS_IN_STREAM+1)*NUM_WEIGHTS_IN_STREAM;c>((~(channels-1)&(NUM_WEIGHTS_IN_STREAM-1)))
		shifting--;
		addr=0;
		int value=0;
		int signedBit=0;
		printf("channel = %d:\n", c);
		if(shifting <0) shifting=NUM_WEIGHTS_IN_STREAM-1;
		for (i=0; i<rows; i++) {
			for (int j=0; j<cols; j++) {
				printf("(%d,%d): ", i,j);
				//printf("shifitng is %d   addr suplement is %d\n",shifting  , addrSuplement);


				//printf(" addr+addrSuplement is %d ",addr+addrSuplement);//(i*rows*((channels/NUM_WEIGHTS_IN_STREAM+1)/NUM_WEIGHTS_IN_STREAM)+j*((channels/NUM_WEIGHTS_IN_STREAM+1)/NUM_WEIGHTS_IN_STREAM))+addrSuplement
				value=((x[addr+addrSuplement]>>WEIGHTS_REMAINDER)>>(shifting)*WEIGHT_WIDTH)&(((long)1<<WEIGHT_WIDTH)-1);
				signed bit=(value&((1<<WEIGHT_WIDTH)-1))>>(WEIGHT_WIDTH-1);
				//printf("bit is %d for value %d\n",bit,value);
				if(bit){
					value=(int)(((1<<32-WEIGHT_WIDTH)-1)<<WEIGHT_WIDTH)+(int)value;
				}
				printf("value = %hd  ",value);//(x[(i*rows+j)+c/actsPerStream]>>(ACTS_WIDTH*(c&(actsPerStream-1))))&((1<<ACTS_WIDTH)-1)  &(((long)1<<ACTS_WIDTH)-1)
				addr+=((channels-1)/NUM_WEIGHTS_IN_STREAM+1);
			}
			printf("\n");
		}
		printf("\n\n\n");
		if(shifting%NUM_WEIGHTS_IN_STREAM== 0) addrSuplement++;

	}
}

void hw_to_sw_vector_conversion(bool onlyOutput){
	int sizeOfFilter = TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1);
	int mapShift = TB_INPUT_MAP_SIZE*TB_INPUT_MAP_SIZE*((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1);
	int addrSuplement = 0;
	int addr = 0;
	ap_int<DMA_WIDTH> *curr_filter = filter;
	int shifting = NUM_WEIGHTS_IN_STREAM;

	//Output conversion
	if(onlyOutput) {
		//for (int f = 0; f < TB_NUM_FILTERS; f++){
			shifting = NUM_ACTS_IN_STREAM;
			for (int c = 0; c < TB_NUM_FILTERS; c++){ //(TB_NUM_KERNEL/NUM_ACTS_IN_STREAM+1)  ((channels-1)/NUM_ACTS_IN_STREAM+1)*NUM_ACTS_IN_STREAM;c>((~(channels-1)&(NUM_ACTS_IN_STREAM-1)))
				shifting--;
				addr = 0;
				int value = 0;
				int signedBit = 0;
				if(shifting < 0) shifting=NUM_ACTS_IN_STREAM-1;
				for (int i=0; i<TB_OUTPUT_MAP_SIZE; i++) {
					for (int j=0; j<TB_OUTPUT_MAP_SIZE; j++) {
						value=((outputMap[addr+addrSuplement]>>ACTS_REMAINDER)>>(shifting)*ACTS_WIDTH)&(((long)1<<ACTS_WIDTH)-1);
						signed bit=(value&((1<<ACTS_WIDTH)-1))>>(ACTS_WIDTH-1);

						outputMap_hw_to_sw[c][i*TB_OUTPUT_MAP_SIZE+j] = value;
						addr+=((TB_NUM_FILTERS-1)/NUM_ACTS_IN_STREAM+1);
					}
				}
				if(shifting%NUM_ACTS_IN_STREAM == 0) addrSuplement++;
			}
		//}
		return;
	}

	addrSuplement = 0;

	//New filter converter
	for(int f = 0; f < TB_NUM_FILTERS; f++) {
		shifting = NUM_WEIGHTS_IN_STREAM-1;
		for(int c = TB_NUM_KERNEL-1; c >= 0; c--) {
			addr = (TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM - c/NUM_WEIGHTS_IN_STREAM;
			int value = 0;
			int signedBit = 0;

			for(int ky = 0; ky < TB_KERNEL_SIZE; ky++) {
				for(int kx = 0; kx < TB_KERNEL_SIZE; kx++) {
					value = ((filter[f*sizeOfFilter + addr] >> WEIGHTS_REMAINDER) 
							>> (shifting*WEIGHT_WIDTH)) & (((long)1<<WEIGHT_WIDTH)-1);
					signed bit = (value & ((1<<WEIGHT_WIDTH)-1)) >> (WEIGHT_WIDTH-1);
					if(bit) {
						value = (int)(((1<<32-WEIGHT_WIDTH)-1)<<WEIGHT_WIDTH)+(int)value;
					}
					filter_sw[f][TB_NUM_KERNEL-1 - c][ky*TB_KERNEL_SIZE+kx] = value;
					addr += (TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1;
				}
			}
			shifting--;
			if(shifting == -1)
				shifting = NUM_WEIGHTS_IN_STREAM-1;
		}
	}

	addrSuplement = 0;
	//inputMap conversion
	act_t inputMap_sw_buffer[TB_NUM_KERNEL][TB_INPUT_MAP_SIZE*TB_INPUT_MAP_SIZE];
	shifting = NUM_ACTS_IN_STREAM-1;
	for (int c = TB_NUM_KERNEL-1; c >= 0; c--){ //(TB_NUM_KERNEL/NUM_ACTS_IN_STREAM+1)  ((channels-1)/NUM_ACTS_IN_STREAM+1)*NUM_ACTS_IN_STREAM;c>((~(channels-1)&(NUM_ACTS_IN_STREAM-1)))
		addr = (TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM - c/NUM_ACTS_IN_STREAM;
		int value = 0;
		int signedBit = 0;
		if(shifting <0) shifting=NUM_ACTS_IN_STREAM-1;
		for (int i=0; i<TB_INPUT_MAP_SIZE; i++) {
			for (int j=0; j<TB_INPUT_MAP_SIZE; j++) {
				value=((inputMap[addr]>>ACTS_REMAINDER)
				>>(shifting)*ACTS_WIDTH)&(((long)1<<ACTS_WIDTH)-1);
				signed bit=(value&((1<<ACTS_WIDTH)-1))>>(ACTS_WIDTH-1);
				if(bit&&TB_RELU_OK){
					value=(int)(((1<<32-ACTS_WIDTH)-1)<<ACTS_WIDTH)+(int)value;
				}
				inputMap_sw_buffer[TB_NUM_KERNEL-1 - c][i*TB_INPUT_MAP_SIZE+j] = value;
				addr+=((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1);
			}
		}
		shifting--;
		if(shifting == -1)
			shifting = NUM_ACTS_IN_STREAM-1;
	}

	if(TB_PADDING > 0) {
		//add padding to inputMap
		for(int k = 0; k < TB_NUM_KERNEL; k++) {
			int idx = 0;
			for(int i = 0; i < (TB_INPUT_MAP_SIZE+2*TB_PADDING); i++) {
				for(int j = 0; j < (TB_INPUT_MAP_SIZE+2*TB_PADDING); j++) {
					if(i < TB_PADDING || i >= TB_PADDING + TB_INPUT_MAP_SIZE || 
					j < TB_PADDING || j >= TB_PADDING + TB_INPUT_MAP_SIZE) {
						inputMap_sw[k][i*(TB_INPUT_MAP_SIZE+2*TB_PADDING) + j] = 0;
					}
					else {
						inputMap_sw[k][i*(TB_INPUT_MAP_SIZE+2*TB_PADDING) + j] = inputMap_sw_buffer[k][idx++];
					}
				}
			}
		}
	}
	else {
		for(int k = 0; k < TB_NUM_KERNEL; k++) {
			for(int i = 0; i < (TB_INPUT_MAP_SIZE); i++) {
				for(int j = 0; j < (TB_INPUT_MAP_SIZE); j++) {
					inputMap_sw[k][i*(TB_INPUT_MAP_SIZE) + j] = inputMap_sw_buffer[k][i*(TB_INPUT_MAP_SIZE) + j];
				}
			}
		}
	}
}

//void testbenchVectors(){
//	//Input map generation
//	printf("Generating Input Map...\n\n");
//	for (int i=0; i<(TB_INPUT_MAP_SIZE*TB_INPUT_MAP_SIZE); i++) {
//		for(int k=0; k<((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1);k++){
//			ap_int<DMA_WIDTH> bus_value= 0;
//			act_t curr_value;
//			for(int y=0;y<NUM_ACTS_IN_STREAM;y++){
//				if(k*NUM_ACTS_IN_STREAM+y<TB_NUM_KERNEL){
//					if(y % 2 == 0) {
//						curr_value = y + 1;
//					}
//					else {
//						curr_value = - (y + 1);
//					}
//					bus_value= (bus_value<<ACTS_WIDTH)+(curr_value&0xFF);
//
//					//printf("put %d into %lu\n",(TB_INPUT_MAP_SIZE*TB_INPUT_MAP_SIZE)*(k*NUM_ACTS_IN_STREAM+y)+i,value);
//				}else{
//					bus_value= (bus_value<<ACTS_WIDTH);
//					//printf("shifted %d into %lu",ACTS_WIDTH,value);
//				}
//			} //arranjar shifts quando width n e potencia 2
//			inputMap[i*((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1)+k] = bus_value<<ACTS_REMAINDER;
//			printf("%x %x in pos %d\n",
//					inputMap[i*((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1)+k].range(DMA_WIDTH-1,DMA_WIDTH/2),
//					inputMap[i*((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1)+k].range(DMA_WIDTH/2-1,0),
//					i*((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1)+k);
//			for(int idx = NUM_ACTS_IN_STREAM - 1; idx >= 0; idx--) {
//				printf("In bus range %d - %d --> %d\n",
//						(idx+1)*ACTS_WIDTH-1,
//					   	idx*ACTS_WIDTH,
//						bus_value.range((idx+1)*ACTS_WIDTH-1,idx*ACTS_WIDTH).to_int()
//						);
//			}
//		}
//	}
//
//	//Filter generation
//	printf("\nGenerating Filter...\n\n");
//	int k_limit = 0;
//	if(NUM_WEIGHTS_IN_STREAM > NUM_ACTS_IN_STREAM)
//		k_limit = ((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1)*WEIGHTS_ACTS_RATIO;
//	else
//		k_limit = ((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1)*WEIGHTS_ACTS_RATIO;
//
//	for (int f=0; f<(TB_NUM_FILTERS); f++) {
//		for (int i=0; i<(TB_KERNEL_SIZE*TB_KERNEL_SIZE); i++) {
//			for(int k=0; k<k_limit;k++){
//				ap_int<DMA_WIDTH> bus_value= 0;
//				weight_t curr_value;
//				for(int y=0;y<NUM_WEIGHTS_IN_STREAM;y++){
//					if(y % 2 == 0) {
//						curr_value = NUM_WEIGHTS_IN_STREAM - y + 1;
//					}
//					else {
//						curr_value = - (NUM_WEIGHTS_IN_STREAM - y + 1);
//					};
//					if(k*NUM_WEIGHTS_IN_STREAM+y<TB_NUM_KERNEL){
//						bus_value= (bus_value<<WEIGHT_WIDTH)+(curr_value&0xFF);
//						//printf("put %d into %lu\n",(f*TB_KERNEL_SIZE*TB_KERNEL_SIZE*TB_NUM_KERNEL)+(TB_KERNEL_SIZE*TB_KERNEL_SIZE)*(k*NUM_WEIGHTS_IN_STREAM+y)+i,value);
//
//					}else{
//						bus_value= (bus_value<<WEIGHT_WIDTH);
//						//printf("shifted %d into %lu",WEIGHT_WIDTH,value);
//					}
//				}
//				filter[(f*TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1))+i*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1)+k] = bus_value<<WEIGHTS_REMAINDER;
//				//printf("\t%d  %lu\n",(f*TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1))+i*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1)+k,filter[(f*TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1))+i*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1)+k]);
//			}
//
//		}
//	}
//}

void compareOutputs() {
	int diff[TB_NUM_FILTERS][TB_OUTPUT_MAP_SIZE*TB_OUTPUT_MAP_SIZE], num_err = 0;;
	hw_to_sw_vector_conversion(true);
	for(int f = 0; f < (TB_NUM_FILTERS); f++) {
		for(int i = 0; i < (TB_OUTPUT_MAP_SIZE); i++) {
			for(int j = 0; j < (TB_OUTPUT_MAP_SIZE); j++) {
				diff[f][i*(TB_OUTPUT_MAP_SIZE) + j] = outputMap_hw_to_sw[f][i*(TB_OUTPUT_MAP_SIZE) + j] -
													  outputMap_sw[f][i*(TB_OUTPUT_MAP_SIZE) + j];

				if(diff[f][i*(TB_OUTPUT_MAP_SIZE) + j] != 0)
					num_err++;
			}
		}
	}

	if(PRINT_OK_RESULT){
		printf("Difference in results between hardware and simulator:\n\n");
		for(int f = 0; f < (TB_NUM_FILTERS); f++) {
			printf("channel = %d:\n", f);
			for(int i = 0; i < (TB_OUTPUT_MAP_SIZE); i++) {
				for(int j = 0; j < (TB_OUTPUT_MAP_SIZE); j++) {
					printf("(%d,%d): ", i,j);
					printf("value = %d  ",diff[f][i*(TB_OUTPUT_MAP_SIZE) + j]);
				}
				printf("\n");
			}
			printf("\n\n\n");
		}
	}

	if(num_err > 0)
		printf("\n\nDifferent outputs detected = %d\n\n", num_err);

}


void sw_conv_3D(bool print) 
{
	for (int f = 0; f < TB_NUM_FILTERS; f++)
	{
		for (int i = 0; i < TB_OUTPUT_MAP_SIZE; i++)
		{
			for (int j = 0; j < TB_OUTPUT_MAP_SIZE; j++)
			{
				accum_t accum = bias[f];
				for (int k = 0; k < TB_NUM_KERNEL; k++)
				{
					if(PRINT_OK_SW) printf("c = %d, map (%d,%d): k = %d\n",f,i,j,k);
					for (int ky = 0; ky < TB_KERNEL_SIZE; ky++)
					{
						for (int kx = 0; kx < TB_KERNEL_SIZE; kx++)
						{
							int inputMap_idx = (ky + i*TB_STRIDE) * (TB_INPUT_MAP_SIZE+2*TB_PADDING) + (kx + j*TB_STRIDE);
							accum += filter_sw[f][k][ky*TB_KERNEL_SIZE+kx] * inputMap_sw[k][inputMap_idx];
							if(PRINT_OK_SW) {
								printf("\t%d * %d = %d, accum = %d // kernel (%d,%d) * inputMap_idx (%d,%d)\n",
							  		filter_sw[f][k][ky*TB_KERNEL_SIZE+kx],
							  		inputMap_sw[k][inputMap_idx],
							  		filter_sw[f][k][ky*TB_KERNEL_SIZE+kx] * inputMap_sw[k][inputMap_idx],
							  		accum.to_int(),
							  		ky,kx,
							 		(ky + i*TB_STRIDE), (kx + j*TB_STRIDE));
							}
						}
					}
					if(PRINT_OK_SW) printf("\n");
					
				}
				if(PRINT_OK_SW)printf("\n\n");

				if(TB_RELU_OK && accum < 0)
					accum = 0;
				else
					accum >>= TB_SCALE;

				if(PRINT_OK_SW)printf("Accum result after scale = %X \n", accum);

				if(accum >= ((1<<(ACTS_WIDTH-1))-1)) {
					accum = (1<<(ACTS_WIDTH-1))-1;
				}
				else if(accum <= -((1<<(ACTS_WIDTH-1))-1)) {
					accum = -((1<<(ACTS_WIDTH-1))-1);
				}

				if(PRINT_OK_SW)printf("After truncation = %X \n\n", accum);

				act_t result = accum.range(ACTS_WIDTH-1,0);

				outputMap_sw[f][i*TB_OUTPUT_MAP_SIZE+j] = result;
			}
		}
	}

	//Save in .bin file software results
	act_bus_t outputMap_sw_bus = 0;
	FILE *fp = fopen(output_map_file_sw, "wb");
	printf("Software only bus output\n");
	for(int y = 0; y < TB_OUTPUT_MAP_SIZE; y++) {
		for(int x = 0; x < TB_OUTPUT_MAP_SIZE; x++) {
			int i = 0;
			for(int c = 0; c < TB_NUM_FILTERS; c++) {
				outputMap_sw_bus.range(DMA_WIDTH-1-i*ACTS_WIDTH, 
									   DMA_WIDTH-(i+1)*ACTS_WIDTH) = outputMap_sw[c][y*TB_OUTPUT_MAP_SIZE+x];
				i++;
				if (i == NUM_ACTS_IN_STREAM) {
					i = 0;
					printf("\ttmp data %X ",outputMap_sw_bus.range((DMA_WIDTH/4)-1,0).to_int());
					printf("%X ",outputMap_sw_bus.range((DMA_WIDTH/4)*2-1,(DMA_WIDTH/4)).to_int());
					printf("%X ",outputMap_sw_bus.range((DMA_WIDTH/4)*3-1,(DMA_WIDTH/4)*2).to_int());
					printf("%X\n",outputMap_sw_bus.range(DMA_WIDTH-1,(DMA_WIDTH/4)*3).to_int());
					fwrite(&outputMap_sw_bus, sizeof(act_bus_t), 1, fp);
				}
			}
		}
	}
	fclose(fp);

	//Print software result
	if(print) {
		printf("-----------------Software only Output-----------------\n\n");
		for(int f = 0; f < TB_NUM_FILTERS ; f++) {
			printf("channel = %d:\n", f);
			for(int i = 0; i < (TB_OUTPUT_MAP_SIZE); i++) {
				for(int j = 0; j < (TB_OUTPUT_MAP_SIZE); j++) {
					int value = outputMap_sw[f][i*(TB_OUTPUT_MAP_SIZE) + j];
					printf("(%d,%d): ", i,j);
					printf("value = %hd  ",value);
				}
				printf("\n");
			}
			printf("\n\n\n");
		}
	}
}

hls::stream<stream_in_t> str_in("inputStream"); //("sinp");
hls::stream<stream_out_t> str_out("outputStream"); //("sout");

int main()
{
	outputMap = (ap_int<DMA_WIDTH> *)malloc(TB_OUTPUT_MAP_SIZE*TB_OUTPUT_MAP_SIZE*((TB_NUM_FILTERS-1)/NUM_ACTS_IN_STREAM+1)*sizeof(ap_int<DMA_WIDTH>));
	outputMap_sw = (act_t **)malloc(TB_NUM_FILTERS*sizeof(act_t *));
	outputMap_hw_to_sw = (act_t **)malloc(TB_NUM_FILTERS*sizeof(act_t *));
	for(int i = 0; i < TB_NUM_FILTERS; i++) {
		outputMap_sw[i] = (act_t *)malloc(TB_OUTPUT_MAP_SIZE*TB_OUTPUT_MAP_SIZE*sizeof(act_t));
		outputMap_hw_to_sw[i] = (act_t *)malloc(TB_OUTPUT_MAP_SIZE*TB_OUTPUT_MAP_SIZE*sizeof(act_t));
	}

	stream_in_t tmp, tmpa;
	int sizeOfFilter = TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1);

	printf("Beginning testbench\n");

	read_weights_simple(WEIGHT_WIDTH, weights_file, TB_NUM_FILTERS, TB_NUM_KERNEL, TB_KERNEL_SIZE);

	if(DO_SHORTCUT)
		read_maps_and_sum_simple(ACTS_WIDTH, acts_file, acts_file_sum, TB_NUM_FILTERS, TB_NUM_KERNEL, TB_INPUT_MAP_SIZE);
	else
		read_map_simple(ACTS_WIDTH, acts_file, TB_NUM_FILTERS, TB_NUM_KERNEL, TB_INPUT_MAP_SIZE);

	if(PRINT_OK) {
		for(int i = 0; i < TB_NUM_FILTERS; i++){
			printf("\n\tFilter %d \n", i);
			print_Filter(filter+i*sizeOfFilter, TB_KERNEL_SIZE, TB_KERNEL_SIZE,TB_NUM_KERNEL);
		}

		printf("\n\tInput Image %d \n", 0);
		print_Map(inputMap, TB_INPUT_MAP_SIZE, TB_INPUT_MAP_SIZE, TB_NUM_KERNEL, TB_MAP_SIGNED_OK);
	}

	hw_to_sw_vector_conversion(false);

	// SW-only conv
	sw_conv_3D(PRINT_OK);

	// HW conv
	if(HW_ON){
		for(int i=0;i<(TB_NUM_FILTERS-1)/NUM_BIAS_IN_STREAM+1;i++){
			bias[i] = 0;
			tmp.data = bias[i];

			if(i == (((TB_NUM_FILTERS-1)/NUM_BIAS_IN_STREAM+1)-1))
				tmp.last=1;
			else
				tmp.last=0;

			printf("\ttmp data %X ",tmp.data.range(DMA_WIDTH-1,(DMA_WIDTH/4)*3).to_int());
			printf("%X ",tmp.data.range((DMA_WIDTH/4)*3-1,(DMA_WIDTH/4)*2).to_int());
			printf("%X ",tmp.data.range((DMA_WIDTH/4)*2-1,(DMA_WIDTH/4)).to_int());
			printf("%X\n",tmp.data.range((DMA_WIDTH/4)-1,0).to_int());

			str_in.write(tmp);
		}
		printf("\nSent Bias N = %d \n\n",((TB_NUM_FILTERS-1)/NUM_BIAS_IN_STREAM+1));

		for (int i=0; i<(TB_NUM_FILTERS*TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1)); i++) {
			tmp.data=(ap_uint<DMA_WIDTH>)filter[i];

			if(i == TB_NUM_FILTERS*TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1)-1)
				tmp.last=1;
			else
				tmp.last=0;

			printf("\ttmp data %X ",tmp.data.range(DMA_WIDTH-1,(DMA_WIDTH/4)*3).to_int());
			printf("%X ",tmp.data.range((DMA_WIDTH/4)*3-1,(DMA_WIDTH/4)*2).to_int());
			printf("%X ",tmp.data.range((DMA_WIDTH/4)*2-1,(DMA_WIDTH/4)).to_int());
			printf("%X\n",tmp.data.range((DMA_WIDTH/4)-1,0).to_int());

			str_in.write(tmp);
		}
		printf("\nSent whole Filter N = %d \n\n",(TB_NUM_FILTERS*TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1)));

		for (int y =0 ;y<TB_INPUT_MAP_SIZE*TB_INPUT_MAP_SIZE*((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1); y++) {
			tmp.data=(ap_int<DMA_WIDTH>)inputMap[y];

			if(y == TB_INPUT_MAP_SIZE*TB_INPUT_MAP_SIZE*((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1)-1)
				tmp.last=1;
			else
				tmp.last=0;

	//		printf("\ttmp data %X ",tmp.data.range(DMA_WIDTH-1,(DMA_WIDTH/4)*3).to_int());
	//		printf("%X ",tmp.data.range((DMA_WIDTH/4)*3-1,(DMA_WIDTH/4)*2).to_int());
	//		printf("%X ",tmp.data.range((DMA_WIDTH/4)*2-1,(DMA_WIDTH/4)).to_int());
	//		printf("%X\n",tmp.data.range((DMA_WIDTH/4)-1,0).to_int());

			printf("\ttmp data %X ",tmp.data.range((DMA_WIDTH/4)-1,0).to_int());
			printf("%X ",tmp.data.range((DMA_WIDTH/4)*2-1,(DMA_WIDTH/4)).to_int());
			printf("%X ",tmp.data.range((DMA_WIDTH/4)*3-1,(DMA_WIDTH/4)*2).to_int());
			printf("%X\n",tmp.data.range(DMA_WIDTH-1,(DMA_WIDTH/4)*3).to_int());

			str_in.write(tmp);
		}
		printf("\nSent whole Input Map N = %d  \n\n",TB_INPUT_MAP_SIZE*TB_INPUT_MAP_SIZE*((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1));

		// 0-2: padding, 3-5: kernelSize
		int ctrl=(TB_PADDING)+(TB_KERNEL_SIZE<<3)+(TB_STRIDE<<6)+(TB_BIAS_SCALE<<8)+(TB_MAP_SIGNED_OK<<12)+(TB_RELU_OK<<13)+(TB_SCALE<<14);
		conv(str_in, str_out,TB_NUM_FILTERS,TB_NUM_KERNEL,TB_INPUT_MAP_SIZE,TB_INPUT_MAP_SIZE,ctrl);

		printf("Receiving out Map N = %d  \n\n",TB_OUTPUT_MAP_SIZE*TB_OUTPUT_MAP_SIZE*((TB_NUM_FILTERS-1)/NUM_ACTS_IN_STREAM+1));

		FILE *fp = fopen(output_map_file, "wb");
		for (int i=0; i<TB_OUTPUT_MAP_SIZE*TB_OUTPUT_MAP_SIZE*((TB_NUM_FILTERS-1)/NUM_ACTS_IN_STREAM+1); i++) {
			tmpa = str_out.read();

			outputMap[i] = ((ap_uint<DMA_WIDTH>)tmpa.data);
			fwrite(&outputMap[i], sizeof(ap_uint<DMA_WIDTH>), 1, fp);

			//printf("%lu\n",outputMap[i]);
	//		printf("\ttmp data %X ",tmpa.data.range(DMA_WIDTH-1,(DMA_WIDTH/4)*3).to_int());
	//		printf("%X ",tmpa.data.range((DMA_WIDTH/4)*3-1,(DMA_WIDTH/4)*2).to_int());
	//		printf("%X ",tmpa.data.range((DMA_WIDTH/4)*2-1,(DMA_WIDTH/4)).to_int());
	//		printf("%X\n",tmpa.data.range((DMA_WIDTH/4)-1,0).to_int());

			printf("\ttmp data %X ",tmpa.data.range((DMA_WIDTH/4)-1,0).to_int());
			printf("%X ",tmpa.data.range((DMA_WIDTH/4)*2-1,(DMA_WIDTH/4)).to_int());
			printf("%X ",tmpa.data.range((DMA_WIDTH/4)*3-1,(DMA_WIDTH/4)*2).to_int());
			printf("%X\n",tmpa.data.range(DMA_WIDTH-1,(DMA_WIDTH/4)*3).to_int());

			if(tmpa.last) printf("Received LAST\n\n");
		}
		fclose(fp);



		if(PRINT_OK) {
			printf("-----------------Hardware Output-----------------\n\n");
			print_Map(outputMap, TB_OUTPUT_MAP_SIZE, TB_OUTPUT_MAP_SIZE,TB_NUM_FILTERS,TB_RELU_OK);
		}

		compareOutputs();
	}

	return 0;
}
