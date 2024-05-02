; ModuleID = '/home/pferreira/HwSw/HLS/mixed_conv_w2a8/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>" = type { %"struct.hls::axis<ap_int<128>, 0, 0, 0>" }
%"struct.hls::axis<ap_int<128>, 0, 0, 0>" = type { %"struct.ap_int<128>", %"struct.ap_uint<16>", %"struct.ap_uint<16>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>" }
%"struct.ap_int<128>" = type { %"struct.ap_int_base<128, true>" }
%"struct.ap_int_base<128, true>" = type { %"struct.ssdm_int<128, true>" }
%"struct.ssdm_int<128, true>" = type { i128 }
%"struct.ap_uint<16>" = type { %"struct.ap_int_base<16, false>" }
%"struct.ap_int_base<16, false>" = type { %"struct.ssdm_int<16, false>" }
%"struct.ssdm_int<16, false>" = type { i16 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }

; Function Attrs: noinline
define void @apatb_conv_w2_ir(%"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* noalias nocapture nonnull dereferenceable(32) %strm_in, %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* noalias nocapture nonnull dereferenceable(32) %strm_out, i32 %numFilters, i32 %numKernels, i32 %inputMapSizeX, i32 %inputMapSizeY, i32 %ctrl) local_unnamed_addr #0 {
entry:
  %strm_in_copy.data = alloca i128
  %strm_in_copy.keep = alloca i16
  %strm_in_copy.strb = alloca i16
  %strm_in_copy.last = alloca i1
  %strm_out_copy.data = alloca i128
  %strm_out_copy.keep = alloca i16
  %strm_out_copy.strb = alloca i16
  %strm_out_copy.last = alloca i1
  call fastcc void @copy_in(%"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* nonnull %strm_in, i128* %strm_in_copy.data, i16* %strm_in_copy.keep, i16* %strm_in_copy.strb, i1* %strm_in_copy.last, %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* nonnull %strm_out, i128* %strm_out_copy.data, i16* %strm_out_copy.keep, i16* %strm_out_copy.strb, i1* %strm_out_copy.last)
  call void @apatb_conv_w2_hw(i128* %strm_in_copy.data, i16* %strm_in_copy.keep, i16* %strm_in_copy.strb, i1* %strm_in_copy.last, i128* %strm_out_copy.data, i16* %strm_out_copy.keep, i16* %strm_out_copy.strb, i1* %strm_out_copy.last, i32 %numFilters, i32 %numKernels, i32 %inputMapSizeX, i32 %inputMapSizeY, i32 %ctrl)
  call void @copy_back(%"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %strm_in, i128* %strm_in_copy.data, i16* %strm_in_copy.keep, i16* %strm_in_copy.strb, i1* %strm_in_copy.last, %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %strm_out, i128* %strm_out_copy.data, i16* %strm_out_copy.keep, i16* %strm_out_copy.strb, i1* %strm_out_copy.last)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* noalias, i128* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_last_V, %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* noalias, i128* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="6.0" %_V_data_V1, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="6.1" %_V_keep_V2, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="6.2" %_V_strb_V3, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="6.3" %_V_last_V4) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>.21"(i128* %_V_data_V, i16* %_V_keep_V, i16* %_V_strb_V, i1* %_V_last_V, %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>.21"(i128* %_V_data_V1, i16* %_V_keep_V2, i16* %_V_strb_V3, i1* %_V_last_V4, %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %1)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(%"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* noalias, i128* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_last_V, %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* noalias, i128* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="6.0" %_V_data_V1, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="6.1" %_V_keep_V2, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="6.2" %_V_strb_V3, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="6.3" %_V_last_V4) unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %0, i128* %_V_data_V, i16* %_V_keep_V, i16* %_V_strb_V, i1* %_V_last_V)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %1, i128* %_V_data_V1, i16* %_V_keep_V2, i16* %_V_strb_V3, i1* %_V_last_V4)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", i128* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_last_V) unnamed_addr #3 {
entry:
  %1 = icmp eq %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %0, null
  %2 = or i1 %1, false
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>.16"(%"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* nonnull align 512 %0, i128* %_V_data_V, i16* %_V_keep_V, i16* %_V_strb_V, i1* %_V_last_V)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>.16"(%"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", i128* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i16* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i16* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_last_V) unnamed_addr #4 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"
  %2 = alloca i128
  %3 = alloca i16
  %4 = alloca i16
  %5 = alloca i1
  br label %empty

empty:                                            ; preds = %push, %entry
  %6 = bitcast i128* %_V_data_V to i8*
  %7 = call i1 @fpga_fifo_not_empty_16(i8* %6)
  br i1 %7, label %push, label %ret

push:                                             ; preds = %empty
  %8 = bitcast i128* %2 to i8*
  %9 = bitcast i128* %_V_data_V to i8*
  call void @fpga_fifo_pop_16(i8* %8, i8* %9)
  %10 = load volatile i128, i128* %2
  %11 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 0
  %12 = bitcast %"struct.ap_int<128>"* %11 to i128*
  store i128 %10, i128* %12
  %13 = bitcast i16* %4 to i8*
  %14 = bitcast i16* %_V_keep_V to i8*
  call void @fpga_fifo_pop_2(i8* %13, i8* %14)
  %15 = load volatile i16, i16* %4
  %16 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 1
  %17 = bitcast %"struct.ap_uint<16>"* %16 to i16*
  store i16 %15, i16* %17
  %18 = bitcast i16* %3 to i8*
  %19 = bitcast i16* %_V_strb_V to i8*
  call void @fpga_fifo_pop_2(i8* %18, i8* %19)
  %20 = load volatile i16, i16* %3
  %21 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 2
  %22 = bitcast %"struct.ap_uint<16>"* %21 to i16*
  store i16 %20, i16* %22
  %23 = bitcast i1* %5 to i8*
  %24 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_pop_1(i8* %23, i8* %24)
  %25 = bitcast i1* %5 to i8*
  %26 = load i8, i8* %25
  %27 = trunc i8 %26 to i1
  %28 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 4
  %29 = bitcast %"struct.ap_uint<1>"* %28 to i1*
  store i1 %27, i1* %29
  %30 = bitcast %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %1 to i8*
  %31 = bitcast %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %0 to i8*
  call void @fpga_fifo_push_32(i8* %30, i8* %31)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>.21"(i128* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.0" %_V_data_V, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.1" %_V_keep_V, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.3" %_V_last_V, %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %1 = icmp eq %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %0, null
  %2 = or i1 false, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>.24"(i128* %_V_data_V, i16* %_V_keep_V, i16* %_V_strb_V, i1* %_V_last_V, %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* nonnull %0)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>.24"(i128* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.0" %_V_data_V, i16* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.1" %_V_keep_V, i16* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.2" %_V_strb_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.3" %_V_last_V, %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"
  %2 = alloca %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %0 to i8*
  %4 = call i1 @fpga_fifo_not_empty_32(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %0 to i8*
  call void @fpga_fifo_pop_32(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %2
  store %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>" %7, %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %1
  %8 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 0
  %9 = bitcast %"struct.ap_int<128>"* %8 to i128*
  %10 = bitcast i128* %9 to i8*
  %11 = bitcast i128* %_V_data_V to i8*
  call void @fpga_fifo_push_16(i8* %10, i8* %11)
  %12 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 1
  %13 = bitcast %"struct.ap_uint<16>"* %12 to i16*
  %14 = bitcast i16* %13 to i8*
  %15 = bitcast i16* %_V_keep_V to i8*
  call void @fpga_fifo_push_2(i8* %14, i8* %15)
  %16 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 2
  %17 = bitcast %"struct.ap_uint<16>"* %16 to i16*
  %18 = bitcast i16* %17 to i8*
  %19 = bitcast i16* %_V_strb_V to i8*
  call void @fpga_fifo_push_2(i8* %18, i8* %19)
  %20 = getelementptr inbounds %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 4
  %21 = bitcast %"struct.ap_uint<1>"* %20 to i1*
  %22 = bitcast i1* %21 to i8*
  %23 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_push_1(i8* %22, i8* %23)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

declare void @apatb_conv_w2_hw(i128*, i16*, i16*, i1*, i128*, i16*, i16*, i1*, i32, i32, i32, i32, i32)

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_back(%"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* noalias, i128* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_last_V, %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* noalias, i128* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="6.0" %_V_data_V1, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="6.1" %_V_keep_V2, i16* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="6.2" %_V_strb_V3, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="6.3" %_V_last_V4) unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %0, i128* %_V_data_V, i16* %_V_keep_V, i16* %_V_strb_V, i1* %_V_last_V)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"(%"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %1, i128* %_V_data_V1, i16* %_V_keep_V2, i16* %_V_strb_V3, i1* %_V_last_V4)
  ret void
}

define void @conv_w2_hw_stub_wrapper(i128*, i16*, i16*, i1*, i128*, i16*, i16*, i1*, i32, i32, i32, i32, i32) #5 {
entry:
  %13 = alloca %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"
  %14 = alloca %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"
  call void @copy_out(%"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %13, i128* %0, i16* %1, i16* %2, i1* %3, %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %14, i128* %4, i16* %5, i16* %6, i1* %7)
  call void @conv_w2_hw_stub(%"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %13, %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %14, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12)
  call void @copy_in(%"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %13, i128* %0, i16* %1, i16* %2, i1* %3, %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"* %14, i128* %4, i16* %5, i16* %6, i1* %7)
  ret void
}

declare void @conv_w2_hw_stub(%"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"*, %"class.hls::stream<hls::axis<ap_int<128>, 0, 0, 0>, 0>"*, i32, i32, i32, i32, i32)

declare i1 @fpga_fifo_not_empty_32(i8*)

declare i1 @fpga_fifo_not_empty_16(i8*)

declare void @fpga_fifo_pop_32(i8*, i8*)

declare void @fpga_fifo_pop_16(i8*, i8*)

declare void @fpga_fifo_pop_2(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_push_32(i8*, i8*)

declare void @fpga_fifo_push_16(i8*, i8*)

declare void @fpga_fifo_push_2(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
