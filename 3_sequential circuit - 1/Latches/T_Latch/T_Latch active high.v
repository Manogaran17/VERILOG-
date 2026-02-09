// Code your design here
module t_latch (
    input  t,
    input  clk,
    input  rst,
    output reg q
);

always @(*) begin
    if (rst)
        q = 1'b0;
    else if (clk && t)
        q = ~q;
end

endmodule
module t_latch_tb;

reg t, clk, rst;
wire q;

t_latch dut(t, clk, rst, q);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, t_latch_tb);
end

initial begin
    rst = 1;
    t   = 0;

    #12 rst = 0;

    #12 t = 1; 
    #18 t = 0; 
    #12 t = 1;
    #12 t = 1; 
    #18 t = 0; 
    #12 t = 1;

    #20 rst = 1;
    #10 rst = 0;

    #20 $finish;
end

endmodule
