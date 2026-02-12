module t_ff(t,clk,rst,q);
  input t,clk,rst;
  output reg q;
  
  always@(negedge clk or posedge rst)
    begin
      if(rst)
        q<=0;
      else if(t)
        q<=~q; 
    end
endmodule
module Decade_counter(t,clk,rst,q);
input t,clk,rst;
output reg [3:0]q;
wire rst1;
  assign rst1 = rst|q[3]&q[1];

  

  t_ff m0(.t(1'b1),.clk(clk),.rst(rst1),.q(q[0]));
  t_ff m1(.t(1'b1),.clk(q[0]),.rst(rst1),.q(q[1]));
  t_ff m2(.t(1'b1),.clk(q[1]),.rst(rst1),.q(q[2]));
  t_ff m3(.t(1'b1),.clk(q[2]),.rst(rst1),.q(q[3]));
 
endmodule 
// test bench 
module decade_counter_tb;
  reg clk,rst;
  wire [3:0]q;
  
  initial 
    begin
      clk=1;
      forever #5 clk = ~clk;
    end 
   
   Decade_counter dut(t,clk,rst,q);
  initial 
    begin 
      $monitor("time=%0t,clk=%b,rst=%b,q=%b",$time,clk,rst,q);
     rst=1;
      #8rst=0;
      #200$finish;
    end 
  initial
    begin
      $dumpfile("count.vcd");
      $dumpvars(0,decade_counter_tb);
    end
endmodule 
      
      
  
  


  
  
  



          
