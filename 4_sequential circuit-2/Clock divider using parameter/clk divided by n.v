//design file 
//clk div by n 
module clkdiv_by_n #(parameter N=8) (input clk_in,rst,output reg clk_out);
  reg [N-1]count;
  always @(posedge clk_in or posedge rst)
    begin 
      if (rst)
        begin 
          count<=0;
          clk_out<=0;
        end 
      else if (count==N-1) begin
        count<=0;
      clk_out<=~clk_out;
    end 
      else begin 
        clk_out<=0;
        count<=count+1;
      end 
    end 
endmodule 
//test bench file 
module clk_div_tb;
  reg clk_in,rst;
  wire clk_out;
  clkdiv_by_n uut(clk_in,rst,clk_out);
  initial begin 
    $monitor ("$time=%0t clk_in=%b rst=%b clk_out=%b ",$time,clk_in,rst,clk_out);
    clk_in=1'b0;
    forever #2 clk_in=~clk_in;
  end 
  initial 
    begin 
      $dumpfile("file.vcd" );
    $dumpvars(1,clk_div_tb);
   end 
   initial begin
     rst=1'b1; 
     #1 rst=1'b0;
     #100 $finish;
   end 
endmodule 
