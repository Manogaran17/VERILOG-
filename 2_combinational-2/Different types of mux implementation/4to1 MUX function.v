// Code your design here

module mux_function(d,s,y);
  input [3:0]d;
  input [1:0]s;
  output y;
  
  function mux;
    input [3:0]i;
    input [1:0]s1;
    begin
      case(s1)
        2'b00:mux=i[3];
        2'b01:mux=i[2];
        2'b10:mux=i[1];
        2'b11:mux=i[0];
        default mux=0;
      endcase
    end 
  endfunction
  
    assign y = mux(d,s);
  
    endmodule 
  // Code your testbench here
// or browse Examples

module mux_tb;
  reg [3:0]d;
  reg [1:0]s;
  wire y;
  
  integer i;
  
  mux_function dut(d,s,y);
  initial 
    begin 
      $monitor("time=%0t,d=%b,s=%b,y=%b",$time,d,s,y);
      d=4'b1011;
      for(i=0;i<4;i=i+1)
        begin
          s=i;
          #10;
        end      
    end 
endmodule 
      
      
      
      
  
