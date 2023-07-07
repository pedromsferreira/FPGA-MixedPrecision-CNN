#ifndef MIXED_CONV
#define MIXED_CONV

/*
    Bit-width defines
*/
#define DMA_WIDTH 64
#define WEIGHT_WIDTH 4
#define ACTS_WIDTH 8
#define BIAS_WIDTH 8
#define ACCUM_WIDTH 32
/*
    Internal memory sizes
*/
#define MAX_WEIGHTS_MEM_SIZE 4096*SIMD_ITERS
#define MAX_ACTS_MEM_SIZE 9728*SIMD_ITERS
#define MAX_BIAS_MEM_SIZE 256*SIMD_ITERS
#define MAX_FEATURE_MAP_LINES 3

/*
    Conv-IP defines
*/
#define NUM_WEIGHTS_IN_STREAM (DMA_WIDTH/WEIGHT_WIDTH)
#define NUM_ACTS_IN_STREAM (DMA_WIDTH/ACTS_WIDTH)
#define NUM_BIAS_IN_STREAM (DMA_WIDTH/BIAS_WIDTH)

#if NUM_WEIGHTS_IN_STREAM > NUM_ACTS_IN_STREAM
#define SIMD_ITERS NUM_ACTS_IN_STREAM
#else
#define SIMD_ITERS NUM_WEIGHTS_IN_STREAM
#endif

#define WEIGHTS_REMAINDER (DMA_WIDTH%WEIGHT_WIDTH)
#define ACTS_REMAINDER (DMA_WIDTH%ACTS_WIDTH)
#define BIAS_REMAINDER (DMA_WIDTH%BIAS_WIDTH)

#define NUM_PE SIMD_ITERS
#define OUTPUT_WIDTH NUM_PE*ACTS_WIDTH
#define TARGET_II (OUTPUT_WIDTH/DMA_WIDTH)

/*
    Data type definitions
*/
//Streams
typedef ap_axis<DMA_WIDTH, 0, 0, 0> stream_in_t;
typedef ap_axis<DMA_WIDTH, 0, 0, 0> stream_out_t;

//Basic definitions
typedef ap_int<WEIGHT_WIDTH> weight_t;
typedef ap_int<ACTS_WIDTH> act_t;
typedef ap_int<ACTS_WIDTH+1> signed_act_t;
typedef ap_int<BIAS_WIDTH> bias_t;

//Operators
typedef ap_int<ACTS_WIDTH*WEIGHT_WIDTH> mul_t;
typedef ap_int<ACCUM_WIDTH> accum_t;

#endif



