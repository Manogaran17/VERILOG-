
  // synchronizer 
  
  module synchronizer#(parameter width = 3)(
    input clk,rst,
    input [width:0]gin,
    output reg [width:0]gout);
    
    reg [width:0]q;
    
    always@(posedge clk or posedge rst )
      begin
        if(rst)
          begin
            gout<=0;
            q<=0;
          end 
        else
          begin
            q<=gin;
            gout<=q;
          end 
      end
        endmodule 
        
