`timescale 1ns / 1ps
//Image generation part
module Video(
    input clk,
    input [11:0]bpos_x,
    input [11:0]bpos_y,
    input [11:0]pippos_x1,
    input [11:0]pippos_y1,
    input [11:0]pippos_x2,
    input [11:0]pippos_y2,
    input [11:0]pippos_x3,
    input [11:0]pippos_y3,
    input RGB_VDE,
    input [11:0]Set_X,
    input [11:0]Set_Y,
    input is_over,
    input Is_over,
    input is_start,
    input [3:0]score,
    output reg[23:0]RGB_Data=24'hffff00
   // output reg[23:0]RGB_Data2=24'hffff00  //RBG
    );
    reg [13:0]Address1 = 0;
  //  reg [13:0]Address2 = 0;
    wire [7:0]R_Data1;
    wire [7:0]G_Data1;
    wire [7:0]B_Data1;
  //  wire [7:0]R_Data2;
  // wire [7:0]G_Data2;
  // wire [7:0]B_Data2;
always@(*)
begin
if(is_start)
begin
if(!is_over && !Is_over)   //Game interface
        begin
            if ( (Set_X >= bpos_x-12'd50) && (Set_X < bpos_x+12'd50) &&(Set_Y >= bpos_y-12'd50)&&(Set_Y < bpos_y+12'd50))
              begin
                  Address1=(Set_X-bpos_x+12'd50)*100+(Set_Y-bpos_y+12'd51);
                  RGB_Data<={R_Data1,B_Data1,G_Data1};
               end  //bird model
            else if( (Set_X >= pippos_x1-12'd86 && Set_X <= pippos_x1+12'd86) && ((Set_Y >= 0 && Set_Y <= pippos_y1-12'd100)||( Set_Y >= pippos_y1 + 12'd100 && Set_Y <= 12'd720)))
              begin  
                   RGB_Data <= 24'h93db70;
              end
            else if( (Set_X >= pippos_x2-12'd86 && Set_X <= pippos_x2+12'd86) && ((Set_Y >= 0 && Set_Y <= pippos_y2-12'd100)||( Set_Y >= pippos_y2 + 12'd100 && Set_Y <= 12'd720)))
              begin  
                   RGB_Data <= 24'hff6ec7;
              end
            else if( (Set_X >= pippos_x3-12'd86 && Set_X <= pippos_x3+12'd86) && ((Set_Y >= 0 && Set_Y <= pippos_y3-12'd100)||( Set_Y >= pippos_y3 + 12'd100 && Set_Y <= 12'd720)))
              begin  
                   RGB_Data <= 24'h38b0de;
              end   //pipe model
            else   
               RGB_Data <= 24'hffffff; 
        end
else
            begin
                case(score)
                4'd0:begin
                  if((Set_X>=530&&Set_X<750)&&(Set_Y>=110&&Set_Y<150))
                  RGB_Data<=24'h000000;
                  else if((Set_X>=750&&Set_X<790)&&(Set_Y>=110&&Set_Y<380))
                  RGB_Data<=24'h000000;
                  else if((Set_X>=750&&Set_X<790)&&(Set_Y>=340&&Set_Y<610))
                  RGB_Data<=24'h000000;
                  else if((Set_X>=530&&Set_X<750)&&(Set_Y>=570&&Set_Y<610))
                  RGB_Data<=24'h000000;
                  else if((Set_X>=490&&Set_X<530)&&(Set_Y>=340&&Set_Y<610))
                  RGB_Data<=24'h000000;
                  else if((Set_X>=490&&Set_X<530)&&(Set_Y>=110&&Set_Y<380))
                  RGB_Data<=24'h000000;
                  else 
                  RGB_Data<=24'hff0000;
                  end
                4'd1:begin
                   if((Set_X>=750&&Set_X<790)&&(Set_Y>=110&&Set_Y<380))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=750&&Set_X<790)&&(Set_Y>=340&&Set_Y<610))
                   RGB_Data<=24'h000000;
                   else
                   RGB_Data<=24'hff0000;
                   end
                4'd2:begin
                   if((Set_X>=530&&Set_X<750)&&(Set_Y>=110&&Set_Y<150))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=750&&Set_X<790)&&(Set_Y>=110&&Set_Y<380))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=530&&Set_X<750)&&(Set_Y>=340&&Set_Y<380))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=490&&Set_X<530)&&(Set_Y>=340&&Set_Y<610))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=530&&Set_X<750)&&(Set_Y>=570&&Set_Y<610))
                   RGB_Data<=24'h000000;
                   else
                   RGB_Data<=24'hff0000;
                  end
                4'd3:begin
                   if((Set_X>=530&&Set_X<750)&&(Set_Y>=110&&Set_Y<150))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=750&&Set_X<790)&&(Set_Y>=110&&Set_Y<380))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=750&&Set_X<790)&&(Set_Y>=340&&Set_Y<610))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=530&&Set_X<750)&&(Set_Y>=570&&Set_Y<610))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=530&&Set_X<750)&&(Set_Y>=340&&Set_Y<380))
                   RGB_Data<=24'h000000;
                   else
                   RGB_Data<=24'hff0000;
                  end
                4'd4:begin
                   if((Set_X>=750&&Set_X<790)&&(Set_Y>=110&&Set_Y<380))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=750&&Set_X<790)&&(Set_Y>=340&&Set_Y<610))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=490&&Set_X<530)&&(Set_Y>=110&&Set_Y<380))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=530&&Set_X<750)&&(Set_Y>=340&&Set_Y<380))
                   RGB_Data<=24'h000000;
                   else
                   RGB_Data<=24'hff0000;
                  end
                4'd5:begin
                   if((Set_X>=530&&Set_X<750)&&(Set_Y>=110&&Set_Y<150))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=750&&Set_X<790)&&(Set_Y>=340&&Set_Y<610))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=530&&Set_X<750)&&(Set_Y>=570&&Set_Y<610))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=490&&Set_X<530)&&(Set_Y>=110&&Set_Y<380))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=530&&Set_X<750)&&(Set_Y>=340&&Set_Y<380))
                   RGB_Data<=24'h000000;
                   else
                   RGB_Data<=24'hff0000;
                  end
                4'd6:begin
                   if((Set_X>=530&&Set_X<750)&&(Set_Y>=110&&Set_Y<150))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=750&&Set_X<790)&&(Set_Y>=340&&Set_Y<610))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=530&&Set_X<750)&&(Set_Y>=570&&Set_Y<610))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=490&&Set_X<530)&&(Set_Y>=110&&Set_Y<380))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=530&&Set_X<750)&&(Set_Y>=340&&Set_Y<380))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=490&&Set_X<530)&&(Set_Y>=340&&Set_Y<610))
                   RGB_Data<=24'h000000;
                   else
                   RGB_Data<=24'hff0000;
                  end
                4'd7:begin
                   if((Set_X>=530&&Set_X<750)&&(Set_Y>=110&&Set_Y<150))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=750&&Set_X<790)&&(Set_Y>=110&&Set_Y<380))
                   RGB_Data<=24'h000000;
                   else if((Set_X>=750&&Set_X<790)&&(Set_Y>=340&&Set_Y<610))
                   RGB_Data<=24'h000000;
                   else
                   RGB_Data<=24'hff0000;
                  end
                 4'd8:begin
                    if((Set_X>=530&&Set_X<750)&&(Set_Y>=110&&Set_Y<150))
                    RGB_Data<=24'h000000;
                    else if((Set_X>=750&&Set_X<790)&&(Set_Y>=110&&Set_Y<380))
                    RGB_Data<=24'h000000;
                    else if((Set_X>=750&&Set_X<790)&&(Set_Y>=340&&Set_Y<610))
                    RGB_Data<=24'h000000;
                    else if((Set_X>=530&&Set_X<750)&&(Set_Y>=570&&Set_Y<610))
                    RGB_Data<=24'h000000;
                    else if((Set_X>=490&&Set_X<530)&&(Set_Y>=340&&Set_Y<610))
                    RGB_Data<=24'h000000;
                    else if((Set_X>=490&&Set_X<530)&&(Set_Y>=110&&Set_Y<380))
                    RGB_Data<=24'h000000;
                    else if((Set_X>=530&&Set_X<750)&&(Set_Y>=340&&Set_Y<380))
                    RGB_Data<=24'h000000;
                    else 
                    RGB_Data<=24'hff0000;
                   end
                 4'd9:begin
                    if((Set_X>=530&&Set_X<750)&&(Set_Y>=110&&Set_Y<150))
                    RGB_Data<=24'h000000;
                    else if((Set_X>=750&&Set_X<790)&&(Set_Y>=110&&Set_Y<380))
                    RGB_Data<=24'h000000;
                    else if((Set_X>=750&&Set_X<790)&&(Set_Y>=340&&Set_Y<610))
                    RGB_Data<=24'h000000;
                    else if((Set_X>=530&&Set_X<750)&&(Set_Y>=570&&Set_Y<610))
                    RGB_Data<=24'h000000;
                    else if((Set_X>=530&&Set_X<750)&&(Set_Y>=340&&Set_Y<380))
                    RGB_Data<=24'h000000;
                    else if((Set_X>=490&&Set_X<530)&&(Set_Y>=110&&Set_Y<380))
                    RGB_Data<=24'h000000;
                    else
                    RGB_Data<=24'hff0000;
                   end
                 default:RGB_Data <= 24'h32cd32;   //green means success
               endcase
            end
end
else
begin
     if(((Set_X >=100 && Set_X <=125) || (Set_X >= 275 && Set_X <=300) || (Set_X >= 600 && Set_X <= 625) || (Set_X >=825 && Set_X <= 850) || (Set_X >=950 && Set_X <= 975) || (Set_X 
>=1075 && Set_X <= 1100)) && (Set_Y >= 210 && Set_Y <= 510))
    RGB_Data<=24'h87ceeb;
else if(((Set_X >=200 && Set_X <=225) || (Set_X >= 450 && Set_X <=475) || (Set_X >= 750 && Set_X <= 775) || (Set_X >=900 && Set_X <= 925) || (Set_X >=1000 && Set_X <= 1025)) && 
(Set_Y >= 210 && Set_Y <= 510))
    RGB_Data<=24'h87ceeb;
else if(((Set_X >=275 && Set_X <= 400) || (Set_X >=600 && Set_X <= 700) || (Set_X >=750 && Set_X <= 850) || (Set_X >=900 && Set_X <= 1000) ||  (Set_X >=1100 && Set_X <= 1200)) && 
(Set_Y >=210 && Set_Y <= 235))
    RGB_Data<=24'h87ceeb;
else if((Set_X >= 150 && Set_X <= 175) && (Set_Y >= 360 && Set_Y <= 485)) 
    RGB_Data<=24'h87ceeb;
else if(((Set_X >=100 && Set_X <= 225) || (Set_X >=275 && Set_X <= 400) || (Set_X >=450 && Set_X <= 550) || (Set_X >=600 && Set_X <= 700) || (Set_X >=750 && Set_X <= 850) || (Set_X 
>=1100 && Set_X <= 1200)) && (Set_Y >=485 && Set_Y <= 510))
    RGB_Data<=24'h87ceeb;
else if(((Set_X >= 275 && Set_X <= 400) || (Set_X >= 1075 && Set_X <= 1200)) && (Set_Y >= 360 && Set_Y <= 385))
    RGB_Data<=24'h87ceeb;
else RGB_Data<=24'hffffff;
   
end
end
    PICTURE_R_ROM R_ROM (
      .clka(clk),    // input wire clka
      .ena(1),      // input wire ena
      .addra(Address1),  // input wire [13 : 0] addra
      .douta(R_Data1)  // output wire [7 : 0] douta
    );
    PICTURE_G_ROM G_ROM (
      .clka(clk),    // input wire clka
      .ena(1),      // input wire ena
      .addra(Address1),  // input wire [13 : 0] addra
      .douta(G_Data1)  // output wire [7 : 0] douta
    );
    PICTURE_B_ROM B_ROM (
      .clka(clk),    // input wire clka
      .ena(1),      // input wire ena
      .addra(Address1),  // input wire [13 : 0] addra
      .douta(B_Data1)
    );
    
  /*  INTER_R_ROM_1 face_R_ROM (
      .clka(clk),    // input wire clka
      .ena(1),      // input wire ena
      .addra(Address2),  // input wire [13 : 0] addra
      .douta(R_Data2)  // output wire [7 : 0] douta
    );
    INTER_G_ROM_1 face_G_ROM (
      .clka(clk),    // input wire clka
      .ena(1),      // input wire ena
      .addra(Address2),  // input wire [13 : 0] addra
      .douta(G_Data2)  // output wire [7 : 0] douta
    );
    INTER_B_ROM_1 face_B_ROM (
      .clka(clk),    // input wire clka
      .ena(1),      // input wire ena
      .addra(Address2),  // input wire [13 : 0] addra
      .douta(B_Data2)
    );*/
endmodule
