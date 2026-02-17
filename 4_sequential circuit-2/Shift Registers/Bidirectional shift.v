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
  
  
  
  
