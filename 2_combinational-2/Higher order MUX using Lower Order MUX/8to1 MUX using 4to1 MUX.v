// Code your design here
module MUX4to1(i,s,E,y);
  input [3:0]i;
  input [1:0]s;
  input E;
  output reg y;
  always@(*)
    begin 
      if (E==1) 
      case(s)
        2'b00: y = i[0];
        2'b01: y = i[1];
        2'b10: y = i[2];
        2'b11: y = i[3];
        default : y = 0; 
      endcase
      else 
          y = 0;
    end
      endmodule 
  
  module MUX8to1(i,s,E,y);
    input [7:0]i;
    input [2:0]s;
    input E;
    output reg y;
        wire t1,t2;  
        
    MUX4to1 m0(i[3:0],s[1:0],~s[2],t1);
    MUX4to1 m1(i[7:4],s[1:0],s[2],t2);
    or g1(y,t1,t2);
        endmodule 



// Code your testbench here
// or browse Examples
module mux8to1_tb;
  reg [7:0]i;
  reg [2:0]s;
     wire y,E;
  integer k;

  MUX8to1 dut(i,s,E,y);
    initial begin
      $monitor("Time=%0t,i=%b,s=%b,y=%b", $time, i,s, y);
      i=8'b10111011;
      for(k=0;k<8;k=k+1)
      begin 
      s=k;
        #10;
      end 
    end
endmodule
    
  
  
