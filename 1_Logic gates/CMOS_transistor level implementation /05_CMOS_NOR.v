// Code your design here

module CMOS_nor(a,b,y);
  input a,b;
  output y;
  
  supply0 gnd;
  supply1 vdd;
  
  wire w1,w2;
  
  nmos p0(w1,vdd,a);
  nmos p1(w1,vdd,b);
  
  pmos n0(w1,w2,a);
  pmos n1(w2,gnd,b);
  
 
  pmos i0(y,vdd,w1);
  nmos i1(y,gnd,w1);
  
endmodule

// Code your testbench here


module CMOS_nortb;
  reg a,b;
  wire y;
  
  CMOS_nor dut(a,b,y);
  initial 
    begin 
      $dumpfile("cmos.vcd");
      $dumpvars(1,CMOS_nortb);
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
