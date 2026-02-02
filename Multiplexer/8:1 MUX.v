// Code your design here
module mux8to1_dataflow (
    input d0,d1,d2,d3,d4,d5,d6,d7,
    input s0,s1,s2,
    output y
);
    assign y = (d0 & ~s2 & ~s1 & ~s0) |
               (d1 & ~s2 & ~s1 &  s0) |
               (d2 & ~s2 &  s1 & ~s0) |
               (d3 & ~s2 &  s1 &  s0) |
               (d4 &  s2 & ~s1 & ~s0) |
               (d5 &  s2 & ~s1 &  s0) |
               (d6 &  s2 &  s1 & ~s0) |
               (d7 &  s2 &  s1 &  s0);
endmodule
// test bench 
// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module mux8to1_dataflow_tb;

    reg d0,d1,d2,d3,d4,d5,d6,d7;
    reg s0,s1,s2;
    wire y;

    // Instantiate DUT
    mux8to1_dataflow dut (
        .d0(d0),.d1(d1),.d2(d2),.d3(d3),
        .d4(d4),.d5(d5),.d6(d6),.d7(d7),
        .s0(s0),.s1(s1),.s2(s2),
        .y(y)
    );

    initial begin
        $monitor("Time=%0t | s2=%b s1=%b s0=%b | y=%b", $time, s2,s1,s0,y);

        // Example: only one input high at a time
        d0=1; d1=0; d2=0; d3=0; d4=0; d5=0; d6=0; d7=0;

        // Test all select combinations
        s2=0; s1=0; s0=0; #10;
        s2=0; s1=0; s0=1; #10;
        s2=0; s1=1; s0=0; #10;
        s2=0; s1=1; s0=1; #10;
        s2=1; s1=0; s0=0; #10;
        s2=1; s1=0; s0=1; #10;
        s2=1; s1=1; s0=0; #10;
        s2=1; s1=1; s0=1; #10;

        $finish;
    end

endmodule

