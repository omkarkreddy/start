 module xnor(c,a,b);
 input a,b;
 output  c;
assign c=~(a ^ b);
 endmodule 
