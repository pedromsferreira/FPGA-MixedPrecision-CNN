// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __conv_w2_mac_muladd_8ns_2s_32s_32_4_1__HH__
#define __conv_w2_mac_muladd_8ns_2s_32s_32_4_1__HH__
#include "conv_w2_mac_muladd_8ns_2s_32s_32_4_1_DSP48_2.h"

template<
    int ID,
    int NUM_STAGE,
    int din0_WIDTH,
    int din1_WIDTH,
    int din2_WIDTH,
    int dout_WIDTH>
SC_MODULE(conv_w2_mac_muladd_8ns_2s_32s_32_4_1) {
    sc_core::sc_in_clk clk;
    sc_core::sc_in<sc_dt::sc_logic> reset;
    sc_core::sc_in<sc_dt::sc_logic> ce;
    sc_core::sc_in< sc_dt::sc_lv<din0_WIDTH> >   din0;
    sc_core::sc_in< sc_dt::sc_lv<din1_WIDTH> >   din1;
    sc_core::sc_in< sc_dt::sc_lv<din2_WIDTH> >   din2;
    sc_core::sc_out< sc_dt::sc_lv<dout_WIDTH> >   dout;



    conv_w2_mac_muladd_8ns_2s_32s_32_4_1_DSP48_2 conv_w2_mac_muladd_8ns_2s_32s_32_4_1_DSP48_2_U;

    SC_CTOR(conv_w2_mac_muladd_8ns_2s_32s_32_4_1):  conv_w2_mac_muladd_8ns_2s_32s_32_4_1_DSP48_2_U ("conv_w2_mac_muladd_8ns_2s_32s_32_4_1_DSP48_2_U") {
        conv_w2_mac_muladd_8ns_2s_32s_32_4_1_DSP48_2_U.clk(clk);
        conv_w2_mac_muladd_8ns_2s_32s_32_4_1_DSP48_2_U.rst(reset);
        conv_w2_mac_muladd_8ns_2s_32s_32_4_1_DSP48_2_U.ce(ce);
        conv_w2_mac_muladd_8ns_2s_32s_32_4_1_DSP48_2_U.in0(din0);
        conv_w2_mac_muladd_8ns_2s_32s_32_4_1_DSP48_2_U.in1(din1);
        conv_w2_mac_muladd_8ns_2s_32s_32_4_1_DSP48_2_U.in2(din2);
        conv_w2_mac_muladd_8ns_2s_32s_32_4_1_DSP48_2_U.dout(dout);

    }

};

#endif //
