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
      
      
  
