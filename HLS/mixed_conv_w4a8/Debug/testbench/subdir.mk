################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/pferreira/HwSw/HLS/sources/mixed_conv_w4/tb_mixed_conv.cpp 

OBJS += \
./testbench/tb_mixed_conv.o 

CPP_DEPS += \
./testbench/tb_mixed_conv.d 


# Each subdirectory must supply rules for building sources it contributes
testbench/tb_mixed_conv.o: /home/pferreira/HwSw/HLS/sources/mixed_conv_w4/tb_mixed_conv.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/home/mpv/tools/Xilinx/Vitis_HLS/2022.2/include/ap_sysc -I/home/mpv/tools/Xilinx/Vitis_HLS/2022.2/include/etc -I/home/mpv/tools/Xilinx/Vitis_HLS/2022.2/lnx64/tools/auto_cc/include -I/home/mpv/tools/Xilinx/Vitis_HLS/2022.2/lnx64/tools/systemc/include -I/home/mpv/tools/Xilinx/Vitis_HLS/2022.2/include -I/home/pferreira/HwSw/HLS -O0 -g3 -Wall -Wno-unknown-pragmas -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"testbench/tb_mixed_conv.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


