set SynModuleInfo {
  {SRCNAME conv_Pipeline_VITIS_LOOP_330_1 MODELNAME conv_Pipeline_VITIS_LOOP_330_1 RTLNAME conv_conv_Pipeline_VITIS_LOOP_330_1
    SUBMODULES {
      {MODELNAME conv_flow_control_loop_pipe_sequential_init RTLNAME conv_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME conv_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME conv_Pipeline_ReadBiasStreamsLOOP_VITIS_LOOP_240_1 MODELNAME conv_Pipeline_ReadBiasStreamsLOOP_VITIS_LOOP_240_1 RTLNAME conv_conv_Pipeline_ReadBiasStreamsLOOP_VITIS_LOOP_240_1}
  {SRCNAME conv_Pipeline_ReadWeightStreamsLOOP MODELNAME conv_Pipeline_ReadWeightStreamsLOOP RTLNAME conv_conv_Pipeline_ReadWeightStreamsLOOP}
  {SRCNAME conv_Pipeline_ReadActivationsLOOP MODELNAME conv_Pipeline_ReadActivationsLOOP RTLNAME conv_conv_Pipeline_ReadActivationsLOOP
    SUBMODULES {
      {MODELNAME conv_mux_53_32_1_1 RTLNAME conv_mux_53_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME conv_Pipeline_OutYLOOP_FilterLOOP_KernelXLOOP_ChannelLOOP MODELNAME conv_Pipeline_OutYLOOP_FilterLOOP_KernelXLOOP_ChannelLOOP RTLNAME conv_conv_Pipeline_OutYLOOP_FilterLOOP_KernelXLOOP_ChannelLOOP
    SUBMODULES {
      {MODELNAME conv_mul_10ns_2ns_12_1_1 RTLNAME conv_mul_10ns_2ns_12_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_urem_12ns_4ns_4_16_1 RTLNAME conv_urem_12ns_4ns_4_16_1 BINDTYPE op TYPE urem IMPL auto LATENCY 15 ALLOW_PRAGMA 1}
      {MODELNAME conv_mul_10ns_3ns_13_1_1 RTLNAME conv_mul_10ns_3ns_13_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_mul_13ns_3ns_16_1_1 RTLNAME conv_mul_13ns_3ns_16_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_mul_16ns_30s_32_1_1 RTLNAME conv_mul_16ns_30s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_mul_3ns_30s_32_1_1 RTLNAME conv_mul_3ns_30s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_mul_32s_2ns_32_1_1 RTLNAME conv_mul_32s_2ns_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_mul_8ns_4s_12_1_1 RTLNAME conv_mul_8ns_4s_12_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_mul_9s_4s_13_1_1 RTLNAME conv_mul_9s_4s_13_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_mac_muladd_8ns_4s_12s_13_4_1 RTLNAME conv_mac_muladd_8ns_4s_12s_13_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME conv_mac_muladd_9s_4s_13s_14_4_1 RTLNAME conv_mac_muladd_9s_4s_13s_14_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME conv_mac_muladd_8ns_4s_32s_32_4_1 RTLNAME conv_mac_muladd_8ns_4s_32s_32_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME conv_mac_muladd_8ns_4s_13s_14_4_1 RTLNAME conv_mac_muladd_8ns_4s_13s_14_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME conv_mac_muladd_9s_4s_32s_32_4_1 RTLNAME conv_mac_muladd_9s_4s_32s_32_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME conv_mac_muladd_9s_4s_14s_14_4_1 RTLNAME conv_mac_muladd_9s_4s_14s_14_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME conv MODELNAME conv RTLNAME conv IS_TOP 1
    SUBMODULES {
      {MODELNAME conv_sdiv_33ns_3ns_10_37_seq_1 RTLNAME conv_sdiv_33ns_3ns_10_37_seq_1 BINDTYPE op TYPE sdiv IMPL auto_seq LATENCY 36 ALLOW_PRAGMA 1}
      {MODELNAME conv_mul_30s_32s_32_1_1 RTLNAME conv_mul_30s_32s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_mul_3ns_3ns_6_1_1 RTLNAME conv_mul_3ns_3ns_6_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_mul_6ns_29s_32_1_1 RTLNAME conv_mul_6ns_29s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_mul_32s_32s_32_1_1 RTLNAME conv_mul_32s_32s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_mul_30s_3ns_32_1_1 RTLNAME conv_mul_30s_3ns_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_mul_3ns_28ns_31_1_1 RTLNAME conv_mul_3ns_28ns_31_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_mul_3ns_31ns_34_1_1 RTLNAME conv_mul_3ns_31ns_34_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_mul_10ns_34ns_44_1_1 RTLNAME conv_mul_10ns_34ns_44_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_mul_32ns_2ns_34_1_1 RTLNAME conv_mul_32ns_2ns_34_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_mul_10ns_44ns_54_1_1 RTLNAME conv_mul_10ns_44ns_54_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_mul_10ns_54ns_64_1_1 RTLNAME conv_mul_10ns_54ns_64_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME conv_filter_V_RAM_AUTO_1R1W RTLNAME conv_filter_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv_inputMap_V_RAM_AUTO_1R1W RTLNAME conv_inputMap_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv_bias_V_RAM_AUTO_1R1W RTLNAME conv_bias_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME conv_BUS1_s_axi RTLNAME conv_BUS1_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME conv_regslice_both RTLNAME conv_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME conv_regslice_both_U}
    }
  }
}
