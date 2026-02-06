// Code your design here
module dff_sync (d,clk,syn_reset,q);
    input d,clk,syn_reset;
    output reg q;


  always @(posedge clk )
    begin
    if (syn_reset)
      q <= 0;
    else
      q <= d;
  end

endmodule

// test bench 
// Code your testbench here
// or browse Examples


module dff_sync_tb;

  reg d;
  reg clk;
  reg syn_reset;
  wire q;

  dff_sync dut (d,clk,syn_reset,q);
  
  initial
    begin
    $dumpfile("dump.vcd");
    $dumpvars(0, dff_sync_tb);
  end 
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    d = 0;
    syn_reset = 1;  

     #12 syn_reset = 0;

    #8  d = 1;
    #10 d = 0;
    #10 syn_reset = 1;
         d = 1;
    #10 d = 0;
    #10 syn_reset = 0;
         d = 1;
    #10 d = 0;
    #10 d = 1;
         syn_reset = 1;
    #10 syn_reset = 0;
    #10 d = 0;
    #10 d = 1;
 #20 $finish;
  end

endmodule
