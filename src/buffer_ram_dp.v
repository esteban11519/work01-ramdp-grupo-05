`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:34:31 10/22/2019 
// Design Name: 	 Ferney alberto Beltran Molina
// Module Name:    buffer_ram_dp 
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
module buffer_ram_dp#( 
	parameter AW = 17, 				// Cantidad de bits  de la dirección 
	parameter DW = 16, 				// Cantidad de Bits por pixel 
	parameter   imageFILE= "ramdp/image.men")	// Archivo para precargar
	(  
	input  clk, 			// Reloj
	input  [AW-1: 0] addr_in,	// Direccion de entrada 
	input  [DW-1: 0] data_in,	// Dato de entrada
	input  regwrite, 		// Registro de control de escritura
	
	output reg [DW-1: 0] data_out,	// Dato de salida
	input [AW-1: 0] addr_out, 	// Direccion de salida
	input regread			// Registro de control de lectura
	);

//-- Calcular el numero de posiciones totales de memoria 
localparam NPOS = 2 ** AW; //-- Memoria / Cantidad de pixeles

	reg [DW-1: 0] ram [0: NPOS-1]; 	// RAM. Se llena de arriba a abajo, izq a derecha. 

//-- Lectura/escritura  de la memoria port 1 
always @(posedge clk) begin 		// Flancos de subida en el reloj
       if (regwrite == 1) 		// Si regwrite es 1, entonces
             ram[addr_in] <= data_in;	// escribe el dato de entrada en la direccion dada
end

//-- Lectura/escritura  de la memoria port 2 
always @(posedge clk) begin 		// Flancos de subida en el reloj
       if (regread == 1) 		// Si regread es 1, entonces
           data_out <= ram[addr_out]; 	// lee el dato en la direcion dada y lo asigna a data_out
end
 
initial begin
	$readmemh(imageFILE, ram);	// Inicializa la RAM con los valores del archivo imageFILE
end

endmodule
