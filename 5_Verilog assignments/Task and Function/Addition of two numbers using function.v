// Code your design here

module adder_function(a,b,sum);
  input [3:0]a,b;
  output reg [4:0]sum;
  
  function [4:0]addition;
    input [3:0]x,y;
    addition = (x+y);
  endfunction
  
  assign sum = addition(a,b);
endmodule 
    
    // Code your testbench here
// or browse Examples
module addition_usingfunction_tb;
  reg [3:0]a,b;
  wire [4:0] sum;
  
  adder_function dut(a,b,sum);
  initial 
    begin
      $monitor("time=%0t,a=%b,b=%b,sum=%b",$time,a,b,sum);
      
      a=3;b=3;
      #10 a=2;b=2;
      #10 a=1;b=2;
      #10 a=3;b=2;
      #10 a=2;b=5;
      #70$finish;
    end 
endmodule 
      
  
