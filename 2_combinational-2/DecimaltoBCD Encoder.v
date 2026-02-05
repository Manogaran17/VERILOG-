module decimaltoBCD_Encoder(D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,B0,B1,B2,B3);
  input D0,D1,D2,D3,D4,D5,D6,D7,D8,D9;
  output B0,B1,B2,B3;
  
  or g1(B0,D1,D3,D5,D7,D9);
  or g2(B1,D2,D3,D6,D7);
  or g3(B2,D4,D5,D6,D7);
  or g4(B3,D8,D9);
endmodule 

// test bench 
module encoder_tb;
  reg D0,D1,D2,D3,D4,D5,D6,D7,D8,D9;
  wire B0,B1,B2,B3;
  
   decimaltoBCD_Encoder dut(D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,B0,B1,B2,B3);
  initial 
    begin 
      $monitor("Time=%0t,Inputs=%b%b%b%b%b%b%b%b%b%b,BCD=%b%b%b%b"
                  ,$time, D9,D8,D7,D6,D5,D4,D3,D2,D1,D0,
               B3,B2,B1,B0);
    

        #10 D0=1; #10 D0=0;
        #10 D1=1; #10 D1=0;
        #10 D2=1; #10 D2=0;
        #10 D3=1; #10 D3=0;
        #10 D4=1; #10 D4=0;
        #10 D5=1; #10 D5=0;
        #10 D6=1; #10 D6=0;
        #10 D7=1; #10 D7=0;
        #10 D8=1; #10 D8=0;
        #10 D9=1; 

        #10 $finish;
    end

endmodule

  
