# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/pferreira/HwSw/Vitis/debug/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/pferreira/HwSw/Vitis/debug/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {debug}\
-hw {/home/pferreira/HwSw/Vitis/Hardware/system_wrapper-debugger.xsa}\
-proc {psu_cortexa53_0} -os {standalone} -arch {64-bit} -fsbl-target {psu_cortexa53_0} -out {/home/pferreira/HwSw/Vitis}

platform write
platform generate -domains 
platform active {debug}
platform generate
platform generate
platform generate
platform generate
platform clean
platform generate
platform clean
platform generate
platform active {debug}
platform active {debug}
platform config -updatehw {/home/pferreira/HwSw/Vitis/Hardware/system_wrapper-debug-v2.xsa}
platform generate -domains 
platform generate
platform active {debug}
platform config -updatehw {/home/pferreira/HwSw/Vitis/Hardware/debug-solid.xsa}
platform generate
platform clean
platform generate
platform generate
platform active {debug}
platform config -updatehw {/home/pferreira/HwSw/Vitis/Hardware/system_wrapper-bigger-DMA.xsa}
platform generate -domains 
platform config -updatehw {/home/pferreira/HwSw/Vitis/Hardware/system_wrapper-bigger-DMA.xsa}
platform generate -domains 
platform active {debug}
platform config -updatehw {/home/pferreira/HwSw/Vitis/Hardware/system_wrapper-fix-RELU.xsa}
platform generate
platform active {debug}
platform config -updatehw {/home/pferreira/HwSw/Vitis/Hardware/system_wrapper-fix-weights-addr.xsa}
platform generate
platform generate
platform active {debug}
platform config -updatehw {/home/pferreira/HwSw/Vitis/Hardware/system_wrapper-stride2-fix.xsa}
platform generate
platform clean
platform generate
platform generate
platform active {debug}
platform config -updatehw {/home/pferreira/HwSw/Vitis/Hardware/system_wrapper-stride2-fix.xsa}
platform clean
platform generate
platform clean
platform generate
platform config -updatehw {/home/pferreira/HwSw/Vitis/Hardware/system_wrapper-fixmaybe.xsa}
platform clean
platform generate
platform clean
platform generate
platform generate
platform active {debug}
platform config -updatehw {/home/pferreira/HwSw/Vitis/Hardware/system_wrapper-overflow-fix.xsa}
platform clean
platform generate
platform clean
platform generate
platform active {debug}
platform config -updatehw {/home/pferreira/HwSw/Vitis/Hardware/system_wrapper-fix-w2.xsa}
platform generate
platform clean
platform generate
platform generate
platform generate
platform generate
platform generate
