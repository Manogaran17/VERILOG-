// Code your design here
module ha(a,b,s,cout);
  input a,b;
  output reg s,cout;
  
  always@(*)
    begin 
  s = (a^b);
  cout = (a&b);
    end 
  
endmodule


// Code your testbench here
// or browse Examples
module ha_tb;
  reg a,b;
  reg s,cout;
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
