module dff(d,clk,q);
    input d,clk;
    output reg q;


  always @(posedge clk)
    begin
      q <= d;
  end

endmodule

// test bench 
module dff_async_tb;

  reg d;
  reg clk;
  wire q;

  dff dut (d,clk,q);
  
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
   
    #8  d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 d = 0;
    #5 d = 1;
    #15 d = 0;
    #20 d = 1;
  
    
 #20 $finish;
  end

endmodule


