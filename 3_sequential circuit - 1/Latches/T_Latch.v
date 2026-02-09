module t_latch (
    input  t,
    input  clk,
    output reg q
);

initial q = 0;

always @(*) begin
    if (clk) begin
        if (t)
            q = ~q;
    end
end

endmodule
// test bench 
module t_latch_tb;

reg t, clk;
wire q;

t_latch dut(t, clk, q);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, t_latch_tb);
end

initial begin
    t = 0;       

    #12 t = 1; 
    #18 t = 0; 
    #12 t = 1;
    #12 t = 1; 
    #18 t = 0; 
    #12 t = 1;

    #20 $finish;
end

endmodule
