module IDecode (
   input logic              clk, reset,
   input logic      [31:0]  PCD,
   input logic      [31:0]  InstrD,
   input logic      [31:0]  PCPlus4D,
   input logic              RegWriteW,
   input logic      [31:0]  ResultW,
   input logic      [4:0]   RDW,
   
   output logic     [31:0]  PCE,PCPlus4E,
   output logic     [31:0]  RD1E, RD2E, 
   output logic     [4:0]   RDE,
   output logic     [31:0]  IMMEXIE,
   output logic             RegWriteE, MemWriteE, JumpE, BranchE, AluSrcE,
   output logic     [1:0]   ResultSrcE,
   output logic     [2:0]   AluControlE,
   output logic     [4:0]   RS1E, RS2E
   );
   
    logic [1:0]         ImmSrcD; 
    
    logic     [31:0]    RD1D, RD2D;
    logic     [4:0]     RDD, RS1D, RS2D;
    logic     [31:0]    IMMEXID;
    logic               RegWriteD, MemWriteD, JumpD, BranchD, AluSrcD;
    logic     [1:0]     ResultSrcD;
    logic     [2:0]     AluControlD;
    
    assign RDD = InstrD[11:7];
    assign RS1D = InstrD[19:15];
    assign RS2D = InstrD[24:20];
    
    controller c(InstrD[6:0], InstrD[14:12], InstrD[30],
               ResultSrcD, MemWriteD,
               AluSrcD, RegWriteD, JumpD, BranchD,
               ImmSrcD, AluControlD);
               
    extend  extend1(InstrD[31:7],ImmSrcD,IMMEXID);
    regfile  regfile1(clk, RegWriteW, RS1D, RS2D, 
                 RDW, ResultW, RD1D, RD2D);
 
    id_ex   id_ex1( clk, reset,
                    PCD,PCPlus4D,
                    RD1D, RD2D, RDD,
                    IMMEXID,
                    RegWriteD, MemWriteD, JumpD, BranchD, AluSrcD,
                    ResultSrcD,
                    AluControlD,
                    RS1D, RS2D,
                       
                    PCE,PCPlus4E,
                    RD1E, RD2E, RDE,
                    IMMEXIE,
                    RegWriteE, MemWriteE, JumpE, BranchE, AluSrcE,
                    ResultSrcE,
                    AluControlE,
                    RS1E, RS2E);

endmodule
