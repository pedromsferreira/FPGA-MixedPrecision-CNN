# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/pferreira/HwSw/Vitis/gomi_system/_ide/scripts/systemdebugger_gomi_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/pferreira/HwSw/Vitis/gomi_system/_ide/scripts/systemdebugger_gomi_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
source /home/mpv/tools/Xilinx/Vitis/2022.2/scripts/vitis/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Xilinx HW-Z1-ZCU104 FT4232H 87957A" && level==0 && jtag_device_ctx=="jsn-HW-Z1-ZCU104 FT4232H-87957A-14730093-0"}
fpga -file /home/pferreira/HwSw/Vitis/gomi/_ide/bitstream/system_wrapper-fixmaybe.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/pferreira/HwSw/Vitis/debug/export/debug/hw/system_wrapper-fixmaybe.xsa -mem-ranges [list {0x80000000 0xbfffffff} {0x400000000 0x5ffffffff} {0x1000000000 0x7fffffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
set mode [expr [mrd -value 0xFF5E0200] & 0xf]
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow /home/pferreira/HwSw/Vitis/debug/export/debug/sw/debug/boot/fsbl.elf
set bp_23_22_fsbl_bp [bpadd -addr &XFsbl_Exit]
con -block -timeout 60
bpremove $bp_23_22_fsbl_bp
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow /home/pferreira/HwSw/Vitis/gomi/Debug/gomi.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A53*#0"}
con
