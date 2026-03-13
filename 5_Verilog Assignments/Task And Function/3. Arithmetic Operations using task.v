module Arithmetic_operations1(a,b,s,result1);
  input [3:0]a,b;
  input [1:0]s;
  output reg [7:0]result1;
  
  task Arithmetic_operations;
    input [3:0]x,y;
    input [1:0]s;
    output [7:0]result2;
    begin
    case(s)
      2'b00: result2 = x+y;
      2'b01: result2 = x-y;
      2'b10: result2 = x*y;
      2'b11: result2 = x/y;
      default result2 = 7'b00000000;
   endcase 
    end 
  endtask
    
    always@(*) 
      Arithmetic_operations(a,b,s,result1);  
    
endmodule 

// test bench 
// Code your testbench here
// or browse Examples
module Arithmetic_operations_tb;
  reg [3:0]a,b;
  reg [1:0]s;
  wire [7:0] result1;
  
  Arithmetic_operations1 dut(a,b,s,result1);
  initial 
    begin
      $monitor("time=%0t,a=%b,b=%b,s=%b,result1=%b",$time,a,b,s,result1);
      s=2'b00;
      a=3;b=3;
      
      #10 a=2;b=2;s=2'b01;
      #10 a=1;b=2;s=2'b10;
      #10 a=3;b=2;s=2'b00;
      #10 a=10;b=5;s=2'b11;
      #70$finish;
    end 
endmodule 
      
  
    
