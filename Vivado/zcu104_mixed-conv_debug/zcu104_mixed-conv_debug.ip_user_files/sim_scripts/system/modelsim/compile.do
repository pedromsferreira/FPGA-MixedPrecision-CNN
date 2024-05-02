vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_13
vlib modelsim_lib/msim/zynq_ultra_ps_e_vip_v1_0_13
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/lib_pkg_v1_0_2
vlib modelsim_lib/msim/fifo_generator_v13_2_7
vlib modelsim_lib/msim/lib_fifo_v1_0_16
vlib modelsim_lib/msim/lib_srl_fifo_v1_0_2
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/axi_datamover_v5_1_29
vlib modelsim_lib/msim/axi_sg_v4_1_15
vlib modelsim_lib/msim/axi_dma_v7_1_28
vlib modelsim_lib/msim/xlconstant_v1_1_7
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/smartconnect_v1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_27
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/axi_data_fifo_v2_1_26
vlib modelsim_lib/msim/axi_crossbar_v2_1_28
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_27
vlib modelsim_lib/msim/axi_clock_converter_v2_1_26
vlib modelsim_lib/msim/blk_mem_gen_v8_4_5
vlib modelsim_lib/msim/axi_dwidth_converter_v2_1_27

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_13 modelsim_lib/msim/axi_vip_v1_1_13
vmap zynq_ultra_ps_e_vip_v1_0_13 modelsim_lib/msim/zynq_ultra_ps_e_vip_v1_0_13
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap lib_pkg_v1_0_2 modelsim_lib/msim/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_7 modelsim_lib/msim/fifo_generator_v13_2_7
vmap lib_fifo_v1_0_16 modelsim_lib/msim/lib_fifo_v1_0_16
vmap lib_srl_fifo_v1_0_2 modelsim_lib/msim/lib_srl_fifo_v1_0_2
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap axi_datamover_v5_1_29 modelsim_lib/msim/axi_datamover_v5_1_29
vmap axi_sg_v4_1_15 modelsim_lib/msim/axi_sg_v4_1_15
vmap axi_dma_v7_1_28 modelsim_lib/msim/axi_dma_v7_1_28
vmap xlconstant_v1_1_7 modelsim_lib/msim/xlconstant_v1_1_7
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap smartconnect_v1_0 modelsim_lib/msim/smartconnect_v1_0
vmap axi_register_slice_v2_1_27 modelsim_lib/msim/axi_register_slice_v2_1_27
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap axi_data_fifo_v2_1_26 modelsim_lib/msim/axi_data_fifo_v2_1_26
vmap axi_crossbar_v2_1_28 modelsim_lib/msim/axi_crossbar_v2_1_28
vmap axi_protocol_converter_v2_1_27 modelsim_lib/msim/axi_protocol_converter_v2_1_27
vmap axi_clock_converter_v2_1_26 modelsim_lib/msim/axi_clock_converter_v2_1_26
vmap blk_mem_gen_v8_4_5 modelsim_lib/msim/blk_mem_gen_v8_4_5
vmap axi_dwidth_converter_v2_1_27 modelsim_lib/msim/axi_dwidth_converter_v2_1_27

vlog -work xilinx_vip -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"/home/mpv/tools/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/mpv/tools/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/mpv/tools/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"/home/mpv/tools/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr -mfcu  "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_13 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ffc2/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_13 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_zynq_ultra_ps_e_0_0/sim/system_zynq_ultra_ps_e_0_0_vip_wrapper.v" \

vcom -work lib_pkg_v1_0_2 -64 -93  \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_7 -64 -incr -mfcu  "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7 -64 -93  \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7 -64 -incr -mfcu  "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_16 -64 -93  \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/6c82/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93  \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93  \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_29 -64 -93  \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/2237/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_15 -64 -93  \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/751a/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_28 -64 -93  \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/70c4/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/system/ip/system_axi_dma_0_0/sim/system_axi_dma_0_0.vhd" \
"../../../bd/system/ip/system_axi_dma_w2_0/sim/system_axi_dma_w2_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/sim/bd_919a.v" \

vlog -work xlconstant_v1_1_7 -64 -incr -mfcu  "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/badb/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_0/sim/bd_919a_one_0.v" \

vcom -work proc_sys_reset_v5_0_13 -64 -93  \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_1/sim/bd_919a_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_2/sim/bd_919a_arsw_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_3/sim/bd_919a_rsw_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_4/sim/bd_919a_awsw_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_5/sim/bd_919a_wsw_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_6/sim/bd_919a_bsw_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/be1f/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_7/sim/bd_919a_s00mmu_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/4fd2/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_8/sim/bd_919a_s00tr_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/637d/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_9/sim/bd_919a_s00sic_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f38e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_10/sim/bd_919a_s00a2s_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_11/sim/bd_919a_sarn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_12/sim/bd_919a_srn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_13/sim/bd_919a_s01mmu_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_14/sim/bd_919a_s01tr_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_15/sim/bd_919a_s01sic_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_16/sim/bd_919a_s01a2s_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_17/sim/bd_919a_sawn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_18/sim/bd_919a_swn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_19/sim/bd_919a_sbn_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/9cc5/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_20/sim/bd_919a_m00s2a_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_21/sim/bd_919a_m00arn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_22/sim/bd_919a_m00rn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_23/sim/bd_919a_m00awn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_24/sim/bd_919a_m00wn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_25/sim/bd_919a_m00bn_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/6bba/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/bd_0/ip/ip_26/sim/bd_919a_m00e_0.sv" \

vlog -work axi_register_slice_v2_1_27 -64 -incr -mfcu  "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_0/sim/system_smartconnect_0_0.v" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/sim/bd_515b.v" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_0/sim/bd_515b_one_0.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_1/sim/bd_515b_psr_aclk_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L axi_vip_v1_1_13 -L smartconnect_v1_0 -L zynq_ultra_ps_e_vip_v1_0_13 -L xilinx_vip "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_2/sim/bd_515b_arsw_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_3/sim/bd_515b_rsw_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_4/sim/bd_515b_awsw_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_5/sim/bd_515b_wsw_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_6/sim/bd_515b_bsw_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_7/sim/bd_515b_s00mmu_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_8/sim/bd_515b_s00tr_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_9/sim/bd_515b_s00sic_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_10/sim/bd_515b_s00a2s_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_11/sim/bd_515b_sarn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_12/sim/bd_515b_srn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_13/sim/bd_515b_s01mmu_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_14/sim/bd_515b_s01tr_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_15/sim/bd_515b_s01sic_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_16/sim/bd_515b_s01a2s_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_17/sim/bd_515b_sawn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_18/sim/bd_515b_swn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_19/sim/bd_515b_sbn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_20/sim/bd_515b_m00s2a_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_21/sim/bd_515b_m00arn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_22/sim/bd_515b_m00rn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_23/sim/bd_515b_m00awn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_24/sim/bd_515b_m00wn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_25/sim/bd_515b_m00bn_0.sv" \
"../../../bd/system/ip/system_smartconnect_0_1/bd_0/ip/ip_26/sim/bd_515b_m00e_0.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_smartconnect_0_1/sim/system_smartconnect_0_1.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/system/ip/system_rst_ps8_0_100M_0/sim/system_rst_ps8_0_100M_0.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr -mfcu  "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_26 -64 -incr -mfcu  "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/3111/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_28 -64 -incr -mfcu  "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/c40e/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_xbar_0/sim/system_xbar_0.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_bias_V_RAM_AUTO_1R1W.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_BUS1_s_axi.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_conv_Pipeline_OutYLOOP_FilterLOOP_KernelXLOOP_ChannelLOOP.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_conv_Pipeline_ReadActivationsLOOP.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_conv_Pipeline_ReadBiasStreamsLOOP_VITIS_LOOP_240_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_conv_Pipeline_ReadWeightStreamsLOOP.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_conv_Pipeline_VITIS_LOOP_330_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_filter_V_RAM_AUTO_1R1W.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_flow_control_loop_pipe_sequential_init.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_inputMap_V_RAM_AUTO_1R1W.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mac_muladd_8ns_4s_12s_13_4_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mac_muladd_8ns_4s_13s_14_4_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mac_muladd_8ns_4s_32s_32_4_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mac_muladd_9s_4s_13s_14_4_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mac_muladd_9s_4s_14s_14_4_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mac_muladd_9s_4s_32s_32_4_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mul_3ns_3ns_6_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mul_3ns_28ns_31_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mul_3ns_30s_32_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mul_3ns_31ns_34_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mul_6ns_29s_32_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mul_8ns_4s_12_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mul_9s_4s_13_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mul_10ns_2ns_12_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mul_10ns_3ns_13_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mul_10ns_34ns_44_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mul_10ns_44ns_54_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mul_10ns_54ns_64_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mul_13ns_3ns_16_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mul_16ns_30s_32_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mul_30s_3ns_32_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mul_30s_32s_32_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mul_32ns_2ns_34_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mul_32s_2ns_32_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mul_32s_32s_32_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_mux_53_32_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_regslice_both.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_sdiv_33ns_3ns_10_37_seq_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv_urem_12ns_4ns_4_16_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/876f/hdl/vhdl/conv.vhd" \
"../../../bd/system/ip/system_conv_0_1/sim/system_conv_0_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_bias_V_RAM_AUTO_1R1W.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_BUS1_s_axi.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_conv_w2_Pipeline_OutYLOOP_FilterLOOP_KernelXLOOP_ChannelLOOP.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_conv_w2_Pipeline_ReadActivationsLOOP.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_conv_w2_Pipeline_ReadBiasStreamsLOOP_VITIS_LOOP_240_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_conv_w2_Pipeline_ReadWeightStreamsLOOP.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_conv_w2_Pipeline_VITIS_LOOP_330_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_filter_V_RAM_AUTO_1R1W.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_flow_control_loop_pipe_sequential_init.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_inputMap_V_RAM_AUTO_1R1W.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mac_muladd_8ns_2s_10s_11_4_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mac_muladd_8ns_2s_11s_12_4_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mac_muladd_8ns_2s_32s_32_4_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mac_muladd_9s_2s_11s_12_4_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mac_muladd_9s_2s_12s_12_4_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mac_muladd_9s_2s_32s_32_4_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mul_3ns_3ns_6_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mul_3ns_28ns_31_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mul_3ns_30s_32_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mul_3ns_31ns_34_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mul_8ns_2s_10_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mul_9s_2s_11_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mul_10ns_2ns_12_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mul_10ns_3ns_13_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mul_10ns_34ns_44_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mul_10ns_44ns_54_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mul_10ns_54ns_64_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mul_13ns_3ns_16_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mul_16ns_30s_32_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mul_30s_3ns_32_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mul_30s_32s_32_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mul_32ns_2ns_34_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mul_32s_2ns_32_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mul_32s_32s_32_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mul_mul_6ns_28s_32_4_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mux_42_32_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_mux_53_32_1_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_regslice_both.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_sdiv_33ns_3ns_10_37_seq_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2_urem_12ns_4ns_4_16_1.vhd" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/eea8/hdl/vhdl/conv_w2.vhd" \
"../../../bd/system/ip/system_conv_w2_0_0/sim/system_conv_w2_0_0.vhd" \

vlog -work axi_protocol_converter_v2_1_27 -64 -incr -mfcu  "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/aeb3/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work axi_clock_converter_v2_1_26 -64 -incr -mfcu  "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/b8be/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work blk_mem_gen_v8_4_5 -64 -incr -mfcu  "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \

vlog -work axi_dwidth_converter_v2_1_27 -64 -incr -mfcu  "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/4675/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/abef/hdl" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/f0b6/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ipshared/66be/hdl/verilog" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_0_1/drivers/conv_v1_7/src" "+incdir+../../../../zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/drivers/conv_w2_v1_7/src" "+incdir+/home/mpv/tools/Xilinx/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_auto_ds_0/sim/system_auto_ds_0.v" \
"../../../bd/system/ip/system_auto_pc_0/sim/system_auto_pc_0.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/system/sim/system.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

