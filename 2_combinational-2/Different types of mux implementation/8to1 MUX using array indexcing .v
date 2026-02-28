module mux(d,s,y);
  input [7:0]d;
  input [2:0]s;
  output reg y;
  
  always@(*)
    begin
  assign y = d[s];
    end 
endmodule 
// Code your testbench here
// or browse Examples

module mux_tb;
  reg [7:0]d;
  reg [2:0]s;
  wire y;
  
  integer i;
  
  mux dut(d,s,y);
  initial 
    begin 
      $monitor("time=%0t,d=%b,s=%b,y=%b",$time,d,s,y);
      d=8'b10111011;
      for(i=0;i<8;i=i+1)
        begin
          s=i;
          #10;
        end      
    end 
endmodule 
      
      
      
      
  
