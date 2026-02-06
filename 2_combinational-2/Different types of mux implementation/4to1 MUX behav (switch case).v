module mux4to1_behavioural (d0,d1,d2,d3,s0,s1,y);
    input d0,d1,d2,d3,s0,s1; output reg y;

  
  always@(*)
    begin 
      case({s1,s0})
        2'b00 : y = d0;
        2'b01 : y = d1;
        2'b10 : y = d2;
        2'b11 : y = d3;
        default : y = 0;
          endcase
          end 
  
endmodule


// test bench 
// Code your testbench here
// or browse Examples
module mux4to1_tb;

    reg d0,d1,d2,d3;
    reg s0,s1;
    wire y;
 

    mux4to1_behavioural dut (.d0(d0),.d1(d1),.d2(d2),.d3(d3),
                          .s0(s0),.s1(s1),.y(y));

    initial begin
        $monitor("Time=%0t,s1=%b s0=%b,y=%b", $time, s1, s0, y);

       d0=1; d1=0; d2=1; d3=0;
       #10 s1=0; s0=0; #10;
        s1=0; s0=1; #10;
        s1=1; s0=0; #9
        s1=1; s0=1; #10;

        $finish;
    end

endmodule
