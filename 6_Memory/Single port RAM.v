// Code your design here

module single_portRAM(clk,we,rst,data_in,data_out,addr);
  input clk,rst,we;
  input [2:0]addr;
  input [7:0]data_in;
  output reg [7:0]data_out;
  reg [7:0]mem[7:0];
  
  always@(posedge clk or posedge rst)
    begin 
      if(rst)
        begin 
        data_out<=0;
        mem[addr]<=0;
        end 
      else if(we)
        mem[addr]<=data_in;
      else 
        data_out<=mem[addr];
    end 
endmodule 

// Code your testbench here
// or browse Examples

module single_port_tb;
  reg clk,rst,we;
  reg [2:0]addr;
  reg [7:0]data_in;
  wire [7:0]data_out;
  reg [7:0]mem[7:0];
  
  single_portRAM dut(clk,we,rst,data_in,data_out,addr);
  initial 
    $monitor("time=%0t,clk=%b,we=%b,rst=%b,data_in=%b,data_out=%b,addr=%b",$time,clk,we,rst,data_in,data_out,addr);
  initial
    begin
  clk=1;
  forever #5clk=~clk;
  end 
  
  initial 
    begin
    we=1;rst=1;data_in=8'b0;addr=3'b0;
    #10 
     rst=0;
     addr=3'b000;data_in=8'd23;
     #10addr=3'b001;data_in=8'd45;
     #10addr=3'b010;data_in=8'd65;
     #10addr=3'b011;data_in=8'd87;
     #10addr=3'b100;data_in=8'd97;
     #10addr=3'b101;data_in=8'd43;
     #10addr=3'b110;data_in=8'd65;
     #10addr=3'b111;data_in=8'd24;
  #10 we=0;
     addr=3'b000; 
     #10addr=3'b001;
     #10addr=3'b010;
     #10addr=3'b011;
     #10addr=3'b100;
     #10addr=3'b101;
     #10addr=3'b110;
     #10addr=3'b111;
      #50 $finish;
    end
  initial 
    begin
      $dumpfile("single,vcd");
      $dumpvars(1,single_port_tb);
    end 
endmodule 
  
