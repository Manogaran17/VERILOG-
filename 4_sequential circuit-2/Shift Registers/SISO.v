module shift_register(s_in,clk,rst,s_out);
  input s_in,clk,rst;
  output s_out;
  reg [3:0]regis;
  
  always@(posedge clk)
    begin
      if(rst)
        regis<=4'b0000;
       else
           regis<={regis[2:0],s_in};      
    end 
  assign s_out = regis[3];
endmodule 

  module shift_register_tb;
  reg s_in,clk,rst;
  reg[ 3:0]regis;
  wire s_out;
  
  initial
    begin 
      clk=1;
  forever #5 clk=~clk;
    end 
      
   
   shift_register dut (s_in,clk,rst,s_out);
  initial 
    begin 
      $monitor("time=%0t,s_in=%b,clk=%b,rst=%b,s_out=%b",$time,s_in,clk,rst,s_out);
      
      rst=1; s_in = 0;
      #10rst=0;
      
        s_in = 1; #10;
        s_in = 0; #10;
        s_in = 1; #10;
        s_in = 1; #10;  
        s_in = 0; #40;
      
      #70$finish;
    end
   initial 
        begin 
          $dumpfile("sr.vcd");
          $dumpvars(1,shift_register_tb);
        end 
endmodule 
  
      
