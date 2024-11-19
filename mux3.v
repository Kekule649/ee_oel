module mux3(a,b,c,s,out);
input [31:0] a,b,c;
input [1:0] s;
output [31:0] out;
reg [31:0] out;

always@(a or b or c or s)
begin
case(s)
2'b00: out = a;
2'b01: out = b;
2'b10: out = c;
default: out = 32'bx;
endcase
end
endmodule
