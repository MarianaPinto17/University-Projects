library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Counter_Ram is
	port(reset  	   : in std_logic;
		  clk	   	   : in std_logic;
		  enable 	   : in std_logic;
		  counterValue : out std_logic_vector(7 downto 0));
end Counter_Ram;


architecture Behavioral of Counter_Ram is
	
	signal s_counterValue: unsigned(7 downto 0) := to_unsigned(0,8);
	signal s_wait : std_logic := '0';


begin
	
	process(clk)
	
	begin
	
		if (rising_edge(clk)) then
			if (reset = '1') then
				s_counterValue <= (others => '0');
			elsif (enable = '1') then
				if(s_counterValue < to_unsigned(255,8) and s_wait = '0') then --enquanto o valor do contador for menor que o indice da ram
					s_counterValue <= s_counterValue + 1; --incrementa o contador
					s_wait <= '1';
				end if;
			else
				s_wait <= '0';
			end if;
		end if;
	
	end process;
	
	counterValue <= std_logic_vector(s_counterValue);
end Behavioral;