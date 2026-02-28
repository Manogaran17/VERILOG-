// Code your design here

module power_of_3counter#(parameter N=16)(rst,clk,out);
  input rst,clk;
  output reg [N-1:0]out;
  
  
  always@(posedge clk or posedge rst)
    begin 
      if(rst)
        out<=1;
      else if (out==(59049))
        out<=1;
      else 
        out<=out*3;
    end
endmodule 
  
  

// Code your testbench here
// or browse Examples

module counter_tb;
  
  parameter N = 16;
  reg rst,clk;
  wire [N-1:0]out;
  initial 
    begin 
      clk=0;
      forever #5 clk=~clk;
    end 
  
  power_of_3counter #(N) dut(rst,clk,out);
  initial 
    begin 
      $monitor("time=%0t,rst=%b,clk=%b,out=%b",$time,rst,clk,out);
      
      rst=1;
      #10 rst=0;
      
      #180$finish;
    end 
  initial 
    begin 
      $dumpfile("count.vcd");
      $dumpvars(1,counter_tb);
    end
endmodule 
      
      
      
    
      
     
  
  
