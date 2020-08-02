`timescale 1ns / 1ps

module Isover(
input clk,
input [11:0]bpos_x,
input [11:0]bpos_y,
input [11:0]pippos_x1,
input [11:0]pippos_y1,
input [11:0]pippos_x2,
input [11:0]pippos_y2,
input [11:0]pippos_x3,
input [11:0]pippos_y3,   
output Is_over);
reg Is_over0 = 0;
reg [21:0]counter = 0;
reg flag = 0;
always@(posedge clk)
begin
   if(counter == 21'd1000000) 
   begin 
   counter <= 0;
   flag <= 1;
   end
   else begin 
   flag <= 0;
   counter <= counter+1'b1; 
   end
end
always@(posedge clk)
begin
    if(flag)
    begin
    if((pippos_x1-12'd136<bpos_x && bpos_x<pippos_x1+12'd136)&&((bpos_y<pippos_y1-12'd50)||(bpos_y>pippos_y1+12'd50)))
    Is_over0 <= 1;
    else if((pippos_x2-12'd136<bpos_x && bpos_x<pippos_x2+12'd136)&&((bpos_y<pippos_y2-12'd50)||(bpos_y>pippos_y2+12'd50)))
    Is_over0 <= 1;
    else if((pippos_x3-12'd136<bpos_x && bpos_x<pippos_x3+12'd136)&&((bpos_y<pippos_y3-12'd50)||(bpos_y>pippos_y3+12'd50)))
    Is_over0 <= 1;
    else
    Is_over0 <= Is_over0;
    end
end
assign Is_over = Is_over0;
endmodule
