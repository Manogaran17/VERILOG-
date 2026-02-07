// top module 
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
// instantiation 
    
    module mux4to1(i,s,y);
      input [3:0]i;
      input [1:0]s;
      output reg y;
      wire [1:0]t;
      
      mux2to1 m1(i[1:0],s[0],t[0]);
      mux2to1 m2(i[3:2],s[0],t[1]);
      mux2to1 m3(t,s[1],y);
    endmodule 
// test bench 
module mux4to1_dataflow_tb;

    reg [3:0]i;
      reg [1:0]s;
      wire y;
  

     mux4to1 dut(i,s,y);

    initial begin
      $monitor("Time=%0t,i=%b,s=%b,y=%b", $time, i,s, y);

      i=4'b1011;
      s[1]=0; s[0]=0; #10;
      s[1]=0; s[0]=1; #10;
      s[1]=1; s[0]=0; #10;
      s[1]=1; s[0]=1; #10;

        $finish;
    end

endmodule
