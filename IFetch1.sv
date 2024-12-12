module IFetch (
   input  logic         clk, reset,
   input  logic         PCSrcE,
   input  logic  [31:0] PCTargetE,
   output logic  [31:0] InstrD,
   output logic  [31:0] PCD,PCPlus4D   
   );

   logic [31:0] PCNext, PCF;
   logic [31:0] InstrF,PCPlus4F;

   mux2 #(32)  pcmux(PCPlus4F, PCTargetE, PCSrcE, PCNext);

  flopr #(32) pcreg(clk, reset, PCNext, PCF); 
  adder       pcadd4(PCF, 32'd4, PCPlus4F);
  
  imem imem1(PCF, InstrF);
  
   if_id  if_id1  (clk, reset,InstrF, PCF,PCPlus4F,InstrD,PCD,PCPlus4D);

endmodule
