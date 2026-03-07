// Code your design here

module FIFO_syn(datain,dataout,clk,rst,full,empty,we,re);
  input clk,rst,we,re;
  reg [3:0]wrpt,rdpt;
  output full,empty;
  input [7:0]datain;
  output reg[7:0]dataout;
  
  reg[7:0]mem[0:7];
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
        wrpt<=0;
        rdpt<=0;
        dataout<=0;
        end
      else
        begin
       if(we&&!full) 
        begin
          mem[wrpt[2:0]]<=datain;   
          wrpt<=wrpt+1;
        end 
          else
            wrpt<=wrpt;
       if(re&&!empty)
        begin
          dataout<=mem[rdpt[2:0]];
           rdpt<=rdpt+1;
        end 
          else
            rdpt<=rdpt;
    end
    end
  assign full = ((wrpt[3]!=rdpt[3])&&(wrpt[2:0]==rdpt[2:0]));
  assign empty = (wrpt==rdpt);
endmodule 

module fifo_syn_tb;
  
  reg clk,rst,we,re;
  wire full,empty;
  reg [7:0]datain;
  wire [7:0]dataout;
  
  initial 
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end 
      
  FIFO_syn dut(datain,dataout,clk,rst,full,empty,we,re);
  
  initial 
    begin
      $monitor("time=%0t datain=%b dataout=%b clk=%b rst=%b full=%b empty=%b we=%b re=%b wrpt=%0d rdpt=%0d",
         $time,datain,dataout,clk,rst,full,empty,we,re,dut.wrpt,dut.rdpt);

      rst=1; datain=0; we=1; re=0;datain=5;

      #12 rst=0;

      // write operation
      #10 datain=6;re=1;
      #10 datain=7;re=1;
      #10 datain=8;
      #10 datain=9;re=0;
      #10 datain=10;
      #10 datain=11;
      #10 datain=12;
      #10 datain=13;
      #10 datain=14;
      #10 datain=15;
      
      // read operation
      #10 re=1; we=0;
      #10 re=1;
      #10 re=1;
      #10 re=1;
      #10 re=1;
      #10 re=1;
      #10 re=1;
      #30 $finish;
    end 

  initial 
    begin
      $dumpfile("fifo.vcd");
      $dumpvars(0,fifo_syn_tb);
    end 

endmodule
  
  
  
