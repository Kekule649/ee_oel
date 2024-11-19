module riscV_pp(clk,reset,immsrc,resultsrc,memwrite,alusrc,regwrite,pcsrc);
input clk,reset;
output resultsrc,memwrite,alusrc,regwrite,pcsrc;
output [1:0] immsrc;
wire [31:0] pcnext,pc;                    //pc
wire [31:0] pcplus4;                      //adder
wire [31:0] pctarget;                     //adder
wire [31:0] instr;                        //instructionmemory
wire [31:0] rd1,rd2,result;               //registerfile
wire [31:0] imm_ext;                      //immediatextender
wire [31:0] srcb,aluresult;               //alu
wire [2:0] alucontrol;                    //alu              
wire [31:0] read_data;                    //datamemory
wire zero;                                //controlunit
               
wire [31:0] instrd,pcd,pcplus4d,rd1e,rd2e,pce,immexte,pcplus4e,pcplus4m,pcplus4w,aluresultM,writedataM,read_dataW,aluresultW;
wire [4:0]  rde,rdw,rdm;
wire regwriteW,regwriteM,regwriteE,memwriteE,memwriteM,jmpe,branche,alusrcE;
wire [2:0] alucontrolE;
wire [1:0] resultsrcE,resultsrcM,resultsrcW;
//clk_div clkd(clk,clk_d);

mux pc_next(pctarget,pcplus4,pcsrc,pcnext);

pc ProgC(clk,reset,pcnext,pc);

adder pc_plus4(pc,32'b100,pcplus4);

instmem IM(pc,instr);

fetch_pipe FP(clk,instr,pc,pcplus4,instrd,pcd,pcplus4d);

pp_rf PP_RF(instrd[19:15],instrd[24:20],rdw,resultW,regwriteW,rd1,rd2,clk);

decode_reg DR(clk,regwrite,memwrite,0,1,alusrc,resultsrc,alucontrol,rd1,rd2,pcd,imm_ext,pcplus4d,instrd,rd1e,rd2e,pce,immexte,pcplus4e,rde,regwriteE,memwriteE,jmpe,branche,alusrcE,resultsrcE,alucontrolE);

immext ImmExt(instrd,immsrc,imm_ext);

mux src_b(imm_exte,rd2e,alusrcE,srcb);

alu ALU(rd1e,srcb,alucontrolE,zero,aluresult);

exe_reg ER(clk,regwriteE,memwriteE,resultsrcE,aluresult,rd2e,pcplus4e,rde,aluresultM,writedataM,pcplus4m,rdm,regwriteM,memwriteM,resultsrcM);

datamem DM(aluresultM,writedataM,clk,memwriteM,read_data);

mux3 result_0(aluresultW,read_dataW,pcplus4w,resultsrcW,resultW); 

adder pc_target(pce,imm_ext,pctarget);

mem_reg MR(clk,regwriteM,resultsrcM,aluresultM,read_data,pcplus4m,rdm,aluresultW,read_dataW,pcplus4w,rdw,regwriteW,resultsrcW);

controlunit CU(instrd[6:0],zero,instrd[14:12],instrd[30],alusrc,resultsrc,immsrc,regwrite,memwrite,pcsrc,alucontrol);

endmodule 


module tb_riscv_pp();
reg clk,reset;
  
riscV_pp dut(clk,reset);
  
always #5 clk=~clk;
  
initial 
begin
 clk =0; reset = 1;
 #10;
 reset = 0;
 #200 $stop;
end
  
endmodule 
