/*To design a state diagram and implement a circuit that outputs a "1" if the
aggregate serial binary input is divisible by 5, we first need to understand the
problem and then translate it into Verilog code.*/
==============================================================================================================
// Code your design here
module fsm_divby5(
  
  input x,rst,clk,
  output reg y
 
  
);
  
  localparam [2:0] s0=0,s1=1,s2=2,s3=3,s4=4;
  
  reg [1:0] state,nxt_state;
  
  always@(posedge clk)
    begin
      if(rst)
        state<=s0;
      else
        state<=nxt_state;
    end 
  
  always@(*)
    begin
      case(state)
         s0:nxt_state=x?s1:s0;
         s1:nxt_state=x?s3:s2;
         s2:nxt_state=x?s0:s4;
         s3:nxt_state=x?s2:s1;
         s4:nxt_state=x?s4:s3;
        default:nxt_state=s0;
      endcase
    end 
  
  always@(*)
    begin
      if(rst)
        y=0;
      else
        y=(state==s0);
    end 
  
endmodule 

// Code your testbench here
// or browse Examples
module fsm_tb;
  
  reg x,clk,rst;
  wire y;
  
  initial clk=1;
  always #5 clk=~clk;
  
  fsm_divby5 dut(x,rst,clk,y);
  
  initial 
    begin
      rst=1;
      x=0;
       #10 rst=0;
       #10 x=1;
       #10 x=0;
       #10 x=1;
       #10 x=0;
       #10 x=0;
       #10 x=1;
       #10 x=0;
       #10 x=1;
     
      #70 $finish;
    end 
  
  initial
    begin
      $dumpvars(1,fsm_tb);
      $dumpfile("fsm.vcd");
    end 
endmodule 
