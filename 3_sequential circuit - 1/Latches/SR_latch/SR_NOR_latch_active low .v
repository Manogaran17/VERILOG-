// Code your design here
module sr_Latch(s,r,clk,q);
  input s,r,clk;
  output reg q;
  
  always@(clk or s or r)
    begin
      q=1'b0;
      if(!clk)  // active low
      case({s,r})
        2'b00: q <=q;
        2'b01: q <=0;
        2'b10: q <=1;
        2'b11: q <=1'bX;
        default :q <=q; 
      endcase
    end
endmodule
 module sr_Latch_tb;
   reg s,r,clk;
   wire q;
     
    initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end  
     initial
    begin
    $dumpfile("dump.vcd");
      $dumpvars(0, sr_Latch_tb);
  end 
   sr_Latch dut(s,r,clk,q);
 initial begin 
       
     s = 0; r = 0;
    #12 s = 0; r = 1;
    #18 s = 1; r = 0;
    #12 s = 1; r = 1;
    #5  s = 0; r = 0;
   
    #10 $finish;
      
     end 
 endmodule
