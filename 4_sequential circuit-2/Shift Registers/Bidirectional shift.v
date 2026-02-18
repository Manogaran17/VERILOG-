module dff(d,clk,rst,q);
  input d,clk,rst;
  output reg q;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        q<=0;
      else
        q<=d;
    end 
endmodule 

module bidirectional_shift(clk,rst,q,sin,sout,m);
  input clk,rst,sin,m;
  output [3:0]q;
  output sout;
  wire y0,y1,y2,y3;
  
  assign y0 = (sin&m)|(~m&q[2]);
  assign y1 = (q[3]&m)|(~m&q[1]);
  assign y2 = (q[2]&m)|(~m&q[0]);
  assign y3 = (q[1]&m)|(~m&sin);
  
  dff m0(.d(y0),.clk(clk),.rst(rst),.q(q[3]));
  dff m1(.d(y1),.clk(clk),.rst(rst),.q(q[2]));
  dff m2(.d(y2),.clk(clk),.rst(rst),.q(q[1]));
  dff m3(.d(y3),.clk(clk),.rst(rst),.q(q[0]));

  assign sout = (m) ? q[0] : q[3];
    
endmodule   
  
  // test bench 
// Code your testbench here
// or browse Examples

module bidirectionalshift_tb;
  reg clk,rst,sin,m;
  wire [3:0]q;
  wire sout;
  
  initial
    begin
      clk=0;
     forever #5 clk = ~clk;
    end 
  
  bidirectional_shift dut(clk,rst,q,sin,sout,m);
  initial 
    begin 
      $monitor("time=%0t,clk=%b,rst=%b,m=%b,sin=%b,sout=%b",$time,clk,rst,m,sin,sout);
      

        rst = 1; sin = 0; m = 0;
        #10 rst = 0;

       
        m = 0; 
        sin = 1; #10;
        sin = 0; #10;
        sin = 1; #10;
        sin = 1; #10;
        sin = 0; #10;

       
        m = 1;
        sin = 1; #10;
        sin = 0; #10;
        sin = 1; #10;
        sin = 0; #10;

        #170$finish;
    end
  initial 
    begin 
      $dumpfile("shift.vcd");
      $dumpvars(1,bidirectionalshift_tb);
    end 
endmodule 

  
  
