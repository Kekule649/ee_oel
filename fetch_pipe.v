module fetch_pipe(clk,rdi,pcfi,pcp4i,rdo,pcfo,pcp4o);
input clk;
input [31:0] rdi,pcfi,pcp4i;
output [31:0] rdo,pcfo,pcp4o;
reg [31:0] rdo,pcfo,pcp4o;
 
always@(posedge clk)
begin
rdo = rdi;
pcfo = pcfi;
pcp4o = pcp4i;
end

endmodule
