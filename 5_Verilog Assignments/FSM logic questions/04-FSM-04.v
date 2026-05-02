/*The purpose of this lab is to build a Binary-to-BCD converter using the double
dabble algorithm (aka the shift-add-3 algorithm). You will only utilize
combinational circuit components, verify the functionality of the converter using
a testbench*/
============================================================================================================

module binarytobcd_fsm(
  input [7:0] binary_data,
  input clk, rst,start,
  output reg [11:0] bcd,
  output reg done1
);

  parameter idle=0, add=1, shift=2, done=3;

  reg [19:0] register;
  reg [3:0] count;
  reg [1:0] state, nxt_state;

  // State register
  always @(posedge clk or posedge rst) begin
    if(rst)
      state <= idle;
    else
      state <= nxt_state;
  end

  // Next state logic
  always @(*) begin
    case(state)
      idle:  nxt_state =start? add:idle;
      add:   nxt_state = shift;
      shift: nxt_state = (count == 1) ? done : add;
      done:  nxt_state = idle;
      default: nxt_state = idle;
    endcase
  end

  // Datapath
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      register <= 0;
      count <= 0;
      done1 <= 0;
      bcd <= 0;
    end
    else begin
      
      case(state)

        idle: begin
          done1 <= 0;
          count <= 8;
          register[7:0] <= binary_data;
          register[19:8] <= 0;
            
        end

        add: begin
          if(register[11:8] >= 5)
            register[11:8] <= register[11:8] + 3;
          if(register[15:12] >= 5)
            register[15:12] <= register[15:12] + 3;
          if(register[19:16] >= 5)
            register[19:16] <= register[19:16] + 3;
        end

        shift: begin
          register <= register << 1;
          count <= count - 1;
        end

        done: begin
          done1 <= 1;
          bcd <= register[19:8];
        end

      endcase
    end
  end

endmodule

// Code your testbench here
// or browse Examples

module fsm_tb;
  
  reg [7:0]binary_data;
  reg clk,rst,start;
  wire[11:0]bcd;
  wire done1;
  
  binarytobcd_fsm dut(binary_data,clk,rst,start,bcd,done1);
  
  initial clk=0;
  always #5 clk = ~clk;
  
  initial 
  begin
    $monitor("time =%0t | clk=%b | rst=%b |%0d|%0d |%b_%b_%b |%b|done1=%b",$time,clk,rst,dut.count,dut.state,dut.register[19:16],dut.register[15:12],dut.register[11:8],dut.register[7:0],done1);
    
    rst=1; start=0;
    binary_data = 8'b11111111;
    
    #13 rst=0; start=1;
    
    // --- FIRST TEST ---
    wait(done1 == 1); 
    start = 0; // Drop the start signal
    
    // ==========================================
    // THE CRITICAL MISSING STEP
    // Wait for the FSM to return to idle and clear the done flag
    wait(done1 == 0); 
    // ==========================================
    
    // --- SECOND TEST ---
    #10; // Give it a little breathing room 
    binary_data = 8'b00001010; 
    start = 1; // Pulse start again
    
    wait(done1 == 1); 
    start = 0;
    
    #10 $finish;
  end 
  
  initial 
    begin
      $dumpfile("fsm.vcd");
      $dumpvars(1,fsm_tb);
    end 
endmodule




