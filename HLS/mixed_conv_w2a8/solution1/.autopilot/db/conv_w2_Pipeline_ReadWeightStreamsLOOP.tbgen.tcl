set moduleName conv_w2_Pipeline_ReadWeightStreamsLOOP
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {conv_w2_Pipeline_ReadWeightStreamsLOOP}
set C_modelType { void 0 }
set C_modelArgList {
	{ sext_ln190 int 30 regular  }
	{ totalWeightStreams int 32 regular  }
	{ streamsPerFilter int 32 regular  }
	{ filter_V_2 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_3 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_63 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_62 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_61 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_60 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_59 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_58 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_57 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_56 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_55 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_54 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_53 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_52 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_51 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_50 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_49 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_48 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_47 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_46 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_45 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_44 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_43 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_42 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_41 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_40 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_39 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_38 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_37 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_36 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_35 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_34 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_33 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_32 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_31 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_30 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_29 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_28 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_27 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_26 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_25 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_24 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_23 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_22 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_21 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_20 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_19 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_18 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_17 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_16 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_15 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_14 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_13 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_12 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_11 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_10 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_9 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_8 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_7 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_6 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_5 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_4 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ filter_V_1 int 32 regular {array 2304 { 0 3 } 0 1 }  }
	{ strm_in_V_data_V int 128 regular {axi_s 0 volatile  { strm_in Data } }  }
	{ strm_in_V_keep_V int 16 regular {axi_s 0 volatile  { strm_in Keep } }  }
	{ strm_in_V_strb_V int 16 regular {axi_s 0 volatile  { strm_in Strb } }  }
	{ strm_in_V_last_V int 1 regular {axi_s 0 volatile  { strm_in Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "sext_ln190", "interface" : "wire", "bitwidth" : 30, "direction" : "READONLY"} , 
 	{ "Name" : "totalWeightStreams", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "streamsPerFilter", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_V_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_3", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_63", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_62", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_61", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_60", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_59", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_58", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_57", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_56", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_55", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_54", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_53", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_52", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_51", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_50", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_49", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_48", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_47", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_46", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_45", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_44", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_43", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_42", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_41", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_40", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_39", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_38", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_37", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_36", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_35", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_34", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_33", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_32", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_31", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_30", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_29", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_28", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_27", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_26", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_25", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_24", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_23", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_22", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_21", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_20", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_19", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_18", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_17", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_16", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_15", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_14", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_13", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_12", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_11", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_10", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_9", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_8", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_7", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_6", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_5", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_4", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "strm_in_V_data_V", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "strm_in_V_keep_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "strm_in_V_strb_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "strm_in_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 271
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ strm_in_TVALID sc_in sc_logic 1 invld 67 } 
	{ sext_ln190 sc_in sc_lv 30 signal 0 } 
	{ totalWeightStreams sc_in sc_lv 32 signal 1 } 
	{ streamsPerFilter sc_in sc_lv 32 signal 2 } 
	{ filter_V_2_address0 sc_out sc_lv 12 signal 3 } 
	{ filter_V_2_ce0 sc_out sc_logic 1 signal 3 } 
	{ filter_V_2_we0 sc_out sc_logic 1 signal 3 } 
	{ filter_V_2_d0 sc_out sc_lv 32 signal 3 } 
	{ filter_V_3_address0 sc_out sc_lv 12 signal 4 } 
	{ filter_V_3_ce0 sc_out sc_logic 1 signal 4 } 
	{ filter_V_3_we0 sc_out sc_logic 1 signal 4 } 
	{ filter_V_3_d0 sc_out sc_lv 32 signal 4 } 
	{ filter_V_address0 sc_out sc_lv 12 signal 5 } 
	{ filter_V_ce0 sc_out sc_logic 1 signal 5 } 
	{ filter_V_we0 sc_out sc_logic 1 signal 5 } 
	{ filter_V_d0 sc_out sc_lv 32 signal 5 } 
	{ filter_V_63_address0 sc_out sc_lv 12 signal 6 } 
	{ filter_V_63_ce0 sc_out sc_logic 1 signal 6 } 
	{ filter_V_63_we0 sc_out sc_logic 1 signal 6 } 
	{ filter_V_63_d0 sc_out sc_lv 32 signal 6 } 
	{ filter_V_62_address0 sc_out sc_lv 12 signal 7 } 
	{ filter_V_62_ce0 sc_out sc_logic 1 signal 7 } 
	{ filter_V_62_we0 sc_out sc_logic 1 signal 7 } 
	{ filter_V_62_d0 sc_out sc_lv 32 signal 7 } 
	{ filter_V_61_address0 sc_out sc_lv 12 signal 8 } 
	{ filter_V_61_ce0 sc_out sc_logic 1 signal 8 } 
	{ filter_V_61_we0 sc_out sc_logic 1 signal 8 } 
	{ filter_V_61_d0 sc_out sc_lv 32 signal 8 } 
	{ filter_V_60_address0 sc_out sc_lv 12 signal 9 } 
	{ filter_V_60_ce0 sc_out sc_logic 1 signal 9 } 
	{ filter_V_60_we0 sc_out sc_logic 1 signal 9 } 
	{ filter_V_60_d0 sc_out sc_lv 32 signal 9 } 
	{ filter_V_59_address0 sc_out sc_lv 12 signal 10 } 
	{ filter_V_59_ce0 sc_out sc_logic 1 signal 10 } 
	{ filter_V_59_we0 sc_out sc_logic 1 signal 10 } 
	{ filter_V_59_d0 sc_out sc_lv 32 signal 10 } 
	{ filter_V_58_address0 sc_out sc_lv 12 signal 11 } 
	{ filter_V_58_ce0 sc_out sc_logic 1 signal 11 } 
	{ filter_V_58_we0 sc_out sc_logic 1 signal 11 } 
	{ filter_V_58_d0 sc_out sc_lv 32 signal 11 } 
	{ filter_V_57_address0 sc_out sc_lv 12 signal 12 } 
	{ filter_V_57_ce0 sc_out sc_logic 1 signal 12 } 
	{ filter_V_57_we0 sc_out sc_logic 1 signal 12 } 
	{ filter_V_57_d0 sc_out sc_lv 32 signal 12 } 
	{ filter_V_56_address0 sc_out sc_lv 12 signal 13 } 
	{ filter_V_56_ce0 sc_out sc_logic 1 signal 13 } 
	{ filter_V_56_we0 sc_out sc_logic 1 signal 13 } 
	{ filter_V_56_d0 sc_out sc_lv 32 signal 13 } 
	{ filter_V_55_address0 sc_out sc_lv 12 signal 14 } 
	{ filter_V_55_ce0 sc_out sc_logic 1 signal 14 } 
	{ filter_V_55_we0 sc_out sc_logic 1 signal 14 } 
	{ filter_V_55_d0 sc_out sc_lv 32 signal 14 } 
	{ filter_V_54_address0 sc_out sc_lv 12 signal 15 } 
	{ filter_V_54_ce0 sc_out sc_logic 1 signal 15 } 
	{ filter_V_54_we0 sc_out sc_logic 1 signal 15 } 
	{ filter_V_54_d0 sc_out sc_lv 32 signal 15 } 
	{ filter_V_53_address0 sc_out sc_lv 12 signal 16 } 
	{ filter_V_53_ce0 sc_out sc_logic 1 signal 16 } 
	{ filter_V_53_we0 sc_out sc_logic 1 signal 16 } 
	{ filter_V_53_d0 sc_out sc_lv 32 signal 16 } 
	{ filter_V_52_address0 sc_out sc_lv 12 signal 17 } 
	{ filter_V_52_ce0 sc_out sc_logic 1 signal 17 } 
	{ filter_V_52_we0 sc_out sc_logic 1 signal 17 } 
	{ filter_V_52_d0 sc_out sc_lv 32 signal 17 } 
	{ filter_V_51_address0 sc_out sc_lv 12 signal 18 } 
	{ filter_V_51_ce0 sc_out sc_logic 1 signal 18 } 
	{ filter_V_51_we0 sc_out sc_logic 1 signal 18 } 
	{ filter_V_51_d0 sc_out sc_lv 32 signal 18 } 
	{ filter_V_50_address0 sc_out sc_lv 12 signal 19 } 
	{ filter_V_50_ce0 sc_out sc_logic 1 signal 19 } 
	{ filter_V_50_we0 sc_out sc_logic 1 signal 19 } 
	{ filter_V_50_d0 sc_out sc_lv 32 signal 19 } 
	{ filter_V_49_address0 sc_out sc_lv 12 signal 20 } 
	{ filter_V_49_ce0 sc_out sc_logic 1 signal 20 } 
	{ filter_V_49_we0 sc_out sc_logic 1 signal 20 } 
	{ filter_V_49_d0 sc_out sc_lv 32 signal 20 } 
	{ filter_V_48_address0 sc_out sc_lv 12 signal 21 } 
	{ filter_V_48_ce0 sc_out sc_logic 1 signal 21 } 
	{ filter_V_48_we0 sc_out sc_logic 1 signal 21 } 
	{ filter_V_48_d0 sc_out sc_lv 32 signal 21 } 
	{ filter_V_47_address0 sc_out sc_lv 12 signal 22 } 
	{ filter_V_47_ce0 sc_out sc_logic 1 signal 22 } 
	{ filter_V_47_we0 sc_out sc_logic 1 signal 22 } 
	{ filter_V_47_d0 sc_out sc_lv 32 signal 22 } 
	{ filter_V_46_address0 sc_out sc_lv 12 signal 23 } 
	{ filter_V_46_ce0 sc_out sc_logic 1 signal 23 } 
	{ filter_V_46_we0 sc_out sc_logic 1 signal 23 } 
	{ filter_V_46_d0 sc_out sc_lv 32 signal 23 } 
	{ filter_V_45_address0 sc_out sc_lv 12 signal 24 } 
	{ filter_V_45_ce0 sc_out sc_logic 1 signal 24 } 
	{ filter_V_45_we0 sc_out sc_logic 1 signal 24 } 
	{ filter_V_45_d0 sc_out sc_lv 32 signal 24 } 
	{ filter_V_44_address0 sc_out sc_lv 12 signal 25 } 
	{ filter_V_44_ce0 sc_out sc_logic 1 signal 25 } 
	{ filter_V_44_we0 sc_out sc_logic 1 signal 25 } 
	{ filter_V_44_d0 sc_out sc_lv 32 signal 25 } 
	{ filter_V_43_address0 sc_out sc_lv 12 signal 26 } 
	{ filter_V_43_ce0 sc_out sc_logic 1 signal 26 } 
	{ filter_V_43_we0 sc_out sc_logic 1 signal 26 } 
	{ filter_V_43_d0 sc_out sc_lv 32 signal 26 } 
	{ filter_V_42_address0 sc_out sc_lv 12 signal 27 } 
	{ filter_V_42_ce0 sc_out sc_logic 1 signal 27 } 
	{ filter_V_42_we0 sc_out sc_logic 1 signal 27 } 
	{ filter_V_42_d0 sc_out sc_lv 32 signal 27 } 
	{ filter_V_41_address0 sc_out sc_lv 12 signal 28 } 
	{ filter_V_41_ce0 sc_out sc_logic 1 signal 28 } 
	{ filter_V_41_we0 sc_out sc_logic 1 signal 28 } 
	{ filter_V_41_d0 sc_out sc_lv 32 signal 28 } 
	{ filter_V_40_address0 sc_out sc_lv 12 signal 29 } 
	{ filter_V_40_ce0 sc_out sc_logic 1 signal 29 } 
	{ filter_V_40_we0 sc_out sc_logic 1 signal 29 } 
	{ filter_V_40_d0 sc_out sc_lv 32 signal 29 } 
	{ filter_V_39_address0 sc_out sc_lv 12 signal 30 } 
	{ filter_V_39_ce0 sc_out sc_logic 1 signal 30 } 
	{ filter_V_39_we0 sc_out sc_logic 1 signal 30 } 
	{ filter_V_39_d0 sc_out sc_lv 32 signal 30 } 
	{ filter_V_38_address0 sc_out sc_lv 12 signal 31 } 
	{ filter_V_38_ce0 sc_out sc_logic 1 signal 31 } 
	{ filter_V_38_we0 sc_out sc_logic 1 signal 31 } 
	{ filter_V_38_d0 sc_out sc_lv 32 signal 31 } 
	{ filter_V_37_address0 sc_out sc_lv 12 signal 32 } 
	{ filter_V_37_ce0 sc_out sc_logic 1 signal 32 } 
	{ filter_V_37_we0 sc_out sc_logic 1 signal 32 } 
	{ filter_V_37_d0 sc_out sc_lv 32 signal 32 } 
	{ filter_V_36_address0 sc_out sc_lv 12 signal 33 } 
	{ filter_V_36_ce0 sc_out sc_logic 1 signal 33 } 
	{ filter_V_36_we0 sc_out sc_logic 1 signal 33 } 
	{ filter_V_36_d0 sc_out sc_lv 32 signal 33 } 
	{ filter_V_35_address0 sc_out sc_lv 12 signal 34 } 
	{ filter_V_35_ce0 sc_out sc_logic 1 signal 34 } 
	{ filter_V_35_we0 sc_out sc_logic 1 signal 34 } 
	{ filter_V_35_d0 sc_out sc_lv 32 signal 34 } 
	{ filter_V_34_address0 sc_out sc_lv 12 signal 35 } 
	{ filter_V_34_ce0 sc_out sc_logic 1 signal 35 } 
	{ filter_V_34_we0 sc_out sc_logic 1 signal 35 } 
	{ filter_V_34_d0 sc_out sc_lv 32 signal 35 } 
	{ filter_V_33_address0 sc_out sc_lv 12 signal 36 } 
	{ filter_V_33_ce0 sc_out sc_logic 1 signal 36 } 
	{ filter_V_33_we0 sc_out sc_logic 1 signal 36 } 
	{ filter_V_33_d0 sc_out sc_lv 32 signal 36 } 
	{ filter_V_32_address0 sc_out sc_lv 12 signal 37 } 
	{ filter_V_32_ce0 sc_out sc_logic 1 signal 37 } 
	{ filter_V_32_we0 sc_out sc_logic 1 signal 37 } 
	{ filter_V_32_d0 sc_out sc_lv 32 signal 37 } 
	{ filter_V_31_address0 sc_out sc_lv 12 signal 38 } 
	{ filter_V_31_ce0 sc_out sc_logic 1 signal 38 } 
	{ filter_V_31_we0 sc_out sc_logic 1 signal 38 } 
	{ filter_V_31_d0 sc_out sc_lv 32 signal 38 } 
	{ filter_V_30_address0 sc_out sc_lv 12 signal 39 } 
	{ filter_V_30_ce0 sc_out sc_logic 1 signal 39 } 
	{ filter_V_30_we0 sc_out sc_logic 1 signal 39 } 
	{ filter_V_30_d0 sc_out sc_lv 32 signal 39 } 
	{ filter_V_29_address0 sc_out sc_lv 12 signal 40 } 
	{ filter_V_29_ce0 sc_out sc_logic 1 signal 40 } 
	{ filter_V_29_we0 sc_out sc_logic 1 signal 40 } 
	{ filter_V_29_d0 sc_out sc_lv 32 signal 40 } 
	{ filter_V_28_address0 sc_out sc_lv 12 signal 41 } 
	{ filter_V_28_ce0 sc_out sc_logic 1 signal 41 } 
	{ filter_V_28_we0 sc_out sc_logic 1 signal 41 } 
	{ filter_V_28_d0 sc_out sc_lv 32 signal 41 } 
	{ filter_V_27_address0 sc_out sc_lv 12 signal 42 } 
	{ filter_V_27_ce0 sc_out sc_logic 1 signal 42 } 
	{ filter_V_27_we0 sc_out sc_logic 1 signal 42 } 
	{ filter_V_27_d0 sc_out sc_lv 32 signal 42 } 
	{ filter_V_26_address0 sc_out sc_lv 12 signal 43 } 
	{ filter_V_26_ce0 sc_out sc_logic 1 signal 43 } 
	{ filter_V_26_we0 sc_out sc_logic 1 signal 43 } 
	{ filter_V_26_d0 sc_out sc_lv 32 signal 43 } 
	{ filter_V_25_address0 sc_out sc_lv 12 signal 44 } 
	{ filter_V_25_ce0 sc_out sc_logic 1 signal 44 } 
	{ filter_V_25_we0 sc_out sc_logic 1 signal 44 } 
	{ filter_V_25_d0 sc_out sc_lv 32 signal 44 } 
	{ filter_V_24_address0 sc_out sc_lv 12 signal 45 } 
	{ filter_V_24_ce0 sc_out sc_logic 1 signal 45 } 
	{ filter_V_24_we0 sc_out sc_logic 1 signal 45 } 
	{ filter_V_24_d0 sc_out sc_lv 32 signal 45 } 
	{ filter_V_23_address0 sc_out sc_lv 12 signal 46 } 
	{ filter_V_23_ce0 sc_out sc_logic 1 signal 46 } 
	{ filter_V_23_we0 sc_out sc_logic 1 signal 46 } 
	{ filter_V_23_d0 sc_out sc_lv 32 signal 46 } 
	{ filter_V_22_address0 sc_out sc_lv 12 signal 47 } 
	{ filter_V_22_ce0 sc_out sc_logic 1 signal 47 } 
	{ filter_V_22_we0 sc_out sc_logic 1 signal 47 } 
	{ filter_V_22_d0 sc_out sc_lv 32 signal 47 } 
	{ filter_V_21_address0 sc_out sc_lv 12 signal 48 } 
	{ filter_V_21_ce0 sc_out sc_logic 1 signal 48 } 
	{ filter_V_21_we0 sc_out sc_logic 1 signal 48 } 
	{ filter_V_21_d0 sc_out sc_lv 32 signal 48 } 
	{ filter_V_20_address0 sc_out sc_lv 12 signal 49 } 
	{ filter_V_20_ce0 sc_out sc_logic 1 signal 49 } 
	{ filter_V_20_we0 sc_out sc_logic 1 signal 49 } 
	{ filter_V_20_d0 sc_out sc_lv 32 signal 49 } 
	{ filter_V_19_address0 sc_out sc_lv 12 signal 50 } 
	{ filter_V_19_ce0 sc_out sc_logic 1 signal 50 } 
	{ filter_V_19_we0 sc_out sc_logic 1 signal 50 } 
	{ filter_V_19_d0 sc_out sc_lv 32 signal 50 } 
	{ filter_V_18_address0 sc_out sc_lv 12 signal 51 } 
	{ filter_V_18_ce0 sc_out sc_logic 1 signal 51 } 
	{ filter_V_18_we0 sc_out sc_logic 1 signal 51 } 
	{ filter_V_18_d0 sc_out sc_lv 32 signal 51 } 
	{ filter_V_17_address0 sc_out sc_lv 12 signal 52 } 
	{ filter_V_17_ce0 sc_out sc_logic 1 signal 52 } 
	{ filter_V_17_we0 sc_out sc_logic 1 signal 52 } 
	{ filter_V_17_d0 sc_out sc_lv 32 signal 52 } 
	{ filter_V_16_address0 sc_out sc_lv 12 signal 53 } 
	{ filter_V_16_ce0 sc_out sc_logic 1 signal 53 } 
	{ filter_V_16_we0 sc_out sc_logic 1 signal 53 } 
	{ filter_V_16_d0 sc_out sc_lv 32 signal 53 } 
	{ filter_V_15_address0 sc_out sc_lv 12 signal 54 } 
	{ filter_V_15_ce0 sc_out sc_logic 1 signal 54 } 
	{ filter_V_15_we0 sc_out sc_logic 1 signal 54 } 
	{ filter_V_15_d0 sc_out sc_lv 32 signal 54 } 
	{ filter_V_14_address0 sc_out sc_lv 12 signal 55 } 
	{ filter_V_14_ce0 sc_out sc_logic 1 signal 55 } 
	{ filter_V_14_we0 sc_out sc_logic 1 signal 55 } 
	{ filter_V_14_d0 sc_out sc_lv 32 signal 55 } 
	{ filter_V_13_address0 sc_out sc_lv 12 signal 56 } 
	{ filter_V_13_ce0 sc_out sc_logic 1 signal 56 } 
	{ filter_V_13_we0 sc_out sc_logic 1 signal 56 } 
	{ filter_V_13_d0 sc_out sc_lv 32 signal 56 } 
	{ filter_V_12_address0 sc_out sc_lv 12 signal 57 } 
	{ filter_V_12_ce0 sc_out sc_logic 1 signal 57 } 
	{ filter_V_12_we0 sc_out sc_logic 1 signal 57 } 
	{ filter_V_12_d0 sc_out sc_lv 32 signal 57 } 
	{ filter_V_11_address0 sc_out sc_lv 12 signal 58 } 
	{ filter_V_11_ce0 sc_out sc_logic 1 signal 58 } 
	{ filter_V_11_we0 sc_out sc_logic 1 signal 58 } 
	{ filter_V_11_d0 sc_out sc_lv 32 signal 58 } 
	{ filter_V_10_address0 sc_out sc_lv 12 signal 59 } 
	{ filter_V_10_ce0 sc_out sc_logic 1 signal 59 } 
	{ filter_V_10_we0 sc_out sc_logic 1 signal 59 } 
	{ filter_V_10_d0 sc_out sc_lv 32 signal 59 } 
	{ filter_V_9_address0 sc_out sc_lv 12 signal 60 } 
	{ filter_V_9_ce0 sc_out sc_logic 1 signal 60 } 
	{ filter_V_9_we0 sc_out sc_logic 1 signal 60 } 
	{ filter_V_9_d0 sc_out sc_lv 32 signal 60 } 
	{ filter_V_8_address0 sc_out sc_lv 12 signal 61 } 
	{ filter_V_8_ce0 sc_out sc_logic 1 signal 61 } 
	{ filter_V_8_we0 sc_out sc_logic 1 signal 61 } 
	{ filter_V_8_d0 sc_out sc_lv 32 signal 61 } 
	{ filter_V_7_address0 sc_out sc_lv 12 signal 62 } 
	{ filter_V_7_ce0 sc_out sc_logic 1 signal 62 } 
	{ filter_V_7_we0 sc_out sc_logic 1 signal 62 } 
	{ filter_V_7_d0 sc_out sc_lv 32 signal 62 } 
	{ filter_V_6_address0 sc_out sc_lv 12 signal 63 } 
	{ filter_V_6_ce0 sc_out sc_logic 1 signal 63 } 
	{ filter_V_6_we0 sc_out sc_logic 1 signal 63 } 
	{ filter_V_6_d0 sc_out sc_lv 32 signal 63 } 
	{ filter_V_5_address0 sc_out sc_lv 12 signal 64 } 
	{ filter_V_5_ce0 sc_out sc_logic 1 signal 64 } 
	{ filter_V_5_we0 sc_out sc_logic 1 signal 64 } 
	{ filter_V_5_d0 sc_out sc_lv 32 signal 64 } 
	{ filter_V_4_address0 sc_out sc_lv 12 signal 65 } 
	{ filter_V_4_ce0 sc_out sc_logic 1 signal 65 } 
	{ filter_V_4_we0 sc_out sc_logic 1 signal 65 } 
	{ filter_V_4_d0 sc_out sc_lv 32 signal 65 } 
	{ filter_V_1_address0 sc_out sc_lv 12 signal 66 } 
	{ filter_V_1_ce0 sc_out sc_logic 1 signal 66 } 
	{ filter_V_1_we0 sc_out sc_logic 1 signal 66 } 
	{ filter_V_1_d0 sc_out sc_lv 32 signal 66 } 
	{ strm_in_TDATA sc_in sc_lv 128 signal 67 } 
	{ strm_in_TREADY sc_out sc_logic 1 inacc 70 } 
	{ strm_in_TKEEP sc_in sc_lv 16 signal 68 } 
	{ strm_in_TSTRB sc_in sc_lv 16 signal 69 } 
	{ strm_in_TLAST sc_in sc_lv 1 signal 70 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "strm_in_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "strm_in_V_data_V", "role": "default" }} , 
 	{ "name": "sext_ln190", "direction": "in", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "sext_ln190", "role": "default" }} , 
 	{ "name": "totalWeightStreams", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "totalWeightStreams", "role": "default" }} , 
 	{ "name": "streamsPerFilter", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "streamsPerFilter", "role": "default" }} , 
 	{ "name": "filter_V_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_2", "role": "address0" }} , 
 	{ "name": "filter_V_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_2", "role": "ce0" }} , 
 	{ "name": "filter_V_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_2", "role": "we0" }} , 
 	{ "name": "filter_V_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_2", "role": "d0" }} , 
 	{ "name": "filter_V_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_3", "role": "address0" }} , 
 	{ "name": "filter_V_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_3", "role": "ce0" }} , 
 	{ "name": "filter_V_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_3", "role": "we0" }} , 
 	{ "name": "filter_V_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_3", "role": "d0" }} , 
 	{ "name": "filter_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V", "role": "address0" }} , 
 	{ "name": "filter_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V", "role": "ce0" }} , 
 	{ "name": "filter_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V", "role": "we0" }} , 
 	{ "name": "filter_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V", "role": "d0" }} , 
 	{ "name": "filter_V_63_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_63", "role": "address0" }} , 
 	{ "name": "filter_V_63_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_63", "role": "ce0" }} , 
 	{ "name": "filter_V_63_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_63", "role": "we0" }} , 
 	{ "name": "filter_V_63_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_63", "role": "d0" }} , 
 	{ "name": "filter_V_62_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_62", "role": "address0" }} , 
 	{ "name": "filter_V_62_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_62", "role": "ce0" }} , 
 	{ "name": "filter_V_62_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_62", "role": "we0" }} , 
 	{ "name": "filter_V_62_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_62", "role": "d0" }} , 
 	{ "name": "filter_V_61_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_61", "role": "address0" }} , 
 	{ "name": "filter_V_61_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_61", "role": "ce0" }} , 
 	{ "name": "filter_V_61_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_61", "role": "we0" }} , 
 	{ "name": "filter_V_61_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_61", "role": "d0" }} , 
 	{ "name": "filter_V_60_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_60", "role": "address0" }} , 
 	{ "name": "filter_V_60_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_60", "role": "ce0" }} , 
 	{ "name": "filter_V_60_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_60", "role": "we0" }} , 
 	{ "name": "filter_V_60_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_60", "role": "d0" }} , 
 	{ "name": "filter_V_59_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_59", "role": "address0" }} , 
 	{ "name": "filter_V_59_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_59", "role": "ce0" }} , 
 	{ "name": "filter_V_59_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_59", "role": "we0" }} , 
 	{ "name": "filter_V_59_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_59", "role": "d0" }} , 
 	{ "name": "filter_V_58_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_58", "role": "address0" }} , 
 	{ "name": "filter_V_58_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_58", "role": "ce0" }} , 
 	{ "name": "filter_V_58_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_58", "role": "we0" }} , 
 	{ "name": "filter_V_58_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_58", "role": "d0" }} , 
 	{ "name": "filter_V_57_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_57", "role": "address0" }} , 
 	{ "name": "filter_V_57_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_57", "role": "ce0" }} , 
 	{ "name": "filter_V_57_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_57", "role": "we0" }} , 
 	{ "name": "filter_V_57_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_57", "role": "d0" }} , 
 	{ "name": "filter_V_56_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_56", "role": "address0" }} , 
 	{ "name": "filter_V_56_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_56", "role": "ce0" }} , 
 	{ "name": "filter_V_56_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_56", "role": "we0" }} , 
 	{ "name": "filter_V_56_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_56", "role": "d0" }} , 
 	{ "name": "filter_V_55_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_55", "role": "address0" }} , 
 	{ "name": "filter_V_55_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_55", "role": "ce0" }} , 
 	{ "name": "filter_V_55_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_55", "role": "we0" }} , 
 	{ "name": "filter_V_55_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_55", "role": "d0" }} , 
 	{ "name": "filter_V_54_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_54", "role": "address0" }} , 
 	{ "name": "filter_V_54_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_54", "role": "ce0" }} , 
 	{ "name": "filter_V_54_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_54", "role": "we0" }} , 
 	{ "name": "filter_V_54_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_54", "role": "d0" }} , 
 	{ "name": "filter_V_53_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_53", "role": "address0" }} , 
 	{ "name": "filter_V_53_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_53", "role": "ce0" }} , 
 	{ "name": "filter_V_53_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_53", "role": "we0" }} , 
 	{ "name": "filter_V_53_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_53", "role": "d0" }} , 
 	{ "name": "filter_V_52_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_52", "role": "address0" }} , 
 	{ "name": "filter_V_52_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_52", "role": "ce0" }} , 
 	{ "name": "filter_V_52_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_52", "role": "we0" }} , 
 	{ "name": "filter_V_52_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_52", "role": "d0" }} , 
 	{ "name": "filter_V_51_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_51", "role": "address0" }} , 
 	{ "name": "filter_V_51_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_51", "role": "ce0" }} , 
 	{ "name": "filter_V_51_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_51", "role": "we0" }} , 
 	{ "name": "filter_V_51_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_51", "role": "d0" }} , 
 	{ "name": "filter_V_50_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_50", "role": "address0" }} , 
 	{ "name": "filter_V_50_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_50", "role": "ce0" }} , 
 	{ "name": "filter_V_50_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_50", "role": "we0" }} , 
 	{ "name": "filter_V_50_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_50", "role": "d0" }} , 
 	{ "name": "filter_V_49_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_49", "role": "address0" }} , 
 	{ "name": "filter_V_49_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_49", "role": "ce0" }} , 
 	{ "name": "filter_V_49_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_49", "role": "we0" }} , 
 	{ "name": "filter_V_49_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_49", "role": "d0" }} , 
 	{ "name": "filter_V_48_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_48", "role": "address0" }} , 
 	{ "name": "filter_V_48_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_48", "role": "ce0" }} , 
 	{ "name": "filter_V_48_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_48", "role": "we0" }} , 
 	{ "name": "filter_V_48_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_48", "role": "d0" }} , 
 	{ "name": "filter_V_47_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_47", "role": "address0" }} , 
 	{ "name": "filter_V_47_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_47", "role": "ce0" }} , 
 	{ "name": "filter_V_47_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_47", "role": "we0" }} , 
 	{ "name": "filter_V_47_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_47", "role": "d0" }} , 
 	{ "name": "filter_V_46_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_46", "role": "address0" }} , 
 	{ "name": "filter_V_46_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_46", "role": "ce0" }} , 
 	{ "name": "filter_V_46_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_46", "role": "we0" }} , 
 	{ "name": "filter_V_46_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_46", "role": "d0" }} , 
 	{ "name": "filter_V_45_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_45", "role": "address0" }} , 
 	{ "name": "filter_V_45_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_45", "role": "ce0" }} , 
 	{ "name": "filter_V_45_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_45", "role": "we0" }} , 
 	{ "name": "filter_V_45_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_45", "role": "d0" }} , 
 	{ "name": "filter_V_44_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_44", "role": "address0" }} , 
 	{ "name": "filter_V_44_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_44", "role": "ce0" }} , 
 	{ "name": "filter_V_44_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_44", "role": "we0" }} , 
 	{ "name": "filter_V_44_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_44", "role": "d0" }} , 
 	{ "name": "filter_V_43_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_43", "role": "address0" }} , 
 	{ "name": "filter_V_43_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_43", "role": "ce0" }} , 
 	{ "name": "filter_V_43_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_43", "role": "we0" }} , 
 	{ "name": "filter_V_43_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_43", "role": "d0" }} , 
 	{ "name": "filter_V_42_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_42", "role": "address0" }} , 
 	{ "name": "filter_V_42_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_42", "role": "ce0" }} , 
 	{ "name": "filter_V_42_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_42", "role": "we0" }} , 
 	{ "name": "filter_V_42_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_42", "role": "d0" }} , 
 	{ "name": "filter_V_41_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_41", "role": "address0" }} , 
 	{ "name": "filter_V_41_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_41", "role": "ce0" }} , 
 	{ "name": "filter_V_41_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_41", "role": "we0" }} , 
 	{ "name": "filter_V_41_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_41", "role": "d0" }} , 
 	{ "name": "filter_V_40_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_40", "role": "address0" }} , 
 	{ "name": "filter_V_40_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_40", "role": "ce0" }} , 
 	{ "name": "filter_V_40_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_40", "role": "we0" }} , 
 	{ "name": "filter_V_40_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_40", "role": "d0" }} , 
 	{ "name": "filter_V_39_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_39", "role": "address0" }} , 
 	{ "name": "filter_V_39_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_39", "role": "ce0" }} , 
 	{ "name": "filter_V_39_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_39", "role": "we0" }} , 
 	{ "name": "filter_V_39_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_39", "role": "d0" }} , 
 	{ "name": "filter_V_38_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_38", "role": "address0" }} , 
 	{ "name": "filter_V_38_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_38", "role": "ce0" }} , 
 	{ "name": "filter_V_38_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_38", "role": "we0" }} , 
 	{ "name": "filter_V_38_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_38", "role": "d0" }} , 
 	{ "name": "filter_V_37_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_37", "role": "address0" }} , 
 	{ "name": "filter_V_37_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_37", "role": "ce0" }} , 
 	{ "name": "filter_V_37_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_37", "role": "we0" }} , 
 	{ "name": "filter_V_37_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_37", "role": "d0" }} , 
 	{ "name": "filter_V_36_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_36", "role": "address0" }} , 
 	{ "name": "filter_V_36_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_36", "role": "ce0" }} , 
 	{ "name": "filter_V_36_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_36", "role": "we0" }} , 
 	{ "name": "filter_V_36_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_36", "role": "d0" }} , 
 	{ "name": "filter_V_35_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_35", "role": "address0" }} , 
 	{ "name": "filter_V_35_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_35", "role": "ce0" }} , 
 	{ "name": "filter_V_35_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_35", "role": "we0" }} , 
 	{ "name": "filter_V_35_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_35", "role": "d0" }} , 
 	{ "name": "filter_V_34_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_34", "role": "address0" }} , 
 	{ "name": "filter_V_34_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_34", "role": "ce0" }} , 
 	{ "name": "filter_V_34_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_34", "role": "we0" }} , 
 	{ "name": "filter_V_34_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_34", "role": "d0" }} , 
 	{ "name": "filter_V_33_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_33", "role": "address0" }} , 
 	{ "name": "filter_V_33_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_33", "role": "ce0" }} , 
 	{ "name": "filter_V_33_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_33", "role": "we0" }} , 
 	{ "name": "filter_V_33_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_33", "role": "d0" }} , 
 	{ "name": "filter_V_32_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_32", "role": "address0" }} , 
 	{ "name": "filter_V_32_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_32", "role": "ce0" }} , 
 	{ "name": "filter_V_32_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_32", "role": "we0" }} , 
 	{ "name": "filter_V_32_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_32", "role": "d0" }} , 
 	{ "name": "filter_V_31_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_31", "role": "address0" }} , 
 	{ "name": "filter_V_31_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_31", "role": "ce0" }} , 
 	{ "name": "filter_V_31_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_31", "role": "we0" }} , 
 	{ "name": "filter_V_31_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_31", "role": "d0" }} , 
 	{ "name": "filter_V_30_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_30", "role": "address0" }} , 
 	{ "name": "filter_V_30_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_30", "role": "ce0" }} , 
 	{ "name": "filter_V_30_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_30", "role": "we0" }} , 
 	{ "name": "filter_V_30_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_30", "role": "d0" }} , 
 	{ "name": "filter_V_29_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_29", "role": "address0" }} , 
 	{ "name": "filter_V_29_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_29", "role": "ce0" }} , 
 	{ "name": "filter_V_29_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_29", "role": "we0" }} , 
 	{ "name": "filter_V_29_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_29", "role": "d0" }} , 
 	{ "name": "filter_V_28_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_28", "role": "address0" }} , 
 	{ "name": "filter_V_28_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_28", "role": "ce0" }} , 
 	{ "name": "filter_V_28_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_28", "role": "we0" }} , 
 	{ "name": "filter_V_28_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_28", "role": "d0" }} , 
 	{ "name": "filter_V_27_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_27", "role": "address0" }} , 
 	{ "name": "filter_V_27_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_27", "role": "ce0" }} , 
 	{ "name": "filter_V_27_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_27", "role": "we0" }} , 
 	{ "name": "filter_V_27_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_27", "role": "d0" }} , 
 	{ "name": "filter_V_26_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_26", "role": "address0" }} , 
 	{ "name": "filter_V_26_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_26", "role": "ce0" }} , 
 	{ "name": "filter_V_26_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_26", "role": "we0" }} , 
 	{ "name": "filter_V_26_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_26", "role": "d0" }} , 
 	{ "name": "filter_V_25_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_25", "role": "address0" }} , 
 	{ "name": "filter_V_25_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_25", "role": "ce0" }} , 
 	{ "name": "filter_V_25_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_25", "role": "we0" }} , 
 	{ "name": "filter_V_25_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_25", "role": "d0" }} , 
 	{ "name": "filter_V_24_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_24", "role": "address0" }} , 
 	{ "name": "filter_V_24_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_24", "role": "ce0" }} , 
 	{ "name": "filter_V_24_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_24", "role": "we0" }} , 
 	{ "name": "filter_V_24_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_24", "role": "d0" }} , 
 	{ "name": "filter_V_23_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_23", "role": "address0" }} , 
 	{ "name": "filter_V_23_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_23", "role": "ce0" }} , 
 	{ "name": "filter_V_23_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_23", "role": "we0" }} , 
 	{ "name": "filter_V_23_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_23", "role": "d0" }} , 
 	{ "name": "filter_V_22_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_22", "role": "address0" }} , 
 	{ "name": "filter_V_22_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_22", "role": "ce0" }} , 
 	{ "name": "filter_V_22_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_22", "role": "we0" }} , 
 	{ "name": "filter_V_22_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_22", "role": "d0" }} , 
 	{ "name": "filter_V_21_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_21", "role": "address0" }} , 
 	{ "name": "filter_V_21_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_21", "role": "ce0" }} , 
 	{ "name": "filter_V_21_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_21", "role": "we0" }} , 
 	{ "name": "filter_V_21_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_21", "role": "d0" }} , 
 	{ "name": "filter_V_20_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_20", "role": "address0" }} , 
 	{ "name": "filter_V_20_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_20", "role": "ce0" }} , 
 	{ "name": "filter_V_20_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_20", "role": "we0" }} , 
 	{ "name": "filter_V_20_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_20", "role": "d0" }} , 
 	{ "name": "filter_V_19_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_19", "role": "address0" }} , 
 	{ "name": "filter_V_19_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_19", "role": "ce0" }} , 
 	{ "name": "filter_V_19_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_19", "role": "we0" }} , 
 	{ "name": "filter_V_19_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_19", "role": "d0" }} , 
 	{ "name": "filter_V_18_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_18", "role": "address0" }} , 
 	{ "name": "filter_V_18_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_18", "role": "ce0" }} , 
 	{ "name": "filter_V_18_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_18", "role": "we0" }} , 
 	{ "name": "filter_V_18_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_18", "role": "d0" }} , 
 	{ "name": "filter_V_17_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_17", "role": "address0" }} , 
 	{ "name": "filter_V_17_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_17", "role": "ce0" }} , 
 	{ "name": "filter_V_17_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_17", "role": "we0" }} , 
 	{ "name": "filter_V_17_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_17", "role": "d0" }} , 
 	{ "name": "filter_V_16_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_16", "role": "address0" }} , 
 	{ "name": "filter_V_16_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_16", "role": "ce0" }} , 
 	{ "name": "filter_V_16_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_16", "role": "we0" }} , 
 	{ "name": "filter_V_16_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_16", "role": "d0" }} , 
 	{ "name": "filter_V_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_15", "role": "address0" }} , 
 	{ "name": "filter_V_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_15", "role": "ce0" }} , 
 	{ "name": "filter_V_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_15", "role": "we0" }} , 
 	{ "name": "filter_V_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_15", "role": "d0" }} , 
 	{ "name": "filter_V_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_14", "role": "address0" }} , 
 	{ "name": "filter_V_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_14", "role": "ce0" }} , 
 	{ "name": "filter_V_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_14", "role": "we0" }} , 
 	{ "name": "filter_V_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_14", "role": "d0" }} , 
 	{ "name": "filter_V_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_13", "role": "address0" }} , 
 	{ "name": "filter_V_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_13", "role": "ce0" }} , 
 	{ "name": "filter_V_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_13", "role": "we0" }} , 
 	{ "name": "filter_V_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_13", "role": "d0" }} , 
 	{ "name": "filter_V_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_12", "role": "address0" }} , 
 	{ "name": "filter_V_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_12", "role": "ce0" }} , 
 	{ "name": "filter_V_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_12", "role": "we0" }} , 
 	{ "name": "filter_V_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_12", "role": "d0" }} , 
 	{ "name": "filter_V_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_11", "role": "address0" }} , 
 	{ "name": "filter_V_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_11", "role": "ce0" }} , 
 	{ "name": "filter_V_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_11", "role": "we0" }} , 
 	{ "name": "filter_V_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_11", "role": "d0" }} , 
 	{ "name": "filter_V_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_10", "role": "address0" }} , 
 	{ "name": "filter_V_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_10", "role": "ce0" }} , 
 	{ "name": "filter_V_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_10", "role": "we0" }} , 
 	{ "name": "filter_V_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_10", "role": "d0" }} , 
 	{ "name": "filter_V_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_9", "role": "address0" }} , 
 	{ "name": "filter_V_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_9", "role": "ce0" }} , 
 	{ "name": "filter_V_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_9", "role": "we0" }} , 
 	{ "name": "filter_V_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_9", "role": "d0" }} , 
 	{ "name": "filter_V_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_8", "role": "address0" }} , 
 	{ "name": "filter_V_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_8", "role": "ce0" }} , 
 	{ "name": "filter_V_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_8", "role": "we0" }} , 
 	{ "name": "filter_V_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_8", "role": "d0" }} , 
 	{ "name": "filter_V_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_7", "role": "address0" }} , 
 	{ "name": "filter_V_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_7", "role": "ce0" }} , 
 	{ "name": "filter_V_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_7", "role": "we0" }} , 
 	{ "name": "filter_V_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_7", "role": "d0" }} , 
 	{ "name": "filter_V_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_6", "role": "address0" }} , 
 	{ "name": "filter_V_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_6", "role": "ce0" }} , 
 	{ "name": "filter_V_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_6", "role": "we0" }} , 
 	{ "name": "filter_V_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_6", "role": "d0" }} , 
 	{ "name": "filter_V_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_5", "role": "address0" }} , 
 	{ "name": "filter_V_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_5", "role": "ce0" }} , 
 	{ "name": "filter_V_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_5", "role": "we0" }} , 
 	{ "name": "filter_V_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_5", "role": "d0" }} , 
 	{ "name": "filter_V_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_4", "role": "address0" }} , 
 	{ "name": "filter_V_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_4", "role": "ce0" }} , 
 	{ "name": "filter_V_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_4", "role": "we0" }} , 
 	{ "name": "filter_V_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_4", "role": "d0" }} , 
 	{ "name": "filter_V_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "filter_V_1", "role": "address0" }} , 
 	{ "name": "filter_V_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_1", "role": "ce0" }} , 
 	{ "name": "filter_V_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_1", "role": "we0" }} , 
 	{ "name": "filter_V_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter_V_1", "role": "d0" }} , 
 	{ "name": "strm_in_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "strm_in_V_data_V", "role": "default" }} , 
 	{ "name": "strm_in_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "strm_in_V_last_V", "role": "default" }} , 
 	{ "name": "strm_in_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "strm_in_V_keep_V", "role": "default" }} , 
 	{ "name": "strm_in_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "strm_in_V_strb_V", "role": "default" }} , 
 	{ "name": "strm_in_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "strm_in_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "conv_w2_Pipeline_ReadWeightStreamsLOOP",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln190", "Type" : "None", "Direction" : "I"},
			{"Name" : "totalWeightStreams", "Type" : "None", "Direction" : "I"},
			{"Name" : "streamsPerFilter", "Type" : "None", "Direction" : "I"},
			{"Name" : "filter_V_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_63", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_62", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_61", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_60", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_59", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_58", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_57", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_56", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_55", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_54", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_53", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_52", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_51", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_50", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_49", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_48", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_47", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_46", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_45", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_44", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_43", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_42", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_41", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_40", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_39", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_38", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_37", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_36", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_35", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_34", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_33", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_32", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_31", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_30", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_29", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_28", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_27", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_26", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_25", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_24", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_23", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_22", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_21", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_20", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_19", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_18", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_17", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_16", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "strm_in_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "strm_in",
				"BlockSignal" : [
					{"Name" : "strm_in_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "strm_in_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "strm_in"},
			{"Name" : "strm_in_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "strm_in"},
			{"Name" : "strm_in_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "strm_in"}],
		"Loop" : [
			{"Name" : "ReadWeightStreamsLOOP", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter1", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	conv_w2_Pipeline_ReadWeightStreamsLOOP {
		sext_ln190 {Type I LastRead 0 FirstWrite -1}
		totalWeightStreams {Type I LastRead 0 FirstWrite -1}
		streamsPerFilter {Type I LastRead 0 FirstWrite -1}
		filter_V_2 {Type O LastRead -1 FirstWrite 1}
		filter_V_3 {Type O LastRead -1 FirstWrite 1}
		filter_V {Type O LastRead -1 FirstWrite 1}
		filter_V_63 {Type O LastRead -1 FirstWrite 1}
		filter_V_62 {Type O LastRead -1 FirstWrite 1}
		filter_V_61 {Type O LastRead -1 FirstWrite 1}
		filter_V_60 {Type O LastRead -1 FirstWrite 1}
		filter_V_59 {Type O LastRead -1 FirstWrite 1}
		filter_V_58 {Type O LastRead -1 FirstWrite 1}
		filter_V_57 {Type O LastRead -1 FirstWrite 1}
		filter_V_56 {Type O LastRead -1 FirstWrite 1}
		filter_V_55 {Type O LastRead -1 FirstWrite 1}
		filter_V_54 {Type O LastRead -1 FirstWrite 1}
		filter_V_53 {Type O LastRead -1 FirstWrite 1}
		filter_V_52 {Type O LastRead -1 FirstWrite 1}
		filter_V_51 {Type O LastRead -1 FirstWrite 1}
		filter_V_50 {Type O LastRead -1 FirstWrite 1}
		filter_V_49 {Type O LastRead -1 FirstWrite 1}
		filter_V_48 {Type O LastRead -1 FirstWrite 1}
		filter_V_47 {Type O LastRead -1 FirstWrite 1}
		filter_V_46 {Type O LastRead -1 FirstWrite 1}
		filter_V_45 {Type O LastRead -1 FirstWrite 1}
		filter_V_44 {Type O LastRead -1 FirstWrite 1}
		filter_V_43 {Type O LastRead -1 FirstWrite 1}
		filter_V_42 {Type O LastRead -1 FirstWrite 1}
		filter_V_41 {Type O LastRead -1 FirstWrite 1}
		filter_V_40 {Type O LastRead -1 FirstWrite 1}
		filter_V_39 {Type O LastRead -1 FirstWrite 1}
		filter_V_38 {Type O LastRead -1 FirstWrite 1}
		filter_V_37 {Type O LastRead -1 FirstWrite 1}
		filter_V_36 {Type O LastRead -1 FirstWrite 1}
		filter_V_35 {Type O LastRead -1 FirstWrite 1}
		filter_V_34 {Type O LastRead -1 FirstWrite 1}
		filter_V_33 {Type O LastRead -1 FirstWrite 1}
		filter_V_32 {Type O LastRead -1 FirstWrite 1}
		filter_V_31 {Type O LastRead -1 FirstWrite 1}
		filter_V_30 {Type O LastRead -1 FirstWrite 1}
		filter_V_29 {Type O LastRead -1 FirstWrite 1}
		filter_V_28 {Type O LastRead -1 FirstWrite 1}
		filter_V_27 {Type O LastRead -1 FirstWrite 1}
		filter_V_26 {Type O LastRead -1 FirstWrite 1}
		filter_V_25 {Type O LastRead -1 FirstWrite 1}
		filter_V_24 {Type O LastRead -1 FirstWrite 1}
		filter_V_23 {Type O LastRead -1 FirstWrite 1}
		filter_V_22 {Type O LastRead -1 FirstWrite 1}
		filter_V_21 {Type O LastRead -1 FirstWrite 1}
		filter_V_20 {Type O LastRead -1 FirstWrite 1}
		filter_V_19 {Type O LastRead -1 FirstWrite 1}
		filter_V_18 {Type O LastRead -1 FirstWrite 1}
		filter_V_17 {Type O LastRead -1 FirstWrite 1}
		filter_V_16 {Type O LastRead -1 FirstWrite 1}
		filter_V_15 {Type O LastRead -1 FirstWrite 1}
		filter_V_14 {Type O LastRead -1 FirstWrite 1}
		filter_V_13 {Type O LastRead -1 FirstWrite 1}
		filter_V_12 {Type O LastRead -1 FirstWrite 1}
		filter_V_11 {Type O LastRead -1 FirstWrite 1}
		filter_V_10 {Type O LastRead -1 FirstWrite 1}
		filter_V_9 {Type O LastRead -1 FirstWrite 1}
		filter_V_8 {Type O LastRead -1 FirstWrite 1}
		filter_V_7 {Type O LastRead -1 FirstWrite 1}
		filter_V_6 {Type O LastRead -1 FirstWrite 1}
		filter_V_5 {Type O LastRead -1 FirstWrite 1}
		filter_V_4 {Type O LastRead -1 FirstWrite 1}
		filter_V_1 {Type O LastRead -1 FirstWrite 1}
		strm_in_V_data_V {Type I LastRead 1 FirstWrite -1}
		strm_in_V_keep_V {Type I LastRead 1 FirstWrite -1}
		strm_in_V_strb_V {Type I LastRead 1 FirstWrite -1}
		strm_in_V_last_V {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sext_ln190 { ap_none {  { sext_ln190 in_data 0 30 } } }
	totalWeightStreams { ap_none {  { totalWeightStreams in_data 0 32 } } }
	streamsPerFilter { ap_none {  { streamsPerFilter in_data 0 32 } } }
	filter_V_2 { ap_memory {  { filter_V_2_address0 mem_address 1 12 }  { filter_V_2_ce0 mem_ce 1 1 }  { filter_V_2_we0 mem_we 1 1 }  { filter_V_2_d0 mem_din 1 32 } } }
	filter_V_3 { ap_memory {  { filter_V_3_address0 mem_address 1 12 }  { filter_V_3_ce0 mem_ce 1 1 }  { filter_V_3_we0 mem_we 1 1 }  { filter_V_3_d0 mem_din 1 32 } } }
	filter_V { ap_memory {  { filter_V_address0 mem_address 1 12 }  { filter_V_ce0 mem_ce 1 1 }  { filter_V_we0 mem_we 1 1 }  { filter_V_d0 mem_din 1 32 } } }
	filter_V_63 { ap_memory {  { filter_V_63_address0 mem_address 1 12 }  { filter_V_63_ce0 mem_ce 1 1 }  { filter_V_63_we0 mem_we 1 1 }  { filter_V_63_d0 mem_din 1 32 } } }
	filter_V_62 { ap_memory {  { filter_V_62_address0 mem_address 1 12 }  { filter_V_62_ce0 mem_ce 1 1 }  { filter_V_62_we0 mem_we 1 1 }  { filter_V_62_d0 mem_din 1 32 } } }
	filter_V_61 { ap_memory {  { filter_V_61_address0 mem_address 1 12 }  { filter_V_61_ce0 mem_ce 1 1 }  { filter_V_61_we0 mem_we 1 1 }  { filter_V_61_d0 mem_din 1 32 } } }
	filter_V_60 { ap_memory {  { filter_V_60_address0 mem_address 1 12 }  { filter_V_60_ce0 mem_ce 1 1 }  { filter_V_60_we0 mem_we 1 1 }  { filter_V_60_d0 mem_din 1 32 } } }
	filter_V_59 { ap_memory {  { filter_V_59_address0 mem_address 1 12 }  { filter_V_59_ce0 mem_ce 1 1 }  { filter_V_59_we0 mem_we 1 1 }  { filter_V_59_d0 mem_din 1 32 } } }
	filter_V_58 { ap_memory {  { filter_V_58_address0 mem_address 1 12 }  { filter_V_58_ce0 mem_ce 1 1 }  { filter_V_58_we0 mem_we 1 1 }  { filter_V_58_d0 mem_din 1 32 } } }
	filter_V_57 { ap_memory {  { filter_V_57_address0 mem_address 1 12 }  { filter_V_57_ce0 mem_ce 1 1 }  { filter_V_57_we0 mem_we 1 1 }  { filter_V_57_d0 mem_din 1 32 } } }
	filter_V_56 { ap_memory {  { filter_V_56_address0 mem_address 1 12 }  { filter_V_56_ce0 mem_ce 1 1 }  { filter_V_56_we0 mem_we 1 1 }  { filter_V_56_d0 mem_din 1 32 } } }
	filter_V_55 { ap_memory {  { filter_V_55_address0 mem_address 1 12 }  { filter_V_55_ce0 mem_ce 1 1 }  { filter_V_55_we0 mem_we 1 1 }  { filter_V_55_d0 mem_din 1 32 } } }
	filter_V_54 { ap_memory {  { filter_V_54_address0 mem_address 1 12 }  { filter_V_54_ce0 mem_ce 1 1 }  { filter_V_54_we0 mem_we 1 1 }  { filter_V_54_d0 mem_din 1 32 } } }
	filter_V_53 { ap_memory {  { filter_V_53_address0 mem_address 1 12 }  { filter_V_53_ce0 mem_ce 1 1 }  { filter_V_53_we0 mem_we 1 1 }  { filter_V_53_d0 mem_din 1 32 } } }
	filter_V_52 { ap_memory {  { filter_V_52_address0 mem_address 1 12 }  { filter_V_52_ce0 mem_ce 1 1 }  { filter_V_52_we0 mem_we 1 1 }  { filter_V_52_d0 mem_din 1 32 } } }
	filter_V_51 { ap_memory {  { filter_V_51_address0 mem_address 1 12 }  { filter_V_51_ce0 mem_ce 1 1 }  { filter_V_51_we0 mem_we 1 1 }  { filter_V_51_d0 mem_din 1 32 } } }
	filter_V_50 { ap_memory {  { filter_V_50_address0 mem_address 1 12 }  { filter_V_50_ce0 mem_ce 1 1 }  { filter_V_50_we0 mem_we 1 1 }  { filter_V_50_d0 mem_din 1 32 } } }
	filter_V_49 { ap_memory {  { filter_V_49_address0 mem_address 1 12 }  { filter_V_49_ce0 mem_ce 1 1 }  { filter_V_49_we0 mem_we 1 1 }  { filter_V_49_d0 mem_din 1 32 } } }
	filter_V_48 { ap_memory {  { filter_V_48_address0 mem_address 1 12 }  { filter_V_48_ce0 mem_ce 1 1 }  { filter_V_48_we0 mem_we 1 1 }  { filter_V_48_d0 mem_din 1 32 } } }
	filter_V_47 { ap_memory {  { filter_V_47_address0 mem_address 1 12 }  { filter_V_47_ce0 mem_ce 1 1 }  { filter_V_47_we0 mem_we 1 1 }  { filter_V_47_d0 mem_din 1 32 } } }
	filter_V_46 { ap_memory {  { filter_V_46_address0 mem_address 1 12 }  { filter_V_46_ce0 mem_ce 1 1 }  { filter_V_46_we0 mem_we 1 1 }  { filter_V_46_d0 mem_din 1 32 } } }
	filter_V_45 { ap_memory {  { filter_V_45_address0 mem_address 1 12 }  { filter_V_45_ce0 mem_ce 1 1 }  { filter_V_45_we0 mem_we 1 1 }  { filter_V_45_d0 mem_din 1 32 } } }
	filter_V_44 { ap_memory {  { filter_V_44_address0 mem_address 1 12 }  { filter_V_44_ce0 mem_ce 1 1 }  { filter_V_44_we0 mem_we 1 1 }  { filter_V_44_d0 mem_din 1 32 } } }
	filter_V_43 { ap_memory {  { filter_V_43_address0 mem_address 1 12 }  { filter_V_43_ce0 mem_ce 1 1 }  { filter_V_43_we0 mem_we 1 1 }  { filter_V_43_d0 mem_din 1 32 } } }
	filter_V_42 { ap_memory {  { filter_V_42_address0 mem_address 1 12 }  { filter_V_42_ce0 mem_ce 1 1 }  { filter_V_42_we0 mem_we 1 1 }  { filter_V_42_d0 mem_din 1 32 } } }
	filter_V_41 { ap_memory {  { filter_V_41_address0 mem_address 1 12 }  { filter_V_41_ce0 mem_ce 1 1 }  { filter_V_41_we0 mem_we 1 1 }  { filter_V_41_d0 mem_din 1 32 } } }
	filter_V_40 { ap_memory {  { filter_V_40_address0 mem_address 1 12 }  { filter_V_40_ce0 mem_ce 1 1 }  { filter_V_40_we0 mem_we 1 1 }  { filter_V_40_d0 mem_din 1 32 } } }
	filter_V_39 { ap_memory {  { filter_V_39_address0 mem_address 1 12 }  { filter_V_39_ce0 mem_ce 1 1 }  { filter_V_39_we0 mem_we 1 1 }  { filter_V_39_d0 mem_din 1 32 } } }
	filter_V_38 { ap_memory {  { filter_V_38_address0 mem_address 1 12 }  { filter_V_38_ce0 mem_ce 1 1 }  { filter_V_38_we0 mem_we 1 1 }  { filter_V_38_d0 mem_din 1 32 } } }
	filter_V_37 { ap_memory {  { filter_V_37_address0 mem_address 1 12 }  { filter_V_37_ce0 mem_ce 1 1 }  { filter_V_37_we0 mem_we 1 1 }  { filter_V_37_d0 mem_din 1 32 } } }
	filter_V_36 { ap_memory {  { filter_V_36_address0 mem_address 1 12 }  { filter_V_36_ce0 mem_ce 1 1 }  { filter_V_36_we0 mem_we 1 1 }  { filter_V_36_d0 mem_din 1 32 } } }
	filter_V_35 { ap_memory {  { filter_V_35_address0 mem_address 1 12 }  { filter_V_35_ce0 mem_ce 1 1 }  { filter_V_35_we0 mem_we 1 1 }  { filter_V_35_d0 mem_din 1 32 } } }
	filter_V_34 { ap_memory {  { filter_V_34_address0 mem_address 1 12 }  { filter_V_34_ce0 mem_ce 1 1 }  { filter_V_34_we0 mem_we 1 1 }  { filter_V_34_d0 mem_din 1 32 } } }
	filter_V_33 { ap_memory {  { filter_V_33_address0 mem_address 1 12 }  { filter_V_33_ce0 mem_ce 1 1 }  { filter_V_33_we0 mem_we 1 1 }  { filter_V_33_d0 mem_din 1 32 } } }
	filter_V_32 { ap_memory {  { filter_V_32_address0 mem_address 1 12 }  { filter_V_32_ce0 mem_ce 1 1 }  { filter_V_32_we0 mem_we 1 1 }  { filter_V_32_d0 mem_din 1 32 } } }
	filter_V_31 { ap_memory {  { filter_V_31_address0 mem_address 1 12 }  { filter_V_31_ce0 mem_ce 1 1 }  { filter_V_31_we0 mem_we 1 1 }  { filter_V_31_d0 mem_din 1 32 } } }
	filter_V_30 { ap_memory {  { filter_V_30_address0 mem_address 1 12 }  { filter_V_30_ce0 mem_ce 1 1 }  { filter_V_30_we0 mem_we 1 1 }  { filter_V_30_d0 mem_din 1 32 } } }
	filter_V_29 { ap_memory {  { filter_V_29_address0 mem_address 1 12 }  { filter_V_29_ce0 mem_ce 1 1 }  { filter_V_29_we0 mem_we 1 1 }  { filter_V_29_d0 mem_din 1 32 } } }
	filter_V_28 { ap_memory {  { filter_V_28_address0 mem_address 1 12 }  { filter_V_28_ce0 mem_ce 1 1 }  { filter_V_28_we0 mem_we 1 1 }  { filter_V_28_d0 mem_din 1 32 } } }
	filter_V_27 { ap_memory {  { filter_V_27_address0 mem_address 1 12 }  { filter_V_27_ce0 mem_ce 1 1 }  { filter_V_27_we0 mem_we 1 1 }  { filter_V_27_d0 mem_din 1 32 } } }
	filter_V_26 { ap_memory {  { filter_V_26_address0 mem_address 1 12 }  { filter_V_26_ce0 mem_ce 1 1 }  { filter_V_26_we0 mem_we 1 1 }  { filter_V_26_d0 mem_din 1 32 } } }
	filter_V_25 { ap_memory {  { filter_V_25_address0 mem_address 1 12 }  { filter_V_25_ce0 mem_ce 1 1 }  { filter_V_25_we0 mem_we 1 1 }  { filter_V_25_d0 mem_din 1 32 } } }
	filter_V_24 { ap_memory {  { filter_V_24_address0 mem_address 1 12 }  { filter_V_24_ce0 mem_ce 1 1 }  { filter_V_24_we0 mem_we 1 1 }  { filter_V_24_d0 mem_din 1 32 } } }
	filter_V_23 { ap_memory {  { filter_V_23_address0 mem_address 1 12 }  { filter_V_23_ce0 mem_ce 1 1 }  { filter_V_23_we0 mem_we 1 1 }  { filter_V_23_d0 mem_din 1 32 } } }
	filter_V_22 { ap_memory {  { filter_V_22_address0 mem_address 1 12 }  { filter_V_22_ce0 mem_ce 1 1 }  { filter_V_22_we0 mem_we 1 1 }  { filter_V_22_d0 mem_din 1 32 } } }
	filter_V_21 { ap_memory {  { filter_V_21_address0 mem_address 1 12 }  { filter_V_21_ce0 mem_ce 1 1 }  { filter_V_21_we0 mem_we 1 1 }  { filter_V_21_d0 mem_din 1 32 } } }
	filter_V_20 { ap_memory {  { filter_V_20_address0 mem_address 1 12 }  { filter_V_20_ce0 mem_ce 1 1 }  { filter_V_20_we0 mem_we 1 1 }  { filter_V_20_d0 mem_din 1 32 } } }
	filter_V_19 { ap_memory {  { filter_V_19_address0 mem_address 1 12 }  { filter_V_19_ce0 mem_ce 1 1 }  { filter_V_19_we0 mem_we 1 1 }  { filter_V_19_d0 mem_din 1 32 } } }
	filter_V_18 { ap_memory {  { filter_V_18_address0 mem_address 1 12 }  { filter_V_18_ce0 mem_ce 1 1 }  { filter_V_18_we0 mem_we 1 1 }  { filter_V_18_d0 mem_din 1 32 } } }
	filter_V_17 { ap_memory {  { filter_V_17_address0 mem_address 1 12 }  { filter_V_17_ce0 mem_ce 1 1 }  { filter_V_17_we0 mem_we 1 1 }  { filter_V_17_d0 mem_din 1 32 } } }
	filter_V_16 { ap_memory {  { filter_V_16_address0 mem_address 1 12 }  { filter_V_16_ce0 mem_ce 1 1 }  { filter_V_16_we0 mem_we 1 1 }  { filter_V_16_d0 mem_din 1 32 } } }
	filter_V_15 { ap_memory {  { filter_V_15_address0 mem_address 1 12 }  { filter_V_15_ce0 mem_ce 1 1 }  { filter_V_15_we0 mem_we 1 1 }  { filter_V_15_d0 mem_din 1 32 } } }
	filter_V_14 { ap_memory {  { filter_V_14_address0 mem_address 1 12 }  { filter_V_14_ce0 mem_ce 1 1 }  { filter_V_14_we0 mem_we 1 1 }  { filter_V_14_d0 mem_din 1 32 } } }
	filter_V_13 { ap_memory {  { filter_V_13_address0 mem_address 1 12 }  { filter_V_13_ce0 mem_ce 1 1 }  { filter_V_13_we0 mem_we 1 1 }  { filter_V_13_d0 mem_din 1 32 } } }
	filter_V_12 { ap_memory {  { filter_V_12_address0 mem_address 1 12 }  { filter_V_12_ce0 mem_ce 1 1 }  { filter_V_12_we0 mem_we 1 1 }  { filter_V_12_d0 mem_din 1 32 } } }
	filter_V_11 { ap_memory {  { filter_V_11_address0 mem_address 1 12 }  { filter_V_11_ce0 mem_ce 1 1 }  { filter_V_11_we0 mem_we 1 1 }  { filter_V_11_d0 mem_din 1 32 } } }
	filter_V_10 { ap_memory {  { filter_V_10_address0 mem_address 1 12 }  { filter_V_10_ce0 mem_ce 1 1 }  { filter_V_10_we0 mem_we 1 1 }  { filter_V_10_d0 mem_din 1 32 } } }
	filter_V_9 { ap_memory {  { filter_V_9_address0 mem_address 1 12 }  { filter_V_9_ce0 mem_ce 1 1 }  { filter_V_9_we0 mem_we 1 1 }  { filter_V_9_d0 mem_din 1 32 } } }
	filter_V_8 { ap_memory {  { filter_V_8_address0 mem_address 1 12 }  { filter_V_8_ce0 mem_ce 1 1 }  { filter_V_8_we0 mem_we 1 1 }  { filter_V_8_d0 mem_din 1 32 } } }
	filter_V_7 { ap_memory {  { filter_V_7_address0 mem_address 1 12 }  { filter_V_7_ce0 mem_ce 1 1 }  { filter_V_7_we0 mem_we 1 1 }  { filter_V_7_d0 mem_din 1 32 } } }
	filter_V_6 { ap_memory {  { filter_V_6_address0 mem_address 1 12 }  { filter_V_6_ce0 mem_ce 1 1 }  { filter_V_6_we0 mem_we 1 1 }  { filter_V_6_d0 mem_din 1 32 } } }
	filter_V_5 { ap_memory {  { filter_V_5_address0 mem_address 1 12 }  { filter_V_5_ce0 mem_ce 1 1 }  { filter_V_5_we0 mem_we 1 1 }  { filter_V_5_d0 mem_din 1 32 } } }
	filter_V_4 { ap_memory {  { filter_V_4_address0 mem_address 1 12 }  { filter_V_4_ce0 mem_ce 1 1 }  { filter_V_4_we0 mem_we 1 1 }  { filter_V_4_d0 mem_din 1 32 } } }
	filter_V_1 { ap_memory {  { filter_V_1_address0 mem_address 1 12 }  { filter_V_1_ce0 mem_ce 1 1 }  { filter_V_1_we0 mem_we 1 1 }  { filter_V_1_d0 mem_din 1 32 } } }
	strm_in_V_data_V { axis {  { strm_in_TVALID in_vld 0 1 }  { strm_in_TDATA in_data 0 128 } } }
	strm_in_V_keep_V { axis {  { strm_in_TKEEP in_data 0 16 } } }
	strm_in_V_strb_V { axis {  { strm_in_TSTRB in_data 0 16 } } }
	strm_in_V_last_V { axis {  { strm_in_TREADY in_acc 1 1 }  { strm_in_TLAST in_data 0 1 } } }
}
