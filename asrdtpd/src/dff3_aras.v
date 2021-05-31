`timescale 1ns / 1ps

//              | |                         |Source code for Clifford E. Cummings, Don Mills and Steve Golson article
//==============+=+==============           |Asynchronous & Synchronous Reset Design Techniques - Part Deux 
//              | |            ||           |
//    |***|    |***|           ||           |Find more
//====|***|    |***|           \\ |***|     |https://github.com/FPGA-Systems/articles-sources
//====|***|    |***|             =|***|==== |   
//====|***|====|***|    |**\                |   
//====|***|    |***|====|***\     |***|     |   
//    |***|    |***|    |****|====|***|==== |    
//             |***|    |****|    FPGA      |   
//fpga-systems |***| ru |****| developers   |   
//             |***|    |****|  community   |   
//    |***|    |***|    |****|====|***|==== |   
//====|***|    |***|====|***/     |***|     |   
//====|***|====|***|    |**/                |   
//====|***|    |***|             =|***|==== |   
//====|***|    |***|           // |***|     |   
//    |***|    |***|           ||           |   
//              | |            ||           |web      - https://fpga-systems.ru  
//==============+=+==============           |telegram - https://t.me/fpgasystems   
//              | |                         |Youtube  - https://www.youtube.com/c/fpgasystems   
// Good DFF with asynchronous set and reset and self-
// correcting set-reset assignment
module dff3_aras (
	output reg q,
	input d, clk, rst_n, set_n);
	
	always @(posedge clk or negedge rst_n or negedge set_n)
		if (!rst_n) q <= 0; // asynchronous reset
		else if (!set_n) q <= 1; // asynchronous set
		else q <= d;
	// synopsys translate_off
	always @(rst_n or set_n)
		if (rst_n && !set_n) force q = 1;
		else release q;
	// synopsys translate_on
endmodule