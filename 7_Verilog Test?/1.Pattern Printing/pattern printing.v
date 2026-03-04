module pattern_printing();                                         
  integer a,b,c;
  
  parameter n=9;
  
  initial 
    begin 
      for(a=1;a<=n;a=a+1)
        begin
          for(b=1;b<=n-a;b=b+1)
            $write(" ");
          for(c=1;c<=a;c=c+1)
            $write("%0d ",a);
          $write("\n");
        end 
      
      for(a=n-1;a>=1;a=a-1)
        begin
          for(b=1;b<=n-a;b=b+1)
            $write(" ");
          for(c=1;c<=a;c=c+1)
            $write("%0d ",a);
          $write("\n");
        end 
    end 
      endmodule 
      // test bench 
module tb_diamond;
   pattern_printing uut();  

    initial begin
        #10;  
        $finish;
    end

endmodule

       
