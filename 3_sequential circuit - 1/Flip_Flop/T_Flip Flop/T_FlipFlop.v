// Code your design here
module t_flipflop(t,clk,q);
  input t,clk;
  output reg q;
  
  always@(posedge clk)
    begin
      if(t)
        q <= ~q;
         
    end
endmodule

// Code your testbench here
// or browse Examples
// test bench 
 module t_flipflop_tb;
   reg t,clk;
   wire q;
     
    initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end  
     initial
    begin
    $dumpfile("dump.vcd");
      $dumpvars(0, t_flipflop_tb);
  end 
   t_flipflop dut(t,clk,q);
 initial begin 
       
     t = 0; 
    #12 t = 1; 
    #18 t = 0; 
    #12 t = 1;
    #12 t = 1; 
    #18 t = 0; 
    #12 t = 1;
    #10 $finish;
      
     end 
 endmodule 
