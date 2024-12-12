module HazardUnit(
    input logic     clk, reset,
    input logic     RegWriteW, RegWriteM,
    input logic     [4:0]   RDM, RDW, RS1E, RS2E,
    
    output [1:0] ForwardAE, ForwardBE
    );
    
    assign ForwardAE = (reset == 1'b1) ? 2'b00 : 
                       ((RegWriteM == 1'b1) & (RDM != 5'h00) & (RDM == RS1E)) ? 2'b10 :
                       ((RegWriteW == 1'b1) & (RDW != 5'h00) & (RDW == RS1E)) ? 2'b01 : 2'b00;
                       
    assign ForwardBE = (reset == 1'b1) ? 2'b00 : 
                       ((RegWriteM == 1'b1) & (RDM != 5'h00) & (RDM == RS2E)) ? 2'b10 :
                       ((RegWriteW == 1'b1) & (RDW != 5'h00) & (RDW == RS2E)) ? 2'b01 : 2'b00;
    
endmodule
