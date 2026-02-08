// Code your design here
module CMOS_or(a,b,w1);
  input a,b;
  output w1;
  
  supply0 gnd;
  supply1 vdd;
  
  wire w1,w2;
  
  nmos p0(w1,vdd,a);
  nmos p1(w1,vdd,b);
  
  pmos n0(w1,w2,a);
  pmos n1(w2,gnd,b);
  
endmodule

// Code your testbench here
// or browse Examples
module CMOS_ortb;
  reg a,b;
  wire w1;
  
  CMOS_or dut(a,b,w1);
  initial 
    begin 
      $dumpfile("cmos.vcd");
      $dumpvars(1,CMOS_ortb);
    end 
  
  initial 
    begin 
      $monitor("time=%0t,a=%b,b=%b,w1=%b",$time,a,b,w1);
      
       a=0;b=0;#10;
       a=0;b=1;#10;
       a=1;b=0;#10;
       a=1;b=1;#10;
      #50$finish;
    end 
endmodule 
       
 
  
  
