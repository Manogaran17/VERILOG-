module sr_Latch(s,r,clk,reset,q);
  input s,r,clk,reset;
  output reg q;
  
  always@(clk or s or r)
    begin
      if (reset)
        q<=0;
      else if(!clk)
      case({s,r})
        2'b00: q <=q;
        2'b01: q <=0;
        2'b10: q <=1;
        2'b11: q <=1'bX;
        default :q <=q; 
      endcase
    end
  module sr_Latch_tb;
   reg s,r,clk,reset;
   wire q;
     
    initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end  
     initial
    begin
    $dumpfile("dump.vcd");
      $dumpvars(1, sr_Latch_tb);
  end 
   sr_Latch dut(s,r,clk,reset,q);
 initial begin
   
      reset=1;s=0;r=0;
   #6 reset=0;
      
    #5 s = 0; r = 0;
    #15 s = 1; r = 0;
    #5 s = 1; r = 0;
    #5 s = 0; r = 1;
   #7 s = 1; r = 1;
   
    #10 $finish;
      
     end 
 endmodule
