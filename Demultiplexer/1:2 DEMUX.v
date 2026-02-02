// Code your design here
module demux1to2_dataflow (
    input d, s,
    output y0, y1
);
    assign y0 = d & ~s;
    assign y1 = d & s;
endmodule

// test bench 


module demux1to2_dataflow_tb;
    reg d, s;
    wire y0, y1;

    demux1to2_dataflow dut (.d(d), .s(s), .y0(y0), .y1(y1));

    initial begin
        $monitor("Time=%0t | d=%b s=%b | y0=%b y1=%b", $time, d, s, y0, y1);

        d=1; s=0; #10;
        d=1; s=1; #10;
        d=0; s=0; #10;
        d=0; s=1; #10;

        $finish;
    end
endmodule
