module dff_async (d,clk,asyn_reset,q);
    input d,clk,asyn_reset;
    output reg q;


  always @(posedge clk or posedge asyn_reset)
    begin
    if (asyn_reset)
      q <= 0;
    else
      q <= d;
  end

endmodule



module dff_async_tb;

  reg d;
  reg clk;
  reg asyn_reset;
  wire q;

  dff_async dut (d,clk,asyn_reset,q);
  
  initial
    begin
    $dumpfile("dump.vcd");
    $dumpvars(0, dff_async_tb);
  end 
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  
  initial begin
    d = 0;
    asyn_reset = 1;  

    #12 asyn_reset = 0; 
    #8  d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 d = 0;
    #10 asyn_reset = 1;
    #5 d = 1;
    #15 d = 0;
    #10 asyn_reset = 0;
    #20 d = 1;
  
    
 #20 $finish;
  end

endmodule

