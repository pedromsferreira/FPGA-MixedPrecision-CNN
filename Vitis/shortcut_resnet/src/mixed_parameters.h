#ifndef MIXED_PARAMETERS_H
#define MIXED_PARAMETERS_H

// Memory Addresses
#define W_ADDR        0x10000000
#define FM_ADDR       0x11000000
#define OUTPUT_ADDR   0x12000000
#define PADDING_ADDR  0x13000000
#define TRUTH_ADDR    0x13100000
#define W_LINEAR_ADDR 0x13200000

uintptr_t WEIGHTS_ADDR_OFF_RN18[] = {0x0,0x2400,0x6c00,0xb400,0xfc00,0x14400,0x1d400,0x2f400,0x30400,0x42400,0x54400,0x66400,0x8a400,0x8c400,0xb0400,0xd4400,0x11c400,0x1ac400,0x1b4400,0x244400};

// File paths
// char DATASET_PATH[] = "../../datasets/cifar-10-batches-bin/";
// char MAPS_FILE[] = "test_maps.bin";
// char LABELS_FILE[] = "test_labels.bin";

// char WEIGHTS_TEST_FILE[] = "../../weights/0000conv1.weight.bin";

// Pre-defined Parameters
int ACT_SCALE[] = {6, 
				   6, 5, 
				   5, 5, 
				   5, 6, 5, 
				   6, 4, 
				   4, 4, 5, 
				   4, 2, 
				   4, 4, 4,
				   1, 4};

int RELU_SCALE[] = {5, 
					4, 4, 
					4, 4, 
					4, 3, 
					2, 3, 
					2, 1, 
					0, 1, 
					1, 1, 
					3, 2};

char CIFAR_10_LABELS[][11] = {"airplane","automobile","bird","cat","deer","dog","frog","horse","ship","truck"};

#define IMAGE_WIDTH 32
#define IMAGE_DEPTH 3
#define TOTAL_IMAGES 10000

#define DMA_WIDTH 128
#define WEIGHT_WIDTH_1 4
#define WEIGHT_WIDTH_2 2
#define ACTS_WIDTH 8
#define BIAS_WIDTH 8
#define DMA_WIDTH_IN_B (DMA_WIDTH/8)

#define NUM_WEIGHTS_IN_STREAM_1 (DMA_WIDTH/WEIGHT_WIDTH_1)
#define NUM_WEIGHTS_IN_STREAM_2 (DMA_WIDTH/WEIGHT_WIDTH_2)
#define NUM_ACTS_IN_STREAM (DMA_WIDTH/ACTS_WIDTH)
#define NUM_BIAS_IN_STREAM (DMA_WIDTH/BIAS_WIDTH)

#if NUM_WEIGHTS_IN_STREAM_1 > NUM_ACTS_IN_STREAM
#define SIMD_ITERS NUM_ACTS_IN_STREAM
#else
#define SIMD_ITERS NUM_WEIGHTS_IN_STREAM
#endif

#define WEIGHTS_REMAINDER_1 (DMA_WIDTH % WEIGHT_WIDTH_1)
#define WEIGHTS_REMAINDER_2 (DMA_WIDTH % WEIGHT_WIDTH_2)
#define ACTS_REMAINDER (DMA_WIDTH % ACTS_WIDTH)
#define BIAS_REMAINDER (DMA_WIDTH % BIAS_WIDTH)

// Data structures
typedef struct {
    unsigned char map[IMAGE_DEPTH][IMAGE_WIDTH*IMAGE_WIDTH];
    unsigned char label;
} image_t;

#endif // MIXED_PARAMETERS_H
