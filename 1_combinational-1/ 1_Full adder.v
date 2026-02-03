module fa_struc(a,b,cin,s,cout);
  input a,b,cin;
  output s,cout;
  wire s1,c1,c2;
  //sum
  xor g1(s1,a,b);
  xor g2(s,s1,cin);
  //carry
  and g3(c1,a,b);
  and g4(c2,cin,s1);
  or g5(cout,c2,c1);
  
endmodule

// test bench 
module hd_tb;
  reg a,b,cin;
  wire s1,c1,c2,s,cout;
  fa_struc dut(a,b,cin,s,cout);
  initial 
    begin 
      $monitor("Time=%0t,a=%b b=%b,cin=%b,s=%b,cout=%b", $time, a, b, cin, s, cout);
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
