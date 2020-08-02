`timescale 1ns / 1ps

module Pipe(
input clk,
input [11:0]bpos_y, //as a random number
input is_over,
input Is_over,
input is_start,
output [11:0]pippos_x1,
output [11:0]pippos_y1,
output [11:0]pippos_x2,
output [11:0]pippos_y2,
output [11:0]pippos_x3,
output [11:0]pippos_y3,
output [3:0]score
);
reg [11:0]pippos_x10 = 12'd1200;
reg [11:0]pippos_y10 = 12'd300;
reg [11:0]pippos_x20 = 12'd1700;
reg [11:0]pippos_y20 = 12'd450;
reg [11:0]pippos_x30 = 12'd2200;
reg [11:0]pippos_y30 = 12'd150;
reg [21:0]counter = 0;
reg move = 0;
reg [3:0]speed = 4'd1;
reg [3:0]score0 = 4'd0;


always@(posedge clk)
begin
   if(counter == 21'd1000000) 
   begin 
   move <= 1;
   counter <= 0;
   end
   else begin 
   move <= 0;
   counter <= counter+1'b1; 
   end
end

always@(posedge clk)
begin
if(is_start)
begin
  if(pippos_x10 <= 0) 
  begin
  pippos_x10 = 12'd1560;
  pippos_y10 = bpos_y;
  score0 <= score0 + 1'b1;
  if(pippos_y10 < 12'd150)
  pippos_y10 <= pippos_y10 + 150;
  else if(pippos_y10 > 12'd580)
  pippos_y10 <= pippos_y10 - 150;
  else
  pippos_y10 <= pippos_y10 ;
  end
  else if(pippos_x20 <= 0)
  begin
  score0 <= score0 + 1'b1; 
  pippos_x20 = 12'd1560;
  pippos_y20 = bpos_y;
  if(pippos_y20 < 12'd150)
  pippos_y20 <= pippos_y20 + 150;
  else if(pippos_y20 > 12'd580)
  pippos_y20 <= pippos_y20 - 150;
  else
  pippos_y20 <= pippos_y20;
  end
  else if(pippos_x30 <= 0)
  begin
 // speed <= speed + 1'b1;
  score0 <= score0 + 1'b1;
  pippos_x30 = 12'd1560;
  pippos_y30 = bpos_y;
  if(pippos_y30 < 12'd150)
  pippos_y30 <= pippos_y30 + 150;
  else if(pippos_y30 > 12'd580)
  pippos_y30 <= pippos_y30 - 150;
  else
  pippos_y30 <= pippos_y30;
  end
  else if(move && (!is_over && !Is_over))
  begin 
  pippos_x10 <= pippos_x10 - speed;
  pippos_x20 <= pippos_x20 - speed; 
  pippos_x30 <= pippos_x30 - speed; 
  end
  else 
  begin
  pippos_x10 <= pippos_x10;
  pippos_x20 <= pippos_x20;
  pippos_x30 <= pippos_x30;
  end
end
else
 begin
  pippos_x10 <= pippos_x10;
  pippos_x20 <= pippos_x20;
  pippos_x30 <= pippos_x30;
   pippos_y10<= pippos_y10;
    pippos_y20<= pippos_y20;
     pippos_y30 <=pippos_y30;
     end
     end

assign pippos_x1 = pippos_x10;
assign pippos_y1 = pippos_y10;
assign pippos_x2 = pippos_x20;
assign pippos_y2 = pippos_y20;
assign pippos_x3 = pippos_x30;
assign pippos_y3 = pippos_y30;
assign score = score0;
endmodule
