// Code your design here

module binarytobcd_fsm(

  input [7:0]binary_data,
  input clk,rst,
  output reg[11:0]bcd,
  output reg done1
  
);
  
  parameter idle=0,add=1,shift=2,done=3;
  
  reg[19:0]register;
  reg[3:0]count;
  
  reg[1:0]state,nxt_state;
  
  always@(posedge clk)
    begin
      if(rst)
        state<=idle;
      else
        state<=nxt_state;
    end 
  
  always@(*)
    begin
      case(state)
        idle:begin
          count<=4'd8;
          register[7:0]<=binary_data;
          register[19:8]<=12'b0;
          nxt_state<=add;
          done1<=0;
          bcd<=0;
        end 
        
        add:begin
          
          if(register[11:8] >= 5)
            register[11:8]<=register[11:8]+3;
          
          if(register[15:12] >= 5)
            register[15:12] <= register[15:12]+3;
          
          if(register[19:16] >= 5)
            register[19:16]<=register[19:16]+3;
          
           nxt_state<= shift;
        end 
        
        
        shift:begin
          
          register <= register << 1'b1;
          count <= count-1'b1;
          
          if(count==1'b1)
            state<=done;
          else
             nxt_state<=add;
          
        end
        
        done:begin
          
          done1<=1;
          bcd<=register[19:8];
          nxt_state<=idle;
          
        end 
        
        default: nxt_state<=idle;
      endcase
      
    end
  
endmodule 


// Code your testbench here
// or browse Examples

module fsm_tb;
  
  reg [7:0]binary_data;
  reg clk,rst;
  wire[12:0]bcd;
  wire done1;
  
  binarytobcd_fsm dut(binary_data,clk,rst,bcd,done1);
  
  initial clk=0;
  always #5 clk = ~clk;
  
  initial 
  begin
    $monitor("time =%0t binary_data=%b clk=%b rst=%b bcd=%b done1=%b",$time,binary_data,clk,rst,bcd,done1);
    
    rst=1;
    binary_data=8'b0;
    #10 rst=0;
    #10 binary_data=8'b11111111; // 255
   #200 $finish;
    
  end 
  
  initial 
    begin
      $dumpfile("fsm.vcd");
      $dumpvars(1,fsm_tb);
    end 
endmodule
