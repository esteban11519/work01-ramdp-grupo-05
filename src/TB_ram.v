`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:11:29 10/29/2019
// Design Name:   buffer_ram_dp
// Module Name:   /home/mitchell/Documentos/Camara/TB_ram.v
// Project Name:  Camara
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: buffer_ram_dp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_ram;

	// Inputs
	reg clk;
	reg [16:0] addr_in;
	reg [15:0] data_in;
	reg regwrite;
	reg [16:0] addr_out;
	reg regread;

	// Outputs
	wire [15:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	buffer_ram_dp uut (
		.clk(clk), 
		.addr_in(addr_in), 
		.data_in(data_in), 
		.regwrite(regwrite), 
		.data_out(data_out), 
		.addr_out(addr_out), 
		.regread(regread)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		addr_in = 0;
		data_in = 0;
		regwrite = 0;
		addr_out = 0;
		regread = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		// Leer datos inicializados en la RAM
		regread=1;
		for (addr_out = 0; addr_out < 8; addr_out = addr_out + 1) begin
			#5 $display("el valor de memoria %d =  %d", addr_out,data_out) ;
		end 
      
		#5
		regread=0;
		
		#5		
		addr_in = 0;
		data_in = 16'haaaa;
		regwrite = 1;
		
		#10
		addr_in = 1;
		data_in = 16'h8642;
		regwrite = 1;
		
		#10
		addr_in = 2;
		data_in = 16'hffff;
		regwrite = 1;
		
		#10
		addr_in = 4;
		data_in = 16'h9753;
		regwrite = 1;
		
		#10
		addr_in = 5;
		data_in = 1111;
		regwrite = 1;
		
		#10
		regwrite = 0;
		addr_out = 2;
		regread = 1;
		
		#5 $display("el valor de memoria %d = %d", addr_out, data_out);
		
		#10
		addr_out = 3;
		regread = 1;
		
		#5 $display("el valor de memoria %d = %d", addr_out, data_out);
		
		#10
		addr_out = 1;
		regread = 1;
		
		#5 $display("el valor de memoria %d = %d", addr_out, data_out);
		
		#10
		addr_out = 4;
		regread = 1;
		
		#5 $display("el valor de memoria %d = %d", addr_out, data_out);
		
		#10
		regread = 0;

	end
  always #1 clk = ~clk;      
endmodule
