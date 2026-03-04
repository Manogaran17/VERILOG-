// Code your design here
// Code your design here
module mealy_overlap_111(x,clk,rst,y);
  input x,clk,rst;
  output reg y;
  
  parameter[1:0] a=0,b=1,c=2;
  reg [1:0] state,nxt_state;
  
  always@(posedge clk)
    begin 
      if(rst)
        state<=a;
      else 
        state<=nxt_state;
    end 
  always@(*)
    begin 
      case(state)
         a:nxt_state = x?b:a;
         b:nxt_state = x?c:a;
         c:nxt_state = x?c:a;
        default nxt_state = a;
      endcase
       
    end 
  
  always@(*)
    begin 
      if(rst)
        y<=0;
      else 
        y<=(state==c);
    end 
    
    endmodule 
// Code your testbench here
// or browse Examples

module mealy_overlap_tb;
  reg x,clk,rst;
  wire y;
  
  initial 
    begin
      clk=1;
      forever#5clk= ~clk;
    end 
 mealy_overlap_111 dut(x,clk,rst,y);
  initial 
    begin 
  
  $monitor("time%0t,x=%b,clk=%b,rst=%b,y=%b",$time,x,clk,rst,y);
  
           rst=1;
           x=0;
      #10 rst=0;
      #10x=1;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=0;
      #10x=0;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10x=1;
      #10 x=1;
      #10 x=0;
      #10 x=0;
      #10 x=1;
      #10x=1;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=0;
      #75 $finish;
    end 
  initial 
    begin 
      $dumpfile("fsm.vcd");
      $dumpvars(1,mealy_overlap_tb);
    end 
endmodule 
