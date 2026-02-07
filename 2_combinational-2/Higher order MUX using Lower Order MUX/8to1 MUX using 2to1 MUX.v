// Code your design here
module mux2to1(i,s,y);
  input [1:0]i;
  input s;
  output reg y;
  
  always@(*)
    begin
      if(s)
        y = i[1];
      else if(!s)
        y = i[0];
        else 
          y = 0;
    end 
  endmodule 
    
    module mux8to1(i,s,y);
      input [7:0]i;
      input [2:0]s;
      output reg y;
      wire [5:0]t;
      
      mux2to1 m1(i[1:0],s[0],t[0]);
      mux2to1 m2(i[3:2],s[0],t[1]);
      mux2to1 m3(i[5:4],s[0],t[2]);
      mux2to1 m4(i[7:6],s[0],t[3]);
      mux2to1 m5(t[1:0],s[1],t[4]);
      mux2to1 m6(t[3:2],s[1],t[5]);    
      mux2to1 m7(t[5:4],s[2],y);
    endmodule 


// test bench 

module mux8to1_dataflow_tb;

  reg [7:0]i;
  reg [2:0]s;
     wire y;
  integer k;

     mux8to1 dut(i,s,y);
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
