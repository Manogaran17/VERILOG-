module CMOS_not(a,y);
  input a;
  output y;
  
  supply0 gnd;
  supply1 vdd;
  
  pmos i0(y,vdd,a);
  nmos i1(y,gnd,a);
  
endmodule

// Code your testbench here
// or browse Examples
module CMOS_nottb;
  reg a;
  wire y;
  
  CMOS_not dut(a,y);
  initial 
    begin 
      $dumpfile("cmos.vcd");
      $dumpvars(1,CMOS_nottb);
    end 
  
  initial 
    begin 
      $monitor("time=%0t,a=%b,y=%b",$time,a,y);
      
       a=0;#10;
       a=1;#10;
      
      #50$finish;
    end 
endmodule 
