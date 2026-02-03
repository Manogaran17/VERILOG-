module demux1to4_dataflow(d,s0,s1,y0,y1,y2,y3);
  input d,s0,s1;
  output y0,y1,y2,y3;
  
  assign y0=~s0&(~s1)&d;
  assign y1=~s0&s1&d;
  assign y2=s0&~s1&d;
  assign y3=s0&s1&d;
endmodule 
// test bench
module demux1to4;
  reg d,s0,s1;
  wire y0,y1,y2,y3;
  
  demux1to4_dataflow dut(d,s0,s1,y0,y1,y2,y3);
  initial 
    begin
      $monitor("time=%0t,d=%b,s0=%b,s1=%b,y0=%b,y1=%b,y2=%b,y3=%b",$time,d,s0,s1,  y0 ,y1 ,y2 ,y3);
      
       d=0;s0=0;s1=0;#10;
       d=0;s0=0;s1=1;#10;
       d=0;s0=1;s1=0;#10;
       d=0;s0=1;s1=1;#10;
       d=1;s0=0;s1=0;#10;
       d=1;s0=0;s1=1;#10;
       d=1;s0=1;s1=0;#10;
       d=1;s0=1;s1=1;#10;
      $finish;
    end
endmodule 
