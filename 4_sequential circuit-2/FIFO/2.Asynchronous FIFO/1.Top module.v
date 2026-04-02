   
  module asyn_fifo(
  input wclk,rclk,we,re,
  input wrst,rrst,
    input [7:0]datain,
    output [7:0]dataout,
  output full,empty
  
);
  parameter pt_width =$clog2(8);
  
  wire [pt_width:0]bwr_ptr,brd_ptr;
  wire [pt_width:0]gwr_ptr,grd_ptr;
  wire [pt_width:0]gwr_ptrsyn,grd_ptrsyn;
  
  synchronizer wr_ptrsyn(
    .clk(rclk),
    .rst(rrst),
    .gin(gwr_ptr),
    .gout(gwr_ptrsyn)
  );
  
   synchronizer  rd_ptrsyn(
     .clk(wclk),
     .rst(wrst),
     .gin(grd_ptr),
     .gout(grd_ptrsyn)
  );
  
  write_pointer_handler wr_ptr_h(
    .wclk(wclk),
    .wrst(wrst),
    .we(we),
    .grd_ptrsyn(grd_ptrsyn),
    .bwr_ptr(bwr_ptr),
    .gwr_ptr(gwr_ptr),
    .full(full)
  );
  
  read_pointer_handler r_ptr_h(
    .rclk(rclk),
    .rrst(rrst),
    .re(re),
    .gwr_ptrsyn(gwr_ptrsyn),
    .brd_ptr(brd_ptr),
    .grd_ptr(grd_ptr),
    .empty(empty)
  );
    
  memory fifo(
    .wclk(wclk),
    .rclk(rclk),
    .we(we),
    .re(re),
    .brd_ptr(brd_ptr),
    .bwr_ptr(bwr_ptr),
    .datain(datain),
    .dataout(dataout),
    .full(full),
    .empty(empty)
  );
    
  endmodule
