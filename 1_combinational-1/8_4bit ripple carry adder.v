// Code your design here

module fulladder_dataflow (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module ripple_carry_adder_4bit (
    input  [3:0] a,
    input  [3:0] b,
    input        cin,
    output [3:0] sum,
    output       cout
);
    wire c1, c2, c3;

    fulladder_dataflow FA0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1));
    fulladder_dataflow FA1 (.a(a[1]), .b(b[1]), .cin(c1),  .sum(sum[1]), .cout(c2));
    fulladder_dataflow FA2 (.a(a[2]), .b(b[2]), .cin(c2),  .sum(sum[2]), .cout(c3));
    fulladder_dataflow FA3 (.a(a[3]), .b(b[3]), .cin(c3),  .sum(sum[3]), .cout(cout));
endmodule


// test bench 

module rca_4bit_tb;

    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

  ripple_carry_adder_4bit dut (a,b,cin,sum,cout);

    initial begin
       
        $monitor("Time=%0t | a=%b b=%b cin=%b | sum=%b cout=%b",
                  $time, a, b, cin, sum, cout);
       a = 4'b0000; b = 4'b0000; cin = 0; #10; 
        a = 4'b0011; b = 4'b0101; cin = 0; #10;  
        a = 4'b1111; b = 4'b0001; cin = 0; #10; 
        a = 4'b1010; b = 4'b0101; cin = 1; #10; 

        $finish;
    end

endmodule

