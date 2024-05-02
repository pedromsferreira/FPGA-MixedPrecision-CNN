#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "defs.h"

/*
    Function: read_weights
    ----------------------
    Reads weights from file and saves them in memory in order

    bitWidth: number of bits used to represent each weight
    weightsFile: name of file containing weights
    nFilters: number of filters in convolutional layer
    nChannels: number of channels in input map
    filterSize: size of filter (filterSize x filterSize)

    returns: pointer to saved filters
    filter format: filter[nFilter][nChannel][kx*ky]

*/

char* read_weights_simple(int bitWidth, char *weightsFile, int nFilters, int nChannels, int filterSize) {
    FILE *fp;
    char *weights;

    // Allocate memory for weights
    weights = (char *) malloc(sizeof(char)*nFilters*nChannels*filterSize*filterSize);
    if(weights == NULL) {
        printf("Error: could not allocate memory for weights\n");
        exit(1);
    }

    // Open weights file for reading
    fp = fopen(weightsFile, "rb");
    if(fp == NULL) {
        printf("Error: could not open weights file\n");
        exit(1);
    }

    // Save weights in memory in order
    fread(weights, sizeof(char), nFilters*nChannels*filterSize*filterSize*BUFFER_SIZE, fp);

    fclose(fp);
    return weights;
}

char*** read_weights(int bitWidth, char *weightsFile, int nFilters, int nChannels, int filterSize) {
    FILE *fp;
    char buffer[BUFFER_SIZE], ***weights;

    // Allocate memory for weights
    weights = (char ***) malloc(sizeof(char **)*nFilters);
    if(weights == NULL) {
        printf("Error: could not allocate memory for weights\n");
        exit(1);
    }

    for(int f = 0; f < 64; f++) {
        weights[f] = (char **) malloc(sizeof(char *)*nChannels);
        if(weights[f] == NULL) {
            printf("Error: could not allocate memory for weights, kernel %d\n", f);
            exit(1);
        }
        for(int z = 0; z < 3; z++) {
            weights[f][z] = (char *) malloc(sizeof(char)*filterSize*filterSize);
            if(weights[f][z] == NULL) {
                printf("Error: could not allocate memory for weights, kernel %d, channel %d\n", f, z);
                exit(1);
            }
        }
    }

    // Open weights file for reading
    fp = fopen(weightsFile, "rb");
    if(fp == NULL) {
        printf("Error: could not open weights file\n");
        exit(1);
    }

    // Save weights in memory in order
    for(int f = 0; f < nFilters; f++) {
        for(int xy = 0; xy < filterSize*filterSize; xy++) {
            fread(&buffer, sizeof(char), BUFFER_SIZE, fp);
            for(int z = 0, i = BUFFER_SIZE-1; z < nChannels; z++) {
                if(bitWidth == 4){
                    weights[f][z][xy] = (char) (buffer[i]>>(4*((z+3)%2)))&0x0F;
                    if(((weights[f][z][xy]>>3) & 1) == 1)
                        weights[f][z][xy] |= 0xF0;
                }
                else if(bitWidth == 2){
                    weights[f][z][xy] = (char) (buffer[i]>>(2*((z+3)%2)))&0x03;
                    if(((weights[f][z][xy]>>1) & 1) == 1)
                        weights[f][z][xy] |= 0xFC;
                }   

                if((z+2)%2 == 1)
                    i--;
            }
        }
    }
    return weights;
}

void free_weights(char ***weights, int dim1, int dim2) {
    for(int i = 0; i < dim1; i++) {
        for(int j = 0; j < dim2; j++) {
            free(weights[i][j]);
        }
        free(weights[i]);
    }
    free(weights);
}

int test_read_batch(int numImages) {
    image_t *inputMap;
    char bufferClass;
    char bufferMap[IMAGE_DEPTH][IMAGE_WIDTH*IMAGE_WIDTH];
    FILE *fp;

    fp = fopen("dataset/test_batch.bin", "rb"); 

    inputMap = (image_t *)malloc(sizeof(image_t)*numImages);
    if(inputMap == NULL) {
        printf("Error: could not allocate memory for inputMap\n");
        return 1;
    }

    for(int i = 0; i < TOTAL_IMAGES; i++) {
        fread(&bufferClass, sizeof(char), 1, fp);
        inputMap[i].label = (unsigned char) bufferClass;
        for(int j = 0; j < IMAGE_DEPTH; j++) {
            fread(&bufferMap[j], sizeof(char), IMAGE_WIDTH*IMAGE_WIDTH, fp);
            for(int k = 0; k < IMAGE_WIDTH*IMAGE_WIDTH; k++) {
                inputMap[i].map[j][k] = (unsigned char) bufferMap[j][k];
            }
        }
    }

    free(fp);
    free(inputMap);

    return 0;
}

int separate_batch(char* datasetPath, char *labelFileName, char *mapFileName, int numImages) {
    char bufferLabel;
    char bufferMap[IMAGE_WIDTH*IMAGE_WIDTH*IMAGE_DEPTH];
    char *mapPath, *labelPath;
    FILE *fpSaveLabel, *fpSaveMap, *fp;

    fp = fopen("dataset/test_batch.bin", "rb"); 

    // Allocate memory for file paths and obtain complete paths for writing
    mapPath = (char *) malloc(sizeof(char)*(strlen(datasetPath)+strlen(mapFileName)+1));
    labelPath = (char *) malloc(sizeof(char)*(strlen(datasetPath)+strlen(labelFileName)+1));

    mapPath = strcpy(mapPath, datasetPath);
    labelPath = strcpy(labelPath, datasetPath);

    mapPath = strcat(mapPath, mapFileName);
    labelPath = strcat(labelPath, labelFileName);

    // Open files for writing
    fpSaveLabel = fopen(labelPath, "wb");
    if(fpSaveLabel == NULL) {
        printf("Error: could not open labels file\n");
        exit(1);
    }

    fpSaveMap = fopen(mapPath, "wb");
    if(fpSaveMap == NULL) {
        printf("Error: could not open maps file\n");
        exit(1);
    }

    for(int i = 0; i < numImages; i++) {
        fread(&bufferLabel, sizeof(char), 1, fp);
        fwrite(&bufferLabel, sizeof(char), 1, fpSaveLabel);
        
        fread(&bufferMap, sizeof(char), IMAGE_WIDTH*IMAGE_WIDTH*IMAGE_DEPTH, fp);
        fwrite(&bufferMap, sizeof(char), IMAGE_WIDTH*IMAGE_WIDTH*IMAGE_DEPTH, fpSaveMap);
    }

    fclose(fp);
    fclose(fpSaveLabel);
    fclose(fpSaveMap);
    free(mapPath);
    free(labelPath);

    return 0;
}

/*
    Function: read_maps
    -------------------
    Reads maps from file and saves them in memory in order

    numImages: number of images to read
    returns: pointer to saved maps
    return format: inputMap[nImage]
                           .map[nChannel][x*y]
                           .label
*/
// image_t* read_maps_simple(int numImages, char* datasetPath, char* mapsFile, char* labelsFile) {
//     image_t *inputMap;
//     FILE *fpMap, *fpLabel;
//     char *mapsPath, *labelsPath;

//     // Allocate memory for inputMap
//     inputMap = (image_t *)malloc(sizeof(image_t)*numImages);
//     if(inputMap == NULL) {
//         printf("Error: could not allocate memory for inputMap\n");
//         exit(1);
//     }

//     for(int i = 0; i < numImages; i++) {
//         inputMap[i].map = (unsigned char *) malloc(sizeof(unsigned char)*IMAGE_DEPTH*IMAGE_WIDTH*IMAGE_WIDTH);
//         if(inputMap[i].map == NULL) {
//             printf("Error: could not allocate memory for inputMap[%d].map\n", i);
//             exit(1);
//         }
//     }

//     // Allocate memory for file paths and obtain complete paths for reading
//     mapsPath = (char *) malloc(sizeof(char)*(strlen(datasetPath)+strlen(mapsFile)+1));
//     labelsPath = (char *) malloc(sizeof(char)*(strlen(datasetPath)+strlen(labelsFile)+1));

//     mapsPath = strcpy(mapsPath, datasetPath);
//     labelsPath = strcpy(labelsPath, datasetPath);

//     mapsPath = strcat(mapsPath, mapsFile);
//     labelsPath = strcat(labelsPath, labelsFile);

//     // Open files
//     fpMap = fopen(mapsPath, "rb");
//     if(fpMap == NULL) {
//         printf("Error: could not open maps file\n");
//         exit(1);
//     }

//     fpLabel = fopen(labelsPath, "rb");
//     if(fpLabel == NULL) {
//         printf("Error: could not open labels file\n");
//         exit(1);
//     }

//     // Read data and separate into inputMap
//     for(int i = 0; i < numImages; i++) {
//         fread(&inputMap[i].label, sizeof(char), 1, fpLabel);
//         fread(&inputMap[i].map, sizeof(char), IMAGE_DEPTH*IMAGE_WIDTH*IMAGE_WIDTH, fpMap);
//     }

//     // Free memory used
//     fclose(fpMap);
//     fclose(fpLabel);
//     free(mapsPath);
//     free(labelsPath);

//     return inputMap;
// }


image_t* read_maps(int numImages, char* datasetPath, char* mapsFile, char* labelsFile) {
    image_t *inputMap;
    FILE *fpMap, *fpLabel;
    char bufferLabel;
    unsigned char bufferMap[IMAGE_WIDTH*IMAGE_WIDTH];
    char *mapsPath, *labelsPath;

    // Allocate memory for inputMap
    inputMap = (image_t *)malloc(sizeof(image_t)*numImages);
    if(inputMap == NULL) {
        printf("Error: could not allocate memory for inputMap\n");
        exit(1);
    }

    // Allocate memory for file paths and obtain complete paths for reading
    mapsPath = (char *) malloc(sizeof(char)*(strlen(datasetPath)+strlen(mapsFile)+1));
    labelsPath = (char *) malloc(sizeof(char)*(strlen(datasetPath)+strlen(labelsFile)+1));

    mapsPath = strcpy(mapsPath, datasetPath);
    labelsPath = strcpy(labelsPath, datasetPath);

    mapsPath = strcat(mapsPath, mapsFile);
    labelsPath = strcat(labelsPath, labelsFile);

    // Open files
    fpMap = fopen(mapsPath, "rb");
    if(fpMap == NULL) {
        printf("Error: could not open maps file\n");
        exit(1);
    }

    fpLabel = fopen(labelsPath, "rb");
    if(fpLabel == NULL) {
        printf("Error: could not open labels file\n");
        exit(1);
    }

    // Read data and separate into inputMap
    for(int i = 0; i < numImages; i++) {
        fread(&bufferLabel, sizeof(char), 1, fpLabel);
        inputMap[i].label = (unsigned char) bufferLabel;
        for(int j = 0; j < IMAGE_DEPTH; j++) {
            fread(&bufferMap, sizeof(char), IMAGE_WIDTH*IMAGE_WIDTH, fpMap);
            for(int k = 0; k < IMAGE_WIDTH*IMAGE_WIDTH; k++) {
                inputMap[i].map[j][k] = (unsigned char) bufferMap[k];
            }
        }
    }

    // Free memory used
    fclose(fpMap);
    fclose(fpLabel);
    free(mapsPath);
    free(labelsPath);

    return inputMap;
}

char** sw_conv_3D(image_t inputMap, char ***filter, int nFilters, int nKernels, int inputMapSize, int kernelSize, int padding, int stride, int scale) 
{
    FILE *fpOut;
    int outputMapSize = (inputMapSize - kernelSize + 2*padding)/stride + 1;
    char **outputMap;
    // char a = 0;
    // unsigned char b = 0;

    // Allocate memory for outputMap
    outputMap = (char **) malloc(sizeof(char *)*nFilters);
    if(outputMap == NULL) {
        printf("Error: could not allocate memory for outputMap\n");
        exit(1);
    }

    for(int f = 0; f < nFilters; f++) {
        outputMap[f] = (char *) malloc(sizeof(char)*outputMapSize*outputMapSize);
        if(outputMap[f] == NULL) {
            printf("Error: could not allocate memory for outputMap\n");
            exit(1);
        }
    }

    for(int f = 0; f < nFilters; f++) {
        for(int y = 0; y < outputMapSize; y++) {
            for(int x = 0; x < outputMapSize; x++) {
                int accum = 0;
                for(int k = 0; k < nKernels; k++) {
                    for(int ky = 0; ky < kernelSize; ky++) {
                        for(int kx = 0; kx < kernelSize; kx++) {
                            // a = 0;
                            // b = 0;
                            if(padding > 0){
                                if(x*stride + kx < padding || 
                                   x*stride + kx >= inputMapSize + padding ||
                                   y*stride + ky < padding ||
                                   y*stride + ky >= inputMapSize + padding) {
                                        // printf("\tPadding\n");
                                        continue;
                                   }
                                    
                                else {
                                    // if(bitWidth == 4) {
                                    //     a = filter[f*nFilters + kx*zbus*BUFFER_SIZE + ky*zbus*BUFFER_SIZE + (BUFFER_SIZE-1)-k]
                                    // }
                                    accum += filter[f][k][kx*kernelSize+ky] * 
                                             inputMap.map[k][(x-padding)*stride + kx + ((y-padding)*stride + ky)*inputMapSize];
                                    // accum += a*b;
                                }
                            }
                            else
                                accum += filter[f][k][kx*kernelSize+ky] * 
                                         inputMap.map[k][x*stride + kx + (y*stride + ky)*inputMapSize];
                                // accum +=
                                
                            // printf("\t %d * %d = %d \t (+ accum = %d)\n", 
                            //         filter[f][k][kx*kernelSize+ky], 
                            //         inputMap.map[k][x*stride + kx + (y*stride + ky)*inputMapSize], 
                            //         filter[f][k][kx*kernelSize+ky] * inputMap.map[k][x*stride + kx + (y*stride + ky)*inputMapSize],
                            //         accum);
                        }
                    }
                    // printf("\n");
                }
                // printf("\n\n");
                if(accum < 0)
                    accum = 0;
                else 
                    accum >>= scale;
                
                outputMap[f][x+y*outputMapSize] = accum;
                // printf("\toutputMap[%d][%d] = %d\n\n", f, x+y*outputMapSize, outputMap[f][x+y*outputMapSize]);
            }
        }
    }

    fpOut = fopen("simOutputMap.bin", "wb");
    if(fpOut == NULL) {
        printf("Error: could not open output file\n");
        exit(1);
    }

    for(int f = 0; f < nFilters; f++) {
        fwrite(outputMap[f], sizeof(char), outputMapSize*outputMapSize, fpOut);
    }

    fclose(fpOut);
    return outputMap;
}



void free_outputMap(char **outputMap, int dim1) {
    for(int i = 0; i < dim1; i++) {
        free(outputMap[i]);
    }
    free(outputMap);
}

void separate_map_into_bus(){
    FILE *fp, *fpOut, *fpOutSmall, *fpOutImage17;
    char buffer[3][IMAGE_WIDTH*IMAGE_WIDTH], bus[16];

    fp = fopen("dataset/test_maps.bin", "rb");
    if(fp == NULL) {
        printf("Error: could not open map file\n");
        exit(1);
    }

    fpOut = fopen("dataset/full_test_cifar10.bin", "wb");
    fpOutSmall = fopen("dataset/small_test_cifar10.bin", "wb");
    fpOutImage17 = fopen("dataset/img_17_horse.bin", "wb");

    for(int i = 0; i < TOTAL_IMAGES; i++) {
        fread(buffer[0], sizeof(char), IMAGE_WIDTH*IMAGE_WIDTH, fp);
        fread(buffer[1], sizeof(char), IMAGE_WIDTH*IMAGE_WIDTH, fp);
        fread(buffer[2], sizeof(char), IMAGE_WIDTH*IMAGE_WIDTH, fp);

        for(int j = 0; j < IMAGE_WIDTH*IMAGE_WIDTH; j++) {
            bus[15] = buffer[0][j];
            bus[14] = buffer[1][j];
            bus[13] = buffer[2][j];

            for(int k = 0; k < 13; k++) {
                bus[k] = 0;
            }

            fwrite(bus, sizeof(char), 16, fpOut);

            if(i == 0  && j < 16) {
                fwrite(bus, sizeof(char), 16, fpOutSmall);
            }

            if(i == 17) {
                fwrite(bus, sizeof(char), 16, fpOutImage17);
            }
        }
    }

    fclose(fp);
    fclose(fpOut);
    fclose(fpOutSmall);

    return;
}

void make_zeroes_file() {
    char zeroes[16];

    for(int i = 0; i < 16; i++) {
        zeroes[i] = 0;
    }

    FILE *fp = fopen("zeroes.bin", "wb");
    for(int i = 0; i < 64; i++) {
        fwrite(zeroes, sizeof(char), 16, fp);
    }

    fclose(fp);
    return;
}

int main() {
    // // Variables
    // char ***filter, **outputMap;
    // image_t *inputMap;

    // // Tested function calls
    // filter = read_weights(4, WEIGHTS_TEST_FILE, 64, 3, 3);
    // inputMap = read_maps(2, DATASET_PATH, MAPS_FILE, LABELS_FILE);

    // outputMap = sw_conv_3D(inputMap[0], filter, 64, 3, 32, 3, 1, 1, 0);

    // //separate_batch(DATASET_PATH, "test_labels.bin", "test_maps.bin", TOTAL_IMAGES);
    // //separate_batch(DATASET_PATH, "test_1_label.bin", "test_1_img.bin", 1);


    // free(inputMap);
    // //free_weights(filter, 64, 3);
    // free_outputMap(outputMap, 64);

    separate_map_into_bus();

    return 0;
}

