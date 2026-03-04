// Code your design here

module clock_divider(clkin,rst,clkout);
  input clkin,rst;
  output reg clkout;
  localparam maxcount = 249999;
  integer count;
  
  always@(posedge clkin or posedge rst)
    begin
      if(rst)
        begin
        clkout<=0;
        count<=0;
        end 
      else if (count==maxcount)
        begin
        count<=0;
        clkout = ~clkout;
        end
      else 
        count=count+1;
    end 
endmodule

// Code your testbench here
// or browse Examples

module clk_div_tb;
  reg clkin,rst;
  wire clkout;
  
  clock_divider dut(clkin,rst,clkout);
  initial 
    begin
      clkin=0;
      forever #10 clkin = ~clkin;
    end 
  initial 
    begin
      $dumpfile("clk.vcd");
      $dumpvars(1,clk_div_tb);
    end
  initial 
    begin
      rst = 1;
      #10 rst=0;
      #2000000$finish;
    end 
endmodule 
  
  
  
