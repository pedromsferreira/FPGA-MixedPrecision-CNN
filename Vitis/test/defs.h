#ifndef DEFS_H
#define DEFS_H

// Pre-defined Parameters
#define IMAGE_WIDTH 32
#define IMAGE_DEPTH 3
#define TOTAL_IMAGES 10000

#define DMA_WIDTH 128
#define WEIGHT_WIDTH_1 4
#define WEIGHT_WIDTH_2 2
#define ACTS_WIDTH 8
#define BIAS_WIDTH 8

#define BUFFER_SIZE 16

char *DATASET_PATH = "dataset/";
char *MAPS_FILE = "test_maps.bin";
char *LABELS_FILE = "test_labels.bin";

char *WEIGHTS_TEST_FILE = "../weights/0000conv1.weight.bin";

// Data structures
typedef struct {
    unsigned char map[IMAGE_DEPTH][IMAGE_WIDTH*IMAGE_WIDTH];
    unsigned char label;
} image_t;

#endif // MIXED_PARAMETERS_H