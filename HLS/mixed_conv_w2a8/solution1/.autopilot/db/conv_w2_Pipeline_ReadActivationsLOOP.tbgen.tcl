set moduleName conv_w2_Pipeline_ReadActivationsLOOP
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
set C_modelName {conv_w2_Pipeline_ReadActivationsLOOP}
set C_modelType { void 0 }
set C_modelArgList {
	{ inputMapLineAddr_reload int 32 regular  }
	{ readLimit int 32 regular  }
	{ streamsPerInputLine int 32 regular  }
	{ inputMapLineAddr_1_reload int 32 regular  }
	{ inputMapLineAddr_2_reload int 32 regular  }
	{ inputMapLineAddr_3_reload int 32 regular  }
	{ inputMapLineAddr_4_reload int 32 regular  }
	{ inputMap_V int 128 regular {array 2880 { 0 3 } 0 1 }  }
	{ zext_ln298 int 3 regular  }
	{ paddingIters int 32 regular  }
	{ xPadUpperLimit int 32 regular  }
	{ yPadUpperLimit int 32 regular  }
	{ strm_in_V_data_V int 128 regular {axi_s 0 volatile  { strm_in Data } }  }
	{ strm_in_V_keep_V int 16 regular {axi_s 0 volatile  { strm_in Keep } }  }
	{ strm_in_V_strb_V int 16 regular {axi_s 0 volatile  { strm_in Strb } }  }
	{ strm_in_V_last_V int 1 regular {axi_s 0 volatile  { strm_in Last } }  }
	{ readLines_out int 32 regular {pointer 1}  }
	{ id_save_out int 32 regular {pointer 1}  }
	{ idx_out int 32 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "inputMapLineAddr_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "readLimit", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "streamsPerInputLine", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "inputMapLineAddr_1_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "inputMapLineAddr_2_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "inputMapLineAddr_3_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "inputMapLineAddr_4_reload", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "inputMap_V", "interface" : "memory", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "zext_ln298", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "paddingIters", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "xPadUpperLimit", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "yPadUpperLimit", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "strm_in_V_data_V", "interface" : "axis", "bitwidth" : 128, "direction" : "READONLY"} , 
 	{ "Name" : "strm_in_V_keep_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "strm_in_V_strb_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "strm_in_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "readLines_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "id_save_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "idx_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 33
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ strm_in_TVALID sc_in sc_logic 1 invld 12 } 
	{ inputMapLineAddr_reload sc_in sc_lv 32 signal 0 } 
	{ readLimit sc_in sc_lv 32 signal 1 } 
	{ streamsPerInputLine sc_in sc_lv 32 signal 2 } 
	{ inputMapLineAddr_1_reload sc_in sc_lv 32 signal 3 } 
	{ inputMapLineAddr_2_reload sc_in sc_lv 32 signal 4 } 
	{ inputMapLineAddr_3_reload sc_in sc_lv 32 signal 5 } 
	{ inputMapLineAddr_4_reload sc_in sc_lv 32 signal 6 } 
	{ inputMap_V_address0 sc_out sc_lv 12 signal 7 } 
	{ inputMap_V_ce0 sc_out sc_logic 1 signal 7 } 
	{ inputMap_V_we0 sc_out sc_logic 1 signal 7 } 
	{ inputMap_V_d0 sc_out sc_lv 128 signal 7 } 
	{ zext_ln298 sc_in sc_lv 3 signal 8 } 
	{ paddingIters sc_in sc_lv 32 signal 9 } 
	{ xPadUpperLimit sc_in sc_lv 32 signal 10 } 
	{ yPadUpperLimit sc_in sc_lv 32 signal 11 } 
	{ strm_in_TDATA sc_in sc_lv 128 signal 12 } 
	{ strm_in_TREADY sc_out sc_logic 1 inacc 15 } 
	{ strm_in_TKEEP sc_in sc_lv 16 signal 13 } 
	{ strm_in_TSTRB sc_in sc_lv 16 signal 14 } 
	{ strm_in_TLAST sc_in sc_lv 1 signal 15 } 
	{ readLines_out sc_out sc_lv 32 signal 16 } 
	{ readLines_out_ap_vld sc_out sc_logic 1 outvld 16 } 
	{ id_save_out sc_out sc_lv 32 signal 17 } 
	{ id_save_out_ap_vld sc_out sc_logic 1 outvld 17 } 
	{ idx_out sc_out sc_lv 32 signal 18 } 
	{ idx_out_ap_vld sc_out sc_logic 1 outvld 18 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "strm_in_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "strm_in_V_data_V", "role": "default" }} , 
 	{ "name": "inputMapLineAddr_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inputMapLineAddr_reload", "role": "default" }} , 
 	{ "name": "readLimit", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "readLimit", "role": "default" }} , 
 	{ "name": "streamsPerInputLine", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "streamsPerInputLine", "role": "default" }} , 
 	{ "name": "inputMapLineAddr_1_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inputMapLineAddr_1_reload", "role": "default" }} , 
 	{ "name": "inputMapLineAddr_2_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inputMapLineAddr_2_reload", "role": "default" }} , 
 	{ "name": "inputMapLineAddr_3_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inputMapLineAddr_3_reload", "role": "default" }} , 
 	{ "name": "inputMapLineAddr_4_reload", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inputMapLineAddr_4_reload", "role": "default" }} , 
 	{ "name": "inputMap_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "inputMap_V", "role": "address0" }} , 
 	{ "name": "inputMap_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inputMap_V", "role": "ce0" }} , 
 	{ "name": "inputMap_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inputMap_V", "role": "we0" }} , 
 	{ "name": "inputMap_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "inputMap_V", "role": "d0" }} , 
 	{ "name": "zext_ln298", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "zext_ln298", "role": "default" }} , 
 	{ "name": "paddingIters", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "paddingIters", "role": "default" }} , 
 	{ "name": "xPadUpperLimit", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "xPadUpperLimit", "role": "default" }} , 
 	{ "name": "yPadUpperLimit", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "yPadUpperLimit", "role": "default" }} , 
 	{ "name": "strm_in_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "strm_in_V_data_V", "role": "default" }} , 
 	{ "name": "strm_in_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "strm_in_V_last_V", "role": "default" }} , 
 	{ "name": "strm_in_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "strm_in_V_keep_V", "role": "default" }} , 
 	{ "name": "strm_in_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "strm_in_V_strb_V", "role": "default" }} , 
 	{ "name": "strm_in_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "strm_in_V_last_V", "role": "default" }} , 
 	{ "name": "readLines_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "readLines_out", "role": "default" }} , 
 	{ "name": "readLines_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "readLines_out", "role": "ap_vld" }} , 
 	{ "name": "id_save_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "id_save_out", "role": "default" }} , 
 	{ "name": "id_save_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "id_save_out", "role": "ap_vld" }} , 
 	{ "name": "idx_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "idx_out", "role": "default" }} , 
 	{ "name": "idx_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "idx_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "conv_w2_Pipeline_ReadActivationsLOOP",
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
			{"Name" : "inputMapLineAddr_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "readLimit", "Type" : "None", "Direction" : "I"},
			{"Name" : "streamsPerInputLine", "Type" : "None", "Direction" : "I"},
			{"Name" : "inputMapLineAddr_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "inputMapLineAddr_2_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "inputMapLineAddr_3_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "inputMapLineAddr_4_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "inputMap_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "zext_ln298", "Type" : "None", "Direction" : "I"},
			{"Name" : "paddingIters", "Type" : "None", "Direction" : "I"},
			{"Name" : "xPadUpperLimit", "Type" : "None", "Direction" : "I"},
			{"Name" : "yPadUpperLimit", "Type" : "None", "Direction" : "I"},
			{"Name" : "strm_in_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "strm_in",
				"BlockSignal" : [
					{"Name" : "strm_in_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "strm_in_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "strm_in"},
			{"Name" : "strm_in_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "strm_in"},
			{"Name" : "strm_in_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "strm_in"},
			{"Name" : "readLines_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "id_save_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "idx_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "ReadActivationsLOOP", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter1", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_53_32_1_1_U100", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	conv_w2_Pipeline_ReadActivationsLOOP {
		inputMapLineAddr_reload {Type I LastRead 0 FirstWrite -1}
		readLimit {Type I LastRead 0 FirstWrite -1}
		streamsPerInputLine {Type I LastRead 0 FirstWrite -1}
		inputMapLineAddr_1_reload {Type I LastRead 0 FirstWrite -1}
		inputMapLineAddr_2_reload {Type I LastRead 0 FirstWrite -1}
		inputMapLineAddr_3_reload {Type I LastRead 0 FirstWrite -1}
		inputMapLineAddr_4_reload {Type I LastRead 0 FirstWrite -1}
		inputMap_V {Type O LastRead -1 FirstWrite 1}
		zext_ln298 {Type I LastRead 0 FirstWrite -1}
		paddingIters {Type I LastRead 0 FirstWrite -1}
		xPadUpperLimit {Type I LastRead 0 FirstWrite -1}
		yPadUpperLimit {Type I LastRead 0 FirstWrite -1}
		strm_in_V_data_V {Type I LastRead 1 FirstWrite -1}
		strm_in_V_keep_V {Type I LastRead 1 FirstWrite -1}
		strm_in_V_strb_V {Type I LastRead 1 FirstWrite -1}
		strm_in_V_last_V {Type I LastRead 1 FirstWrite -1}
		readLines_out {Type O LastRead -1 FirstWrite 1}
		id_save_out {Type O LastRead -1 FirstWrite 1}
		idx_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	inputMapLineAddr_reload { ap_none {  { inputMapLineAddr_reload in_data 0 32 } } }
	readLimit { ap_none {  { readLimit in_data 0 32 } } }
	streamsPerInputLine { ap_none {  { streamsPerInputLine in_data 0 32 } } }
	inputMapLineAddr_1_reload { ap_none {  { inputMapLineAddr_1_reload in_data 0 32 } } }
	inputMapLineAddr_2_reload { ap_none {  { inputMapLineAddr_2_reload in_data 0 32 } } }
	inputMapLineAddr_3_reload { ap_none {  { inputMapLineAddr_3_reload in_data 0 32 } } }
	inputMapLineAddr_4_reload { ap_none {  { inputMapLineAddr_4_reload in_data 0 32 } } }
	inputMap_V { ap_memory {  { inputMap_V_address0 mem_address 1 12 }  { inputMap_V_ce0 mem_ce 1 1 }  { inputMap_V_we0 mem_we 1 1 }  { inputMap_V_d0 mem_din 1 128 } } }
	zext_ln298 { ap_none {  { zext_ln298 in_data 0 3 } } }
	paddingIters { ap_none {  { paddingIters in_data 0 32 } } }
	xPadUpperLimit { ap_none {  { xPadUpperLimit in_data 0 32 } } }
	yPadUpperLimit { ap_none {  { yPadUpperLimit in_data 0 32 } } }
	strm_in_V_data_V { axis {  { strm_in_TVALID in_vld 0 1 }  { strm_in_TDATA in_data 0 128 } } }
	strm_in_V_keep_V { axis {  { strm_in_TKEEP in_data 0 16 } } }
	strm_in_V_strb_V { axis {  { strm_in_TSTRB in_data 0 16 } } }
	strm_in_V_last_V { axis {  { strm_in_TREADY in_acc 1 1 }  { strm_in_TLAST in_data 0 1 } } }
	readLines_out { ap_vld {  { readLines_out out_data 1 32 }  { readLines_out_ap_vld out_vld 1 1 } } }
	id_save_out { ap_vld {  { id_save_out out_data 1 32 }  { id_save_out_ap_vld out_vld 1 1 } } }
	idx_out { ap_vld {  { idx_out out_data 1 32 }  { idx_out_ap_vld out_vld 1 1 } } }
}
