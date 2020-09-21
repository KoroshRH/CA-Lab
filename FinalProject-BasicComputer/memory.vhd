library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity memory is
	port
	(
		data	: inout std_logic_vector(15 downto 0);
		address	: in std_logic_vector(15 downto 0);
		wr		: in std_logic;
		rd		: in std_logic;
		Clk		: in std_logic
	);
	
end entity;

architecture rtl of memory is

	-- Build a 2-D array type for the RAM
	subtype word_t is std_logic_vector(15 downto 0);
	type memory_t is array((2**16)-1 downto 0) of word_t;
	
	-- Declare the RAM signal.
	signal ram : memory_t;
	
	-- Register to hold the address
	signal addr_reg : std_logic_vector(15 downto 0);

begin

	process(Clk)
	begin
		if(rising_edge(Clk)) then
			if(wr = '1') then
				data <= (others => 'Z');
				ram(to_integer(unsigned(address))) <= data;
			elsif(rd = '1') then
				data <= ram(to_integer(unsigned(address)));
			end if;
		end if;
	end process;
end rtl;