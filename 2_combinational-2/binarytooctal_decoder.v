module binarytoOctal_decoder(i,y);
  input [2:0]i;
  output reg [7:0]y;
 
  always@(*)
    begin 
      case(i)
         3'd0 : y=8'b00000001;
         3'd1 : y=8'b00000010;
         3'd2 : y=8'b00000100;
         3'd3 : y=8'b00001000;
         3'd4 : y=8'b00010000;
         3'd5 : y=8'b00100000;
         3'd6 : y=8'b01000000; 
         3'd7 : y=8'b10000000;
        default : y=8'b00000000;
      endcase
    end 
endmodule 

module binarytoOctal_decoder_tb;
  reg [2:0]i;
  wire [7:0]y;
  
  integer k;
  
 binarytoOctal_decoder dut(i,y);
  initial 
    begin
    $dumpfile("decoder.vcd");
      $dumpvars(0,binarytoOctal_decoder_tb);
  end 
  initial 
    begin 
  $monitor("time=%0t,i=%b,y=%b",$time,i,y);
      for(k=0;k<9;k=k+1)
        begin 
          i=k;
             #10;
        end 
    end
endmodule 
