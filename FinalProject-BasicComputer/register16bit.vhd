library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity register16bit is
port ( 
	D : IN std_logic_vector(15 downto 0);
	load : IN std_logic;
	reset : IN std_logic;
	increament : in std_logic;
	clk : IN std_logic;
	Q : OUT std_logic_vector(15 downto 0):= (others => '0')
	 );
end register16bit;
architecture Behavioral of register16bit is
	signal regQ: std_logic_vector(15 downto 0) := (others => '0');
begin
	process(clk, increament, load, reset)
	begin
		if(reset='1') then
			Q <= (others => '0');
		end if;
		if(load='1')then
			Q <= D;
			regQ <= D;
		end if;
		if(rising_edge(increament)) then
			Q <= std_logic_vector( unsigned(regQ) + 1 );
			regQ <= std_logic_vector( unsigned(regQ) + 1 );
			--Q <= std_logic_vector(to_unsigned(to_integer(unsigned(regQ)) + 1, regQ'length));
		end if;
	end process;
end Behavioral;