// Code your design here
module jk_flipflop(j,k,clk,q);
  input j,k,clk;
  output reg q;
  
  always@(posedge clk)
    begin
      case({j,k})
        2'b00: q <=q;
        2'b01: q <=0;
        2'b10: q <=1;
        2'b11: q <=~q;
      endcase
    end
endmodule

        module jk_flipflop_tb;
   reg j,k,clk;
   wire q;
     
    initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end  
     initial
    begin
    $dumpfile("dump.vcd");
    $dumpvars(0, jk_flipflop_tb);
  end 
   jk_flipflop dut(j,k,clk,q);
 initial begin 
       
     j = 0; k = 0;
    #12 j = 0; k = 1;
    #15 j = 1; k = 0;
    #12 j = 1; k = 1;
    #12 j = 0; k = 1;
    #8 j = 1; k = 1;
    #10 $finish;
      
     end 
 endmodule
