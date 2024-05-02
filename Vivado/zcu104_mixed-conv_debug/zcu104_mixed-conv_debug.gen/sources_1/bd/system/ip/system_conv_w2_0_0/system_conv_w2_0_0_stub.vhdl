-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
-- Date        : Thu Apr 18 03:11:58 2024
-- Host        : brutus running 64-bit Ubuntu 20.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/pferreira/HwSw/Vivado/zcu104_mixed-conv_debug/zcu104_mixed-conv_debug.gen/sources_1/bd/system/ip/system_conv_w2_0_0/system_conv_w2_0_0_stub.vhdl
-- Design      : system_conv_w2_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu7ev-ffvc1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_conv_w2_0_0 is
  Port ( 
    s_axi_BUS1_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_BUS1_AWVALID : in STD_LOGIC;
    s_axi_BUS1_AWREADY : out STD_LOGIC;
    s_axi_BUS1_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_BUS1_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_BUS1_WVALID : in STD_LOGIC;
    s_axi_BUS1_WREADY : out STD_LOGIC;
    s_axi_BUS1_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_BUS1_BVALID : out STD_LOGIC;
    s_axi_BUS1_BREADY : in STD_LOGIC;
    s_axi_BUS1_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_BUS1_ARVALID : in STD_LOGIC;
    s_axi_BUS1_ARREADY : out STD_LOGIC;
    s_axi_BUS1_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_BUS1_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_BUS1_RVALID : out STD_LOGIC;
    s_axi_BUS1_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    strm_in_TVALID : in STD_LOGIC;
    strm_in_TREADY : out STD_LOGIC;
    strm_in_TDATA : in STD_LOGIC_VECTOR ( 127 downto 0 );
    strm_in_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    strm_in_TKEEP : in STD_LOGIC_VECTOR ( 15 downto 0 );
    strm_in_TSTRB : in STD_LOGIC_VECTOR ( 15 downto 0 );
    strm_out_TVALID : out STD_LOGIC;
    strm_out_TREADY : in STD_LOGIC;
    strm_out_TDATA : out STD_LOGIC_VECTOR ( 127 downto 0 );
    strm_out_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 );
    strm_out_TKEEP : out STD_LOGIC_VECTOR ( 15 downto 0 );
    strm_out_TSTRB : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end system_conv_w2_0_0;

architecture stub of system_conv_w2_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_BUS1_AWADDR[5:0],s_axi_BUS1_AWVALID,s_axi_BUS1_AWREADY,s_axi_BUS1_WDATA[31:0],s_axi_BUS1_WSTRB[3:0],s_axi_BUS1_WVALID,s_axi_BUS1_WREADY,s_axi_BUS1_BRESP[1:0],s_axi_BUS1_BVALID,s_axi_BUS1_BREADY,s_axi_BUS1_ARADDR[5:0],s_axi_BUS1_ARVALID,s_axi_BUS1_ARREADY,s_axi_BUS1_RDATA[31:0],s_axi_BUS1_RRESP[1:0],s_axi_BUS1_RVALID,s_axi_BUS1_RREADY,ap_clk,ap_rst_n,interrupt,strm_in_TVALID,strm_in_TREADY,strm_in_TDATA[127:0],strm_in_TLAST[0:0],strm_in_TKEEP[15:0],strm_in_TSTRB[15:0],strm_out_TVALID,strm_out_TREADY,strm_out_TDATA[127:0],strm_out_TLAST[0:0],strm_out_TKEEP[15:0],strm_out_TSTRB[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "conv_w2,Vivado 2022.2";
begin
end;
