// Code your design he

module MUX_8to1(I,s,y);
  input [7:0]I;
  input [2:0]s;
  output y;
  
  assign y =  s[2]?(s[1]?(s[0]?I[7]:I[6]):(s[0]?I[5]:I[4])):(s[1]?(s[0]?I[3]:I[2]):(s[0]?I[1]:I[0]));
  
endmodule 
  // test bench 
// Code your testbench here
// or browse Examples


module mux8to1_tb;

  reg  [7:0] I;
  reg  [2:0] s;
  wire y;

  integer k;

  MUX_8to1 dut(I,s,y);

  

  initial begin
    $monitor("time=%0t,I=%b,s=%b,y=%b",$time,I,s,y);
    I = 8'b10101011;

    for (k = 0; k < 8; k = k + 1) begin
      s = k;
      #10;
    end

    #10 $finish;
  end

endmodule
