`timescale 1ns / 1ps

module WBStg(
    input logic     [31:0]  ALUResultW, ReadDataW, PCPlus4W,
    input logic     [1:0]   ResultSrcW,
    
    output logic    [31:0]  ResultW
    );
    mux3 #(32) mux31(ALUResultW, ReadDataW, PCPlus4W, ResultSrcW, ResultW);

endmodule