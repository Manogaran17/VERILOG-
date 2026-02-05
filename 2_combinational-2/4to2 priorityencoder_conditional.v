module priority_encoder_cond (
    input [3:0] I,
  output [1:0] y,
    output valid
);

  assign y = (I[3])?2'b11:(I[2])?2'b10:(I[1])?2'b01:(I[0])?2'b00:2'b00;

assign valid = |I; 

endmodule
// test bench 
// Code your testbench here
// or browse Examples
module priority_tb;
  reg [3:0]I;
  wire [1:0]y;
  wire valid;
  
priority_encoder_cond dut(I,y,valid);
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
