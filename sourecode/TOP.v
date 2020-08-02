`timescale 1ns / 1ps
module TOP(
    input clk_100MHz,
    input key1,
    input key2,
    output TMDS_Tx_Clk_N,
    output TMDS_Tx_Clk_P,
    output [2:0]TMDS_Tx_Data_N,
    output [2:0]TMDS_Tx_Data_P
    );
    wire clk_system;
    wire [23:0]RGB_Data;
  //wire [23:0]RGB_Data2;
    wire [23:0]RGB_In;
    wire RGB_HSync;
    wire RGB_VSync;
    wire RGB_VDE;
    wire [11:0]Set_X;
    wire [11:0]Set_Y;
    wire [11:0]bpos_x;
    wire [11:0]bpos_y;
    wire [11:0]pippos_x1;
    wire [11:0]pippos_y1;
    wire [11:0]pippos_x2;
    wire [11:0]pippos_y2;
    wire [11:0]pippos_x3;
    wire [11:0]pippos_y3;
    wire is_over;
    wire Is_over;
    wire is_start;
    wire [3:0]score;
    clk_wiz_0 clk_10(.clk_out1(clk_system),.clk_in1(clk_100MHz));
    //RGBToDvi instantiation
    rgb2dvi_0 rgb2dvi(
        .TMDS_Clk_p(TMDS_Tx_Clk_P),
        .TMDS_Clk_n(TMDS_Tx_Clk_N),
        .TMDS_Data_p(TMDS_Tx_Data_P),
        .TMDS_Data_n(TMDS_Tx_Data_N),
        .aRst_n(1),
        .vid_pData(RGB_Data),
        .vid_pVDE(RGB_VDE),
        .vid_pHSync(RGB_HSync),
        .vid_pVSync(RGB_VSync),
        .PixelClk(clk_system));
    //HDMI driver
   HDMI Driver_HDMI(
        .clk(clk_system),        //Clock
        .Rst(1),                 //Reset signal, low reset
        .Video_Mode(1),          //Video format, 0 is 1920*1080@60Hz, 1 is 1280*720@60Hz
        .RGB_In(RGB_In),         //Input data
        .RGB_Data(RGB_Data),     //Output Data
        .RGB_HSync(RGB_HSync),   //Line signal
        .RGB_VSync(RGB_VSync),   //Field signal
        .RGB_VDE(RGB_VDE),       //Data valid signal
        .Set_X(Set_X),           //Image coordinate X
        .Set_Y(Set_Y)            //Image coordinate Y
        );
        //Video generator
    Video Video_Generator(
        .clk(clk_system),
        .bpos_x(bpos_x),
        .bpos_y(bpos_y),
        .pippos_x1(pippos_x1),
        .pippos_y1(pippos_y1),
        .pippos_x2(pippos_x2),
        .pippos_y2(pippos_y2),
        .pippos_x3(pippos_x3),
        .pippos_y3(pippos_y3),
        .RGB_VDE(RGB_VDE),
        .Set_X(Set_X),
        .Set_Y(Set_Y),
        .is_over(is_over),
        .Is_over(Is_over),
        .is_start(is_start),
        .RGB_Data(RGB_In),
       // .RGB_Data2(RGB_In),
        .score(score)    
        );
        //control bird
      Bird bird(
        .is_start(is_start),
          .clk(clk_system),
          .key1(key1),
          .score(score),
          .bpos_x(bpos_x),
          .bpos_y(bpos_y),
          .is_over(is_over)
        );   
      //control pipe
      Pipe pipe(
          .clk(clk_system),
          .bpos_y(bpos_y),
          .is_over(is_over),
          .Is_over(Is_over),
          .is_start(is_start),
          .pippos_x1(pippos_x1),
          .pippos_y1(pippos_y1),
          .pippos_x2(pippos_x2),
          .pippos_y2(pippos_y2),
          .pippos_x3(pippos_x3),
          .pippos_y3(pippos_y3),
          .score(score)
        );
        //Is the game over
      Isover isover(
          .clk(clk_system),
          .bpos_x(bpos_x),
          .bpos_y(bpos_y),
          .pippos_x1(pippos_x1),
          .pippos_y1(pippos_y1),
          .pippos_x2(pippos_x2),
          .pippos_y2(pippos_y2),
          .pippos_x3(pippos_x3),
          .pippos_y3(pippos_y3),
          .Is_over(Is_over)
          );
          //is the game start
      Isstart isstart(
           .clk(clk_100MHz),
           .key2(key2),
           .is_start(is_start)
           ); 

          
endmodule

