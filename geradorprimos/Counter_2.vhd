library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Counter_2 is
	port(DataIn 	   : in std_logic_vector(9 downto 0);
		  reset  	   : in std_logic;
		  clk	   	   : in std_logic;
		  enable 	   : in std_logic;
		  load 		   : in std_logic;
		  numberGo     : out std_logic;
		  done         : out std_logic;
		  counterValue : out std_logic_vector(9 downto 0));
end Counter_2;


architecture Behavioral of Counter_2 is
	
		signal s_counterValue : unsigned(9 downto 0);
		signal s_start : unsigned(9 downto 0) := to_unsigned(2,10);
		signal s_numberGo : std_logic := '0';

begin
	
	process(clk)
	
	begin
	
		if (rising_edge(clk)) then
			if (reset = '1') then
				s_counterValue <= (others => '0');
				s_start <= to_unsigned(2,10);
			elsif(load = '1') then
				s_counterValue <= unsigned(DataIn) / to_unsigned(2,10);
				s_start <= to_unsigned(2,10);
				s_numberGo <= '1';
				done <= '0';
			elsif (enable = '1' and s_numberGo = '0') then
				if(s_start < s_counterValue) then
					s_start <= s_start + 1;
					s_numberGo <= '1';
					done <= '0';
				elsif(s_start >= s_counterValue) then
					s_numberGo <= '0';
					done <= '1';
				end if;
			else
			
				s_numberGo <= '0';
				
			end if;
		end if;
	
	end process;
	
	counterValue <= std_logic_vector(s_start);
	numberGo <= s_numberGo;
end Behavioral;