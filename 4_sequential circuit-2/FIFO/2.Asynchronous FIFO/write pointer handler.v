    module write_pointer_handler#(parameter ptr_width= 3)(
          input wclk,wrst,we,
          input [ptr_width:0]grd_ptrsyn,
          output reg [ptr_width:0]gwr_ptr,bwr_ptr,
          output reg full
        );
          
          wire [ptr_width:0] bwr_ptr_nxt;
          wire [ptr_width:0] gwr_ptr_nxt;
          wire full1;
          
          assign bwr_ptr_nxt = bwr_ptr + (we&&!full);
          assign gwr_ptr_nxt = (bwr_ptr_nxt>>1)^(bwr_ptr_nxt);
          
          always@(posedge wclk or posedge wrst)
            begin
              if(wrst)
                begin
                  full <= 0;
                  gwr_ptr <=0;
                  bwr_ptr<=0;
                end 
              else
                begin
                gwr_ptr<=gwr_ptr_nxt;
                bwr_ptr<=bwr_ptr_nxt;
                full<=full1;
                end 
            end 
          
