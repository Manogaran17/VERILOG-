module and_tb;
  reg a,b;
  wire y;
  and_struc dut(a,b,y);
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
