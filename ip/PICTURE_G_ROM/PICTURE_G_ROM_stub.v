// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sat Aug  1 20:12:55 2020
// Host        : USER-King running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               E:/Xilinx/Bird/Bird.srcs/sources_1/ip/PICTURE_G_ROM/PICTURE_G_ROM_stub.v
// Design      : PICTURE_G_ROM
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s15ftgb196-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *)
module PICTURE_G_ROM(clka, ena, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[13:0],dina[7:0],douta[7:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [13:0]addra;
  input [7:0]dina;
  output [7:0]douta;
endmodule
