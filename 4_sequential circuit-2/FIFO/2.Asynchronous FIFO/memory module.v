  module memory#(parameter depth = 8, pt_width =3,datawidth=8)(
          input wclk,rclk,we,re,
          input [pt_width:0] brd_ptr,bwr_ptr,
          input [datawidth-1:0]datain,
          output reg [datawidth-1:0]dataout,
          input full,empty 
        );
          reg[datawidth-1:0]mem[depth-1:0];
          
          always@(posedge wclk)
            begin
              if(we&&!full)
              mem[bwr_ptr[pt_width-1:0]]<=datain;
            end 
          
          always@(posedge rclk)
            begin
              if(re&&!empty)
              dataout<= mem[brd_ptr[pt_width-1:0]];
            end 
        endmodule 
        
        
