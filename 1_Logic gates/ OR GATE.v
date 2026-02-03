// Code your design here
module or_struc(a,b,y);
  input a,b;
  output y;
  or g1(y,a,b);
endmodule

// test bench
// Code your testbench here
// or browse Examples
module or_tb;
  reg A,B;
  wire y;
  or_struc dut(A,B,y);
  initial 
    begin 
      $monitor("Time=%0t,A=%b B=%b,y=%b", $time, A, B, y);
      A=0;B=0;#10;
      A=0;B=1;#10;
      A=1;B=0;#10;
      A=1;B=1;#10;
      $finish;
    end
endmodule
