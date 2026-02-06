// Code your design here
module mux4to1_dataflow ( d0,d1,d2,d3,s0,s1,y);
    input d0,d1,d2,d3,s0,s1;
  output y;wire [5:0]w;
  
  
  not(w[0],s0);
  not(w[1],s1);
  
  and(w[2],w[1],w[0],d0);
  and(w[3],w[1],s0,d1);
  and(w[4],s1,w[0],d2);
  and(w[5],s1,s0,d3);
  
  or (y,w[2],w[3],w[4],w[5]);
 
          
endmodule

// test bench 
// Code your testbench here
// or browse Examples
module mux4to1_dataflow_tb;

    reg d0,d1,d2,d3;
    reg s0,s1;
    wire y;
  wire [5:0]w;

    mux4to1_dataflow dut (.d0(d0),.d1(d1),.d2(d2),.d3(d3),
                          .s0(s0),.s1(s1),.y(y));

    initial begin
        $monitor("Time=%0t,s1=%b s0=%b,y=%b", $time, s1, s0, y);

       d0=1; d1=1; d2=1; d3=1;
        s1=0; s0=0; #10;
        s1=0; s0=1; #10;
        s1=1; s0=0; #9
        s1=1; s0=1; #10;

        $finish;
    end

endmodule
