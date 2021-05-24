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

entity syncresetFFstyle is
port (
    clk : in std_logic;
    rst_n : in std_logic;
    d : in std_logic;
    q : out std_logic);
end syncresetFFstyle;

architecture rtl of syncresetFFstyle is
begin
    process (clk)
    begin
        if (clk'event and clk = '1') then
            if (rst_n = '0') then
                q <= '0';
            else
                q <= d;
            end if;
        end if;
    end process;
end rtl;

