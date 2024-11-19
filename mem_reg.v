module mem_reg(clk,regwi,resrci,alui,memdi,pcp4i,rdi,a1uo,memdo,pcp4o,rdo,regwo,resrco);
input clk,regwi;
input [1:0] resrci;
input [31:0] alui,memdi,pcp4i;
input [4:0] rdi;

output [31:0] a1uo,memdo,pcp4o;
output [4:0] rdo;
output regwo;
output [1:0] resrco;

reg [31:0] a1uo,memdo,pcp4o;
reg [4:0] rdo;
reg regwo;
reg [1:0] resrco;

always@(posedge clk)
begin
a1uo = alui;
memdo = memdi;
pcp4o = pcp4i;
rdo = rdi;

regwo = regwi;
resrco = resrci;
end

endmodule
