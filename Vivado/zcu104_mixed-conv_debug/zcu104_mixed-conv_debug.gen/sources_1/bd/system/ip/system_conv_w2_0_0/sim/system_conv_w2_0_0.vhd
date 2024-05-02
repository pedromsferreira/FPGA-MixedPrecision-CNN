-- (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:conv_w2:1.7
-- IP Revision: 2113519196

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY system_conv_w2_0_0 IS
  PORT (
    s_axi_BUS1_AWADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    s_axi_BUS1_AWVALID : IN STD_LOGIC;
    s_axi_BUS1_AWREADY : OUT STD_LOGIC;
    s_axi_BUS1_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_BUS1_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_BUS1_WVALID : IN STD_LOGIC;
    s_axi_BUS1_WREADY : OUT STD_LOGIC;
    s_axi_BUS1_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_BUS1_BVALID : OUT STD_LOGIC;
    s_axi_BUS1_BREADY : IN STD_LOGIC;
    s_axi_BUS1_ARADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    s_axi_BUS1_ARVALID : IN STD_LOGIC;
    s_axi_BUS1_ARREADY : OUT STD_LOGIC;
    s_axi_BUS1_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_BUS1_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_BUS1_RVALID : OUT STD_LOGIC;
    s_axi_BUS1_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    interrupt : OUT STD_LOGIC;
    strm_in_TVALID : IN STD_LOGIC;
    strm_in_TREADY : OUT STD_LOGIC;
    strm_in_TDATA : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    strm_in_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    strm_in_TKEEP : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    strm_in_TSTRB : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    strm_out_TVALID : OUT STD_LOGIC;
    strm_out_TREADY : IN STD_LOGIC;
    strm_out_TDATA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    strm_out_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    strm_out_TKEEP : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    strm_out_TSTRB : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END system_conv_w2_0_0;

ARCHITECTURE system_conv_w2_0_0_arch OF system_conv_w2_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF system_conv_w2_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT conv_w2 IS
    GENERIC (
      C_S_AXI_BUS1_ADDR_WIDTH : INTEGER;
      C_S_AXI_BUS1_DATA_WIDTH : INTEGER
    );
    PORT (
      s_axi_BUS1_AWADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      s_axi_BUS1_AWVALID : IN STD_LOGIC;
      s_axi_BUS1_AWREADY : OUT STD_LOGIC;
      s_axi_BUS1_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_BUS1_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_BUS1_WVALID : IN STD_LOGIC;
      s_axi_BUS1_WREADY : OUT STD_LOGIC;
      s_axi_BUS1_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_BUS1_BVALID : OUT STD_LOGIC;
      s_axi_BUS1_BREADY : IN STD_LOGIC;
      s_axi_BUS1_ARADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      s_axi_BUS1_ARVALID : IN STD_LOGIC;
      s_axi_BUS1_ARREADY : OUT STD_LOGIC;
      s_axi_BUS1_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_BUS1_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_BUS1_RVALID : OUT STD_LOGIC;
      s_axi_BUS1_RREADY : IN STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      interrupt : OUT STD_LOGIC;
      strm_in_TVALID : IN STD_LOGIC;
      strm_in_TREADY : OUT STD_LOGIC;
      strm_in_TDATA : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      strm_in_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      strm_in_TKEEP : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      strm_in_TSTRB : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      strm_out_TVALID : OUT STD_LOGIC;
      strm_out_TREADY : IN STD_LOGIC;
      strm_out_TDATA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      strm_out_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      strm_out_TKEEP : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      strm_out_TSTRB : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
  END COMPONENT conv_w2;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_BUS1:strm_in:strm_out, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst_n: SIGNAL IS "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF interrupt: SIGNAL IS "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PORTWIDTH 1";
  ATTRIBUTE X_INTERFACE_INFO OF interrupt: SIGNAL IS "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_BUS1_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_BUS1 ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_BUS1_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_BUS1 ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_BUS1_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_BUS1 ARVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_BUS1_AWADDR: SIGNAL IS "XIL_INTERFACENAME s_axi_BUS1, ADDR_WIDTH 6, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_zynq_ultra_ps_e_0_0_pl_clk0, NUM_READ_THREADS 1, " & 
"NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_BUS1_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_BUS1 AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_BUS1_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_BUS1 AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_BUS1_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_BUS1 AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_BUS1_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_BUS1 BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_BUS1_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_BUS1 BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_BUS1_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_BUS1 BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_BUS1_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_BUS1 RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_BUS1_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_BUS1 RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_BUS1_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_BUS1 RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_BUS1_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_BUS1 RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_BUS1_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_BUS1 WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_BUS1_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_BUS1 WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_BUS1_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_BUS1 WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_BUS1_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_BUS1 WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF strm_in_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 strm_in TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF strm_in_TKEEP: SIGNAL IS "xilinx.com:interface:axis:1.0 strm_in TKEEP";
  ATTRIBUTE X_INTERFACE_INFO OF strm_in_TLAST: SIGNAL IS "xilinx.com:interface:axis:1.0 strm_in TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF strm_in_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 strm_in TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF strm_in_TSTRB: SIGNAL IS "xilinx.com:interface:axis:1.0 strm_in TSTRB";
  ATTRIBUTE X_INTERFACE_PARAMETER OF strm_in_TVALID: SIGNAL IS "XIL_INTERFACENAME strm_in, TDATA_NUM_BYTES 16, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN system_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF strm_in_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 strm_in TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF strm_out_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 strm_out TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF strm_out_TKEEP: SIGNAL IS "xilinx.com:interface:axis:1.0 strm_out TKEEP";
  ATTRIBUTE X_INTERFACE_INFO OF strm_out_TLAST: SIGNAL IS "xilinx.com:interface:axis:1.0 strm_out TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF strm_out_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 strm_out TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF strm_out_TSTRB: SIGNAL IS "xilinx.com:interface:axis:1.0 strm_out TSTRB";
  ATTRIBUTE X_INTERFACE_PARAMETER OF strm_out_TVALID: SIGNAL IS "XIL_INTERFACENAME strm_out, TDATA_NUM_BYTES 16, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN system_zynq_ultra_ps_e_0_0_pl_clk0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF strm_out_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 strm_out TVALID";
BEGIN
  U0 : conv_w2
    GENERIC MAP (
      C_S_AXI_BUS1_ADDR_WIDTH => 6,
      C_S_AXI_BUS1_DATA_WIDTH => 32
    )
    PORT MAP (
      s_axi_BUS1_AWADDR => s_axi_BUS1_AWADDR,
      s_axi_BUS1_AWVALID => s_axi_BUS1_AWVALID,
      s_axi_BUS1_AWREADY => s_axi_BUS1_AWREADY,
      s_axi_BUS1_WDATA => s_axi_BUS1_WDATA,
      s_axi_BUS1_WSTRB => s_axi_BUS1_WSTRB,
      s_axi_BUS1_WVALID => s_axi_BUS1_WVALID,
      s_axi_BUS1_WREADY => s_axi_BUS1_WREADY,
      s_axi_BUS1_BRESP => s_axi_BUS1_BRESP,
      s_axi_BUS1_BVALID => s_axi_BUS1_BVALID,
      s_axi_BUS1_BREADY => s_axi_BUS1_BREADY,
      s_axi_BUS1_ARADDR => s_axi_BUS1_ARADDR,
      s_axi_BUS1_ARVALID => s_axi_BUS1_ARVALID,
      s_axi_BUS1_ARREADY => s_axi_BUS1_ARREADY,
      s_axi_BUS1_RDATA => s_axi_BUS1_RDATA,
      s_axi_BUS1_RRESP => s_axi_BUS1_RRESP,
      s_axi_BUS1_RVALID => s_axi_BUS1_RVALID,
      s_axi_BUS1_RREADY => s_axi_BUS1_RREADY,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      interrupt => interrupt,
      strm_in_TVALID => strm_in_TVALID,
      strm_in_TREADY => strm_in_TREADY,
      strm_in_TDATA => strm_in_TDATA,
      strm_in_TLAST => strm_in_TLAST,
      strm_in_TKEEP => strm_in_TKEEP,
      strm_in_TSTRB => strm_in_TSTRB,
      strm_out_TVALID => strm_out_TVALID,
      strm_out_TREADY => strm_out_TREADY,
      strm_out_TDATA => strm_out_TDATA,
      strm_out_TLAST => strm_out_TLAST,
      strm_out_TKEEP => strm_out_TKEEP,
      strm_out_TSTRB => strm_out_TSTRB
    );
END system_conv_w2_0_0_arch;
