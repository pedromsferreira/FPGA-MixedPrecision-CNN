set SynModuleInfo {
  {SRCNAME conv_w2_Pipeline_VITIS_LOOP_330_1 MODELNAME conv_w2_Pipeline_VITIS_LOOP_330_1 RTLNAME conv_w2_conv_w2_Pipeline_VITIS_LOOP_330_1
    SUBMODULES {
      {MODELNAME conv_w2_flow_control_loop_pipe_sequential_init RTLNAME conv_w2_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME conv_w2_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME conv_w2_Pipeline_ReadBiasStreamsLOOP_VITIS_LOOP_240_1 MODELNAME conv_w2_Pipeline_ReadBiasStreamsLOOP_VITIS_LOOP_240_1 RTLNAME conv_w2_conv_w2_Pipeline_ReadBiasStreamsLOOP_VITIS_LOOP_240_1}
  {SRCNAME conv_w2_Pipeline_ReadWeightStreamsLOOP MODELNAME conv_w2_Pipeline_ReadWeightStreamsLOOP RTLNAME conv_w2_conv_w2_Pipeline_ReadWeightStreamsLOOP}
  {SRCNAME conv_w2_Pipeline_ReadActivationsLOOP MODELNAME conv_w2_Pipeline_ReadActivationsLOOP RTLNAME conv_w2_conv_w2_Pipeline_ReadActivationsLOOP
    SUBMODULES {
      {MODELNAME conv_w2_mux_53_32_1_1 RTLNAME conv_w2_mux_53_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME conv_w2_Pipeline_OutYLOOP_FilterLOOP_KernelXLOOP_ChannelLOOP MODELNAME conv_w2_Pipeline_OutYLOOP_FilterLOOP_KernelXLOOP_ChannelLOOP RTLNAME conv_w2_conv_w2_Pipeline_OutYLOOP_FilterLOOP_KernelXLOOP_ChannelLOOP
    SUBMODULES {
      {MODELNAME conv_w2_mul_10ns_2ns_12_1_1 RTLNAME conv_w2_mul_10ns_2ns_12_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_urem_12ns_4ns_4_16_1 RTLNAME conv_w2_urem_12ns_4ns_4_16_1 BINDTYPE op TYPE urem IMPL auto LATENCY 15 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mul_10ns_3ns_13_1_1 RTLNAME conv_w2_mul_10ns_3ns_13_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mul_13ns_3ns_16_1_1 RTLNAME conv_w2_mul_13ns_3ns_16_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mul_16ns_30s_32_1_1 RTLNAME conv_w2_mul_16ns_30s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mux_42_32_1_1 RTLNAME conv_w2_mux_42_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mul_3ns_30s_32_1_1 RTLNAME conv_w2_mul_3ns_30s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mul_32s_2ns_32_1_1 RTLNAME conv_w2_mul_32s_2ns_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mul_8ns_2s_10_1_1 RTLNAME conv_w2_mul_8ns_2s_10_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mul_9s_2s_11_1_1 RTLNAME conv_w2_mul_9s_2s_11_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mac_muladd_8ns_2s_10s_11_4_1 RTLNAME conv_w2_mac_muladd_8ns_2s_10s_11_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mac_muladd_9s_2s_11s_12_4_1 RTLNAME conv_w2_mac_muladd_9s_2s_11s_12_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mac_muladd_8ns_2s_32s_32_4_1 RTLNAME conv_w2_mac_muladd_8ns_2s_32s_32_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mac_muladd_8ns_2s_11s_12_4_1 RTLNAME conv_w2_mac_muladd_8ns_2s_11s_12_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mac_muladd_9s_2s_32s_32_4_1 RTLNAME conv_w2_mac_muladd_9s_2s_32s_32_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mac_muladd_9s_2s_12s_12_4_1 RTLNAME conv_w2_mac_muladd_9s_2s_12s_12_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME conv_w2 MODELNAME conv_w2 RTLNAME conv_w2 IS_TOP 1
    SUBMODULES {
      {MODELNAME conv_w2_sdiv_33ns_3ns_10_37_seq_1 RTLNAME conv_w2_sdiv_33ns_3ns_10_37_seq_1 BINDTYPE op TYPE sdiv IMPL auto_seq LATENCY 36 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mul_30s_32s_32_1_1 RTLNAME conv_w2_mul_30s_32s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mul_3ns_3ns_6_1_1 RTLNAME conv_w2_mul_3ns_3ns_6_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mul_32s_32s_32_1_1 RTLNAME conv_w2_mul_32s_32s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mul_30s_3ns_32_1_1 RTLNAME conv_w2_mul_30s_3ns_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mul_3ns_28ns_31_1_1 RTLNAME conv_w2_mul_3ns_28ns_31_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mul_3ns_31ns_34_1_1 RTLNAME conv_w2_mul_3ns_31ns_34_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mul_10ns_34ns_44_1_1 RTLNAME conv_w2_mul_10ns_34ns_44_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mul_32ns_2ns_34_1_1 RTLNAME conv_w2_mul_32ns_2ns_34_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mul_10ns_44ns_54_1_1 RTLNAME conv_w2_mul_10ns_44ns_54_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mul_10ns_54ns_64_1_1 RTLNAME conv_w2_mul_10ns_54ns_64_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_mul_mul_6ns_28s_32_4_1 RTLNAME conv_w2_mul_mul_6ns_28s_32_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_filter_V_RAM_AUTO_1R1W RTLNAME conv_w2_filter_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_inputMap_V_RAM_AUTO_1R1W RTLNAME conv_w2_inputMap_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_bias_V_RAM_AUTO_1R1W RTLNAME conv_w2_bias_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv_w2_BUS1_s_axi RTLNAME conv_w2_BUS1_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME conv_w2_regslice_both RTLNAME conv_w2_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME conv_w2_regslice_both_U}
    }
  }
}
