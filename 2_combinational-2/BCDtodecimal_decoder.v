// Code your design here

module BCDtodecimal_decoder(i,y);
  input [3:0]i;
  output reg [9:0]y;
 
  always@(*)
    begin 
      case(i)
        4'd0 : y=10'b0000000001;
        4'd1 : y=10'b0000000010;
        4'd2 : y=10'b0000000100;
        4'd3 : y=10'b0000001000;
        4'd4 : y=10'b0000010000;
        4'd5 : y=10'b0000100000;
        4'd6 : y=10'b0001000000;
        4'd7 : y=10'b0010000000;
        4'd8 : y=10'b0100000000;
        4'd9 : y=10'b1000000000;
        default : y=10'b0000000000;
      endcase
    end 
endmodule 
// Code your testbench here
// or browse Examples

module BCDtodecimal_decoder_tb;
  reg [3:0]i;
  wire [9:0]y;
  
  integer k;
  
  BCDtodecimal_decoder dut(i,y);
  initial 
    begin
    $dumpfile("decoder.vcd");
   $dumpvars(0,BCDtodecimal_decoder_tb);
  end 
  initial 
    begin 
  $monitor("time=%0t,i=%b,y=%b",$time,i,y);
      for(k=0;k<10;k=k+1)
        begin 
          #10;i=k;
        end 
    end
endmodule 
