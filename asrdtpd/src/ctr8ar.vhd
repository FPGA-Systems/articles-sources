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
use ieee.std_logic_unsigned.all;
	entity ctr8ar is
		port (
			clk : in std_logic;
			rst_n : in std_logic;
			d : in std_logic;
			ld : in std_logic;
			q : out std_logic_vector(7 downto 0);
			co : out std_logic);
	end ctr8ar;
	
	architecture rtl of ctr8ar is
		signal count : std_logic_vector(8 downto 0);
	begin
	co <= count(8);
	q <= count(7 downto 0);
	
	process (clk, rst_n)
	begin
		if (rst_n = '0') then
			count <= (others => '0'); -- async reset
		elsif (clk'event and clk = '1') then
			if (ld = '1') then
				count <= '0' & d; -- sync load
			else
				count <= count + 1; -- sync increment
			end if;
		end if;
	end process;
end rtl;