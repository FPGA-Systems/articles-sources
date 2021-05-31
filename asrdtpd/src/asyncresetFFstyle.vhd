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
entity asyncresetFFstyle is
	port (
		clk : in std_logic;
		rst_n : in std_logic;
		d : in std_logic;
		q : out std_logic);
end asyncresetFFstyle;

architecture rtl of asyncresetFFstyle is
begin
	process (clk, rst_n)
	begin
		if (rst_n = '0') then
			q <= '0';
		elsif (clk'event and clk = '1') then
			q <= d;
		end if;
	end process;
end rtl;

