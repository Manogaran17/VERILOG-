// Code your design here
module jk_ff(j,k,clk,rst,q);
  input j,k,clk,rst;
  output reg q;
  
  always@(negedge clk )
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
        // test bench 
// Code your testbench here
// or browse Examples
module asyn_counter_tb;
  reg clk,rst;
  reg [2:0]j,k;
  wire [2:0]q;
  
  Asyn_counter_3bit dut(j,k,clk,rst,q);
  initial
    begin 
      clk=0;
      forever #5 clk = ~clk;
    end
   initial 
        begin
          $dumpfile("count.vcd");
          $dumpvars(0,asyn_counter_tb);
        end 
  initial 
    begin
      $monitor("time=%0t,clk=%b,rst=%b,q=%b",$time,clk,rst,q);
    
      j[0]=1;k[0]=1;
      j[1]=1;k[1]=1;
      j[2]=1;k[2]=1;
       rst=1;
      #8 rst=0;
      #80$finish;
     
    end 
          
      endmodule 
      
