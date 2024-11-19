module pp_rf(rs1,rs2,rd,writedata,regwrite,rd1,rd2,clk);
input [4:0] rs1,rs2,rd;
input [31:0] writedata;
input regwrite,clk;
output [31:0] rd1,rd2;
reg [31:0] rf [31:0];
reg [31:0] rd1,rd2;
integer i;

initial 
begin
  for(i=0; i<32; i=i+1)
 begin
 rf[i] = i;
 end
end

always @(posedge clk)
if (regwrite)
 begin
 rf[rd] = writedata;
 end

always@(negedge clk)
begin
rd1 = rf[rs1];
rd2 = rf[rs2];
end

endmodule
