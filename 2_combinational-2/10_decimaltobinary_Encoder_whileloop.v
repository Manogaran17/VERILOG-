module decimal_to_binary_encoder (
    input  [9:0] D,     // one-hot decimal input
    output reg [3:0] B  // 4-bit binary output
);

integer i;

always @(*) begin
    B = 4'b0000;   // default output
    i = 0;

    while (i < 10) begin
        if (D[i] == 1'b1)
            B = i[3:0];   // assign index value
        i = i + 1;
    end
end

endmodule

// testbench 

module encoder_tb;

  reg  [9:0] D;     // 10-bit one-hot input
  wire [3:0] B;     // 4-bit binary output

  decimal_to_binary_encoder dut (D, B);

  initial begin

    $monitor("Time=%0t, D=%b, B=%b", $time, D, B);

    D = 10'b0000000000;

    #10 D = 10'b0000000001;  // 0
    #10 D = 10'b0000000010;  // 1
    #10 D = 10'b0000000100;  // 2
    #10 D = 10'b0000001000;  // 3
    #10 D = 10'b0000010000;  // 4
    #10 D = 10'b0000100000;  // 5
    #10 D = 10'b0001000000;  // 6
    #10 D = 10'b0010000000;  // 7
    #10 D = 10'b0100000000;  // 8
    #10 D = 10'b1000000000;  // 9

    #10 $finish;

  end

endmodule
