#include <ap_int.h>
#include <stdint.h>
#include <hls_stream.h>
#include "ap_axi_sdata.h"
#include "mixed_conv.h"

void PE(act_t inputMap[MAX_ACTS_MEM_SIZE], 
		weight_t filter[MAX_WEIGHTS_MEM_SIZE],
		accum_t *accum,
		unsigned int initInputMapAddr,
		unsigned int initFilterAddr,
		bool signedOp) {
	signed_act_t inputMapValue = 0;

	PEOperationLOOP:
	for(int i = SIMD_ITERS-1; i >= 0; i--) {
		#pragma HLS unroll
		inputMapValue = inputMap[initInputMapAddr+i];
		if(signedOp) {
			if(inputMapValue.test(ACTS_WIDTH-1)){
				inputMapValue.set(ACTS_WIDTH);
			}
			*accum += inputMapValue * filter[initFilterAddr+i];
		}
		else {
			*accum += inputMapValue * filter[initFilterAddr+i];
		}
		printf("\t\tDoing mac: featureMap %d * filter %d = %d, accum %d\n",
				inputMap[initInputMapAddr+i].to_int(),
				filter[initFilterAddr+i].to_int(),
				(int) (inputMapValue * filter[initFilterAddr+i]),
				(int) *accum);
	}
	printf("\n");
}

void save_padding_pixel(act_t inputMap[MAX_ACTS_MEM_SIZE],
					   unsigned int initAddr
					   ) {
	for(int i = 0; i < NUM_ACTS_IN_STREAM; i++) {
		#pragma HLS unroll
		inputMap[initAddr+i] = 0;
		printf("saving in pos %d act %d, from PADDING\n", initAddr+i, inputMap[initAddr+i]);
	}
	printf("\n");
}

void read_stream_activations(act_t inputMap[MAX_ACTS_MEM_SIZE],
							 unsigned int initAddr,
							 hls::stream<stream_in_t> &strm_in
							 ) {
	stream_in_t tmp = strm_in.read();
	for(int i = 0; i < NUM_ACTS_IN_STREAM; i++) {
		#pragma HLS unroll
		inputMap[initAddr+i] = tmp.data.range(DMA_WIDTH-1 - i*ACTS_WIDTH,
											  DMA_WIDTH - i*ACTS_WIDTH - ACTS_WIDTH);

		printf("saving in pos %d act %d, from bus range %d - %d\n", initAddr+i, inputMap[initAddr+i], DMA_WIDTH-1 - i*ACTS_WIDTH, DMA_WIDTH - i*ACTS_WIDTH - ACTS_WIDTH);
	}
	printf("\n");
}

void read_feature_map(act_t inputMap[MAX_ACTS_MEM_SIZE], 
					  unsigned int inputMapSizeY,
					  unsigned int streamsPerInputLine,
					  unsigned int paddingIters,
					  unsigned int padding,
					  int inputMapLineAddr[MAX_FEATURE_MAP_LINES+1],
					  unsigned int readLimit,
					  unsigned int *readLines,
					  unsigned int *idy,
					  hls::stream<stream_in_t> &strm_in
					  ) {

	unsigned int idx = 0;
	unsigned int saveAddr = inputMapLineAddr[*idy];
	int xPadUpperLimit = streamsPerInputLine - paddingIters;
	int yPadUpperLimit = (int) inputMapSizeY - padding;

	printf("\nReading ACTIVATIONS from stream...\n\n");

	ReadActivationsLOOP:
	for(int i = 0; i < readLimit; i++) {
		#pragma HLS pipeline II=1
		if(*readLines < padding || idx < paddingIters || idx >= xPadUpperLimit || *readLines >= yPadUpperLimit)
			save_padding_pixel(inputMap, saveAddr);
		else
			read_stream_activations(inputMap, saveAddr, strm_in);

		saveAddr += NUM_ACTS_IN_STREAM;
		idx++;
		if(idx == streamsPerInputLine) {
			idx = 0;
			(*idy)++;
			(*readLines)++;
			if(*idy > MAX_FEATURE_MAP_LINES){
				*idy = 0;
			}
			saveAddr = inputMapLineAddr[*idy];
		}
	}
}

// void read_feature_map(act_t inputMap[MAX_ACTS_MEM_SIZE], 
// 					  unsigned int inputMapSizeY,
// 					  unsigned int streamsPerInputLine,
// 					  unsigned int paddingIters,
// 					  unsigned int padding,
// 					  hls::stream<stream_in_t> &strm_in
// 					  ) {

// 	unsigned int readLimit = 0;
// 	unsigned int saveAddr = 0;
// 	unsigned int idx = 0;
// 	unsigned int idy = 0;
// 	unsigned int xUpperLimit = streamsPerInputLine - paddingIters; 

// 	printf("\nReading ACTIVATIONS from stream...\n\n");

// 	if(inputMapSizeY >= MAX_FEATURE_MAP_LINES) 
// 		readLimit = MAX_FEATURE_MAP_LINES*streamsPerInputLine;
// 	else 
// 		readLimit = inputMapSizeY*streamsPerInputLine; 

// 	ReadActivationsLOOP:
// 	for(int i = 0; i < readLimit; i++) {
// 		#pragma HLS pipeline II=1
// 		if(idy < padding || idx < paddingIters || idx >= xUpperLimit)
// 			save_padding_pixel(inputMap, saveAddr);
// 		else
// 			read_stream_activations(inputMap, saveAddr, strm_in);

// 		saveAddr += NUM_ACTS_IN_STREAM;
// 		idx++;
// 		if(idx == streamsPerInputLine) {
// 			idx = 0;
// 			idy++;
// 		}
// 	}
// }

void read_bias(bias_t bias[MAX_BIAS_MEM_SIZE],
			   unsigned int totalBiasStreams, 
			   hls::stream<stream_in_t> &strm_in
			   ) {
	stream_in_t tmp;

	printf("\nReading BIAS from stream...\n\n");

	ReadBiasStreamsLOOP:
	for(int i = 0; i < totalBiasStreams; i++){
		for(int j = 0; j < NUM_BIAS_IN_STREAM; j++) {
			#pragma HLS pipeline II=1
			if(j == 0) {
				tmp = strm_in.read();
			}
			bias[j + i*NUM_BIAS_IN_STREAM]=tmp.data.range(DMA_WIDTH-1 - j*BIAS_WIDTH,
														  DMA_WIDTH - j*BIAS_WIDTH - BIAS_WIDTH);
			printf("saving in pos %d bias %d, from bus range %d - %d\n", j + i*NUM_BIAS_IN_STREAM, bias[j + i*NUM_BIAS_IN_STREAM], DMA_WIDTH-1 - j*BIAS_WIDTH, DMA_WIDTH - j*BIAS_WIDTH - BIAS_WIDTH);
		}
	}
	printf("\n");
}

void read_stream_weights(weight_t filter[MAX_WEIGHTS_MEM_SIZE], 
						 unsigned int initAddr,
						 hls::stream<stream_in_t> &strm_in
						 ) {

	stream_in_t tmp = strm_in.read();
	for(int i = 0; i < NUM_WEIGHTS_IN_STREAM; i++) {
		#pragma HLS unroll
		filter[initAddr+i] = tmp.data.range(DMA_WIDTH-1 - i*WEIGHT_WIDTH,
											DMA_WIDTH - i*WEIGHT_WIDTH - WEIGHT_WIDTH);
		//printf("saving in pos %d weight %d, from bus range %d - %d\n", initAddr+i, filter[initAddr+i], DMA_WIDTH-1 - i*WEIGHT_WIDTH, DMA_WIDTH - i*WEIGHT_WIDTH - WEIGHT_WIDTH);
	}
	//printf("\n");
}

void read_weights(weight_t filter[NUM_PE][MAX_WEIGHTS_MEM_SIZE],
				  unsigned int streamsPerFilter,
				  unsigned int totalWeightStreams, 
				  hls::stream<stream_in_t> &strm_in
				  ) {
	
	unsigned int currPE = 0;
	unsigned int saveAddr = 0;
	unsigned int addrOffset = 0;
	unsigned int streamIter = 0;

	//printf("\nReading WEIGHTS from stream...\n\n");

	ReadWeightStreamsLOOP:
	for(int i = 0; i < totalWeightStreams; i++) {
		#pragma HLS pipeline II=1
		//printf("PE %d\n", currPE);
		read_stream_weights(filter[currPE], saveAddr, strm_in);

		saveAddr += NUM_WEIGHTS_IN_STREAM;
		streamIter++;

		//After storing 1 complete filter, change save location to next PE 
		if(streamIter == streamsPerFilter) {
			streamIter = 0;
			currPE++;

			if(currPE == NUM_PE) {
				currPE = 0;
				addrOffset += saveAddr;
			}
			else {
				saveAddr = addrOffset;
			}
		}

	}
}

void conv(hls::stream<stream_in_t> &strm_in,
		  hls::stream<stream_out_t> &strm_out,
		  int numFilters,
		  int numKernels,
		  int inputMapSizeX,
		  int inputMapSizeY,
		  int ctrl// 0-2: padding, 3-5: kernelSize
		  ) {
	//Port map definitions
	#pragma HLS INTERFACE axis port=strm_in
	#pragma HLS INTERFACE axis port=strm_out
	#pragma HLS INTERFACE s_axilite port=numFilters bundle=BUS1
	#pragma HLS INTERFACE s_axilite port=numKernels bundle=BUS1
	#pragma HLS INTERFACE s_axilite port=inputMapSizeX bundle=BUS1
	#pragma HLS INTERFACE s_axilite port=inputMapSizeY bundle=BUS1
	#pragma HLS INTERFACE s_axilite port=ctrl bundle=BUS1

	//ctrl bus splitting
	ap_uint<3> padding = (ctrl&0x07);
	ap_uint<3> kernelSize = (ctrl&0x38)>>3;
	ap_uint<2> stride = (ctrl&0xC0)>>6;
	ap_uint<4> biasScale = (ctrl&0xF00)>>8;
	bool signedOp = (ctrl&0x1000)>>12;
	bool relu = (ctrl&0x2000)>>13;
	ap_uint<3> scale= (ctrl&0x1C000)>>14;
	bool lastPixel = (ctrl&0x20000)>>17;

	//Internal BRAM definitions
	weight_t filter[NUM_PE][MAX_WEIGHTS_MEM_SIZE];
	act_t inputMap[MAX_ACTS_MEM_SIZE];
	bias_t bias[MAX_BIAS_MEM_SIZE];
	accum_t accum[NUM_PE];

	#pragma HLS array_partition variable=filter block factor=NUM_PE dim=1
	#pragma HLS array_partition variable=accum complete

	//Internal variables definitions
	inputMapSizeX += 2*padding;
	inputMapSizeY += 2*padding;

	unsigned int streamsPerKernelWeight = (((numKernels-1)/NUM_WEIGHTS_IN_STREAM)+1);
	unsigned int streamsPerFilter = streamsPerKernelWeight*kernelSize*kernelSize;
	unsigned int streamsPerAct = ((numKernels-1)/NUM_ACTS_IN_STREAM)+1;
	unsigned int streamsPerInputLine = streamsPerAct*inputMapSizeX;
	unsigned int paddingIters = streamsPerAct*padding;

	unsigned int pixelOffsetActs = NUM_ACTS_IN_STREAM*streamsPerAct;
	unsigned int pixelOffsetWeights = NUM_WEIGHTS_IN_STREAM*streamsPerKernelWeight;
	
	unsigned int totalBiasStreams = (unsigned int) ((numFilters-1)/NUM_BIAS_IN_STREAM)+1;
	unsigned int totalWeightStreams = (unsigned int) numFilters*streamsPerFilter;

	ap_uint<10> outMapSizeX = (inputMapSizeX-kernelSize)/stride+1;
	ap_uint<10> outMapSizeY = (inputMapSizeY-kernelSize)/stride+1;
	ap_uint<10> filtersPerPE = (numFilters-1)/NUM_PE+1;

	unsigned int currInputMapAddr, currFilterAddr, saveInputMapAddr;
	unsigned int xOffsetMap, mapOverlapOffset, offsetFilter;

	// int yPadLowerLimit = padding - MAX_FEATURE_MAP_LINES < 0 ? 0 : (int) padding - MAX_FEATURE_MAP_LINES;
	// int xPadLowerLimit = padding;
	// int yPadUpperLimit = (int) inputMapSizeY - padding - MAX_FEATURE_MAP_LINES;
	// int xPadUpperLimit = inputMapSizeX - padding;

	bool read_OK = false;
	unsigned int id_read = 0, id_save = 0;
	int inputMapLineAddr[MAX_FEATURE_MAP_LINES+1];
	for(unsigned int i = 0; i < MAX_FEATURE_MAP_LINES+1; i++) {
		#pragma HLS pipeline II=1
		inputMapLineAddr[i] = i*pixelOffsetActs*inputMapSizeX;
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
	read_weights(filter, streamsPerFilter, totalWeightStreams, strm_in);
	//read_feature_map(inputMap, inputMapSizeY, streamsPerInputLine, paddingIters, padding, strm_in);

	unsigned int readLimit, readLines = 0;
	if(inputMapSizeY >= MAX_FEATURE_MAP_LINES) {
		readLimit = MAX_FEATURE_MAP_LINES*streamsPerInputLine;
	}
	else {
		readLimit = inputMapSizeY*streamsPerInputLine; 
	}

	read_feature_map(inputMap, inputMapSizeY, streamsPerInputLine, 
					 paddingIters, padding, inputMapLineAddr, 
					 readLimit, &readLines, &id_save, strm_in);


	//Conv time
	OutYLOOP:
	for(ap_uint<10> y = 0; y < outMapSizeY; y++, read_OK = (readLines < inputMapSizeY)) {
		OutXLOOP:
		for(ap_uint<10> x = 0; x < outMapSizeX; x++) {
			FilterLOOP:
			for(ap_uint<10> f = 0; f < filtersPerPE; f++) {
				KernelYLOOP:
				for(ap_uint<3> ky = 0; ky < kernelSize; ky++) {
					KernelXLOOP:
					for(ap_uint<3> kx = 0; kx < kernelSize; kx++) {
						ChannelLOOP:
						for(unsigned int kn = 0; kn < numKernels; kn+=SIMD_ITERS) {
							#pragma HLS pipeline II=TARGET_II
							//Adjust memory addresses
							if(kn == 0) {
								//Feature map offsets
								if(f == 0 && kx == 0 && ky == 0) {
									if(x != 0) {
										xOffsetMap += pixelOffsetActs;
									}
									else {
										xOffsetMap = 0;
									}
								}
								if(kx != 0) {
									mapOverlapOffset = kx*pixelOffsetActs;
								}
								else {
									mapOverlapOffset = 0;
								}

								if(kx == 0) {
									id_read = (y*stride+ky)&lineMask;
									if(id_read > MAX_FEATURE_MAP_LINES) {
										id_read -= (MAX_FEATURE_MAP_LINES+1);
									}

								}
								// if(f == 0) {
								// 	id_save = (y*stride+MAX_FEATURE_MAP_LINES)&lineMask;
								// 	if(id_save > MAX_FEATURE_MAP_LINES) {
								// 		id_save -= (MAX_FEATURE_MAP_LINES+1);
								// 	}
								// 	saveInputMapAddr = inputMapLineAddr[id_save] + xOffsetMap*stride;
								// }

								//Filter offsets
								// currFilterAddr = kx*pixelOffsetWeights + 
								// 				 ky*pixelOffsetWeights*kernelSize +
								// 				 f*pixelOffsetWeights*kernelSize*kernelSize;
								currFilterAddr = kx*pixelOffsetWeights +
												 ky*pixelOffsetWeights*kernelSize +
												 f*pixelOffsetWeights*kernelSize*kernelSize;

								currInputMapAddr = inputMapLineAddr[id_read] + xOffsetMap*stride + mapOverlapOffset;

							}

							//Read next input map line when possible
							if(read_OK) {
								read_feature_map(inputMap, inputMapSizeY, streamsPerInputLine, 
												 paddingIters, padding, inputMapLineAddr, 
												 stride*streamsPerInputLine, &readLines, &id_save, strm_in);
								read_OK = false;
							}

							// if(y < outMapSizeY-1 && f == 0 && ky >= kernelSize-1 && kx >= kernelSize-1) {
							// 	//Out of bounds scenario
							// 	if(x < xPadLowerLimit || x >= xPadUpperLimit || y < yPadLowerLimit || y >= yPadUpperLimit) {
							// 		save_padding_pixel(inputMap, saveInputMapAddr);
							// 		printf("PADDING at x = %d, y = %d \n\n",x,y);
							// 	}
							// 	else {
							// 		read_stream_activations(inputMap, saveInputMapAddr, strm_in);
							// 		printf("reading value at x = %d, y = %d\n\n",x,y);
							// 	}
							// 	saveInputMapAddr += NUM_ACTS_IN_STREAM;
							// }
							
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
							printf("current coords: x %d, y %d / f %d, kx %d, ky %d, kn %d / map %d, filter %d\n", x, y, f, kx, ky, kn, currInputMapAddr+kn, currFilterAddr+kn);
							PECallLOOP:
							for(unsigned short peId = 0; peId < NUM_PE; peId++) {
								#pragma HLS unroll
								if(f+peId < numFilters) {
									PE(inputMap, filter[peId], &accum[peId], currInputMapAddr+kn, currFilterAddr+kn, signedOp);
								}
							}

							if(ky==kernelSize-1 && kx==kernelSize-1) {
								if(kn + SIMD_ITERS >= numKernels) {
									//apply scale to all accums
									AccumAdjustmentLOOP:
									for(unsigned short peId = 0; peId < NUM_PE; peId++) {
										#pragma HLS unroll
										if(accum[peId] < 0 && relu) {
											accum[peId] = 0;
										}
										else {
											accum[peId] >>= scale;
										}

										if(relu) {
											if(accum[peId] > (1<<ACTS_WIDTH)-1) {
												accum[peId] = (1<<ACTS_WIDTH)-1;
											}
										}
									}

									short limit = 0;

									
									OutputStreamPackLOOP:
									for(short unsigned peId = 0; peId < NUM_PE; peId++){
										outputPacked = (outputPacked<<ACTS_WIDTH) + accum[peId].range(ACTS_WIDTH-1, 0);
										if((peId + 1) % NUM_ACTS_IN_STREAM == 0){
											tmpo.data = outputPacked<<ACTS_REMAINDER;
											tmpo.keep = 0xFF;
											tmpo.strb = 0xFF;
											if(lastPixel) {
												tmpo.last = (f >= filtersPerPE);
											}
											else {
												tmpo.last = !(y < outMapSizeY-1 - (stride-1)) && 
															!(x < outMapSizeX-1 - (stride-1)) && 
															(f >= filtersPerPE);
											}
											strm_out.write(tmpo);
											printf("sent output\n\n");
											outputPacked = 0;
										}
										else if((peId + 1) == NUM_PE && (peId + 1) % NUM_ACTS_IN_STREAM != 0) {
											tmpo.data = outputPacked<<ACTS_REMAINDER;
											tmpo.keep = 0xFF;
											tmpo.strb = 0xFF;
											if(lastPixel) {
												tmpo.last = (f >= filtersPerPE);
											}
											else {
												tmpo.last = !(y < outMapSizeY-1 - (stride-1)) &&
															!(x < outMapSizeX-1 - (stride-1)) &&
															(f >= filtersPerPE);
											}
											strm_out.write(tmpo);
											printf("sent output\n\n");
											outputPacked = 0;
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}
