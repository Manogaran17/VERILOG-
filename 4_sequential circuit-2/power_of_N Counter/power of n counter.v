// Code your design here

module power_of_3counter#(parameter N=16)(N1,rst,clk,out);
  input rst,clk;
  input [3:0]N1;
  output reg [N-1:0]out;
  
  
  always@(posedge clk or posedge rst)
    begin 
      if(rst)
        out<=1;
      else 
        out <= out*N1;
    end
  always@(N1)
    out<=1;
    
endmodule 
  
  // Code your testbench here
// or browse Examples

module counter_tb;
  
  parameter N = 16;
  reg rst,clk;
  reg [3:0]N1;
  wire [N-1:0]out;
  initial 
    begin 
      clk=0;
      forever #5 clk=~clk;
    end 
  
  power_of_3counter #(N) dut(N1,rst,clk,out);
  initial 
    begin 
      $monitor("time=%0t,N1=%b,rst=%b,clk=%b,out=%b",$time,N1,rst,clk,out);
      
      rst=1;N1=1;
      #10 rst=0;
       #10 N1=2;
       #50 N1=3;
       #50 N1=4;
       #50 N1=5;
      #50 N1=6;
       #50 N1=7;
       #50 N1=8;
      
      #10$finish;
    end 
  initial 
    begin 
      $dumpfile("count.vcd");
      $dumpvars(1,counter_tb);
    end
endmodule 
      
      
      
    
      
     
  
  
  
