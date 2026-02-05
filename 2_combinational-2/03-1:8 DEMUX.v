module demux1to8_struct (
    input d,
    input s0, s1, s2,
    output y0,y1,y2,y3,y4,y5,y6,y7
);

    wire s0_n, s1_n, s2_n;

   
    not g0(s0_n, s0);
    not g1(s1_n, s1);
    not g2(s2_n, s2);

   
    and g3(y0, d, s2_n, s1_n,s0_n);
    and g4(y1, d, s2_n, s1_n,s0);
    and g5(y2, d, s2_n, s1, s0_n);
    and g6(y3, d, s2_n, s1, s0);
    and g7(y4, d, s2, s1_n, s0_n);
    and g8(y5, d, s2, s1_n, s0);
    and g9(y6, d, s2, s1, s0_n);
    and g10(y7, d, s2, s1, s0);

endmodule
// test bench 
module demux1to8_struct_tb;
    reg d;
    reg s0, s1, s2;
    wire y0,y1,y2,y3,y4,y5,y6,y7;

     demux1to8_struct dut (d,s0,s1,s2,y0,y1,y2,y3,y4,y5,y6,y7);

    initial begin
        $monitor("Time=%0t ,s2=%b s1=%b s0=%b ,y0=%b y1=%b y2=%b y3=%b y4=%b y5=%b y6=%b y7=%b",
                 $time, s2,s1,s0,y0,y1,y2,y3,y4,y5,y6,y7);

        d = 1;
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

