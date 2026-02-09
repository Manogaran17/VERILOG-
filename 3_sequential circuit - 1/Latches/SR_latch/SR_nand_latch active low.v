module sr_nandLatch(s,r,clk,q);
  input s,r,clk;
  output reg q;
  
  always@(clk or s or r)
    begin
      if(!clk)
      case({s,r})
        2'b00: q <=1'bX;
        2'b01: q <=1;
        2'b10: q <=0;
        2'b11: q <=q;
        default :q <=0; 
      endcase 
    end
endmodule
// Code your testbench here
// or browse Examples
 module sr_nandLatch_tb;
   reg s,r,clk;
   wire q;
     
    initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end  
     initial
    begin
    $dumpfile("dump.vcd");
      $dumpvars(0, sr_nandLatch_tb);
  end 
   sr_nandLatch dut(s,r,clk,q);
 initial begin 
   $monitor("time=%0t,s=%b,r=%b,clk=%b,q=%b",$time,s,r,clk,q);
       
     s = 0; r = 0;
    #12 s = 0; r = 1;
    #18 s = 1; r = 0;
    #12 s = 1; r = 1;
    #5  s = 0; r = 0;
   
    #10 $finish;
      
     end 
 endmodule
