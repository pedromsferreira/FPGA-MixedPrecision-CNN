################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/pferreira/HwSw/HLS/sources/mixed_conv_w4/mixed_conv.cpp 

OBJS += \
./source/mixed_conv.o 

CPP_DEPS += \
./source/mixed_conv.d 


# Each subdirectory must supply rules for building sources it contributes
source/mixed_conv.o: /home/pferreira/HwSw/HLS/sources/mixed_conv_w4/mixed_conv.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -I/home/mpv/tools/Xilinx/Vitis_HLS/2022.2/include/ap_sysc -I/home/mpv/tools/Xilinx/Vitis_HLS/2022.2/include/etc -I/home/mpv/tools/Xilinx/Vitis_HLS/2022.2/lnx64/tools/auto_cc/include -I/home/mpv/tools/Xilinx/Vitis_HLS/2022.2/lnx64/tools/systemc/include -I/home/mpv/tools/Xilinx/Vitis_HLS/2022.2/include -I/home/pferreira/HwSw/HLS -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


