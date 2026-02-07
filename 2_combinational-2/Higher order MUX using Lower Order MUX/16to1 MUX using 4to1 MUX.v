// Code your design here
module MUX4to1(i,s,y);
  input [3:0]i;
  input [1:0]s;
  output reg y;
  always@(*)
    begin  
      case(s)
        2'b00: y = i[0];
        2'b01: y = i[1];
        2'b10: y = i[2];
        2'b11: y = i[3];
        default : y = 0; 
      endcase
    end
      endmodule 
  
  module MUX16to1(i,s,y);
    input [15:0]i;
    input [3:0]s;
    output reg y;
    wire [3:0]t; 
        
    MUX4to1 m0(i[3:0],s[1:0],t[0]);
    MUX4to1 m1(i[7:4],s[1:0],t[1]);
    MUX4to1 m2(i[11:8],s[1:0],t[2]);
    MUX4to1 m3(i[15:12],s[1:0],t[3]);
    MUX4to1 m4(t,s[3:2],y);
    
        endmodule 

// test bench 

module mux16to1_tb;
  reg [15:0]i;
  reg [3:0]s;
     wire y;
  integer k;

  MUX16to1 dut(i,s,y);
    initial begin
      $monitor("Time=%0t,i=%b,s=%b,y=%b", $time, i,s, y);
      i=16'b1011101110111011;
      for(k=0;k<16;k=k+1)
      begin 
      s=k;
        #10;
      end 
    end
endmodule





    
  
  
