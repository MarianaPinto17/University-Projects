library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Comp is
	port(operand1 : in std_logic_vector(9 downto 0);
		  clk		  : in std_logic;
		  equals   : out std_logic);
end Comp;


architecture Behavioral of Comp is
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			if(unsigned(operand1) = to_unsigned(0,10)) then
				equals <= '1';
			else
				equals <= '0';
			--equals <= '1' when (unsigned(operand1) = to_unsigned(0,10)) else '0';--se o resto da divisao for 0 o sinal equals ativa		
			end if;
		end if;
	end process;
end Behavioral;