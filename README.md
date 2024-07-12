# FPGA Design of Mixed-Precision CNNs (ResNet)

![Vitis HLS 2022.2](https://img.shields.io/badge/Vitis_HLS-2022.2-red.svg?style=plastic)
![Vivado 2022.2](https://img.shields.io/badge/Vivado-2022.2-red.svg?style=plastic)
![Vitis IDE 2022.2](https://img.shields.io/badge/Vitis_IDE-2022.2-red.svg?style=plastic)

![image](./vivado-block-design-interface-view.png)

**Figure:** *Block diagram of the hardware architecture of the ResNet18 HW/SW implementation*

This repository was used to produce the results present in my Master's Dissertation at IST:

> **FPGA Design of Mixed-Precision Convolutional Neural Networks** <br>
> Pedro Ferreira <br>
> Abstract:
> 
> The objective of this work is to develop a mixed-precision convolutional neural network (CNN) using a System-On-Chip (SoC) FPGA. The developed system aims to benefit from low precision while maintaining a balance between image classification accuracy and inference time.

> Image classification is a critical task in computer vision applications. State-of-the-art models using convolutional neural networks require high accuracy but have demanding computational costs. Applications that require edge computing cannot afford high-energy solutions, emphasizing the need for efficient high-performance solutions.

> A dedicated hardware/software system was designed to implement a specific ResNet18 model with mixed-precision in a Zynq Ultrascale+ SoC FPGA. The CNN model was trained and evaluated with different mixed-precision configurations and a solution was selected for implementation that uses convolution layers with 8-bit activations and weights with 4 bit-width and 2 bit-width. Two dedicated convolution hardware accelerators were designed, one for each quantization configuration, both of which are capable of computing 256 MACs per clock cycle.

> In the final hardware/software system, all the convolutional layers (more than 99% of the total operations) are executed in the hardware IPs and the two non-convolutional layers (less than 1% of the total operations) are executed in software in the ARM processor of the SoC-FPGA.

> The system achieves a frame rate of 32 FPS, with a performance per watt 4.5x higher than a NVIDIA GeForce RTX 3080 Ti GPU. 

## PyTorch & Brevitas

All the sources used to train and export the ResNet model used for testing the HW/SW in FPGA are in branch **brevitas-resnet**.

## HLS

The hardware accelerators were developed using Xilinx Vitis High-level synthesis (HLS) tool version 2022.1. For implementation in Vivado of the HW/SW system, you need to use the sources in the /HLS folder and export through Vitis HLS the RTL design block IPs.

## Software

To execute the layers of the ResNet model in order, the embedded software to run in the ARM processor was created in Vitis IDE version 2022.2. The sources used are in the /Vitis folder.
