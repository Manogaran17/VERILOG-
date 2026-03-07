// read pointer 
        
         module read_pointer_handler#(parameter ptr_width= 3)(
          input rclk,rrst,re,
           input [ptr_width:0]gwr_ptrsyn,
           output reg [ptr_width:0]grd_ptr,brd_ptr,
          output reg empty
        );
          
           wire [ptr_width:0] brd_ptr_nxt;
           wire [ptr_width:0] grd_ptr_nxt;
          wire empty1;
          
           assign brd_ptr_nxt = brd_ptr + (re&&!empty);
           assign grd_ptr_nxt = (brd_ptr_nxt>>1)^(brd_ptr_nxt);
          
           always@(posedge rclk or posedge rrst)
            begin
              if(rrst)
                begin
                  empty <= 1;
                  grd_ptr <=0;
                  brd_ptr<=0;
                end 
              else
                begin
                grd_ptr<=grd_ptr_nxt;
                brd_ptr<=brd_ptr_nxt;
                empty<=empty1;
                end 
            end 
           assign empty1 = (grd_ptr_nxt == gwr_ptrsyn);
          
          
        endmodule 
