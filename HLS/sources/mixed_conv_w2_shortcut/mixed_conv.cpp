#include <ap_int.h>
#include <stdint.h>
#include <hls_stream.h>
#include "ap_axi_sdata.h"
#include "mixed_conv.h"

//Debug only
//bool debug_OK = true;

//inline here
void PE(act_bus_t actBus, 
		weight_bus_t filterBus,
		accum_t *accum,
		bool signedOp) {
	#pragma HLS INLINE

	PEOperationLOOP:
	for(int i = 0; i < SIMD_ITERS; i++) {
		#pragma HLS unroll

		weight_t filterValue = filterBus.range((i+1)*WEIGHT_WIDTH - 1,
									  		   i*WEIGHT_WIDTH);

		signed_act_t inputMapValue = actBus.range((i+1)*ACTS_WIDTH - 1,
												  i*ACTS_WIDTH);

		if(signedOp) {
			if(inputMapValue.test(ACTS_WIDTH-1)){
				inputMapValue.set(ACTS_WIDTH);
			}
			*accum += inputMapValue * filterValue;
		}
		else {
			*accum += inputMapValue * filterValue;
		}
		//  if(debug_OK) {
		//  	printf("\t\tDoing mac: featureMap %d * filter %d = %d, accum %d\n",
		//  	   inputMapValue.to_int(),
		//  	   filterValue.to_int(),
		//  	   (int) (inputMapValue * filterValue),
		//  	   (int) *accum
		//  	);

		//  	printf("\t\tBus ranges -> InputMap = %d - %d, Filter = %d - %d\n",
		//  		(i+1)*ACTS_WIDTH-1,
		//  		(i)*ACTS_WIDTH,
		//  		(i+1)*WEIGHT_WIDTH-1,
		//  		(i)*WEIGHT_WIDTH
		//  	);
		//  	printf("\n\n");
		//  }
		// printf("\n");
	}
	//printf("\n");
}

void save_padding_pixel(act_bus_t inputMap[MAX_ACTS_MEM_SIZE],
					   unsigned int initAddr
					   ) {
#pragma HLS inline
	inputMap[initAddr] = 0;
	//printf("saving in pos %d act %d, from PADDING\n", initAddr, inputMap[initAddr]);
}

void read_stream_activations(act_bus_t inputMap[MAX_ACTS_MEM_SIZE],
							 unsigned int initAddr,
							 hls::stream<stream_in_t> &strm_in
							 ) {
#pragma HLS inline
	stream_in_t tmp = strm_in.read();
	inputMap[initAddr] = tmp.data.range(ACTS_BUS_WIDTH-1, ACTS_REMAINDER);
	//printf("saving in pos %d bus %x %x.\n", initAddr, inputMap[initAddr].range(ACTS_BUS_WIDTH-1, ACTS_BUS_WIDTH/2), inputMap[initAddr].range(ACTS_BUS_WIDTH/2-1, 0));
}

void read_feature_map(act_bus_t inputMap[MAX_ACTS_MEM_SIZE], 
					  unsigned int inputMapSizeY,
					  unsigned int streamsPerInputLine,
					  unsigned int paddingIters,
					  unsigned int padding,
					  int inputMapLineAddr[MAX_FEATURE_MAP_LINES+1],
					  unsigned int readLimit,
					  unsigned int *readLines,
					  unsigned int *idx,
					  unsigned int *idy,
					  hls::stream<stream_in_t> &strm_in
					  ) {

	unsigned int saveAddr = inputMapLineAddr[*idy] + (*idx);
	int xPadUpperLimit = streamsPerInputLine - paddingIters;
	int yPadUpperLimit = (int) inputMapSizeY - padding;

//	printf("\nReading ACTIVATIONS from stream...\n\n");

	ReadActivationsLOOP:
	for(int i = 0; i < readLimit; i++) {
	#pragma HLS loop_tripcount min=10*256 max=(MAX_IMAGE_SIZE*MAX_FEATURE_MAP_LINES*3)
	#pragma HLS PIPELINE
		if(*readLines < padding || *idx < paddingIters || *idx >= xPadUpperLimit || *readLines >= yPadUpperLimit)
			save_padding_pixel(inputMap, saveAddr);
		else
			read_stream_activations(inputMap, saveAddr, strm_in);

		saveAddr++;
		(*idx)++;
		if(*idx == streamsPerInputLine) {
			*idx = 0;
			(*idy)++;
			(*readLines)++;
			if(*idy > MAX_FEATURE_MAP_LINES){
				*idy = 0;
			}
			saveAddr = inputMapLineAddr[*idy];
		}
	}
}

void read_feature_map_once(act_bus_t inputMap[MAX_ACTS_MEM_SIZE], 
					  unsigned int inputMapSizeY,
					  unsigned int streamsPerInputLine,
					  unsigned int paddingIters,
					  unsigned int padding,
					  int inputMapLineAddr[MAX_FEATURE_MAP_LINES+1],
					  unsigned int *readLines,
					  unsigned int *idx,
					  unsigned int *idy,
					  hls::stream<stream_in_t> &strm_in
					  ) {
	#pragma HLS INLINE

	unsigned int saveAddr = inputMapLineAddr[*idy] + (*idx);
	int xPadUpperLimit = streamsPerInputLine - paddingIters;
	int yPadUpperLimit = (int) inputMapSizeY - padding;

	//printf("\nReading ACTIVATIONS from stream...\n\n");
	if(*readLines < padding || *idx < paddingIters || *idx >= xPadUpperLimit || *readLines >= yPadUpperLimit)
		save_padding_pixel(inputMap, saveAddr);
	else
		read_stream_activations(inputMap, saveAddr, strm_in);

	(*idx)++;
	if(*idx == streamsPerInputLine) {
		*idx = 0;
		(*idy)++;
		(*readLines)++;
		if(*idy > MAX_FEATURE_MAP_LINES){
			*idy = 0;
		}
	}
}

void read_stream_weights(weight_bus_t filter[MAX_WEIGHTS_MEM_SIZE], 
						 unsigned int *currAddr,
						 int *perWeightCounter,
						 hls::stream<stream_in_t> &strm_in
						 ) {
#pragma HLS INLINE
#pragma HLS ARRAY_PARTITION variable=filter type=cyclic factor=WEIGHTS_ACTS_RATIO

	stream_in_t tmp = strm_in.read();
	int numIters = (*perWeightCounter < WEIGHTS_ACTS_RATIO) ? *perWeightCounter : WEIGHTS_ACTS_RATIO;
	*perWeightCounter -= numIters;

	WeightBusSeparationLOOP:
	for(int i = 0, idx = WEIGHTS_ACTS_RATIO-1;
		i < WEIGHTS_ACTS_RATIO;
		i++, idx--) {
	#pragma HLS loop_tripcount min=(256*256/64) max=(256*256/64)
	#pragma HLS unroll
		int upperLimit = (idx+1)*(DMA_WIDTH/WEIGHTS_ACTS_RATIO)-1;
		int lowerLimit = idx*(DMA_WIDTH/WEIGHTS_ACTS_RATIO);

		filter[(*currAddr) + i] = tmp.data.range(upperLimit,lowerLimit);
		//if(debug_OK) printf("saving in pos %d bus %x\n", (*currAddr)-1, (long long) tmp.data.range(upperLimit,lowerLimit));
	}
	*currAddr += numIters;
	//if(debug_OK) printf("\n");

}

void read_weights(weight_bus_t filter[NUM_PE][MAX_WEIGHTS_MEM_SIZE],
				  unsigned int streamsPerFilter,
				  unsigned int weightsOffset,
				  unsigned int totalWeightStreams, 
				  hls::stream<stream_in_t> &strm_in
				  ) {
	
	unsigned int currPE = 0;
	unsigned int saveAddr = 0;
	unsigned int addrOffset = 0;
	unsigned int streamIter = 0;
	int perWeightCounter = weightsOffset;

	//printf("\nReading WEIGHTS from stream...\n\n");

	ReadWeightStreamsLOOP:
	for(int i = 0; i < totalWeightStreams; i++) {
		#pragma HLS pipeline
		// if(currPE != 0) {
		// 	debug_OK = false;
		// }
		// else {
		// 	debug_OK = true;
		// }
		// printf("PE %d\n", currPE);
		read_stream_weights(filter[currPE], &saveAddr, &perWeightCounter, strm_in);

		streamIter++;
		if(perWeightCounter <= 0) {
			perWeightCounter = weightsOffset;
		}

		//After storing 1 complete filter, change save location to next PE 
		if(streamIter == streamsPerFilter) {
			streamIter = 0;
			currPE++;

			if(currPE == NUM_PE) {
				currPE = 0;
				addrOffset = saveAddr;
			}
			else {
				saveAddr = addrOffset;
			}
		}

	}
}

void read_bias(bias_t bias[MAX_BIAS_MEM_SIZE],
			   unsigned int totalBiasStreams,
			   hls::stream<stream_in_t> &strm_in
			   ) {
	stream_in_t tmp;

	int maxLimit = (MAX_NUM_FILTERS-1)/NUM_BIAS_IN_STREAM+1;
	int readLimit = (totalBiasStreams < maxLimit) ? totalBiasStreams : maxLimit;
	//printf("\nReading BIAS from stream...\n\n");

	ReadBiasStreamsLOOP:
	for(int i = 0; i < readLimit; i++){
		for(int j = 0; j < NUM_BIAS_IN_STREAM; j++) {
		#pragma HLS pipeline
			if(i < totalBiasStreams) {
				if(j == 0) {
					tmp = strm_in.read();
				}
				bias[j + i*NUM_BIAS_IN_STREAM]=tmp.data.range(DMA_WIDTH-1 - j*BIAS_WIDTH,
																DMA_WIDTH - j*BIAS_WIDTH - BIAS_WIDTH);
				//printf("saving in pos %d bias %d, from bus range %d - %d\n", j + i*NUM_BIAS_IN_STREAM, bias[j + i*NUM_BIAS_IN_STREAM], DMA_WIDTH-1 - j*BIAS_WIDTH, DMA_WIDTH - j*BIAS_WIDTH - BIAS_WIDTH);
			}
		}
	}
	//printf("\n");
}

void conv_w2(hls::stream<stream_in_t> &strm_in,
		  hls::stream<stream_out_t> &strm_out,
		  hls::stream<stream_in_t> &strm_in_map2,
		  int numFilters,
		  int numKernels,
		  int inputMapSizeX,
		  int inputMapSizeY,
		  int ctrl
		  ) {
	//Port map definitions
	#pragma HLS INTERFACE axis port=strm_in
	#pragma HLS INTERFACE axis port=strm_out
	#pragma HLS INTERFACE axis port=strm_in_map2
	#pragma HLS INTERFACE s_axilite port=numFilters bundle=BUS1
	#pragma HLS INTERFACE s_axilite port=numKernels bundle=BUS1
	#pragma HLS INTERFACE s_axilite port=inputMapSizeX bundle=BUS1
	#pragma HLS INTERFACE s_axilite port=inputMapSizeY bundle=BUS1
	#pragma HLS INTERFACE s_axilite port=ctrl bundle=BUS1
	#pragma HLS INTERFACE s_axilite port=return bundle=BUS1

	//ctrl bus splitting
	// 0-2: padding, 3-5: kernelSize, 6-7: stride, 8-11: biasScale, 12: mapSigned, 13: relu, 14-16: scale
	ap_uint<3> padding = (ctrl&0x07);
	ap_uint<3> kernelSize = (ctrl&0x38)>>3;
	ap_uint<2> stride = (ctrl&0xC0)>>6;
	ap_uint<4> biasScale = (ctrl&0xF00)>>8;
	bool signedOp = (ctrl&0x1000)>>12;
	bool relu = (ctrl&0x2000)>>13;
	ap_uint<3> scale= (ctrl&0x1C000)>>14;
	bool shortcut = (ctrl&0x20000)>>17;
	ap_uint<3> outScaleMap1 = (ctrl&0x1C0000)>>18;
	ap_uint<3> outScaleMap2 = (ctrl&0xE00000)>>21;
	bool isMap2Signed = (ctrl&0x1000000)>>24;

	//Internal BRAM definitions
	weight_bus_t filter[NUM_PE][MAX_WEIGHTS_MEM_SIZE];
	act_bus_t inputMap[MAX_ACTS_MEM_SIZE];
	act_bus_t inputMap2[MAX_IN_MAP_LINE_SIZE];
	int inputMapLineAddr[MAX_FEATURE_MAP_LINES+1];
	bias_t bias[MAX_BIAS_MEM_SIZE];
	accum_t accum[NUM_PE];

	#pragma HLS array_partition variable=filter type=block factor=NUM_PE dim=1
	//#pragma HLS array_partition variable=filter type=cyclic factor=NUM_WEIGHTS_IN_STREAM dim=2
	//#pragma HLS array_partition variable=inputMap type=cyclic factor=NUM_PE dim=1
	#pragma HLS array_partition variable=inputMapLineAddr type=complete
	#pragma HLS array_partition variable=bias type=cyclic factor=NUM_PE dim=1
	#pragma HLS array_partition variable=accum type=complete

	//Internal variables definitions
	inputMapSizeX += 2*padding;
	inputMapSizeY += 2*padding;

	unsigned int streamsPerWeight = (((numKernels-1)/NUM_WEIGHTS_IN_STREAM)+1);
	unsigned int streamsPerFilter = streamsPerWeight*kernelSize*kernelSize;
	unsigned int streamsPerAct = ((numKernels-1)/NUM_ACTS_IN_STREAM)+1;
	unsigned int streamsPerActOut = ((numFilters-1)/NUM_ACTS_IN_STREAM)+1;
	unsigned int streamsPerInputLine = streamsPerAct*inputMapSizeX;
	unsigned int paddingIters = streamsPerAct*padding;
	unsigned int weightsOffset = 0;
	unsigned int actsOffset = 0;

	//Number of bus that separate in z dimension every weight and act
	if(streamsPerWeight < streamsPerAct) {
		weightsOffset = streamsPerAct;
		actsOffset = streamsPerAct;
	}
	else {
		weightsOffset = streamsPerWeight;
		actsOffset = streamsPerWeight;
	}

	unsigned int totalBiasStreams = (unsigned int) ((numFilters-1)/NUM_BIAS_IN_STREAM)+1;
	unsigned int totalWeightStreams = (unsigned int) numFilters*streamsPerFilter;

	ap_uint<10> outMapSizeX = (inputMapSizeX-kernelSize)/stride+1;
	ap_uint<10> outMapSizeY = (inputMapSizeY-kernelSize)/stride+1;
	ap_uint<10> filtersPerPE = (numFilters-1)/NUM_PE+1;

	unsigned int currInputMapAddr, currFilterAddr, saveInputMapAddr;
	unsigned int xOffsetMap, mapOverlapOffset, offsetFilter;

	unsigned int id_read = 0, id_save = 0, idx = 0;
	for(unsigned int i = 0; i < MAX_FEATURE_MAP_LINES+1; i++) {
		#pragma HLS pipeline II=1
		inputMapLineAddr[i] = i*streamsPerAct*inputMapSizeX;
	}

	unsigned short lineMask = 1, buffer = 2;
	while(lineMask < MAX_FEATURE_MAP_LINES+1) {
		lineMask += buffer;
		buffer *= 2;
	}

	ap_int<DMA_WIDTH> outputPacked = 0;
	stream_out_t tmpo;

	//Initial loading
	read_bias(bias, totalBiasStreams, strm_in);
	read_weights(filter, streamsPerFilter, weightsOffset, totalWeightStreams, strm_in);
	//read_feature_map(inputMap, inputMapSizeY, streamsPerInputLine, paddingIters, padding, strm_in);

	unsigned int readLimit, readLines = 0;
	if(inputMapSizeY >= MAX_FEATURE_MAP_LINES) {
		//readLimit = MAX_FEATURE_MAP_LINES*streamsPerInputLine;
		readLimit = kernelSize*streamsPerInputLine;
	}
	else {
		readLimit = inputMapSizeY*streamsPerInputLine;
	}

	padding = (ctrl&0x07);
	read_feature_map(inputMap, inputMapSizeY, streamsPerInputLine,
					 paddingIters, padding, inputMapLineAddr,
					 readLimit, &readLines, &idx, &id_save, strm_in);

	int shiftA = 0, shiftB = 0, shiftOut = 0;
	if(outScaleMap2 > outScaleMap1) {
		shiftA = outScaleMap2 - outScaleMap1;
		shiftOut = outScaleMap2 - outScaleMap1;
	}
	else {
		shiftB = outScaleMap1 - outScaleMap2;
		shiftOut = outScaleMap1 - outScaleMap2;
	}

	//loop limits
	ap_uint<10> y_limit = (outMapSizeY < MAX_OUT_IMAGE_SIZE) ? outMapSizeY : static_cast<ap_uint<10>>(MAX_OUT_IMAGE_SIZE);
	ap_uint<10> x_limit = (outMapSizeX < MAX_OUT_IMAGE_SIZE) ? outMapSizeX : static_cast<ap_uint<10>>(MAX_OUT_IMAGE_SIZE);
	ap_uint<10> f_limit = (filtersPerPE < (MAX_NUM_FILTERS/NUM_PE)) ? filtersPerPE : static_cast<ap_uint<10>>(MAX_NUM_FILTERS/NUM_PE);
	ap_uint<3> ky_limit = (kernelSize < MAX_KERNEL_SIZE) ? kernelSize : static_cast<ap_uint<3>>(MAX_KERNEL_SIZE);
	ap_uint<3> kx_limit = (kernelSize < MAX_KERNEL_SIZE) ? kernelSize : static_cast<ap_uint<3>>(MAX_KERNEL_SIZE);
	unsigned int kn_limit = (numKernels < MAX_NUM_KERNELS) ? numKernels : MAX_NUM_KERNELS;

	unsigned int streamsRead = 0, streamsReadMap2 = 0;
	bool read_OK = (readLines < inputMapSizeY);
	bool readMap2 = shortcut;
	int idMap2 = 0;

	//Conv time
	OutYLOOP:
	for(int y = 0; y < outMapSizeY; y++) {
		#pragma HLS loop_tripcount min=8 max=8
		OutXLOOP:
		for(int x = 0; x < outMapSizeX; x++) {
			#pragma HLS loop_tripcount min=8 max=8
			FilterLOOP:
			for(int f = 0; f < filtersPerPE; f++) {
				#pragma HLS loop_tripcount min=16 max=16
				KernelYLOOP:
				for(int ky = 0; ky < kernelSize; ky++) {
					#pragma HLS loop_tripcount min=3 max=3
					KernelXLOOP:
					for(int kx = 0; kx < kernelSize; kx++) {
						#pragma HLS loop_tripcount min=3 max=3
						ChannelLOOP:
						for(int kn = 0; kn < numKernels; kn+=SIMD_ITERS) {
							#pragma HLS loop_tripcount min=16 max=16
							//#pragma HLS pipeline II=TARGET_II
							if(kn < kn_limit && kx < kx_limit && ky < ky_limit && f < f_limit && x < x_limit && y < y_limit) {
							if(x == 0 && f == 0 && ky == 0 && kx == 0 && kn == 0) {
								read_OK = (readLines < inputMapSizeY);
								streamsRead = 0;

								if(shortcut){
									readMap2 = true;
									streamsReadMap2 = 0;
									idMap2 = 0;
								}
							}
							// if(x == 0 && f == 0 && ky == 0 && kx == 0 && kn == 0) {
								
							// }
							//Adjust memory addresses
							if(kn == 0) {
								//Feature map offsets
								if(f == 0 && kx == 0 && ky == 0) {
									if(x != 0) {
										xOffsetMap += actsOffset;
									}
									else {
										xOffsetMap = 0;
									}
								}
								if(kx != 0) {
									mapOverlapOffset = kx*actsOffset;
								}
								else {
									mapOverlapOffset = 0;
								}

								if(kx == 0) {
									id_read = (y*stride)%(MAX_FEATURE_MAP_LINES+1) + ky;
//									id_read = ID_READ_TABLE[y%(MAX_FEATURE_MAP_LINES+1)]
									if(id_read > MAX_FEATURE_MAP_LINES) {
										id_read -= (MAX_FEATURE_MAP_LINES+1);
									}
								}

								//General filter location
								currFilterAddr = kx*weightsOffset +
												 ky*weightsOffset*kernelSize +
												 f*weightsOffset*kernelSize*kernelSize;

								currInputMapAddr = inputMapLineAddr[id_read] + xOffsetMap*stride + mapOverlapOffset;
							}

							//Read next input map line when possible
							if(read_OK) {
								read_feature_map_once(inputMap, inputMapSizeY, streamsPerInputLine,
												 	  paddingIters, padding, inputMapLineAddr,
													  &readLines, &idx, &id_save, strm_in);
								streamsRead++;
								if(streamsRead >= streamsPerInputLine*stride){
									read_OK = false;
								}
							}

							//Read input map 2 when performing shortcut
							if(readMap2) {
								read_stream_activations(inputMap2, streamsReadMap2, strm_in_map2);
								streamsReadMap2++;
								if(streamsReadMap2 >= streamsPerActOut*outMapSizeX){
									readMap2 = false;
								}
							}

							//Reset accumulators
							if(kx == 0 && ky == 0 && kn == 0) {
								AccumResetLOOP:
								for(unsigned short peId = 0; peId < NUM_PE; peId++) {
								#pragma HLS unroll
									accum[peId] = 0;

									if(f+peId < numFilters) {
										accum[peId] += bias[f*NUM_PE + peId];
										accum[peId] >>= biasScale;
									}
								}
							}

							//PE calculations
							//printf("current coords: x %d, y %d // f %d, kx %d, ky %d, kn %d\n", x, y, f, kx, ky, kn);
							PECallLOOP:
							for(unsigned short peId = 0; peId < NUM_PE; peId++) {
								#pragma HLS unroll
								//  if(peId != 0) {
								//  	debug_OK = false;
								//  }
								//  else {
								//  	debug_OK = true;
								// 	int readMapAddr = currInputMapAddr + kn/SIMD_ITERS;
								// 	int readFilterAddr = currFilterAddr + kn/SIMD_ITERS;
								// 	printf("\tReference values:\n"
								// 	"\tMap addr = %d\n"
								// 	"\tFilter addr = %d\n\n",
								// 	readMapAddr,
								// 	readFilterAddr);
								//  }
								if(f*SIMD_ITERS+peId < numFilters) {
									int readMapAddr = currInputMapAddr + kn/SIMD_ITERS;
									int readFilterAddr = currFilterAddr + kn/SIMD_ITERS;
									PE(inputMap[readMapAddr],
									   filter[peId][readFilterAddr],
									   &accum[peId],
									   signedOp);
								}

							}

							if(ky==kernelSize-1 && kx==kernelSize-1) {
								if(kn + SIMD_ITERS >= numKernels) {
									//apply scale to all accums
									AccumAdjustmentLOOP:
									for(unsigned short peId = 0; peId < NUM_PE; peId++) {
										//#pragma HLS unroll
										//#pragma HLS
										accum_t output = accum[peId];
										if(output < 0 && relu && !isMap2Signed) {
											output = 0;
										}
										else {
											output >>= scale;
										}

										//limit boundary
										if(output >= ((1<<(ACTS_WIDTH-1))-1)) {
											output = (1<<(ACTS_WIDTH-1))-1;
										}
										else if(output <= -((1<<(ACTS_WIDTH-1))-1)) {
											output = -((1<<(ACTS_WIDTH-1))-1);
										}

										accum[peId] = output;
									}

									short limit = 0;

									OutputStreamPackLOOP:
									for(short unsigned peId = 0; peId < NUM_PE; peId++) {
										accum_t output = accum[peId];

										//Perform shortcut or just apply activation function
										if(shortcut) {
											int bufA = output << shiftA;
											act_t bufB_ = (inputMap2[idMap2]).range((NUM_PE - (peId % NUM_ACTS_IN_STREAM))*ACTS_WIDTH-1,
																			     (NUM_PE-1 - (peId % NUM_ACTS_IN_STREAM))*ACTS_WIDTH);
											int bufB = bufB_ << shiftB;
											
											output = (bufA + bufB) >> shiftOut;
													
											if(output >= ((1<<(ACTS_WIDTH-1))-1)) {
												output = (1<<(ACTS_WIDTH-1))-1;
											}
											else if(output < 0 && relu) {
												output = 0;
											}
											else if(output <= -((1<<(ACTS_WIDTH-1))-1)) {
												output = -((1<<(ACTS_WIDTH-1))-1);
											}
										}

										outputPacked = (outputPacked<<ACTS_WIDTH) + output.range(ACTS_WIDTH-1, 0);
										if((peId + 1) % NUM_ACTS_IN_STREAM == 0 ||
										   ((peId + 1) == NUM_PE && (peId + 1) % NUM_ACTS_IN_STREAM != 0)) {
											//tmpo.data = outputPacked<<ACTS_REMAINDER;
											tmpo.data = outputPacked;
											tmpo.keep = 0xFFFF;
											tmpo.strb = 0xFFFF;
											tmpo.last = (f >= filtersPerPE-1) &&
														(x >= outMapSizeX-1) &&
														(y >= outMapSizeY-1) &&
														(kn + SIMD_ITERS >= numKernels);
											strm_out.write(tmpo);
											//printf("sent output\n\n");
											outputPacked = 0;
										}
									}
									idMap2++;
								}
							}
						}
						}
					}
				}
			}
		}
	}
	return;
}
