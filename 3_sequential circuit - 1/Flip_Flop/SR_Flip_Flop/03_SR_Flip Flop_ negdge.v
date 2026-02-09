module sr_flipflop(s,r,clk,q);
  input s,r,clk;
  output reg q;
  
  always@(negedge clk)
    begin
      case({s,r})
        2'b00: q <=q;
        2'b01: q <=0;
        2'b10: q <=1;
        2'b11: q <=1'bX;
      endcase
    end
endmodule

// test bench 
 module sr_flipflop_tb;
   reg s,r,clk;
   wire q;
     
    initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end  
     initial
    begin
    $dumpfile("dump.vcd");
    $dumpvars(0, sr_flipflop_tb);
  end 
   sr_flipflop dut(s,r,clk,q);
 initial begin 
       
     s = 0; r = 0;
    #12 s = 0; r = 1;
    #15 s = 1; r = 0;
    #12 s = 1; r = 1;
    #10 $finish;
      
     end 
 endmodule 
