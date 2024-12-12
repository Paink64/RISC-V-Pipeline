module if_id ( 
   input  logic         clk, reset,
   input logic [31:0]   InstrF,
                        PCF,
						PCPlus4F,
   output logic [31:0]  InstrD,
                        PCD,
					    PCPlus4D
   );
  
  always_ff @(posedge clk, posedge reset)
    if (reset) begin
		PCD <= 0;
		InstrD <=0;
		PCPlus4D <=0;
	end
	else begin
		PCD <= PCF;
		InstrD <=InstrF;
		PCPlus4D <=PCPlus4F;
	
	end
	
endmodule 