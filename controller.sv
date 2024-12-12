module controller(input  logic [6:0] op,
                  input  logic [2:0] funct3,
                  input  logic       funct7b5,
                  output logic [1:0] ResultSrcD,
                  output logic       MemWriteD,
                  output logic       AluSrcD,
                  output logic       RegWriteD, JumpD, BranchD,
                  output logic [1:0] ImmSrcD,
                  output logic [2:0] AluControlD);

  logic [1:0] ALUOp;

  initial begin 
   ResultSrcD <=0; 
   MemWriteD<=0; 
   BranchD <=0;
   AluSrcD<=0;
   RegWriteD <=0;
   JumpD<=0; 
   ImmSrcD<=0;
   AluControlD <=0;
   end

  maindec md(op, ResultSrcD, MemWriteD, BranchD,
             AluSrcD, RegWriteD, JumpD, ImmSrcD, ALUOp);
  aludec  ad(op[5], funct3, funct7b5, ALUOp, AluControlD);

endmodule
