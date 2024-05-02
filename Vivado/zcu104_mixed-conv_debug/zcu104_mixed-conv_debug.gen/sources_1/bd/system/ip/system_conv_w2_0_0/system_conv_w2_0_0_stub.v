// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Apr 18 03:11:58 2024
// Host        : brutus running 64-bit Ubuntu 20.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/pferreira/HwSw/Vivado/zcu104_mixed-conv_debug/zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/system_conv_w2_0_0_stub.v
// Design      : system_conv_w2_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu7ev-ffvc1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "conv_w2,Vivado 2022.2" *)
module system_conv_w2_0_0(s_axi_BUS1_AWADDR, s_axi_BUS1_AWVALID, 
  s_axi_BUS1_AWREADY, s_axi_BUS1_WDATA, s_axi_BUS1_WSTRB, s_axi_BUS1_WVALID, 
  s_axi_BUS1_WREADY, s_axi_BUS1_BRESP, s_axi_BUS1_BVALID, s_axi_BUS1_BREADY, 
  s_axi_BUS1_ARADDR, s_axi_BUS1_ARVALID, s_axi_BUS1_ARREADY, s_axi_BUS1_RDATA, 
  s_axi_BUS1_RRESP, s_axi_BUS1_RVALID, s_axi_BUS1_RREADY, ap_clk, ap_rst_n, interrupt, 
  strm_in_TVALID, strm_in_TREADY, strm_in_TDATA, strm_in_TLAST, strm_in_TKEEP, strm_in_TSTRB, 
  strm_out_TVALID, strm_out_TREADY, strm_out_TDATA, strm_out_TLAST, strm_out_TKEEP, 
  strm_out_TSTRB)
/* synthesis syn_black_box black_box_pad_pin="s_axi_BUS1_AWADDR[5:0],s_axi_BUS1_AWVALID,s_axi_BUS1_AWREADY,s_axi_BUS1_WDATA[31:0],s_axi_BUS1_WSTRB[3:0],s_axi_BUS1_WVALID,s_axi_BUS1_WREADY,s_axi_BUS1_BRESP[1:0],s_axi_BUS1_BVALID,s_axi_BUS1_BREADY,s_axi_BUS1_ARADDR[5:0],s_axi_BUS1_ARVALID,s_axi_BUS1_ARREADY,s_axi_BUS1_RDATA[31:0],s_axi_BUS1_RRESP[1:0],s_axi_BUS1_RVALID,s_axi_BUS1_RREADY,ap_clk,ap_rst_n,interrupt,strm_in_TVALID,strm_in_TREADY,strm_in_TDATA[127:0],strm_in_TLAST[0:0],strm_in_TKEEP[15:0],strm_in_TSTRB[15:0],strm_out_TVALID,strm_out_TREADY,strm_out_TDATA[127:0],strm_out_TLAST[0:0],strm_out_TKEEP[15:0],strm_out_TSTRB[15:0]" */;
  input [5:0]s_axi_BUS1_AWADDR;
  input s_axi_BUS1_AWVALID;
  output s_axi_BUS1_AWREADY;
  input [31:0]s_axi_BUS1_WDATA;
  input [3:0]s_axi_BUS1_WSTRB;
  input s_axi_BUS1_WVALID;
  output s_axi_BUS1_WREADY;
  output [1:0]s_axi_BUS1_BRESP;
  output s_axi_BUS1_BVALID;
  input s_axi_BUS1_BREADY;
  input [5:0]s_axi_BUS1_ARADDR;
  input s_axi_BUS1_ARVALID;
  output s_axi_BUS1_ARREADY;
  output [31:0]s_axi_BUS1_RDATA;
  output [1:0]s_axi_BUS1_RRESP;
  output s_axi_BUS1_RVALID;
  input s_axi_BUS1_RREADY;
  input ap_clk;
  input ap_rst_n;
  output interrupt;
  input strm_in_TVALID;
  output strm_in_TREADY;
  input [127:0]strm_in_TDATA;
  input [0:0]strm_in_TLAST;
  input [15:0]strm_in_TKEEP;
  input [15:0]strm_in_TSTRB;
  output strm_out_TVALID;
  input strm_out_TREADY;
  output [127:0]strm_out_TDATA;
  output [0:0]strm_out_TLAST;
  output [15:0]strm_out_TKEEP;
  output [15:0]strm_out_TSTRB;
endmodule
