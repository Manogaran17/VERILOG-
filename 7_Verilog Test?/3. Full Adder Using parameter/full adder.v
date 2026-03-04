// Code your design here

module full_adder#(parameter N=8)(a,b,sum,cin,cout);
  input [N-1:0]a,b;
  input cin;
  output cout;
  output reg [N-1:0]sum;
  
  reg [N:0]carry;
  integer i;
  
  always@(*)
    begin
      carry[0]=cin;
      for(i=0;i<N;i+=1)
        begin
      {carry[i+1],sum[i]} = a[i] + b[i] + carry[i];
        end 
    end 
  assign cout = carry[N];
    endmodule 
      
      
  // Code your testbench here
// or browse Examples
module RCA_tb;
  parameter N=8;
  reg [N-1:0]a,b;
  wire [N-1:0]sum;
   reg cin;
   wire cout;
  adder #(N)dut (a,b,sum,cin,cout);
  initial 
    begin
      $strobe("time=%0t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
    
      a=1;b=2;cin=0;
      
      #10 a=2;b=2;cin=0;
      $strobe("time=%0t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
      #10 a=3;b=2;cin=0;
      $strobe("time=%0t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
      #10 a=4;b=2;cin=0;
      $strobe("time=%0t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
      #10 a=5;b=2;cin=0;
      $strobe("time=%0t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
      #10 a=6;b=2;cin=0;
      $strobe("time=%0t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
      #10 a=7;b=2;cin=0;
      $strobe("time=%0t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
    
      #10 a=8;b=2;cin=1;
      $strobe("time=%0t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
      #10 a=9;b=2;cin=1;
      $strobe("time=%0t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
      #10 a=10;b=2;cin=1;
      $strobe("time=%0t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
      #10 a=11;b=2;cin=1;
      $strobe("time=%0t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
      #10 a=12;b=2;cin=1;
      $strobe("time=%0t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
      #10 a=13;b=2;cin=1;
      $strobe("time=%0t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
      #10 a=14;b=2;cin=1;
      $strobe("time=%0t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
      
      
      #30$finish;
    end 
  initial 
    begin
      $dumpfile("rca.vcd");
      $dumpvars(1,RCA_tb);
    end 
endmodule 
  
