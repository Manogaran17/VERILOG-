module pipo_shift_register(p_in,clk,rst,p_out);
    input clk ,rst;
  input [3:0]p_in;
  output reg [3:0]p_out;


    always @(posedge clk) begin
        if (rst)
            p_out <= 4'b0000;
        else
            p_out <= p_in;
    end

endmodule



// Code your testbench here
// or browse Examples

module pipo_shift_register_tb;
    reg clk;
    reg rst;
    reg [3:0]p_in;
    wire [3:0]p_out;

  pipo_shift_register dut (p_in,clk,rst,p_out);

    initial
      begin
      clk= 0;
   forever#5clk =~clk;
      end

    initial begin
        rst= 1; p_in =4'b0000;
        #10;
        rst =0;

       p_in=4'b1010;#10;
        p_in=4'b1100;#10;
        p_in=4'b0111;#10;
         p_in=4'b0011;#20;

        $finish;
    end
   initial 
        begin 
          $dumpfile("sr.vcd");
          $dumpvars(0,pipo_shift_register_tb);
        end 

    initial begin
      $monitor("time%0t,clk=%b,rst=%b,p_in=%b,p_out=%b",  $time,clk,rst,p_in,p_out);
    end

endmodule

