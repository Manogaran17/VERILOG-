module sr_flipflop(s,r,clk,q);
  input s,r,clk;
  output reg q;  
  always@(posedge clk)
    begin
      case({s,r})
        2'b00: q <=q;
        2'b01: q <=0;
        2'b10: q <=1;
        2'b11: q <=1'bx;
        default: q<=0;
      endcase
    end
endmodule
// Code your testbench here 
 module sr_flipflop_tb;
   reg s,r,clk;
   wire q;
     
    initial begin
    clk = 1;
    forever #5 clk = ~clk;
  end  
     initial
    begin
    $dumpfile("dump.vcd");
    $dumpvars(0, sr_flipflop_tb);
  end 
   sr_flipflop dut(s,r,clk,q);
 initial begin 
   $monitor("time=%t,s=%b,r=%b,clk=%b,q=%b",$time,s,r,clk,q);
     
     s = 1; r = 0;
     #12 s = 0; r = 1;
    #18 s = 1; r = 0;
     #12 s = 1; r = 1;
   
    #12 s = 0; r = 1;
    #18 s = 1; r = 0;
    #12 s = 1; r = 1;
    #10 $finish;
      
     end 
 endmodule 

