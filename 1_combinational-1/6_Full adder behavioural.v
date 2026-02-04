module full_adder_behav(a,b,cin,sum,cout);
  input a,b,cin;
  output reg sum,cout;
  always@(*)
    begin 
  sum = (a^b^cin);
  cout = (a&b)|cin&(a^b);
  end 
endmodule 

// test bench 
module hd_tb;
  reg a,b,cin;
  reg sum,cout;
  full_adder_behav dut(a,b,cin,sum,cout);
  initial 
    begin 
      $monitor("Time=%0t,a=%b b=%b,cin=%b,sum=%b,cout=%b", $time, a, b, cin, sum, cout);
      a=0;b=0;cin=0;#10;
      a=0;b=0;cin=1;#10;
     a=0;b=1;cin=0;#10;
     a=0;b=1;cin=1;#10;
     a=1;b=0;cin=0;#10;
     a=1;b=0;cin=1;#10;
     a=1;b=1;cin=0;#10;
     a=1;b=1;cin=1;#10;
    
      $finish;
    end
endmodule
