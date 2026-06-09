// Code your testbench here
// or browse Examples

module alu_test;
  
  reg [31:0]a;
  reg[31:0]b;
  reg[4:0]opcode;
  wire[31:0]out;
  wire carry_flag;
  wire zero_flag;
  
  alu_32bitunsigned dut(a,b,opcode,out,carry_flag,zero_flag);
  
  initial 
    begin
      $monitor("a=%b,b=%b,opcode=%d,out=%b,carry_flag=%b,zero_flag=%b",a,b,opcode,out,carry_flag,zero_flag);
      
      a=0;b=0;opcode=0;
      #10 a=10;b=5;opcode=0;
      #10 opcode=1;
      #10 opcode=2;
      #10 opcode=3;
      #10 opcode=4;
      #10 opcode=5;
      #10 opcode=6;
      #10 opcode=7;
      #10 opcode=8;
      #10 opcode=9;
      #10 opcode=10;
      #10 opcode=11;
      #10 opcode=12;
      #10 opcode=13;
      #10 opcode=14;
      #10 opcode=15;
      #10 opcode=16;
      #10 opcode=17;
      #10 opcode=18;
      #10 opcode=19;
      
    end 
endmodule 
      
      
      
