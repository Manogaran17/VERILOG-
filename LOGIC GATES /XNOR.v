module xnor_struc(a,b,y);
  input a,b;
  output y;
  xnor g1(y,a,b);
endmodule

// test  bench 
module xnor_tb;
  reg a,b;
  wire y;
  xnor_struc dut(a,b,y);
  initial 
    begin 
    $monitor("Time=%0t,a=%b b=%b,y=%b", $time, a, b, y);
      a=0;b=0;#10;
      a=0;b=1;#10;
      a=1;b=0;#10;
      a=1;b=1;#10;
      $finish;
    end
endmodule
