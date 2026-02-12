
module t_ff(t,clk,rst,q,qbar);
  input t,clk,rst;
  output reg q,qbar;
  
  always@(negedge clk or posedge rst)
    begin
      if(rst)
        begin
        q<=0;
        qbar<=1;
        end
      else if(t)
        begin
        q<=~q;
        qbar<=~qbar;
        end   
    end
endmodule 

module updown_counter(m,clk,rst,q,qbar);
  input m,clk,rst;
  output[2:0]q,qbar;
  wire y1,y2;
  
  assign y1 = (~m&q[0]|m&qbar[0]);
  assign y2 = (~m&q[1]|m&qbar[1]);
  
  t_ff m0(.t(1'b1),.rst(rst),.clk(clk),.q(q[0]),.qbar(qbar[0]));
  t_ff m1(.t(1'b1),.rst(rst),.clk(y1),.q(q[1]),.qbar(qbar[1]));
  t_ff m2(.t(1'b1),.rst(rst),.clk(y2),.q(q[2]),.qbar(qbar[2]));
endmodule 
  
  // test bench 
module updown_counter_tb;
  reg clk,rst,m;
  wire [2:0]q,qbar;
  
  initial 
    begin
      clk=1;
      forever #5 clk = ~clk;
    end 
  
   updown_counter dut(m,clk,rst,q,qbar);
  initial 
    begin 
    $monitor("time=%0t,clk=%b,rst=%b,m=%b,q=%b",$time,clk,rst,m,q);
      rst=1;m=1;
      #5 rst=0;
     
      
      #79 rst=1;m=0;
      #5 rst=0;
      #92$finish;
      
    end 
  initial
    begin
      $dumpfile("count.vcd");
      $dumpvars(0,updown_counter_tb);
    end
endmodule 
      
      
  
  
  



          
