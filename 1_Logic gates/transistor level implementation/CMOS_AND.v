// Code your design here
module CMOS_and(a,b,y);
  input a,b;
  output y;
  
  supply0 gnd;
  supply1 vdd;
  
  wire w1,w2;
  
  pmos p0(w1,vdd,a);
  pmos p1(w1,vdd,b);
  
  nmos n0(w1,w2,a);
  nmos n1(w2,gnd,b);
  
  pmos i0(y,vdd,w1);
  nmos i1(y,gnd,w1);
  
endmodule
  // Code your testbench here
// or browse Examples

module CMOS_tb;
  reg a,b;
  wire y;
  
  CMOS_and dut(a,b,y);
  initial 
    begin 
      $dumpfile("cmos.vcd");
      $dumpvars(1,CMOS_tb);
    end 
  
  initial 
    begin 
      $monitor("time=%0t,a=%b,b=%b,y=%b",$time,a,b,y);
      
       a=0;b=0;#10;
       a=0;b=1;#10;
       a=1;b=0;#10;
       a=1;b=1;#10;
      #50$finish;
    end 
endmodule 
       
 
  
  
