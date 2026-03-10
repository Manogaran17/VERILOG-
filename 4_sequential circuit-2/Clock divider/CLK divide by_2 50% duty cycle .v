//design file 
module clk_div_2(input clk_in,rst,output reg clk_out);

  always @(posedge clk_in or posedge rst)
    begin
      if(rst)
      clk_out<=0;
     else
      clk_out<=~clk_out;
   end 
endmodule 
//test bench file 
module clk_div_tb;
  reg clk_in,rst;
  wire clk_out;
  clk_div_2 uut(clk_in,rst,clk_out);
  initial begin 
    $monitor ("$time=%0t clk_in=%b rst=%b clk_out=%b ",$time,clk_in,rst,clk_out);
    clk_in=1'b0;
    forever #5 clk_in=~clk_in;
  end 
  initial 
    begin 
      $dumpfile("file.vcd" );
    $dumpvars(1,clk_div_tb);
   end 
   initial begin
     rst=1'b1; 
     #1 rst=1'b0;
     #50 $finish;
   end 
endmodule 
