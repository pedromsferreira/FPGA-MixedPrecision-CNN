set moduleName conv_Pipeline_ReadWeightStreamsLOOP
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
set C_modelName {conv_Pipeline_ReadWeightStreamsLOOP}
set C_modelType { void 0 }
set C_modelArgList {
	{ sext_ln190 int 30 regular  }
	{ totalWeightStreams int 32 regular  }
	{ streamsPerFilter int 32 regular  }
	{ filter_V int 64 regular {array 576 { 0 0 } 0 1 }  }
	{ filter_V_15 int 64 regular {array 576 { 0 0 } 0 1 }  }
	{ filter_V_14 int 64 regular {array 576 { 0 0 } 0 1 }  }
	{ filter_V_13 int 64 regular {array 576 { 0 0 } 0 1 }  }
	{ filter_V_12 int 64 regular {array 576 { 0 0 } 0 1 }  }
	{ filter_V_11 int 64 regular {array 576 { 0 0 } 0 1 }  }
	{ filter_V_10 int 64 regular {array 576 { 0 0 } 0 1 }  }
	{ filter_V_9 int 64 regular {array 576 { 0 0 } 0 1 }  }
	{ filter_V_8 int 64 regular {array 576 { 0 0 } 0 1 }  }
	{ filter_V_7 int 64 regular {array 576 { 0 0 } 0 1 }  }
	{ filter_V_6 int 64 regular {array 576 { 0 0 } 0 1 }  }
	{ filter_V_5 int 64 regular {array 576 { 0 0 } 0 1 }  }
	{ filter_V_4 int 64 regular {array 576 { 0 0 } 0 1 }  }
	{ filter_V_3 int 64 regular {array 576 { 0 0 } 0 1 }  }
	{ filter_V_2 int 64 regular {array 576 { 0 0 } 0 1 }  }
	{ filter_V_1 int 64 regular {array 576 { 0 0 } 0 1 }  }
	{ strm_in_V_data_V int 128 regular {axi_s 0 volatile  { strm_in Data } }  }
	{ strm_in_V_keep_V int 16 regular {axi_s 0 volatile  { strm_in Keep } }  }
	{ strm_in_V_strb_V int 16 regular {axi_s 0 volatile  { strm_in Strb } }  }
	{ strm_in_V_last_V int 1 regular {axi_s 0 volatile  { strm_in Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "sext_ln190", "interface" : "wire", "bitwidth" : 30, "direction" : "READONLY"} , 
 	{ "Name" : "totalWeightStreams", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "streamsPerFilter", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter_V", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_15", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_14", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_13", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_12", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_11", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_10", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_9", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_8", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_7", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_6", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_5", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_4", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_3", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_2", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "filter_V_1", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "strm_in_V_data_V", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "strm_in_V_keep_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "strm_in_V_strb_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "strm_in_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 143
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ strm_in_TVALID sc_in sc_logic 1 invld 19 } 
	{ sext_ln190 sc_in sc_lv 30 signal 0 } 
	{ totalWeightStreams sc_in sc_lv 32 signal 1 } 
	{ streamsPerFilter sc_in sc_lv 32 signal 2 } 
	{ filter_V_address0 sc_out sc_lv 10 signal 3 } 
	{ filter_V_ce0 sc_out sc_logic 1 signal 3 } 
	{ filter_V_we0 sc_out sc_logic 1 signal 3 } 
	{ filter_V_d0 sc_out sc_lv 64 signal 3 } 
	{ filter_V_address1 sc_out sc_lv 10 signal 3 } 
	{ filter_V_ce1 sc_out sc_logic 1 signal 3 } 
	{ filter_V_we1 sc_out sc_logic 1 signal 3 } 
	{ filter_V_d1 sc_out sc_lv 64 signal 3 } 
	{ filter_V_15_address0 sc_out sc_lv 10 signal 4 } 
	{ filter_V_15_ce0 sc_out sc_logic 1 signal 4 } 
	{ filter_V_15_we0 sc_out sc_logic 1 signal 4 } 
	{ filter_V_15_d0 sc_out sc_lv 64 signal 4 } 
	{ filter_V_15_address1 sc_out sc_lv 10 signal 4 } 
	{ filter_V_15_ce1 sc_out sc_logic 1 signal 4 } 
	{ filter_V_15_we1 sc_out sc_logic 1 signal 4 } 
	{ filter_V_15_d1 sc_out sc_lv 64 signal 4 } 
	{ filter_V_14_address0 sc_out sc_lv 10 signal 5 } 
	{ filter_V_14_ce0 sc_out sc_logic 1 signal 5 } 
	{ filter_V_14_we0 sc_out sc_logic 1 signal 5 } 
	{ filter_V_14_d0 sc_out sc_lv 64 signal 5 } 
	{ filter_V_14_address1 sc_out sc_lv 10 signal 5 } 
	{ filter_V_14_ce1 sc_out sc_logic 1 signal 5 } 
	{ filter_V_14_we1 sc_out sc_logic 1 signal 5 } 
	{ filter_V_14_d1 sc_out sc_lv 64 signal 5 } 
	{ filter_V_13_address0 sc_out sc_lv 10 signal 6 } 
	{ filter_V_13_ce0 sc_out sc_logic 1 signal 6 } 
	{ filter_V_13_we0 sc_out sc_logic 1 signal 6 } 
	{ filter_V_13_d0 sc_out sc_lv 64 signal 6 } 
	{ filter_V_13_address1 sc_out sc_lv 10 signal 6 } 
	{ filter_V_13_ce1 sc_out sc_logic 1 signal 6 } 
	{ filter_V_13_we1 sc_out sc_logic 1 signal 6 } 
	{ filter_V_13_d1 sc_out sc_lv 64 signal 6 } 
	{ filter_V_12_address0 sc_out sc_lv 10 signal 7 } 
	{ filter_V_12_ce0 sc_out sc_logic 1 signal 7 } 
	{ filter_V_12_we0 sc_out sc_logic 1 signal 7 } 
	{ filter_V_12_d0 sc_out sc_lv 64 signal 7 } 
	{ filter_V_12_address1 sc_out sc_lv 10 signal 7 } 
	{ filter_V_12_ce1 sc_out sc_logic 1 signal 7 } 
	{ filter_V_12_we1 sc_out sc_logic 1 signal 7 } 
	{ filter_V_12_d1 sc_out sc_lv 64 signal 7 } 
	{ filter_V_11_address0 sc_out sc_lv 10 signal 8 } 
	{ filter_V_11_ce0 sc_out sc_logic 1 signal 8 } 
	{ filter_V_11_we0 sc_out sc_logic 1 signal 8 } 
	{ filter_V_11_d0 sc_out sc_lv 64 signal 8 } 
	{ filter_V_11_address1 sc_out sc_lv 10 signal 8 } 
	{ filter_V_11_ce1 sc_out sc_logic 1 signal 8 } 
	{ filter_V_11_we1 sc_out sc_logic 1 signal 8 } 
	{ filter_V_11_d1 sc_out sc_lv 64 signal 8 } 
	{ filter_V_10_address0 sc_out sc_lv 10 signal 9 } 
	{ filter_V_10_ce0 sc_out sc_logic 1 signal 9 } 
	{ filter_V_10_we0 sc_out sc_logic 1 signal 9 } 
	{ filter_V_10_d0 sc_out sc_lv 64 signal 9 } 
	{ filter_V_10_address1 sc_out sc_lv 10 signal 9 } 
	{ filter_V_10_ce1 sc_out sc_logic 1 signal 9 } 
	{ filter_V_10_we1 sc_out sc_logic 1 signal 9 } 
	{ filter_V_10_d1 sc_out sc_lv 64 signal 9 } 
	{ filter_V_9_address0 sc_out sc_lv 10 signal 10 } 
	{ filter_V_9_ce0 sc_out sc_logic 1 signal 10 } 
	{ filter_V_9_we0 sc_out sc_logic 1 signal 10 } 
	{ filter_V_9_d0 sc_out sc_lv 64 signal 10 } 
	{ filter_V_9_address1 sc_out sc_lv 10 signal 10 } 
	{ filter_V_9_ce1 sc_out sc_logic 1 signal 10 } 
	{ filter_V_9_we1 sc_out sc_logic 1 signal 10 } 
	{ filter_V_9_d1 sc_out sc_lv 64 signal 10 } 
	{ filter_V_8_address0 sc_out sc_lv 10 signal 11 } 
	{ filter_V_8_ce0 sc_out sc_logic 1 signal 11 } 
	{ filter_V_8_we0 sc_out sc_logic 1 signal 11 } 
	{ filter_V_8_d0 sc_out sc_lv 64 signal 11 } 
	{ filter_V_8_address1 sc_out sc_lv 10 signal 11 } 
	{ filter_V_8_ce1 sc_out sc_logic 1 signal 11 } 
	{ filter_V_8_we1 sc_out sc_logic 1 signal 11 } 
	{ filter_V_8_d1 sc_out sc_lv 64 signal 11 } 
	{ filter_V_7_address0 sc_out sc_lv 10 signal 12 } 
	{ filter_V_7_ce0 sc_out sc_logic 1 signal 12 } 
	{ filter_V_7_we0 sc_out sc_logic 1 signal 12 } 
	{ filter_V_7_d0 sc_out sc_lv 64 signal 12 } 
	{ filter_V_7_address1 sc_out sc_lv 10 signal 12 } 
	{ filter_V_7_ce1 sc_out sc_logic 1 signal 12 } 
	{ filter_V_7_we1 sc_out sc_logic 1 signal 12 } 
	{ filter_V_7_d1 sc_out sc_lv 64 signal 12 } 
	{ filter_V_6_address0 sc_out sc_lv 10 signal 13 } 
	{ filter_V_6_ce0 sc_out sc_logic 1 signal 13 } 
	{ filter_V_6_we0 sc_out sc_logic 1 signal 13 } 
	{ filter_V_6_d0 sc_out sc_lv 64 signal 13 } 
	{ filter_V_6_address1 sc_out sc_lv 10 signal 13 } 
	{ filter_V_6_ce1 sc_out sc_logic 1 signal 13 } 
	{ filter_V_6_we1 sc_out sc_logic 1 signal 13 } 
	{ filter_V_6_d1 sc_out sc_lv 64 signal 13 } 
	{ filter_V_5_address0 sc_out sc_lv 10 signal 14 } 
	{ filter_V_5_ce0 sc_out sc_logic 1 signal 14 } 
	{ filter_V_5_we0 sc_out sc_logic 1 signal 14 } 
	{ filter_V_5_d0 sc_out sc_lv 64 signal 14 } 
	{ filter_V_5_address1 sc_out sc_lv 10 signal 14 } 
	{ filter_V_5_ce1 sc_out sc_logic 1 signal 14 } 
	{ filter_V_5_we1 sc_out sc_logic 1 signal 14 } 
	{ filter_V_5_d1 sc_out sc_lv 64 signal 14 } 
	{ filter_V_4_address0 sc_out sc_lv 10 signal 15 } 
	{ filter_V_4_ce0 sc_out sc_logic 1 signal 15 } 
	{ filter_V_4_we0 sc_out sc_logic 1 signal 15 } 
	{ filter_V_4_d0 sc_out sc_lv 64 signal 15 } 
	{ filter_V_4_address1 sc_out sc_lv 10 signal 15 } 
	{ filter_V_4_ce1 sc_out sc_logic 1 signal 15 } 
	{ filter_V_4_we1 sc_out sc_logic 1 signal 15 } 
	{ filter_V_4_d1 sc_out sc_lv 64 signal 15 } 
	{ filter_V_3_address0 sc_out sc_lv 10 signal 16 } 
	{ filter_V_3_ce0 sc_out sc_logic 1 signal 16 } 
	{ filter_V_3_we0 sc_out sc_logic 1 signal 16 } 
	{ filter_V_3_d0 sc_out sc_lv 64 signal 16 } 
	{ filter_V_3_address1 sc_out sc_lv 10 signal 16 } 
	{ filter_V_3_ce1 sc_out sc_logic 1 signal 16 } 
	{ filter_V_3_we1 sc_out sc_logic 1 signal 16 } 
	{ filter_V_3_d1 sc_out sc_lv 64 signal 16 } 
	{ filter_V_2_address0 sc_out sc_lv 10 signal 17 } 
	{ filter_V_2_ce0 sc_out sc_logic 1 signal 17 } 
	{ filter_V_2_we0 sc_out sc_logic 1 signal 17 } 
	{ filter_V_2_d0 sc_out sc_lv 64 signal 17 } 
	{ filter_V_2_address1 sc_out sc_lv 10 signal 17 } 
	{ filter_V_2_ce1 sc_out sc_logic 1 signal 17 } 
	{ filter_V_2_we1 sc_out sc_logic 1 signal 17 } 
	{ filter_V_2_d1 sc_out sc_lv 64 signal 17 } 
	{ filter_V_1_address0 sc_out sc_lv 10 signal 18 } 
	{ filter_V_1_ce0 sc_out sc_logic 1 signal 18 } 
	{ filter_V_1_we0 sc_out sc_logic 1 signal 18 } 
	{ filter_V_1_d0 sc_out sc_lv 64 signal 18 } 
	{ filter_V_1_address1 sc_out sc_lv 10 signal 18 } 
	{ filter_V_1_ce1 sc_out sc_logic 1 signal 18 } 
	{ filter_V_1_we1 sc_out sc_logic 1 signal 18 } 
	{ filter_V_1_d1 sc_out sc_lv 64 signal 18 } 
	{ strm_in_TDATA sc_in sc_lv 128 signal 19 } 
	{ strm_in_TREADY sc_out sc_logic 1 inacc 22 } 
	{ strm_in_TKEEP sc_in sc_lv 16 signal 20 } 
	{ strm_in_TSTRB sc_in sc_lv 16 signal 21 } 
	{ strm_in_TLAST sc_in sc_lv 1 signal 22 } 
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
 	{ "name": "filter_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V", "role": "address0" }} , 
 	{ "name": "filter_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V", "role": "ce0" }} , 
 	{ "name": "filter_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V", "role": "we0" }} , 
 	{ "name": "filter_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V", "role": "d0" }} , 
 	{ "name": "filter_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V", "role": "address1" }} , 
 	{ "name": "filter_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V", "role": "ce1" }} , 
 	{ "name": "filter_V_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V", "role": "we1" }} , 
 	{ "name": "filter_V_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V", "role": "d1" }} , 
 	{ "name": "filter_V_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_15", "role": "address0" }} , 
 	{ "name": "filter_V_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_15", "role": "ce0" }} , 
 	{ "name": "filter_V_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_15", "role": "we0" }} , 
 	{ "name": "filter_V_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_15", "role": "d0" }} , 
 	{ "name": "filter_V_15_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_15", "role": "address1" }} , 
 	{ "name": "filter_V_15_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_15", "role": "ce1" }} , 
 	{ "name": "filter_V_15_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_15", "role": "we1" }} , 
 	{ "name": "filter_V_15_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_15", "role": "d1" }} , 
 	{ "name": "filter_V_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_14", "role": "address0" }} , 
 	{ "name": "filter_V_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_14", "role": "ce0" }} , 
 	{ "name": "filter_V_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_14", "role": "we0" }} , 
 	{ "name": "filter_V_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_14", "role": "d0" }} , 
 	{ "name": "filter_V_14_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_14", "role": "address1" }} , 
 	{ "name": "filter_V_14_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_14", "role": "ce1" }} , 
 	{ "name": "filter_V_14_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_14", "role": "we1" }} , 
 	{ "name": "filter_V_14_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_14", "role": "d1" }} , 
 	{ "name": "filter_V_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_13", "role": "address0" }} , 
 	{ "name": "filter_V_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_13", "role": "ce0" }} , 
 	{ "name": "filter_V_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_13", "role": "we0" }} , 
 	{ "name": "filter_V_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_13", "role": "d0" }} , 
 	{ "name": "filter_V_13_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_13", "role": "address1" }} , 
 	{ "name": "filter_V_13_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_13", "role": "ce1" }} , 
 	{ "name": "filter_V_13_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_13", "role": "we1" }} , 
 	{ "name": "filter_V_13_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_13", "role": "d1" }} , 
 	{ "name": "filter_V_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_12", "role": "address0" }} , 
 	{ "name": "filter_V_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_12", "role": "ce0" }} , 
 	{ "name": "filter_V_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_12", "role": "we0" }} , 
 	{ "name": "filter_V_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_12", "role": "d0" }} , 
 	{ "name": "filter_V_12_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_12", "role": "address1" }} , 
 	{ "name": "filter_V_12_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_12", "role": "ce1" }} , 
 	{ "name": "filter_V_12_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_12", "role": "we1" }} , 
 	{ "name": "filter_V_12_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_12", "role": "d1" }} , 
 	{ "name": "filter_V_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_11", "role": "address0" }} , 
 	{ "name": "filter_V_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_11", "role": "ce0" }} , 
 	{ "name": "filter_V_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_11", "role": "we0" }} , 
 	{ "name": "filter_V_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_11", "role": "d0" }} , 
 	{ "name": "filter_V_11_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_11", "role": "address1" }} , 
 	{ "name": "filter_V_11_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_11", "role": "ce1" }} , 
 	{ "name": "filter_V_11_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_11", "role": "we1" }} , 
 	{ "name": "filter_V_11_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_11", "role": "d1" }} , 
 	{ "name": "filter_V_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_10", "role": "address0" }} , 
 	{ "name": "filter_V_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_10", "role": "ce0" }} , 
 	{ "name": "filter_V_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_10", "role": "we0" }} , 
 	{ "name": "filter_V_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_10", "role": "d0" }} , 
 	{ "name": "filter_V_10_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_10", "role": "address1" }} , 
 	{ "name": "filter_V_10_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_10", "role": "ce1" }} , 
 	{ "name": "filter_V_10_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_10", "role": "we1" }} , 
 	{ "name": "filter_V_10_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_10", "role": "d1" }} , 
 	{ "name": "filter_V_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_9", "role": "address0" }} , 
 	{ "name": "filter_V_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_9", "role": "ce0" }} , 
 	{ "name": "filter_V_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_9", "role": "we0" }} , 
 	{ "name": "filter_V_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_9", "role": "d0" }} , 
 	{ "name": "filter_V_9_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_9", "role": "address1" }} , 
 	{ "name": "filter_V_9_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_9", "role": "ce1" }} , 
 	{ "name": "filter_V_9_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_9", "role": "we1" }} , 
 	{ "name": "filter_V_9_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_9", "role": "d1" }} , 
 	{ "name": "filter_V_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_8", "role": "address0" }} , 
 	{ "name": "filter_V_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_8", "role": "ce0" }} , 
 	{ "name": "filter_V_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_8", "role": "we0" }} , 
 	{ "name": "filter_V_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_8", "role": "d0" }} , 
 	{ "name": "filter_V_8_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_8", "role": "address1" }} , 
 	{ "name": "filter_V_8_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_8", "role": "ce1" }} , 
 	{ "name": "filter_V_8_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_8", "role": "we1" }} , 
 	{ "name": "filter_V_8_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_8", "role": "d1" }} , 
 	{ "name": "filter_V_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_7", "role": "address0" }} , 
 	{ "name": "filter_V_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_7", "role": "ce0" }} , 
 	{ "name": "filter_V_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_7", "role": "we0" }} , 
 	{ "name": "filter_V_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_7", "role": "d0" }} , 
 	{ "name": "filter_V_7_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_7", "role": "address1" }} , 
 	{ "name": "filter_V_7_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_7", "role": "ce1" }} , 
 	{ "name": "filter_V_7_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_7", "role": "we1" }} , 
 	{ "name": "filter_V_7_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_7", "role": "d1" }} , 
 	{ "name": "filter_V_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_6", "role": "address0" }} , 
 	{ "name": "filter_V_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_6", "role": "ce0" }} , 
 	{ "name": "filter_V_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_6", "role": "we0" }} , 
 	{ "name": "filter_V_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_6", "role": "d0" }} , 
 	{ "name": "filter_V_6_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_6", "role": "address1" }} , 
 	{ "name": "filter_V_6_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_6", "role": "ce1" }} , 
 	{ "name": "filter_V_6_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_6", "role": "we1" }} , 
 	{ "name": "filter_V_6_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_6", "role": "d1" }} , 
 	{ "name": "filter_V_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_5", "role": "address0" }} , 
 	{ "name": "filter_V_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_5", "role": "ce0" }} , 
 	{ "name": "filter_V_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_5", "role": "we0" }} , 
 	{ "name": "filter_V_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_5", "role": "d0" }} , 
 	{ "name": "filter_V_5_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_5", "role": "address1" }} , 
 	{ "name": "filter_V_5_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_5", "role": "ce1" }} , 
 	{ "name": "filter_V_5_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_5", "role": "we1" }} , 
 	{ "name": "filter_V_5_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_5", "role": "d1" }} , 
 	{ "name": "filter_V_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_4", "role": "address0" }} , 
 	{ "name": "filter_V_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_4", "role": "ce0" }} , 
 	{ "name": "filter_V_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_4", "role": "we0" }} , 
 	{ "name": "filter_V_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_4", "role": "d0" }} , 
 	{ "name": "filter_V_4_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_4", "role": "address1" }} , 
 	{ "name": "filter_V_4_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_4", "role": "ce1" }} , 
 	{ "name": "filter_V_4_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_4", "role": "we1" }} , 
 	{ "name": "filter_V_4_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_4", "role": "d1" }} , 
 	{ "name": "filter_V_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_3", "role": "address0" }} , 
 	{ "name": "filter_V_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_3", "role": "ce0" }} , 
 	{ "name": "filter_V_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_3", "role": "we0" }} , 
 	{ "name": "filter_V_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_3", "role": "d0" }} , 
 	{ "name": "filter_V_3_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_3", "role": "address1" }} , 
 	{ "name": "filter_V_3_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_3", "role": "ce1" }} , 
 	{ "name": "filter_V_3_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_3", "role": "we1" }} , 
 	{ "name": "filter_V_3_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_3", "role": "d1" }} , 
 	{ "name": "filter_V_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_2", "role": "address0" }} , 
 	{ "name": "filter_V_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_2", "role": "ce0" }} , 
 	{ "name": "filter_V_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_2", "role": "we0" }} , 
 	{ "name": "filter_V_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_2", "role": "d0" }} , 
 	{ "name": "filter_V_2_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_2", "role": "address1" }} , 
 	{ "name": "filter_V_2_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_2", "role": "ce1" }} , 
 	{ "name": "filter_V_2_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_2", "role": "we1" }} , 
 	{ "name": "filter_V_2_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_2", "role": "d1" }} , 
 	{ "name": "filter_V_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_1", "role": "address0" }} , 
 	{ "name": "filter_V_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_1", "role": "ce0" }} , 
 	{ "name": "filter_V_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_1", "role": "we0" }} , 
 	{ "name": "filter_V_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_1", "role": "d0" }} , 
 	{ "name": "filter_V_1_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter_V_1", "role": "address1" }} , 
 	{ "name": "filter_V_1_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_1", "role": "ce1" }} , 
 	{ "name": "filter_V_1_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter_V_1", "role": "we1" }} , 
 	{ "name": "filter_V_1_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "filter_V_1", "role": "d1" }} , 
 	{ "name": "strm_in_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "strm_in_V_data_V", "role": "default" }} , 
 	{ "name": "strm_in_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "strm_in_V_last_V", "role": "default" }} , 
 	{ "name": "strm_in_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "strm_in_V_keep_V", "role": "default" }} , 
 	{ "name": "strm_in_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "strm_in_V_strb_V", "role": "default" }} , 
 	{ "name": "strm_in_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "strm_in_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "conv_Pipeline_ReadWeightStreamsLOOP",
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
			{"Name" : "filter_V", "Type" : "Memory", "Direction" : "O"},
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
			{"Name" : "filter_V_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "filter_V_2", "Type" : "Memory", "Direction" : "O"},
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
	conv_Pipeline_ReadWeightStreamsLOOP {
		sext_ln190 {Type I LastRead 0 FirstWrite -1}
		totalWeightStreams {Type I LastRead 0 FirstWrite -1}
		streamsPerFilter {Type I LastRead 0 FirstWrite -1}
		filter_V {Type O LastRead -1 FirstWrite 1}
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
		filter_V_3 {Type O LastRead -1 FirstWrite 1}
		filter_V_2 {Type O LastRead -1 FirstWrite 1}
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
	filter_V { ap_memory {  { filter_V_address0 mem_address 1 10 }  { filter_V_ce0 mem_ce 1 1 }  { filter_V_we0 mem_we 1 1 }  { filter_V_d0 mem_din 1 64 }  { filter_V_address1 MemPortADDR2 1 10 }  { filter_V_ce1 MemPortCE2 1 1 }  { filter_V_we1 MemPortWE2 1 1 }  { filter_V_d1 MemPortDIN2 1 64 } } }
	filter_V_15 { ap_memory {  { filter_V_15_address0 mem_address 1 10 }  { filter_V_15_ce0 mem_ce 1 1 }  { filter_V_15_we0 mem_we 1 1 }  { filter_V_15_d0 mem_din 1 64 }  { filter_V_15_address1 MemPortADDR2 1 10 }  { filter_V_15_ce1 MemPortCE2 1 1 }  { filter_V_15_we1 MemPortWE2 1 1 }  { filter_V_15_d1 MemPortDIN2 1 64 } } }
	filter_V_14 { ap_memory {  { filter_V_14_address0 mem_address 1 10 }  { filter_V_14_ce0 mem_ce 1 1 }  { filter_V_14_we0 mem_we 1 1 }  { filter_V_14_d0 mem_din 1 64 }  { filter_V_14_address1 MemPortADDR2 1 10 }  { filter_V_14_ce1 MemPortCE2 1 1 }  { filter_V_14_we1 MemPortWE2 1 1 }  { filter_V_14_d1 MemPortDIN2 1 64 } } }
	filter_V_13 { ap_memory {  { filter_V_13_address0 mem_address 1 10 }  { filter_V_13_ce0 mem_ce 1 1 }  { filter_V_13_we0 mem_we 1 1 }  { filter_V_13_d0 mem_din 1 64 }  { filter_V_13_address1 MemPortADDR2 1 10 }  { filter_V_13_ce1 MemPortCE2 1 1 }  { filter_V_13_we1 MemPortWE2 1 1 }  { filter_V_13_d1 MemPortDIN2 1 64 } } }
	filter_V_12 { ap_memory {  { filter_V_12_address0 mem_address 1 10 }  { filter_V_12_ce0 mem_ce 1 1 }  { filter_V_12_we0 mem_we 1 1 }  { filter_V_12_d0 mem_din 1 64 }  { filter_V_12_address1 MemPortADDR2 1 10 }  { filter_V_12_ce1 MemPortCE2 1 1 }  { filter_V_12_we1 MemPortWE2 1 1 }  { filter_V_12_d1 MemPortDIN2 1 64 } } }
	filter_V_11 { ap_memory {  { filter_V_11_address0 mem_address 1 10 }  { filter_V_11_ce0 mem_ce 1 1 }  { filter_V_11_we0 mem_we 1 1 }  { filter_V_11_d0 mem_din 1 64 }  { filter_V_11_address1 MemPortADDR2 1 10 }  { filter_V_11_ce1 MemPortCE2 1 1 }  { filter_V_11_we1 MemPortWE2 1 1 }  { filter_V_11_d1 MemPortDIN2 1 64 } } }
	filter_V_10 { ap_memory {  { filter_V_10_address0 mem_address 1 10 }  { filter_V_10_ce0 mem_ce 1 1 }  { filter_V_10_we0 mem_we 1 1 }  { filter_V_10_d0 mem_din 1 64 }  { filter_V_10_address1 MemPortADDR2 1 10 }  { filter_V_10_ce1 MemPortCE2 1 1 }  { filter_V_10_we1 MemPortWE2 1 1 }  { filter_V_10_d1 MemPortDIN2 1 64 } } }
	filter_V_9 { ap_memory {  { filter_V_9_address0 mem_address 1 10 }  { filter_V_9_ce0 mem_ce 1 1 }  { filter_V_9_we0 mem_we 1 1 }  { filter_V_9_d0 mem_din 1 64 }  { filter_V_9_address1 MemPortADDR2 1 10 }  { filter_V_9_ce1 MemPortCE2 1 1 }  { filter_V_9_we1 MemPortWE2 1 1 }  { filter_V_9_d1 MemPortDIN2 1 64 } } }
	filter_V_8 { ap_memory {  { filter_V_8_address0 mem_address 1 10 }  { filter_V_8_ce0 mem_ce 1 1 }  { filter_V_8_we0 mem_we 1 1 }  { filter_V_8_d0 mem_din 1 64 }  { filter_V_8_address1 MemPortADDR2 1 10 }  { filter_V_8_ce1 MemPortCE2 1 1 }  { filter_V_8_we1 MemPortWE2 1 1 }  { filter_V_8_d1 MemPortDIN2 1 64 } } }
	filter_V_7 { ap_memory {  { filter_V_7_address0 mem_address 1 10 }  { filter_V_7_ce0 mem_ce 1 1 }  { filter_V_7_we0 mem_we 1 1 }  { filter_V_7_d0 mem_din 1 64 }  { filter_V_7_address1 MemPortADDR2 1 10 }  { filter_V_7_ce1 MemPortCE2 1 1 }  { filter_V_7_we1 MemPortWE2 1 1 }  { filter_V_7_d1 MemPortDIN2 1 64 } } }
	filter_V_6 { ap_memory {  { filter_V_6_address0 mem_address 1 10 }  { filter_V_6_ce0 mem_ce 1 1 }  { filter_V_6_we0 mem_we 1 1 }  { filter_V_6_d0 mem_din 1 64 }  { filter_V_6_address1 MemPortADDR2 1 10 }  { filter_V_6_ce1 MemPortCE2 1 1 }  { filter_V_6_we1 MemPortWE2 1 1 }  { filter_V_6_d1 MemPortDIN2 1 64 } } }
	filter_V_5 { ap_memory {  { filter_V_5_address0 mem_address 1 10 }  { filter_V_5_ce0 mem_ce 1 1 }  { filter_V_5_we0 mem_we 1 1 }  { filter_V_5_d0 mem_din 1 64 }  { filter_V_5_address1 MemPortADDR2 1 10 }  { filter_V_5_ce1 MemPortCE2 1 1 }  { filter_V_5_we1 MemPortWE2 1 1 }  { filter_V_5_d1 MemPortDIN2 1 64 } } }
	filter_V_4 { ap_memory {  { filter_V_4_address0 mem_address 1 10 }  { filter_V_4_ce0 mem_ce 1 1 }  { filter_V_4_we0 mem_we 1 1 }  { filter_V_4_d0 mem_din 1 64 }  { filter_V_4_address1 MemPortADDR2 1 10 }  { filter_V_4_ce1 MemPortCE2 1 1 }  { filter_V_4_we1 MemPortWE2 1 1 }  { filter_V_4_d1 MemPortDIN2 1 64 } } }
	filter_V_3 { ap_memory {  { filter_V_3_address0 mem_address 1 10 }  { filter_V_3_ce0 mem_ce 1 1 }  { filter_V_3_we0 mem_we 1 1 }  { filter_V_3_d0 mem_din 1 64 }  { filter_V_3_address1 MemPortADDR2 1 10 }  { filter_V_3_ce1 MemPortCE2 1 1 }  { filter_V_3_we1 MemPortWE2 1 1 }  { filter_V_3_d1 MemPortDIN2 1 64 } } }
	filter_V_2 { ap_memory {  { filter_V_2_address0 mem_address 1 10 }  { filter_V_2_ce0 mem_ce 1 1 }  { filter_V_2_we0 mem_we 1 1 }  { filter_V_2_d0 mem_din 1 64 }  { filter_V_2_address1 MemPortADDR2 1 10 }  { filter_V_2_ce1 MemPortCE2 1 1 }  { filter_V_2_we1 MemPortWE2 1 1 }  { filter_V_2_d1 MemPortDIN2 1 64 } } }
	filter_V_1 { ap_memory {  { filter_V_1_address0 mem_address 1 10 }  { filter_V_1_ce0 mem_ce 1 1 }  { filter_V_1_we0 mem_we 1 1 }  { filter_V_1_d0 mem_din 1 64 }  { filter_V_1_address1 MemPortADDR2 1 10 }  { filter_V_1_ce1 MemPortCE2 1 1 }  { filter_V_1_we1 MemPortWE2 1 1 }  { filter_V_1_d1 MemPortDIN2 1 64 } } }
	strm_in_V_data_V { axis {  { strm_in_TVALID in_vld 0 1 }  { strm_in_TDATA in_data 0 128 } } }
	strm_in_V_keep_V { axis {  { strm_in_TKEEP in_data 0 16 } } }
	strm_in_V_strb_V { axis {  { strm_in_TSTRB in_data 0 16 } } }
	strm_in_V_last_V { axis {  { strm_in_TREADY in_acc 1 1 }  { strm_in_TLAST in_data 0 1 } } }
}
