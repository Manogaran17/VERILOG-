
// Code your design here
module mux2to1_dataflow (
    input d0, d1,
    input s,
    output y
);
    assign y = (~s & d0) | (s & d1);
endmodule

// test bemch 


module mux2to1_dataflow_tb;

    reg d0, d1, s;
    wire y;

   
    mux2to1_dataflow dut (.d0(d0), .d1(d1), .s(s), .y(y));

    initial begin
        $monitor("Time=%0t | d0=%b d1=%b s=%b | y=%b", $time, d0, d1, s, y);
        d0=0; d1=0; s=0; #10;
        d0=0; d1=1; s=0; #10;
        d0=1; d1=0; s=1; #10;
        d0=1; d1=1; s=1; #10;

        $finish;
    end

endmodule
