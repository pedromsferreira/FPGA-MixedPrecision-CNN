#include <stdio.h>
#include <stdlib.h>
#include <ap_int.h>
#include <cmath>
#include <hls_stream.h>
#include "ap_axi_sdata.h"
#include "mixed_conv.h"

#define TB_NUM_FILTERS 16
#define TB_NUM_KERNEL 18
#define TB_KERNEL_SIZE 3
#define TB_INPUT_MAP_SIZE 5
#define TB_STRIDE 1
#define TB_PADDING 1
#define TB_OUTPUT_MAP_SIZE ((TB_INPUT_MAP_SIZE - TB_KERNEL_SIZE+ 2*TB_PADDING)/TB_STRIDE + 1)
#define TB_SCALE 0
#define TB_BIAS_SCALE 0
#define TB_RELU_OK 1
#define TB_MAP_SIGNED_OK 1
#define TB_LAST_PIXEL_OK 1


static  float filter_sw[TB_NUM_FILTERS][TB_NUM_KERNEL][TB_KERNEL_SIZE*TB_KERNEL_SIZE];
static  float inputMap_sw[TB_NUM_KERNEL][TB_INPUT_MAP_SIZE*TB_INPUT_MAP_SIZE];

static  ap_int<64> filter[TB_NUM_FILTERS*TB_KERNEL_SIZE*TB_KERNEL_SIZE*(TB_NUM_KERNEL/NUM_WEIGHTS_IN_STREAM+1)];
static  ap_int<64> inputMap[TB_INPUT_MAP_SIZE*TB_INPUT_MAP_SIZE*(TB_NUM_KERNEL/NUM_ACTS_IN_STREAM+1)];
static  ap_int<64> bias[TB_NUM_FILTERS];

ap_int<64> outputMap[((2*TB_NUM_FILTERS)/NUM_ACTS_IN_STREAM+1)*TB_OUTPUT_MAP_SIZE*TB_OUTPUT_MAP_SIZE];
float	   outputMap_sw[TB_NUM_FILTERS][TB_OUTPUT_MAP_SIZE*TB_OUTPUT_MAP_SIZE];


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

void print_Map(ap_int<64> *x, int rows, int cols, int channels,bool relud){
	int i;
	int addrSuplement =0;
	int shifting= NUM_ACTS_IN_STREAM;
	int addr=0;
	//printf("starting shifting is %d\n",shifting);
	for(int c=channels; c>0 ;c--){ //(TB_NUM_KERNEL/NUM_ACTS_IN_STREAM+1)  ((channels-1)/NUM_ACTS_IN_STREAM+1)*NUM_ACTS_IN_STREAM;c>((~(channels-1)&(NUM_ACTS_IN_STREAM-1)))
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
				value=((x[addr+addrSuplement]>>ACTS_REMAINDER)>>(shifting)*ACTS_WIDTH)&(((long)1<<ACTS_WIDTH)-1);
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

void print_Filter(ap_int<64> *x, int rows, int cols, int channels){
	int i;
	int addrSuplement =0;
	int shifting= NUM_WEIGHTS_IN_STREAM;
	int addr=0;
	//printf("starting shifting is %d\n",shifting);
	for(int c=channels; c>0 ;c--){ //(TB_NUM_KERNEL/NUM_WEIGHTS_IN_STREAM+1)  ((channels-1)/NUM_WEIGHTS_IN_STREAM+1)*NUM_WEIGHTS_IN_STREAM;c>((~(channels-1)&(NUM_WEIGHTS_IN_STREAM-1)))
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

void hw_to_sw_vector_conversion(){
	int sizeOfFilter = TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1);
	int addrSuplement = 0;
	int addr = 0;
	ap_int<64> *curr_filter = filter;
	int shifting = NUM_WEIGHTS_IN_STREAM;

	//Filter conversion
	for (int f = 0; f < TB_NUM_FILTERS; f++){
		shifting = NUM_WEIGHTS_IN_STREAM;
		for (int c = TB_NUM_KERNEL; c > 0; c--){ //(TB_NUM_KERNEL/NUM_WEIGHTS_IN_STREAM+1)  ((channels-1)/NUM_WEIGHTS_IN_STREAM+1)*NUM_WEIGHTS_IN_STREAM;c>((~(channels-1)&(NUM_WEIGHTS_IN_STREAM-1)))
			shifting--;
			addr = 0;
			int value = 0;
			int signedBit = 0;
			if(shifting <0) shifting=NUM_WEIGHTS_IN_STREAM-1;

			for (int i=0; i<TB_KERNEL_SIZE; i++) {
				for (int j=0; j<TB_KERNEL_SIZE; j++) {
					value=((curr_filter[addr+addrSuplement]>>WEIGHTS_REMAINDER)>>(shifting)*WEIGHT_WIDTH)&(((long)1<<WEIGHT_WIDTH)-1);
					signed bit=(value&((1<<WEIGHT_WIDTH)-1))>>(WEIGHT_WIDTH-1);
					if(bit){
						value=(int)(((1<<32-WEIGHT_WIDTH)-1)<<WEIGHT_WIDTH)+(int)value;
					}
					filter_sw[f][c-1][i*TB_KERNEL_SIZE+j] = (float) value;
					addr+=((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1);
				}
			}
			if(shifting%NUM_WEIGHTS_IN_STREAM== 0) addrSuplement++;
		}
		curr_filter = filter + sizeOfFilter;
	}

	//inputMap conversion
	shifting = NUM_ACTS_IN_STREAM;
	for (int c = TB_NUM_KERNEL; c > 0; c--){ //(TB_NUM_KERNEL/NUM_ACTS_IN_STREAM+1)  ((channels-1)/NUM_ACTS_IN_STREAM+1)*NUM_ACTS_IN_STREAM;c>((~(channels-1)&(NUM_ACTS_IN_STREAM-1)))
		shifting--;
		addr = 0;
		int value = 0;
		int signedBit = 0;
		if(shifting <0) shifting=NUM_ACTS_IN_STREAM-1;
		for (int i=0; i<TB_INPUT_MAP_SIZE; i++) {
			for (int j=0; j<TB_INPUT_MAP_SIZE; j++) {
				value=((inputMap[addr+addrSuplement]>>ACTS_REMAINDER)>>(shifting)*ACTS_WIDTH)&(((long)1<<ACTS_WIDTH)-1);
				signed bit=(value&((1<<ACTS_WIDTH)-1))>>(ACTS_WIDTH-1);
				if(bit&&TB_RELU_OK){
					value=(int)(((1<<32-ACTS_WIDTH)-1)<<ACTS_WIDTH)+(int)value;
				}
				inputMap_sw[c-1][i*TB_INPUT_MAP_SIZE+j] = (float) value;
				addr+=((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1);
			}
		}
		if(shifting%NUM_ACTS_IN_STREAM== 0) addrSuplement++;
	}

}

//void initVectors(){
//
//	for (int i=0; i<(TB_INPUT_MAP_SIZE*TB_INPUT_MAP_SIZE); i++) {
//		for(int k=0; k<((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1);k++){
//			unsigned long long bus_value= 0;
//			unsigned long long curr_value;
//			for(int y=0;y<NUM_ACTS_IN_STREAM;y++){
//				//printf("k*NUM_ACTS_IN_STREAM+y %d\n",k*NUM_ACTS_IN_STREAM+y);
//				if(k*NUM_ACTS_IN_STREAM+y<TB_NUM_KERNEL){
//					curr_value= 1;
//					bus_value= (bus_value<<ACTS_WIDTH)+(curr_value&0xF);
//
//					//printf("put %d into %lu\n",(TB_INPUT_MAP_SIZE*TB_INPUT_MAP_SIZE)*(k*NUM_ACTS_IN_STREAM+y)+i,value);
//				}else{
//					bus_value= (bus_value<<ACTS_WIDTH);
//					//printf("shifted %d into %lu",ACTS_WIDTH,value);
//				}
//			} //arranjar shifts quando width n e potencia 2
//			inputMap[i*((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1)+k] = bus_value<<ACTS_REMAINDER;
//			//printf("%lu \n",inputMap[i*((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1)+k]);
//		}
//
//	}
//
//	for (int f=0; f<(TB_NUM_FILTERS); f++) {
//		for (int i=0; i<(TB_KERNEL_SIZE*TB_KERNEL_SIZE); i++) {
//			for(int k=0; k<((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1);k++){
//				unsigned long long bus_value= 0;
//				unsigned long long curr_value;
//				for(int y=0;y<NUM_WEIGHTS_IN_STREAM;y++){
//					//printf("k*NUM_WEIGHTS_IN_STREAM+y %d\n",k*NUM_WEIGHTS_IN_STREAM+y);
//					if(k*NUM_WEIGHTS_IN_STREAM+y<TB_NUM_KERNEL){
//						curr_value= 1;
//						bus_value= (bus_value<<WEIGHT_WIDTH)+(curr_value&0xF);
//						//printf("put %d into %lu\n",(f*TB_KERNEL_SIZE*TB_KERNEL_SIZE*TB_NUM_KERNEL)+(TB_KERNEL_SIZE*TB_KERNEL_SIZE)*(k*NUM_WEIGHTS_IN_STREAM+y)+i,value);
//
//					}else{
//						bus_value= (bus_value<<WEIGHT_WIDTH);
//						//printf("shifted %d into %lu",WEIGHT_WIDTH,value);
//					}
//
//				}
//				filter[(f*TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1))+i*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1)+k] = bus_value<<WEIGHTS_REMAINDER;
//				//printf("\t%d  %lu\n",(f*TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1))+i*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1)+k,filter[(f*TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1))+i*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1)+k]);
//			}
//
//		}
//	}
//}

void initVectors(){

	for (int i=0; i<(TB_INPUT_MAP_SIZE*TB_INPUT_MAP_SIZE); i++) {
		for(int k=0; k<((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1);k++){
			unsigned long long bus_value= 0;
			unsigned long long curr_value;
			for(int y=0;y<NUM_ACTS_IN_STREAM;y++){
				//printf("k*NUM_ACTS_IN_STREAM+y %d\n",k*NUM_ACTS_IN_STREAM+y);
				if(k*NUM_ACTS_IN_STREAM+y<TB_NUM_KERNEL){
					curr_value= ((TB_INPUT_MAP_SIZE*TB_INPUT_MAP_SIZE)*(k*NUM_ACTS_IN_STREAM+y)+i);
					bus_value= (bus_value<<ACTS_WIDTH)+(curr_value&0xF)+1;

					//printf("put %d into %lu\n",(TB_INPUT_MAP_SIZE*TB_INPUT_MAP_SIZE)*(k*NUM_ACTS_IN_STREAM+y)+i,value);
				}else{
					bus_value= (bus_value<<ACTS_WIDTH);
					//printf("shifted %d into %lu",ACTS_WIDTH,value);
				}
			} //arranjar shifts quando width n e potencia 2
			inputMap[i*((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1)+k] = bus_value<<ACTS_REMAINDER;
			//printf("%lu \n",inputMap[i*((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1)+k]);
		}

	}

	for (int f=0; f<(TB_NUM_FILTERS); f++) {
		for (int i=0; i<(TB_KERNEL_SIZE*TB_KERNEL_SIZE); i++) {
			for(int k=0; k<((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1);k++){
				unsigned long long bus_value= 0;
				unsigned long long curr_value;
				for(int y=0;y<NUM_WEIGHTS_IN_STREAM;y++){
					//printf("k*NUM_WEIGHTS_IN_STREAM+y %d\n",k*NUM_WEIGHTS_IN_STREAM+y);
					if(k*NUM_WEIGHTS_IN_STREAM+y<TB_NUM_KERNEL){
						curr_value= ((f*TB_KERNEL_SIZE*TB_KERNEL_SIZE*TB_NUM_KERNEL)+(TB_KERNEL_SIZE*TB_KERNEL_SIZE)*(k*NUM_WEIGHTS_IN_STREAM+y)+i);
						bus_value= (bus_value<<WEIGHT_WIDTH)+(curr_value&0xF);
						//printf("put %d into %lu\n",(f*TB_KERNEL_SIZE*TB_KERNEL_SIZE*TB_NUM_KERNEL)+(TB_KERNEL_SIZE*TB_KERNEL_SIZE)*(k*NUM_WEIGHTS_IN_STREAM+y)+i,value);

					}else{
						bus_value= (bus_value<<WEIGHT_WIDTH);
						//printf("shifted %d into %lu",WEIGHT_WIDTH,value);
					}

				}
				filter[(f*TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1))+i*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1)+k] = bus_value<<WEIGHTS_REMAINDER;
				//printf("\t%d  %lu\n",(f*TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1))+i*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1)+k,filter[(f*TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1))+i*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1)+k]);
			}

		}
	}
}


void sw_conv_3D() 
{
	for (int f = 0; f < TB_NUM_FILTERS; f++)
	{
		for (int i = 0; i < TB_OUTPUT_MAP_SIZE; i++)
		{
			for (int j = 0; j < TB_OUTPUT_MAP_SIZE; j++)
			{
				float accum = bias[f];
				for (int k = 0; k < TB_NUM_KERNEL; k++)
				{
					for (int x = 0; x < TB_KERNEL_SIZE; x++)
					{
						for (int y = 0; y < TB_KERNEL_SIZE; y++)
						{
							int inputMap_idx = (x + i*TB_STRIDE) * TB_INPUT_MAP_SIZE + (y + j*TB_STRIDE);
							accum += filter_sw[f][k][x*TB_KERNEL_SIZE+y] * inputMap_sw[k][inputMap_idx];
						}
					}
					
				}
				outputMap_sw[f][i*TB_OUTPUT_MAP_SIZE+j] = accum;
			}
		}
	}
}


int main()
{

	hls::stream<stream_in_t> str_in("inputStream"); //("sinp");
	hls::stream<stream_out_t> str_out("outputStream"); //("sout");
	stream_in_t tmp, tmpa;

	printf("Beginning testbench\n");

	initVectors();
	hw_to_sw_vector_conversion();
	printf("Input Map\n");
	print_Map(inputMap, TB_INPUT_MAP_SIZE, TB_INPUT_MAP_SIZE, TB_NUM_KERNEL, TB_MAP_SIGNED_OK);
	printf("Filter 0\n");
	print_Filter(filter, TB_KERNEL_SIZE, TB_KERNEL_SIZE,TB_NUM_KERNEL);
	//printf("Filter 1\n");
	//int sizeOfFilter = TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1);
	//print_Filter(filter+sizeOfFilter, TB_KERNEL_SIZE, TB_KERNEL_SIZE,TB_NUM_KERNEL);
	//printf("Filter 3\n");
	//print_Filter(filter+sizeOfFilter*2, TB_KERNEL_SIZE, TB_KERNEL_SIZE,TB_NUM_KERNEL);
	//print_Filter(filter+sizeOfFilter*3, TB_KERNEL_SIZE, TB_KERNEL_SIZE,TB_NUM_KERNEL);
	//print_Filter(filter+sizeOfFilter*4, TB_KERNEL_SIZE, TB_KERNEL_SIZE,TB_NUM_KERNEL);

	for(int i=0;i<(TB_NUM_FILTERS-1)/NUM_BIAS_IN_STREAM+1;i++){
		bias[i] = 0;
		tmp.data = bias[i];
		str_in.write(tmp);
	}
	printf("Sent Bias N = %d \n",((TB_NUM_FILTERS-1)/NUM_BIAS_IN_STREAM+1));

	for (int i=0; i<(TB_NUM_FILTERS*TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1)); i++) {
		tmp.data=(ap_uint<64>)filter[i];
		printf("tmp data %x\n\n",tmp.data);
		str_in.write(tmp);
		printf("%d %lu\n",i,filter[i]);
	}
	printf("Sent whole Filter N = %d \n",(TB_NUM_FILTERS*TB_KERNEL_SIZE*TB_KERNEL_SIZE*((TB_NUM_KERNEL-1)/NUM_WEIGHTS_IN_STREAM+1)));

	for (int y =0 ;y<TB_INPUT_MAP_SIZE*TB_INPUT_MAP_SIZE*((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1); y++) {
		tmp.data=(ap_int<64>)inputMap[y];
		//if(y == TB_INPUT_MAP_SIZE*TB_INPUT_MAP_SIZE*((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1)-1) tmp.last=1;
		//else tmp.last=0;
		str_in.write(tmp);
		//printf("%lu\n",inputMap[y]);
	}
	printf("Sent whole Input Map N = %d  \n",TB_INPUT_MAP_SIZE*TB_INPUT_MAP_SIZE*((TB_NUM_KERNEL-1)/NUM_ACTS_IN_STREAM+1));

	// SW-only conv
	sw_conv_3D();

	// 0-2: padding, 3-5: kernelSize
	int ctrl=(TB_PADDING)+(TB_KERNEL_SIZE<<3)+(TB_STRIDE<<6)+(TB_BIAS_SCALE<<8)+(TB_MAP_SIGNED_OK<<12)+(TB_RELU_OK<<13)+(TB_SCALE<<14)+(TB_LAST_PIXEL_OK<<17);
	conv(str_in, str_out,TB_NUM_FILTERS,TB_NUM_KERNEL,TB_INPUT_MAP_SIZE,TB_INPUT_MAP_SIZE,ctrl);

	printf("Receiving out Map N = %d  \n",TB_OUTPUT_MAP_SIZE*TB_OUTPUT_MAP_SIZE*((TB_NUM_FILTERS-1)/NUM_ACTS_IN_STREAM+1));

	for (int i=0; i<TB_OUTPUT_MAP_SIZE*TB_OUTPUT_MAP_SIZE*((TB_NUM_FILTERS-1)/NUM_ACTS_IN_STREAM+1); i++) {
		tmpa = str_out.read();
		outputMap[i] = ((ap_uint<64>)tmpa.data);
		printf("%lu\n",outputMap[i]);
		if(tmpa.last) printf("Received LAST\n");
	}

	printf("Output is: \n");
	print_Map(outputMap, TB_OUTPUT_MAP_SIZE, TB_OUTPUT_MAP_SIZE,TB_NUM_FILTERS,0);

	return 0;
}
