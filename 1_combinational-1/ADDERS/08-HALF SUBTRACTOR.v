module HA_dataflow(a,b,D,B);
  input a,b;
  output D,B;
 assign D=(a^b);
  assign B=((~a)&b);
endmodule

//test bench 
// Code your testbench here
// or browse Examples
module HS_tb;
  reg a,b;
  wire D,B;
  HA_dataflow dut (a,b,D,B);
    initial
      begin 
        $monitor("time = %0t,a=%b,b=%b,D=%b,B=%b",$time,a,b,D,B);       
     a=0;b=0;#10;
     a=0;b=1;#10;
     a=1;b=0;#10;           
     a=1;b=1;#10;
             
      $finish;
    end
endmodule
