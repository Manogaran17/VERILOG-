module mux4to1_dataflow (
    input d0,d1,d2,d3,
    input s0,s1,
    output y
);
    assign y = (d0 & ~s1 & ~s0) |
               (d1 & ~s1 &  s0) |
               (d2 &  s1 & ~s0) |
               (d3 &  s1 &  s0);
endmodule

// test bench 


module mux4to1_dataflow_tb;

    reg d0,d1,d2,d3;
    reg s0,s1;
    wire y;

    mux4to1_dataflow dut (.d0(d0),.d1(d1),.d2(d2),.d3(d3),
                          .s0(s0),.s1(s1),.y(y));

    initial begin
        $monitor("Time=%0t | s1=%b s0=%b | y=%b", $time, s1, s0, y);

        d0=1; d1=1; d2=1; d3=1;

        s1=0; s0=0; #10;
        s1=0; s0=1; #10;
        s1=1; s0=0; #10;
        s1=1; s0=1; #10;

        $finish;
    end

endmodule
