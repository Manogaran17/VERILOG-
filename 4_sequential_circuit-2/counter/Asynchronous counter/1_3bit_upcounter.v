// Code your design here
module jk_ff(j,k,clk,rst,q);
  input j,k,clk,rst;
  output reg q;
  
  always@(negedge clk)
    begin 
      if(rst)
        q<=0;
      else
        begin 
          case({j,k})
            2'b00:q<=q;
            2'b01:q<=0;
            2'b10:q<=1;
            2'b11:q<=~q;
            default:q<=q;
          endcase
        end
    end
      endmodule 
      
      module Asyn_counter_3bit(j,k,clk,rst,q);
        input clk,rst;
        input [2:0]j,k;
        output [2:0]q;
        
        jk_ff m1(j[0],k[0],clk,rst,q[0]);
        jk_ff m2(j[1],k[1],q[0],rst,q[1]);
        jk_ff m3(j[2],k[2],q[1],rst,q[2]);
      endmodule 
        
