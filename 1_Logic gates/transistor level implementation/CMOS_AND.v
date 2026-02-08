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
  
 
  
  
