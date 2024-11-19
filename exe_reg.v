module exe_reg(clk,regwi,memwi,resrci,alui,wdi,pcp4i,rdi,a1uo,wdo,pcp4o,rdo,regwo,memwo,resrco);
input clk,regwi,memwi;
input [1:0] resrci;
input [31:0] alui,wdi,pcp4i;
input [4:0] rdi;

output [31:0] a1uo,wdo,pcp4o;
output [4:0] rdo;
output regwo,memwo;
output [1:0] resrco;

reg [31:0] a1uo,wdo,pcp4o;
reg [4:0] rdo;
reg regwo,memwo;
reg [1:0] resrco;

always@(posedge clk)
begin
a1uo = alui;
wdo = wdi;
pcp4o = pcp4i;
rdo = rdi;

regwo = regwi;
memwo = memwi;
resrco = resrci;
end

endmodule
