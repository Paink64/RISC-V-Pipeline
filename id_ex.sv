`timescale 1ns / 1ps

module id_ex(
   input logic              clk, reset,
   input logic     [31:0]   PCD,PCPlus4D,
   input logic     [31:0]   RD1D, RD2D, 
   input logic     [4:0]    RDD,
   input logic     [31:0]   IMMEXID,
   input logic              RegWriteD, MemWriteD, JumpD, BranchD, AluSrcD,
   input logic     [1:0]    ResultSrcD,
   input logic     [2:0]    AluControlD,
   input logic     [4:0]    RS1D, RS2D,
   
   output logic     [31:0]  PCE,PCPlus4E,
   output logic     [31:0]  RD1E, RD2E,
   output logic     [4:0]   RDE,
   output logic     [31:0]  IMMEXIE,
   output logic             RegWriteE, MemWriteE, JumpE, BranchE, AluSrcE,
   output logic     [1:0]   ResultSrcE,
   output logic     [2:0]   AluControlE,
   output logic     [4:0]   RS1E, RS2E
   );
   
    always_ff @(posedge clk, posedge reset)
    if (reset) begin
		RD1E <= 0;
		RD2E <=0;
		PCE <=0;
		RDE <= 0;
		IMMEXIE <=0;
		PCPlus4E <=0;
		RegWriteE <= 0;
		ResultSrcE <=0;
		MemWriteE <=0;
		JumpE <= 0;
		BranchE <=0;
		AluControlE <=0;
		AluSrcE <=0;
	end
	else begin
		RD1E <= RD1D;
		RD2E <=RD2D;
		PCE <=PCD;
		RDE <= RDD;
		IMMEXIE <=IMMEXID;
		PCPlus4E <=PCPlus4D;
		RegWriteE <= RegWriteD;
		ResultSrcE <=ResultSrcD;
		MemWriteE <=MemWriteD;
		JumpE <= JumpD;
		BranchE <=BranchD;
		AluControlE <=AluControlD;
		AluSrcE <=AluSrcD;
		RS1E <=RS1D;
		RS2E <=RS2D;
	end
endmodule
