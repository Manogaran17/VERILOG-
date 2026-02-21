// Code your design here
module moore_nonoverlap_1001(x,clk,rst,y);
  input x,clk,rst;
  output reg y;
  
  parameter[2:0] a=0,b=1,c=2,d=3,e=4;
  reg [2:0] state,nxt_state;
  
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
         b:nxt_state = x?b:c;
         c:nxt_state = x?b:d;
         d:nxt_state = x?e:a;
         e:nxt_state = x?b:a;
        default nxt_state = a;
      endcase
       
    end 
  
  always@(posedge clk)
    begin 
      if(rst)
        y<=0;
      else 
        y<=(state==e);
    end 
    
    endmodule 
// Code your testbench here
// or browse Examples

module moore_nonoverlap_tb;
  reg x,clk,rst;
  wire y;
  
  initial 
    begin
      clk=1;
      forever #5 clk = ~clk;
    end 
 moore_overlap_1001 dut(x,clk,rst,y);
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
      $dumpvars(1,moore_nonoverlap_tb);
    end 
endmodule 
      
      
      
      
        
        
      
