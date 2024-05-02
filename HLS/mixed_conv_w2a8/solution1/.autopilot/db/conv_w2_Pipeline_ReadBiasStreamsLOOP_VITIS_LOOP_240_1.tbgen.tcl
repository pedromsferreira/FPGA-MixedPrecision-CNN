set moduleName conv_w2_Pipeline_ReadBiasStreamsLOOP_VITIS_LOOP_240_1
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
set C_modelName {conv_w2_Pipeline_ReadBiasStreamsLOOP_VITIS_LOOP_240_1}
set C_modelType { void 0 }
set C_modelArgList {
	{ zext_ln276 int 37 regular  }
	{ zext_ln239 int 30 regular  }
	{ bias_V_15 int 8 regular {array 32 { 0 3 } 0 1 }  }
	{ bias_V_14 int 8 regular {array 32 { 0 3 } 0 1 }  }
	{ bias_V_13 int 8 regular {array 32 { 0 3 } 0 1 }  }
	{ bias_V_12 int 8 regular {array 32 { 0 3 } 0 1 }  }
	{ bias_V_11 int 8 regular {array 32 { 0 3 } 0 1 }  }
	{ bias_V_10 int 8 regular {array 32 { 0 3 } 0 1 }  }
	{ bias_V_9 int 8 regular {array 32 { 0 3 } 0 1 }  }
	{ bias_V_8 int 8 regular {array 32 { 0 3 } 0 1 }  }
	{ bias_V_7 int 8 regular {array 32 { 0 3 } 0 1 }  }
	{ bias_V_6 int 8 regular {array 32 { 0 3 } 0 1 }  }
	{ bias_V_5 int 8 regular {array 32 { 0 3 } 0 1 }  }
	{ bias_V_4 int 8 regular {array 32 { 0 3 } 0 1 }  }
	{ bias_V_3 int 8 regular {array 32 { 0 3 } 0 1 }  }
	{ bias_V_2 int 8 regular {array 32 { 0 3 } 0 1 }  }
	{ bias_V_1 int 8 regular {array 32 { 0 3 } 0 1 }  }
	{ bias_V int 8 regular {array 32 { 0 3 } 0 1 }  }
	{ strm_in_V_data_V int 128 regular {axi_s 0 volatile  { strm_in Data } }  }
	{ strm_in_V_keep_V int 16 regular {axi_s 0 volatile  { strm_in Keep } }  }
	{ strm_in_V_strb_V int 16 regular {axi_s 0 volatile  { strm_in Strb } }  }
	{ strm_in_V_last_V int 1 regular {axi_s 0 volatile  { strm_in Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln276", "interface" : "wire", "bitwidth" : 37, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln239", "interface" : "wire", "bitwidth" : 30, "direction" : "READONLY"} , 
 	{ "Name" : "bias_V_15", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bias_V_14", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bias_V_13", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bias_V_12", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bias_V_11", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bias_V_10", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bias_V_9", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bias_V_8", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bias_V_7", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bias_V_6", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bias_V_5", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bias_V_4", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bias_V_3", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bias_V_2", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bias_V_1", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bias_V", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "strm_in_V_data_V", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "strm_in_V_keep_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "strm_in_V_strb_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "strm_in_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 78
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ strm_in_TVALID sc_in sc_logic 1 invld 18 } 
	{ zext_ln276 sc_in sc_lv 37 signal 0 } 
	{ zext_ln239 sc_in sc_lv 30 signal 1 } 
	{ bias_V_15_address0 sc_out sc_lv 5 signal 2 } 
	{ bias_V_15_ce0 sc_out sc_logic 1 signal 2 } 
	{ bias_V_15_we0 sc_out sc_logic 1 signal 2 } 
	{ bias_V_15_d0 sc_out sc_lv 8 signal 2 } 
	{ bias_V_14_address0 sc_out sc_lv 5 signal 3 } 
	{ bias_V_14_ce0 sc_out sc_logic 1 signal 3 } 
	{ bias_V_14_we0 sc_out sc_logic 1 signal 3 } 
	{ bias_V_14_d0 sc_out sc_lv 8 signal 3 } 
	{ bias_V_13_address0 sc_out sc_lv 5 signal 4 } 
	{ bias_V_13_ce0 sc_out sc_logic 1 signal 4 } 
	{ bias_V_13_we0 sc_out sc_logic 1 signal 4 } 
	{ bias_V_13_d0 sc_out sc_lv 8 signal 4 } 
	{ bias_V_12_address0 sc_out sc_lv 5 signal 5 } 
	{ bias_V_12_ce0 sc_out sc_logic 1 signal 5 } 
	{ bias_V_12_we0 sc_out sc_logic 1 signal 5 } 
	{ bias_V_12_d0 sc_out sc_lv 8 signal 5 } 
	{ bias_V_11_address0 sc_out sc_lv 5 signal 6 } 
	{ bias_V_11_ce0 sc_out sc_logic 1 signal 6 } 
	{ bias_V_11_we0 sc_out sc_logic 1 signal 6 } 
	{ bias_V_11_d0 sc_out sc_lv 8 signal 6 } 
	{ bias_V_10_address0 sc_out sc_lv 5 signal 7 } 
	{ bias_V_10_ce0 sc_out sc_logic 1 signal 7 } 
	{ bias_V_10_we0 sc_out sc_logic 1 signal 7 } 
	{ bias_V_10_d0 sc_out sc_lv 8 signal 7 } 
	{ bias_V_9_address0 sc_out sc_lv 5 signal 8 } 
	{ bias_V_9_ce0 sc_out sc_logic 1 signal 8 } 
	{ bias_V_9_we0 sc_out sc_logic 1 signal 8 } 
	{ bias_V_9_d0 sc_out sc_lv 8 signal 8 } 
	{ bias_V_8_address0 sc_out sc_lv 5 signal 9 } 
	{ bias_V_8_ce0 sc_out sc_logic 1 signal 9 } 
	{ bias_V_8_we0 sc_out sc_logic 1 signal 9 } 
	{ bias_V_8_d0 sc_out sc_lv 8 signal 9 } 
	{ bias_V_7_address0 sc_out sc_lv 5 signal 10 } 
	{ bias_V_7_ce0 sc_out sc_logic 1 signal 10 } 
	{ bias_V_7_we0 sc_out sc_logic 1 signal 10 } 
	{ bias_V_7_d0 sc_out sc_lv 8 signal 10 } 
	{ bias_V_6_address0 sc_out sc_lv 5 signal 11 } 
	{ bias_V_6_ce0 sc_out sc_logic 1 signal 11 } 
	{ bias_V_6_we0 sc_out sc_logic 1 signal 11 } 
	{ bias_V_6_d0 sc_out sc_lv 8 signal 11 } 
	{ bias_V_5_address0 sc_out sc_lv 5 signal 12 } 
	{ bias_V_5_ce0 sc_out sc_logic 1 signal 12 } 
	{ bias_V_5_we0 sc_out sc_logic 1 signal 12 } 
	{ bias_V_5_d0 sc_out sc_lv 8 signal 12 } 
	{ bias_V_4_address0 sc_out sc_lv 5 signal 13 } 
	{ bias_V_4_ce0 sc_out sc_logic 1 signal 13 } 
	{ bias_V_4_we0 sc_out sc_logic 1 signal 13 } 
	{ bias_V_4_d0 sc_out sc_lv 8 signal 13 } 
	{ bias_V_3_address0 sc_out sc_lv 5 signal 14 } 
	{ bias_V_3_ce0 sc_out sc_logic 1 signal 14 } 
	{ bias_V_3_we0 sc_out sc_logic 1 signal 14 } 
	{ bias_V_3_d0 sc_out sc_lv 8 signal 14 } 
	{ bias_V_2_address0 sc_out sc_lv 5 signal 15 } 
	{ bias_V_2_ce0 sc_out sc_logic 1 signal 15 } 
	{ bias_V_2_we0 sc_out sc_logic 1 signal 15 } 
	{ bias_V_2_d0 sc_out sc_lv 8 signal 15 } 
	{ bias_V_1_address0 sc_out sc_lv 5 signal 16 } 
	{ bias_V_1_ce0 sc_out sc_logic 1 signal 16 } 
	{ bias_V_1_we0 sc_out sc_logic 1 signal 16 } 
	{ bias_V_1_d0 sc_out sc_lv 8 signal 16 } 
	{ bias_V_address0 sc_out sc_lv 5 signal 17 } 
	{ bias_V_ce0 sc_out sc_logic 1 signal 17 } 
	{ bias_V_we0 sc_out sc_logic 1 signal 17 } 
	{ bias_V_d0 sc_out sc_lv 8 signal 17 } 
	{ strm_in_TDATA sc_in sc_lv 128 signal 18 } 
	{ strm_in_TREADY sc_out sc_logic 1 inacc 21 } 
	{ strm_in_TKEEP sc_in sc_lv 16 signal 19 } 
	{ strm_in_TSTRB sc_in sc_lv 16 signal 20 } 
	{ strm_in_TLAST sc_in sc_lv 1 signal 21 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "strm_in_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "strm_in_V_data_V", "role": "default" }} , 
 	{ "name": "zext_ln276", "direction": "in", "datatype": "sc_lv", "bitwidth":37, "type": "signal", "bundle":{"name": "zext_ln276", "role": "default" }} , 
 	{ "name": "zext_ln239", "direction": "in", "datatype": "sc_lv", "bitwidth":30, "type": "signal", "bundle":{"name": "zext_ln239", "role": "default" }} , 
 	{ "name": "bias_V_15_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bias_V_15", "role": "address0" }} , 
 	{ "name": "bias_V_15_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_15", "role": "ce0" }} , 
 	{ "name": "bias_V_15_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_15", "role": "we0" }} , 
 	{ "name": "bias_V_15_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bias_V_15", "role": "d0" }} , 
 	{ "name": "bias_V_14_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bias_V_14", "role": "address0" }} , 
 	{ "name": "bias_V_14_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_14", "role": "ce0" }} , 
 	{ "name": "bias_V_14_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_14", "role": "we0" }} , 
 	{ "name": "bias_V_14_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bias_V_14", "role": "d0" }} , 
 	{ "name": "bias_V_13_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bias_V_13", "role": "address0" }} , 
 	{ "name": "bias_V_13_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_13", "role": "ce0" }} , 
 	{ "name": "bias_V_13_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_13", "role": "we0" }} , 
 	{ "name": "bias_V_13_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bias_V_13", "role": "d0" }} , 
 	{ "name": "bias_V_12_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bias_V_12", "role": "address0" }} , 
 	{ "name": "bias_V_12_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_12", "role": "ce0" }} , 
 	{ "name": "bias_V_12_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_12", "role": "we0" }} , 
 	{ "name": "bias_V_12_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bias_V_12", "role": "d0" }} , 
 	{ "name": "bias_V_11_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bias_V_11", "role": "address0" }} , 
 	{ "name": "bias_V_11_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_11", "role": "ce0" }} , 
 	{ "name": "bias_V_11_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_11", "role": "we0" }} , 
 	{ "name": "bias_V_11_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bias_V_11", "role": "d0" }} , 
 	{ "name": "bias_V_10_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bias_V_10", "role": "address0" }} , 
 	{ "name": "bias_V_10_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_10", "role": "ce0" }} , 
 	{ "name": "bias_V_10_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_10", "role": "we0" }} , 
 	{ "name": "bias_V_10_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bias_V_10", "role": "d0" }} , 
 	{ "name": "bias_V_9_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bias_V_9", "role": "address0" }} , 
 	{ "name": "bias_V_9_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_9", "role": "ce0" }} , 
 	{ "name": "bias_V_9_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_9", "role": "we0" }} , 
 	{ "name": "bias_V_9_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bias_V_9", "role": "d0" }} , 
 	{ "name": "bias_V_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bias_V_8", "role": "address0" }} , 
 	{ "name": "bias_V_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_8", "role": "ce0" }} , 
 	{ "name": "bias_V_8_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_8", "role": "we0" }} , 
 	{ "name": "bias_V_8_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bias_V_8", "role": "d0" }} , 
 	{ "name": "bias_V_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bias_V_7", "role": "address0" }} , 
 	{ "name": "bias_V_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_7", "role": "ce0" }} , 
 	{ "name": "bias_V_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_7", "role": "we0" }} , 
 	{ "name": "bias_V_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bias_V_7", "role": "d0" }} , 
 	{ "name": "bias_V_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bias_V_6", "role": "address0" }} , 
 	{ "name": "bias_V_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_6", "role": "ce0" }} , 
 	{ "name": "bias_V_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_6", "role": "we0" }} , 
 	{ "name": "bias_V_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bias_V_6", "role": "d0" }} , 
 	{ "name": "bias_V_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bias_V_5", "role": "address0" }} , 
 	{ "name": "bias_V_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_5", "role": "ce0" }} , 
 	{ "name": "bias_V_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_5", "role": "we0" }} , 
 	{ "name": "bias_V_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bias_V_5", "role": "d0" }} , 
 	{ "name": "bias_V_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bias_V_4", "role": "address0" }} , 
 	{ "name": "bias_V_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_4", "role": "ce0" }} , 
 	{ "name": "bias_V_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_4", "role": "we0" }} , 
 	{ "name": "bias_V_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bias_V_4", "role": "d0" }} , 
 	{ "name": "bias_V_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bias_V_3", "role": "address0" }} , 
 	{ "name": "bias_V_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_3", "role": "ce0" }} , 
 	{ "name": "bias_V_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_3", "role": "we0" }} , 
 	{ "name": "bias_V_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bias_V_3", "role": "d0" }} , 
 	{ "name": "bias_V_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bias_V_2", "role": "address0" }} , 
 	{ "name": "bias_V_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_2", "role": "ce0" }} , 
 	{ "name": "bias_V_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_2", "role": "we0" }} , 
 	{ "name": "bias_V_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bias_V_2", "role": "d0" }} , 
 	{ "name": "bias_V_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bias_V_1", "role": "address0" }} , 
 	{ "name": "bias_V_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_1", "role": "ce0" }} , 
 	{ "name": "bias_V_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V_1", "role": "we0" }} , 
 	{ "name": "bias_V_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bias_V_1", "role": "d0" }} , 
 	{ "name": "bias_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "bias_V", "role": "address0" }} , 
 	{ "name": "bias_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V", "role": "ce0" }} , 
 	{ "name": "bias_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias_V", "role": "we0" }} , 
 	{ "name": "bias_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "bias_V", "role": "d0" }} , 
 	{ "name": "strm_in_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "strm_in_V_data_V", "role": "default" }} , 
 	{ "name": "strm_in_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "strm_in_V_last_V", "role": "default" }} , 
 	{ "name": "strm_in_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "strm_in_V_keep_V", "role": "default" }} , 
 	{ "name": "strm_in_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "strm_in_V_strb_V", "role": "default" }} , 
 	{ "name": "strm_in_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "strm_in_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "conv_w2_Pipeline_ReadBiasStreamsLOOP_VITIS_LOOP_240_1",
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
			{"Name" : "zext_ln276", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln239", "Type" : "None", "Direction" : "I"},
			{"Name" : "bias_V_15", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bias_V_14", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bias_V_13", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bias_V_12", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bias_V_11", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bias_V_10", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bias_V_9", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bias_V_8", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bias_V_7", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bias_V_6", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bias_V_5", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bias_V_4", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bias_V_3", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bias_V_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bias_V_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bias_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "strm_in_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "strm_in",
				"BlockSignal" : [
					{"Name" : "strm_in_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "strm_in_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "strm_in"},
			{"Name" : "strm_in_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "strm_in"},
			{"Name" : "strm_in_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "strm_in"}],
		"Loop" : [
			{"Name" : "ReadBiasStreamsLOOP_VITIS_LOOP_240_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter1", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	conv_w2_Pipeline_ReadBiasStreamsLOOP_VITIS_LOOP_240_1 {
		zext_ln276 {Type I LastRead 0 FirstWrite -1}
		zext_ln239 {Type I LastRead 0 FirstWrite -1}
		bias_V_15 {Type O LastRead -1 FirstWrite 2}
		bias_V_14 {Type O LastRead -1 FirstWrite 2}
		bias_V_13 {Type O LastRead -1 FirstWrite 2}
		bias_V_12 {Type O LastRead -1 FirstWrite 2}
		bias_V_11 {Type O LastRead -1 FirstWrite 2}
		bias_V_10 {Type O LastRead -1 FirstWrite 2}
		bias_V_9 {Type O LastRead -1 FirstWrite 2}
		bias_V_8 {Type O LastRead -1 FirstWrite 2}
		bias_V_7 {Type O LastRead -1 FirstWrite 2}
		bias_V_6 {Type O LastRead -1 FirstWrite 2}
		bias_V_5 {Type O LastRead -1 FirstWrite 2}
		bias_V_4 {Type O LastRead -1 FirstWrite 2}
		bias_V_3 {Type O LastRead -1 FirstWrite 2}
		bias_V_2 {Type O LastRead -1 FirstWrite 2}
		bias_V_1 {Type O LastRead -1 FirstWrite 2}
		bias_V {Type O LastRead -1 FirstWrite 2}
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
	zext_ln276 { ap_none {  { zext_ln276 in_data 0 37 } } }
	zext_ln239 { ap_none {  { zext_ln239 in_data 0 30 } } }
	bias_V_15 { ap_memory {  { bias_V_15_address0 mem_address 1 5 }  { bias_V_15_ce0 mem_ce 1 1 }  { bias_V_15_we0 mem_we 1 1 }  { bias_V_15_d0 mem_din 1 8 } } }
	bias_V_14 { ap_memory {  { bias_V_14_address0 mem_address 1 5 }  { bias_V_14_ce0 mem_ce 1 1 }  { bias_V_14_we0 mem_we 1 1 }  { bias_V_14_d0 mem_din 1 8 } } }
	bias_V_13 { ap_memory {  { bias_V_13_address0 mem_address 1 5 }  { bias_V_13_ce0 mem_ce 1 1 }  { bias_V_13_we0 mem_we 1 1 }  { bias_V_13_d0 mem_din 1 8 } } }
	bias_V_12 { ap_memory {  { bias_V_12_address0 mem_address 1 5 }  { bias_V_12_ce0 mem_ce 1 1 }  { bias_V_12_we0 mem_we 1 1 }  { bias_V_12_d0 mem_din 1 8 } } }
	bias_V_11 { ap_memory {  { bias_V_11_address0 mem_address 1 5 }  { bias_V_11_ce0 mem_ce 1 1 }  { bias_V_11_we0 mem_we 1 1 }  { bias_V_11_d0 mem_din 1 8 } } }
	bias_V_10 { ap_memory {  { bias_V_10_address0 mem_address 1 5 }  { bias_V_10_ce0 mem_ce 1 1 }  { bias_V_10_we0 mem_we 1 1 }  { bias_V_10_d0 mem_din 1 8 } } }
	bias_V_9 { ap_memory {  { bias_V_9_address0 mem_address 1 5 }  { bias_V_9_ce0 mem_ce 1 1 }  { bias_V_9_we0 mem_we 1 1 }  { bias_V_9_d0 mem_din 1 8 } } }
	bias_V_8 { ap_memory {  { bias_V_8_address0 mem_address 1 5 }  { bias_V_8_ce0 mem_ce 1 1 }  { bias_V_8_we0 mem_we 1 1 }  { bias_V_8_d0 mem_din 1 8 } } }
	bias_V_7 { ap_memory {  { bias_V_7_address0 mem_address 1 5 }  { bias_V_7_ce0 mem_ce 1 1 }  { bias_V_7_we0 mem_we 1 1 }  { bias_V_7_d0 mem_din 1 8 } } }
	bias_V_6 { ap_memory {  { bias_V_6_address0 mem_address 1 5 }  { bias_V_6_ce0 mem_ce 1 1 }  { bias_V_6_we0 mem_we 1 1 }  { bias_V_6_d0 mem_din 1 8 } } }
	bias_V_5 { ap_memory {  { bias_V_5_address0 mem_address 1 5 }  { bias_V_5_ce0 mem_ce 1 1 }  { bias_V_5_we0 mem_we 1 1 }  { bias_V_5_d0 mem_din 1 8 } } }
	bias_V_4 { ap_memory {  { bias_V_4_address0 mem_address 1 5 }  { bias_V_4_ce0 mem_ce 1 1 }  { bias_V_4_we0 mem_we 1 1 }  { bias_V_4_d0 mem_din 1 8 } } }
	bias_V_3 { ap_memory {  { bias_V_3_address0 mem_address 1 5 }  { bias_V_3_ce0 mem_ce 1 1 }  { bias_V_3_we0 mem_we 1 1 }  { bias_V_3_d0 mem_din 1 8 } } }
	bias_V_2 { ap_memory {  { bias_V_2_address0 mem_address 1 5 }  { bias_V_2_ce0 mem_ce 1 1 }  { bias_V_2_we0 mem_we 1 1 }  { bias_V_2_d0 mem_din 1 8 } } }
	bias_V_1 { ap_memory {  { bias_V_1_address0 mem_address 1 5 }  { bias_V_1_ce0 mem_ce 1 1 }  { bias_V_1_we0 mem_we 1 1 }  { bias_V_1_d0 mem_din 1 8 } } }
	bias_V { ap_memory {  { bias_V_address0 mem_address 1 5 }  { bias_V_ce0 mem_ce 1 1 }  { bias_V_we0 mem_we 1 1 }  { bias_V_d0 mem_din 1 8 } } }
	strm_in_V_data_V { axis {  { strm_in_TVALID in_vld 0 1 }  { strm_in_TDATA in_data 0 128 } } }
	strm_in_V_keep_V { axis {  { strm_in_TKEEP in_data 0 16 } } }
	strm_in_V_strb_V { axis {  { strm_in_TSTRB in_data 0 16 } } }
	strm_in_V_last_V { axis {  { strm_in_TREADY in_acc 1 1 }  { strm_in_TLAST in_data 0 1 } } }
}
