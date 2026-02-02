module ha(a,b,s,cout);
  input a,b;
  output s,cout;
  xor g2(s,a,b);
  and g1(cout,a,b);
endmodule

// test bench 
module ha_tb;
  reg a,b;
  wire s,cout;
  ha dut(a,b,s,cout);
  initial 
    begin 
      $monitor("Time=%0t,a=%b b=%b,s=%b,cout=%b", $time, a, b, s ,cout);
      a=0;b=0;#10;
      a=0;b=1;#10;
      a=1;b=0;#10;
      a=1;b=1;#10;
      $finish;
    end
endmodule
