// Code your testbench here
// or browse Examples

module melay_overlap_tb;
  reg x,clk,rst;
  wire y;
  
  initial 
    begin
      clk=1;
      forever #5 clk = ~clk;
    end 
 sequence_detector dut(x,clk,rst,y);
  initial 
    begin 
  
  $monitor("time%0t,x=%b,clk=%b,rst=%b,y=%b",$time,x,clk,rst,y);
  
      rst=1;
           x=0;
      #10 rst=0;
      #10 x=1;
      #10 x=0;
      #10 x=0;
      #10 x=1;
      #10 x=0;
      #10 x=0;
      #10 x=1;
      #10 x=0;
      #10 x=0;
      #10 x=1;
      #10 x=0;
      #10 x=0;
      #10 x=1;
      #10 x=0;
      #10 x=0;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #75 $finish;
    end 
  initial 
    begin 
      $dumpfile("fsm.vcd");
      $dumpvars(1,melay_overlap_tb);
    end 
endmodule 
