`timescale 1ns / 1ps

module Bird(
    input is_start,
    input clk,
    input key1,
    input [3:0]score,
    output [11:0]bpos_x,
    output [11:0]bpos_y,
    output  is_over);
    reg [11:0]bpos_x0 = 12'd180;
    reg [11:0]bpos_y0 = 12'd360;
    reg [21:0]counter = 0;
    reg [21:0]lift = 0;
    reg is_over0 = 0;   //1 is over
    reg [3:0]speed1 = 4'd1;
    reg [3:0]speed2 = 4'd2;
  always@(posedge clk)
  begin
  if(is_start)
   begin
   if(key1)
   begin
   if(counter <= 21'd700000)  counter <= counter+1'b1;
   else if(bpos_y0 <= 720) 
   begin
   if(score == 5)    
   begin
   speed1 = speed1 + 1;
   bpos_y0 <= bpos_y0 + speed1;
   counter <= 0;
   end
   else
   begin
   bpos_y0 <= bpos_y0 + speed1;
   counter <= 0;
   end
   end
   else is_over0 <= 1;   //drop out of the border 
   end
   else begin
   if(lift <= 21'd900000)  lift <= lift + 1'b1;
   else if(bpos_y0 >= 0) 
   begin
   if(score == 5)
   begin
   speed2 = speed2 + 1; 
   bpos_y0 <= bpos_y0 - speed2;
   lift <= 0;
   end
   else
   begin
   bpos_y0 <= bpos_y0 - speed2;
   lift <= 0;
   end
   end
   else
   bpos_y0 <= 0;     
   end
   end
   else
   begin
   bpos_x0 <= bpos_x0;
   bpos_y0 <= bpos_y0;
   end
   end
assign is_over = is_over0;
assign bpos_x = bpos_x0;
assign bpos_y = bpos_y0;
endmodule
