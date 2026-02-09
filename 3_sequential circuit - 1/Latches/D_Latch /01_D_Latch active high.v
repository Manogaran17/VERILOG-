module dlatch(d,clk,q);
    input d,clk;
    output reg q;


  always @(clk or d)
    begin
      if(clk)
      q <= d;
      else
        q<=q;      
 end
endmodule


// Code your testbench her

module dlatch_tb;

  reg d;
  reg clk;
  wire q;

  dlatch dut (d,clk,q);
  
  initial
    begin
    $dumpfile("dump.vcd");
      $dumpvars(0, dlatch_tb);
  end 
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  
  initial begin
    d = 0;
   
    #8  d = 1;
    #4 d = 0;
    #6 d = 1;
    #10 d = 1;
    #10 d = 0;
    #5 d = 1; 
    #15 d = 0;
    #20 d = 1;
  
    
 #20 $finish;
  end

endmodule
