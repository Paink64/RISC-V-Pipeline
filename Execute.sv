`timescale 1ns / 1ps

module Execute(
   input logic              clk, reset,
   input logic      [31:0]  RD1E, RD2E, 
   input logic      [4:0]   RDE,
   input logic      [31:0]  IMMEXIE,
   input logic      [31:0]  PCE,
   input logic      [31:0]  PCPlus4E,
   input logic              RegWriteE, MemWriteE, JumpE, BranchE, AluSrcE,
   input logic      [1:0]   ResultSrcE,
   input logic      [2:0]   AluControlE,
   input logic      [1:0]   ForwardAE, ForwardBE,
   input logic      [31:0]  ResultW,
   
   output logic     [31:0]  PCTargetE,
   output logic     [31:0]  ALUResultM, WriteDataM, PCPlus4M,
   output logic     [4:0]   RDM,
   output logic             RegWriteM, MemWriteM, PCSrcE,
   output logic     [1:0]   ResultSrcM
    );
    logic ZeroE;
    logic [31:0] SrcAE, SrcBE, ALUResultE, SrcBE1;

    mux2 #(32)  pcmux(SrcBE1, IMMEXIE, AluSrcE, SrcBE);
    
    mux3 #(32) mux31AE(RD1E, ResultW, ALUResultM, ForwardAE, SrcAE);
    mux3 #(32) mux31BE(RD2E, ResultW, ALUResultM, ForwardBE, SrcBE1);
    
    adder       PCadder(PCE, IMMEXIE, PCTargetE);
    alu alu1(SrcAE, SrcBE, AluControlE, ALUResultE, ZeroE);

            Ex_Mem  Ex_Mem1(clk, reset,
            ALUResultE, SrcBE1, PCPlus4E,
            RDE,
            RegWriteE, MemWriteE,
            ResultSrcE,
               
            ALUResultM, WriteDataM, PCPlus4M,
            RDM,
            RegWriteM, MemWriteM,
            ResultSrcM);
    
    assign PCSrcE = (ZeroE & BranchE) | JumpE;

endmodule