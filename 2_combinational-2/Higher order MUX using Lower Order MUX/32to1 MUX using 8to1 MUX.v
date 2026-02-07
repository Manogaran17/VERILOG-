// Code your design here
module MUX8to1(i,s,E,y);
  input[7:0]i;
  input [2:0]s;
  input E;
  output y;
  
  assign y = E&(s[2]?(s[1]?(s[0]?i[7]:i[6]):(s[0]?i[5]:i[4])):(s[1]?(s[0]?i[3]:i[2]):(s[0]?i[1]:i[0])));
  
endmodule 

module MUX32to1(i,s,E,y);
  input[31:0]i;
  input [4:0]s;
  output  y;
  input E;
  wire [7:0]x;
  
  assign x[0] = ~s[4]&~s[3];
  assign x[1] = ~s[4]&s[3];
  assign x[2] = s[4]&~s[3];
  assign x[3] = s[4]&s[3];

  
  
  MUX8to1 mo(i[7:0],s[2:0],x[0],x[4]); 
  MUX8to1 m1(i[15:8],s[2:0],x[1],x[5]); 
  MUX8to1 m2(i[23:16],s[2:0],x[2],x[6]); 
  MUX8to1 m3(i[31:24],s[2:0],x[3],x[7]); 
  
  or g1(y,x[4],x[5],x[6],x[7]);
  
endmodule 

module mux32to1_tb;
  reg [31:0]i;
  reg [4:0]s;
  wire y;
  wire E;
  integer k;

  MUX32to1 dut(i,s,E,y);
    initial begin
      $monitor("Time=%0t,i=%b,s=%b,y=%b", $time, i,s, y);
      i=32'b01110111011101110111011101110111;
      for(k=0;k<32;k=k+1)
      begin 
      s=k;
        #10;
      end 
    end
endmodule
  
  
  
  
