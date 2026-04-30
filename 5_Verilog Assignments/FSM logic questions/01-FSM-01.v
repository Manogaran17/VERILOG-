// Code your design here

module fsm(
  input x,clk,rst,
  output reg y
);
  
  parameter [1:0] a=0,b=1,c=2;
  
  reg [2:0] state ,nxt_state;
  
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
         a:nxt_state=x?b:a;
         b:nxt_state=x?c:a;
         c:nxt_state=x?c:a;
        default:y=a;
      endcase
    end 
  
  always@(posedge clk)
    begin
      if(rst)
        y<=0;
      else
        y<=(state==c);
    end 
endmodule 

// Code your testbench here
// or browse Examples
module fsm_tb;
  
  reg x,rst,clk;
  wire y;
  
  fsm dut(x,clk,rst,y);
  
  initial clk=1;
  always #5clk =~clk;
  
  initial 
    begin
      $monitor("x=%b rst=%b clk=%b y=%b",x,rst,clk,y);
      
      x=0;rst=1;
      
      #10 rst=0;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=0;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=0;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      #10 x=0;
      #10 x=1;
      #10 x=1;
      #10 x=1;
      $finish;
      
    end 
  initial 
    begin
      $dumpfile("fsm.vcd");
      $dumpvars(1,fsm_tb);
    end 
  
endmodule 
    
