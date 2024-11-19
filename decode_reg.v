module decode_reg(clk,regwi,memwi,jmpdi,brhdi,alusrci,resrci,aluctrli,rd1i,rd2i,pcdi,immexti,pcp4i,instr,rd1o,rd2o,pcdo,immexto,pcp4o,rd,regwo,memwo,jmpdo,brhdo,alusrco,resrco,aluctrlo);
input clk,regwi,memwi,jmpdi,brhdi,alusrci;
input [1:0] resrci;
input [2:0] aluctrli;
input [31:0] rd1i,rd2i,pcdi,immexti,pcp4i,instr;

output [31:0] rd1o,rd2o,pcdo,immexto,pcp4o;
output [4:0] rd;
output regwo,memwo,jmpdo,brhdo,alusrco;
output [1:0] resrco;
output [2:0] aluctrlo;

reg [31:0] rd1o,rd2o,pcdo,immexto,pcp4o;
reg [4:0] rd;
reg regwo,memwo,jmpdo,brhdo,alusrco;
reg [1:0] resrco;
reg [2:0] aluctrlo;


always@(posedge clk)
begin
rd1o = rd1i;
rd2o = rd2i;
pcdo = pcdi;
immexto = immexti;
pcp4o = pcp4i;
rd = instr[11:7];

regwo = regwi;
memwo = memwi;
jmpdo = jmpdi;
brhdo = brhdi;
alusrco = alusrci;
resrco = resrci;
aluctrlo = aluctrli;
end


endmodule
