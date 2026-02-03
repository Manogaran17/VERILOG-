
module full_sub_struc(a,b,bin,D,B);
  input a,b,bin;
  output D,B;
  assign D=(a^b^bin);
  assign B=(~a&bin)|(~a&b)|(b&bin);
endmodule 

// Code your testbench here
// or browse Examples

module FS_tb;
  reg a,b,bin;
  wire D,B;
  
  full_sub_struc dut(a,b,bin,D,B);
  initial 
    begin
      $monitor("time=%0t,a=%b,b=%b,bin=%b,B=%b,D=%b",$time,a,b,bin,D,B);
     a=0;b=0;bin=0;#10;
     a=0;b=0;bin=1;#10;
     a=0;b=1;bin=0;#10;
     a=0;b=1;bin=1;#10;
     a=1;b=0;bin=0;#10;
     a=1;b=0;bin=1;#10;
     a=1;b=1;bin=0;#10;
     a=1;b=1;bin=1;#10;
      $finish;
    end 
endmodule 
      
  
