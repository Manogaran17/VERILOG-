module sequence_detector(x,clk,rst,y);
  input x,clk,rst;
  output reg y;
  
  parameter[1:0] a=0,b=1,c=2,d=3;
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
      if(!x && state==a)
        nxt_state=a;
      else if (x && state==a)
        nxt_state=b;
      else if (!x && state==b)
        nxt_state=c;
      else if (x && state==b)
        nxt_state=b;
      else if (!x && state==c)
        nxt_state=d;
      else if (x && state==c)
        nxt_state=b;
      else if (!x && state==d)
        nxt_state=a;
      else if (x && state==d)
        nxt_state=b;
      else
        nxt_state=a;
    end 
  
  always@(posedge clk)
    begin 
      if(rst)
        y<=0;
      else 
      y<=(state==d && x==1);
    end 
    
    endmodule 


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
