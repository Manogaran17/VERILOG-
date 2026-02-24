// Code your design here
module universal_shift(s,clk,rst,d,q,sin);
  input [1:0]s;
  input [3:0]d;
  input clk,rst;
  input sin;
  output reg [3:0]q;
 
  
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        q<=4'b0000;
      else 
        begin 
      case(s)
        2'b00: q <= q;
        2'b01: q <= {sin,q[3:1]}; // right shift 
        2'b10: q <= {q[2:0],sin}; // left shift
        2'b11: q <= d;
      endcase 
    end 
    end 
  
endmodule 
  // test bench 

  // Code your testbench here
// or browse Examples
module universal_tb;
  reg [1:0]s;
  reg [3:0]d;
  reg clk,rst;
  reg sin;
  reg [3:0]q;
 
  
  initial 
    begin 
       clk=1;
      forever #10 clk = ~clk;
    end 
  
  universal_shift dut(s,clk,rst,d,q,sin);
  initial
    begin 
      $monitor("time=%0t,clk=%b,s=%b,rst=%b,d=%b,sin=%b,q=%b",$time,clk,s,rst,d,sin,q);
      
      rst = 1;sin=1;d=4'b1001;
      #15 rst=0;
      
        #10 s=2'b00;       
       #50 s=2'b01; 
       #80 s=2'b10;#5 sin=0;
       #70 s=2'b11;
      #100 $finish;
    end
  initial 
    begin 
      $dumpfile("universal.vcd");
      $dumpvars(1,universal_tb);
    end 
endmodule 
      
      
 
  
        
      
