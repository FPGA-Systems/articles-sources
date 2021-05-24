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

module ctr8sr (
    output reg [7:0] q,
    output reg co,
    input [7:0] d,
    input ld, clk, rst_n);
    
    always @(posedge clk)
        if (!rst_n) {co,q} <= 9'b0; // sync reset
        else if (ld) {co,q} <= d; // sync load
        else {co,q} <= q + 1'b1; // sync increment
endmodule
