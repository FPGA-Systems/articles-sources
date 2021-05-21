--              | |                         |Source code for Clifford E. Cummings, Don Mills and Steve Golson article 
--==============+=+==============           |Asynchronous & Synchronous Reset Design Techniques - Part Deux 
--              | |            ||           |
--    |***|    |***|           ||           |Find more
--====|***|    |***|           \\ |***|     |https://github.com/FPGA-Systems/articles-sources
--====|***|    |***|             =|***|==== |   
--====|***|====|***|    |**\                |   
--====|***|    |***|====|***\     |***|     |   
--    |***|    |***|    |****|====|***|==== |    
--             |***|    |****|    FPGA      |   
--fpga-systems |***| ru |****| developers   |   
--             |***|    |****|  community   |   
--    |***|    |***|    |****|====|***|==== |   
--====|***|    |***|====|***/     |***|     |   
--====|***|====|***|    |**/                |   
--====|***|    |***|             =|***|==== |   
--====|***|    |***|           // |***|     |   
--    |***|    |***|           ||           |   
--              | |            ||           |web      - https://fpga-systems.ru  
--==============+=+==============           |telegram - https://t.me/fpgasystems   
--              | |                         |Youtube  - https://www.youtube.com/c/fpgasystems  

library ieee;
use ieee.std_logic_1164.all;
entity badFFstyle is
    port (
        clk : in std_logic;
        rst_n : in std_logic;
        d : in std_logic;
        q2 : out std_logic);
end badFFstyle;
    
architecture rtl of badFFstyle is
    signal q1 : std_logic;
begin
    process (clk)
    begin
        if (clk'event and clk = '1') then
            if (rst_n = '0') then
                q1 <= '0';
            else
                q1 <= d;
                q2 <= q1;
            end if;
        end if;
    end process;
end rtl;
