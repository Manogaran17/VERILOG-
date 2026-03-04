// Code your design here
module adder(a,b,sum,cin,cout);
  input [3:0]a,b;
  output [3:0]sum;
  input cin;
  output cout;
  wire [4:0]carry;
  
  assign carry[0]=cin;
  
  genvar i;
  
  generate
    for(i=0;i<4;i+=1) begin:adder
      assign {carry[i+1],sum[i]} = a[i] + b[i] + carry[i];
    end 
    endgenerate
  assign cout = carry[4];
endmodule
  
  
  // Code your testbench here
// or browse Examples

module RCA_tb;
   reg [3:0]a,b;
   wire [3:0]sum;
   reg cin;
   wire cout;
  adder dut(a,b,sum,cin,cout);
  initial 
    begin
      $monitor("time=%0t,a=%b,b=%b,sum=%b,cout=%b",$time,a,b,sum,cout);
      a=4'b0001;b=4'b0001;
      #10a=4'b0011;b=4'b0011;
      #10a=4'b1001;b=4'b0001;
      #10a=4'b1001;b=4'b0011;
      #10a=4'b0001;b=4'b0111;
      #10a=4'b1111;b=4'b0111;
      #10a=4'b1111;b=4'b0001;
      #30$finish;
    end 
  initial 
    begin
      $dumpfile("rca.vcd");
      $dumpvars(1,RCA_tb);
    end 
endmodule 
