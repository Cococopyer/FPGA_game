`timescale 1ns / 1ps
module Isstart(
input clk,
input key2,
output is_start   //1 is start
    );
    reg [26:0]counter = 0;
    reg [1:0]is_start0 = 2'b0;
    always@(posedge clk)
    begin
    counter <= counter+1'b1;
    if(counter == 50000000)
    begin
    counter <= 0;
    if(!key2) is_start0 <= is_start + 1'b1;
    else is_start0 <= is_start0;
    end
    end
assign is_start = {is_start0[0]};
endmodule

