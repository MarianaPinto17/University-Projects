library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Reg10 is
	port(reset  : in std_logic;
		  clock  : in std_logic;
		  enable : in std_logic;
		  dataIn : in std_logic_vector(9 downto 0);
		  dataOut: out std_logic_vector(9 downto 0));
end Reg10;

architecture Behavioral of Reg10 is
begin

	process(clock)
	begin
		if(rising_edge(clock)) then
			if(reset = '1') then
				dataOut <= (others => '0');
			elsif (enable = '1') then
				dataOut <= dataIn;
			end if;
		end if;
	end process;
end Behavioral;