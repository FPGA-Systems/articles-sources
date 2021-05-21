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

module goodFFstyle (
    output reg q2,
    input d, clk, rst_n);
    reg q1;
    
    always @(posedge clk)
        if (!rst_n) q1 <= 1'b0;
        else q1 <= d;
        
    always @(posedge clk)
        q2 <= q1;
endmodule
