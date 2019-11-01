`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:08:47 10/22/2019 
// Design Name: 
// Module Name:    getram 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module getram#(
	parameter AW = 19,
	parameter DW = 16)
	(input clk,
	input wire [AW-1:0] addr_in,
	input wire [DW-1:0] data_in,
	input wire regwrite,
	output reg [DW-1:0] data_out,
	input wire [AW-1:0] addr_out,
	output reg [DW-1:0] regread);

localparam NPOS = 2**AW;
reg [DW-1:0]ram[0:NPOS-1];

always @(posedge clk)
begin
		if(regwrite == 1)
			ram[addr_in]<= data_in

		else if(regread == 1)
			data_out<=ram[addr_out];
		
end

endmodule
