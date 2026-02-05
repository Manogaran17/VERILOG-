module ha(a,b,s,cout);
  input a,b;
  output s,cout;
  assign s = (a^b);
  assign cout = (a&b);
    end 
  endmodule

