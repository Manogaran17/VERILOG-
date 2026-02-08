// Code your design here
module CMOS_and(a,b,Y);
  input a,b;
  output Y;
  
  supply0 gnd;
  supply1 vdd;
  
  wire w1,w2;
  
  pmos p0(w1,vdd,a);
  pmos p1(w1,vdd,b);
  
  nmos n0(w1,w2,a);
  nmos n1(w2,gnd,b);
  
  pmos i0(Y,vdd,w1);
  nmos i1(Y,gnd,w1);

endmodule

// Code your testbench here
// or browse Examples
module CMOS_tb;
  reg a,b;
  wire Y;
  
  CMOS_and dut(a,b,Y);
  initial 
    begin 
      $dumpfile("cmos.vcd");
      $dumpvars(1,CMOS_tb);
    end 
  
  initial 
    begin 
      $monitor("time=%0t,a=%b,b=%b,Y=%b",$time,a,b,Y);
      
       a=0;b=0;#10;
       a=0;b=1;#10;
       a=1;b=0;#10;
       a=1;b=1;#10;
       a=0;b=0;#10;
      #50$finish;
    end 
endmodule 
       
 
  
  
