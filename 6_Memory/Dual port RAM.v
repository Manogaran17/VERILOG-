// Code your design here
module dual_port(clk,rst,we1,we2,addr1,addr2,datain1,datain2,dataout1,dataout2);
  input clk,rst,we1,we2;
  input [2:0]addr1,addr2;
  input [7:0]datain1,datain2;
  output reg[7:0]dataout1,dataout2;
  reg[7:0]ram[7:0];
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
        dataout1<=0;
        dataout2<=0;
        ram[addr1]<=0;
        ram[addr2]<=0;
        end 
      else
        begin
    if (we1 && we2)
    begin
        if (addr1 != addr2)
        begin
            ram[addr1] <= datain1;
            ram[addr2] <= datain2;
        end
        else
        begin
            ram[addr1] <= datain1;
        end
    end  
    else if (we1 && !we2)
    begin
        if (addr1 != addr2)
        begin
            ram[addr1] <= datain1;
            dataout2   <= ram[addr2];
        end
        else
        begin
            ram[addr1] <= datain1;
            dataout2   <= datain1;
        end
    end

    else if (!we1 && we2)
    begin
        if (addr1 != addr2)
        begin
            
            ram[addr2] <= datain2;
            dataout1   <= ram[addr1];
        end
        else
        begin

            ram[addr2] <= datain2;
            dataout1   <= datain2;
        end
    end

    else
    begin
        if (addr1 != addr2)
        begin
           
            dataout1 <= ram[addr1];
            dataout2 <= ram[addr2];
        end
        else
        begin
            dataout1 <= ram[addr1];
            dataout2 <= ram[addr1];
        end
    end
end
    end 
endmodule 
      // Code your testbench here
// or browse Examples

module true_dualportRAM_tb;
  reg clk,rst,we1,we2;
  reg [2:0]addr1,addr2;
  reg [7:0]datain1,datain2;
  wire [7:0]dataout1,dataout2;
  reg[7:0]ram[7:0];
  
  initial 
    begin
      clk=0;
      forever #5clk=~clk;
    end 
  
  
  dual_port dut(clk,rst,we1,we2,addr1,addr2,datain1,datain2,dataout1,dataout2);
      
    initial begin
    rst=1; we1=0; we2=0;
    addr1=0; addr2=0;
    datain1=0; datain2=0;

    #12 rst=0; 
    #10;
    $display("CASE 1: WW Different");
    we1=1; we2=1;
    addr1=3'b000; datain1=8'd32;
    addr2=3'b001; datain2=8'd45;
    #10;
    $display("CASE 2: WW Same");
    addr1=3'b010; datain1=8'd32;
    addr2=3'b010; datain2=8'd45;
      
    #10;
    $display("CASE 3: W1-R2 Different");
    we1=1; we2=0;
    addr1=3'b100; datain1=8'd55;
    addr2=3'b001;
    #10;
    $display("CASE 4: W1-R2 Same");
    addr1=3'b100; datain1=8'd60;
    addr2=3'b100;
    #10;
    $display("CASE 5: R1-W2 Different");
    we1=0; we2=1;
    addr1=3'b000;
    addr2=3'b101; datain2=8'd70;
    #10;
    $display("CASE 6: R1-W2 Same");
    addr1=3'b101;
    addr2=3'b101; datain2=8'd80;
    #10;
    $display("CASE 7: RR Different");
    we1=0; we2=0;
    addr1=3'b000;
    addr2=3'b001;
    #10;
    $display("CASE 8: RR Same");
    addr1=3'b010;
    addr2=3'b010;

    #30 $finish;


end 
  initial 
    begin 
      $dumpfile("dualport,vcd");
      $dumpvars(1,true_dualportRAM_tb);
    end 
endmodule  
  
  
