// Code your design here
module priority_4to2(I,y,valid);
  input[3:0]I;
  output reg[1:0]y;
  output wire valid;
  
  always@(*)
    begin
      if(I[3]==1)
        y=2'b11;
      else if(I[2]==1)
         y=2'b10;
      else if(I[1]==1)
         y=2'b01;
      else if(I[0]==1)
         y=2'b00;
      else
         y=2'b00;
    end 
  assign valid = |I;
  
endmodule 

        // test bench 
// Code your testbench here
// or browse Examples
module priority_tb;
  reg [3:0]I;
  wire [1:0]y;
  wire valid;
  
priority_4to2 dut(I,y,valid);
    initial 
      begin 
        $monitor("time=%0t,I=%b,y=%b,valid=%b",$time,I,y,valid);
        
       
        
        I[0]=1;I[1]=0;I[2]=1;I[3]=0;#10;
        I[0]=0;I[1]=1;I[2]=1;I[3]=0;#10;
        I[0]=0;I[1]=0;I[2]=1;I[3]=1;#10;
        I[0]=0;I[1]=0;I[2]=0;I[3]=1;#10;
        I[0]=1;I[1]=0;I[2]=0;I[3]=0;#10;
        I[0]=0;I[1]=0;I[2]=0;I[3]=0;#10;
        $finish;
      end 
  endmodule 
