// Code your design here
module not_struc(a,y);
  input a;
  output y;
  not g1(y,a);
endmodule

// test bench


module not_tb;
  reg a;
  wire y;
  not_struc dut(a,y);
  initial 
    begin 
      $monitor("Time=%0t,a=%b,y=%b", $time, a, y);
      a=0;#10;
      a=1;#10;
     
      $finish;
    end
endmodule
