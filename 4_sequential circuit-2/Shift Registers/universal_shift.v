// Code your design here
module universal_shift(s,clk,rst,d,q,sin,sout);
  input [1:0]s;
  input [3:0]d;
  input clk,rst;
  input sin;
  output reg [3:0]q;
  output sout ;
 
  assign sout = rst?1'b0:(s==2'b01)?q[0]:(s==2'b10)?q[3]:1'b0;
  
  
  
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
  wire sout;
 
  
  initial 
    begin 
       clk=1;
      forever #10 clk = ~clk;
    end 
  
  universal_shift dut(s,clk,rst,d,q,sin,sout);
  initial
    begin 
      $monitor("time=%0t,clk=%b,s=%b,rst=%b,d=%b,sin=%b,q=%b",$time,clk,s,rst,d,sin,q,sout);
      
     rst = 1; s = 2'b00; sin = 0;d=4'b1001;
    #25 rst = 0;
      #20 s= 2'b00;
    s = 2'b01;

    #20sin = 1;
    #20sin = 0;
     #20sin = 1;
    #20 sin = 0;
      
    #30rst = 1;
    #20 rst = 0;
    s = 2'b10;

    #20 sin = 1;
      #20 sin = 0;
    #20 sin = 1;
    #20 sin = 0;
      #20 s=2'b11;

    #100 $finish;
      
    end
  initial 
    begin 
      $dumpfile("universal.vcd");
      $dumpvars(1,universal_tb);
    end 
endmodule 
      
      
 
        
      
