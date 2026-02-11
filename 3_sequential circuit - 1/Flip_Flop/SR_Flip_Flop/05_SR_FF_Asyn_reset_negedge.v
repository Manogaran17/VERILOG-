module sr_flipflop(s,r,clk,rst,q);
  input s,r,clk,rst;
  output reg q;  
  always@(negedge clk or posedge rst) // asynchronous reset
    begin
      if(rst)
        q<=0;
      else
        begin
      case({s,r})
        2'b00: q <=q;
        2'b01: q <=0;
        2'b10: q <=1;
        2'b11: q <=1'bx;
        default: q<=0;
      endcase
    end
    end
endmodule

module sr_flipflop_tb;
   reg s,r,clk,rst;
   wire q;
     
    initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end  
     initial
    begin
      $dumpfile("sr_flipflop.vcd");
      $dumpvars(1, sr_flipflop_tb);
  end 
  sr_flipflop dut(s,r,clk,rst,q);
 initial begin 
   $monitor("time=%t,s=%b,r=%b,clk=%b,rst=%b,q=%b",$time,s,r,clk,rst,q);
     rst=1;
   s=1;r=0;
   #5 rst=0;
     s = 1; r = 0;
     #12 s = 0; r = 1;
     #5rst=1;s=1;r=1;
   #10 rst=0;
    #10 s = 1; r = 0;
   #2 rst=1;s=1;r=0;
   #5 rst=0;
     #12 s = 1; r = 1;
    #12 s = 0; r = 1;
    #9 s = 1; r = 0;
   #5rst=1;s=1;r=1;
   #6rst=0;
    #12 s = 1; r = 1;
    #10 $finish;
      
     end 
 endmodule 
