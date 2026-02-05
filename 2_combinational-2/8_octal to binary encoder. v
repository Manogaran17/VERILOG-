// Code your design here
module octaltobinary_behav(D0,D1,D2,D3,D4,D5,D6,D7,B0,B1,B2);
  input D0,D1,D2,D3,D4,D5,D6,D7;
  output reg B0,B1,B2;
  always@(*)
    begin
  
  B0 = (D1|D3|D5|D7);
  B1 = (D2|D3|D6|D7);
  B2 = (D4|D5|D6|D7);
 
    end 
endmodule

// Code your testbench here

module encoder_tb;
  reg D0,D1,D2,D3,D4,D5,D6,D7;
  reg B0,B1,B2;
  
   octaltobinary_behav dut(D0,D1,D2,D3,D4,D5,D6,D7,B0,B1,B2);
  initial 
    begin 
      $monitor("Time=%0t,Inputs=%b%b%b%b%b%b%b%b,binary=%b%b%b"
                  ,$time,D7,D6,D5,D4,D3,D2,D1,D0,B2,B1,B0);
    

        #10 D0=1; #10 D0=0;
        #10 D1=1; #10 D1=0;
        #10 D2=1; #10 D2=0;
        #10 D3=1; #10 D3=0;
        #10 D4=1; #10 D4=0;
        #10 D5=1; #10 D5=0;
        #10 D6=1; #10 D6=0;
        #10 D7=1; 

        #10 $finish;
    end

endmodule
