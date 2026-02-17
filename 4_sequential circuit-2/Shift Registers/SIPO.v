module shift_register_SIPO(s_in,clk,rst,p_out);
  input s_in,clk,rst;
  output [3:0]p_out;
  reg [3:0]regis;
  
  always@(posedge clk)
    begin
      if(rst)
        regis<=4'b0000;
       else
           regis<={regis[2:0],s_in};      
    end 
  assign p_out = regis[3:0];
endmodule 

// Code your testbench 

 module shift_register_tb;
  reg s_in,clk,rst;
  reg[ 3:0]regis;
   wire [3:0]p_out;
  
  initial
    begin 
      clk=1;
  forever #5 clk=~clk;
    end 
   shift_register_SIPO dut (s_in,clk,rst,p_out);
  initial 
    begin 
      $monitor("time=%0t,s_in=%b,clk=%b,rst=%b,p_out=%b",$time,s_in,clk,rst,p_out);    
      rst=1; s_in = 0;
      #10 rst=0;
        s_in = 1;#10;
         s_in =0;#10;
        s_in = 1;#10;
         s_in =1;#10;  
        s_in = 0;#40;    
         #70$finish;
    end
   initial 
        begin 
          $dumpfile("sr.vcd");
          $dumpvars(1,shift_register_tb);
        end 
endmodule 
