// Code your design here
module comparator_2bit (
    input  [1:0] A,
    input  [1:0] B,
    output G, 
    output E,   
    output L    
);

wire A1 = A[1];
  wire A0 = A[0];
wire B1 = B[1];
 wire B0 = B[0];

assign E = ((A1 & B1) | (~A1 & ~B1)) &((A0 & B0) | (~A0 & ~B0));
   assign G = (A1 & ~B1) | (((A1 & B1) | (~A1 & ~B1)) & (A0 & ~B0));
 assign L = (~A1 & B1) | (((A1 & B1) | (~A1 & ~B1)) & (~A0 & B0));

endmodule

// Code your testbench here
// or browse Examples
module comparator_2bit_tb;

reg [1:0] A, B;
wire G, E, L;

comparator_2bit dut(A, B, G, E, L);

initial begin

    $display(" A  B | G E L ");
    $display("---------------");

    A=0; B=0; #10;
    A=0; B=1; #10;
    A=0; B=2; #10;
    A=0; B=3; #10;
    A=1; B=0; #10;
    A=1; B=1; #10;
    A=1; B=2; #10;
    A=1; B=3; #10;
    A=2; B=0; #10;
    A=2; B=1; #10;
    A=2; B=2; #10;
    A=2; B=3; #10;

    A=3; B=0; #10;
    A=3; B=1; #10;
    A=3; B=2; #10;
    A=3; B=3; #10;

    $finish;
end

initial begin
    $monitor(" %b  %b | %b %b %b", A, B, G, E, L);
end

endmodule
