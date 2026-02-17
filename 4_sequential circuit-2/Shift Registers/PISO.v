module shift_register_PISO(p_in,clk,rst,load,s_out);
  input clk,rst,load ;
  input [3:0] p_in;
  output s_out;
  reg [3:0]regis;
  
  always@(posedge clk)
    begin
      if(rst)
        begin
        regis<=4'b0000;
        
        end
      else if(!load)
        regis <= p_in;
      else
          regis<={regis[2:0],1'b0};               
    end 
  assign s_out =regis[3];
endmodule 

// test bench 
module shift_register_tb;
  reg clk,rst,load;
  reg[ 3:0]regis;
  reg [3:0]p_in;
  wire s_out;
   
  
  initial
    begin 
      clk=1;
  forever #5 clk=~clk;
    end 
   shift_register_PISO dut (p_in,clk,rst,load,s_out);
   initial begin
    $monitor("time=%0t p_in=%b clk=%b rst=%b load=%b regis=%b s_out=%b",
             $time,p_in,clk,rst,load,dut.regis,s_out);

    rst = 1; load = 0; p_in = 4'b0000;
    #10;

    rst = 0;
    p_in = 4'b1010; load = 0;
    #10;

    load = 1;
    #40;

    $finish;
  end
   initial 
        begin 
          $dumpfile("sr.vcd");
          $dumpvars(1,shift_register_tb);
        end 
endmodule 
