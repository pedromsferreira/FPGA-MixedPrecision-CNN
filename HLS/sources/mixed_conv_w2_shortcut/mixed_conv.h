#ifndef MIXED_CONV
#define MIXED_CONV

/*
    Known limits specific to the network and dataset used
    Network: ResNet
    Dataset: CIFAR-10
*/
#define MAX_PADDING 1
#define MAX_IN_IMAGE_SIZE (16 + MAX_PADDING*2)
#define MAX_OUT_IMAGE_SIZE (16 + MAX_PADDING*2)
#define MAX_NUM_FILTERS 512 //max for ResNet50 at halfway point
#define MAX_NUM_KERNELS 512 //max for ResNet50 at halfway point
#define MAX_KERNEL_SIZE 3

/*
    Bit-width defines
*/
#define DMA_WIDTH 128
#define WEIGHT_WIDTH 2
#define ACTS_WIDTH 8
#define BIAS_WIDTH 8
#define ACCUM_WIDTH 32

/*
    Internal memory limits
*/
#define MAX_FEATURE_MAP_LINES 4
#define MAX_WEIGHTS_MEM_SIZE ((36864/NUM_PE)*WEIGHTS_ACTS_RATIO) //max needed is x*y*filters*kernels/numWeightsInBus = 3*3*512*512/64=36 864 bus
//#define MAX_ACTS_MEM_SIZE ((MAX_IN_IMAGE_SIZE*(MAX_FEATURE_MAP_LINES+1))/NUM_ACTS_IN_BUS) //65536 total acts
#define MAX_ACTS_MEM_SIZE (MAX_IN_IMAGE_SIZE*(MAX_FEATURE_MAP_LINES+1)*MAX_NUM_KERNELS/NUM_ACTS_IN_BUS)
#define MAX_BIAS_MEM_SIZE MAX_NUM_FILTERS

#define MAX_IN_MAP_LINE_SIZE (MAX_IN_IMAGE_SIZE*MAX_NUM_KERNELS/NUM_ACTS_IN_BUS)

/*
    Conv-IP defines
*/
#define NUM_WEIGHTS_IN_STREAM (DMA_WIDTH/WEIGHT_WIDTH)
#define NUM_ACTS_IN_STREAM (DMA_WIDTH/ACTS_WIDTH)
#define NUM_BIAS_IN_STREAM (DMA_WIDTH/BIAS_WIDTH)

#if NUM_WEIGHTS_IN_STREAM > NUM_ACTS_IN_STREAM
#define SIMD_ITERS NUM_ACTS_IN_STREAM
#define WEIGHTS_ACTS_RATIO (NUM_WEIGHTS_IN_STREAM/NUM_ACTS_IN_STREAM)
#else
#define SIMD_ITERS NUM_WEIGHTS_IN_STREAM
#define WEIGHTS_ACTS_RATIO (NUM_ACTS_IN_STREAM/NUM_WEIGHTS_IN_STREAM)
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

//Basic data definitions
#if NUM_WEIGHTS_IN_STREAM > NUM_ACTS_IN_STREAM
#define ACTS_BUS_WIDTH DMA_WIDTH
typedef ap_int<DMA_WIDTH> act_bus_t;
#define WEIGHTS_BUS_WIDTH (DMA_WIDTH/WEIGHTS_ACTS_RATIO)
typedef ap_int<WEIGHTS_BUS_WIDTH> weight_bus_t;
#define NUM_WEIGHTS_IN_BUS (WEIGHTS_BUS_WIDTH/WEIGHT_WIDTH)
#define NUM_ACTS_IN_BUS NUM_ACTS_IN_STREAM
#else
#define ACTS_BUS_WIDTH (DMA_WIDTH/WEIGHTS_ACTS_RATIO)
typedef ap_int<ACTS_BUS_WIDTH> act_bus_t;
#define WEIGHTS_BUS_WIDTH DMA_WIDTH
typedef ap_int<DMA_WIDTH> weight_bus_t;
#define NUM_WEIGHTS_IN_BUS NUM_WEIGHTS_IN_STREAM
#define NUM_ACTS_IN_BUS (ACTS_BUS_WIDTH/ACTS_WIDTH)
#endif
typedef ap_int<WEIGHT_WIDTH> weight_t;
typedef ap_int<ACTS_WIDTH> act_t;
typedef ap_int<ACTS_WIDTH+1> signed_act_t;
typedef ap_int<BIAS_WIDTH> bias_t;

//Operators
typedef ap_int<ACTS_WIDTH*WEIGHT_WIDTH> mul_t;
typedef ap_int<ACCUM_WIDTH> accum_t;


#endif



