library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Counter_1 is
	port(DataIn_1 	   : in std_logic_vector(9 downto 0);
		  DataIn_2	   : in std_logic_vector(9 downto 0);
		  reset  	   : in std_logic;
		  clk	   	   : in std_logic;
		  enable 	   : in std_logic;
		  load 		   : in std_logic;
		  done         : out std_logic;
		  numberGo     : out std_logic;
		  counterValue : out std_logic_vector(9 downto 0));
end Counter_1;


architecture Behavioral of Counter_1 is
	
	signal s_counterValue,s_start,s_finish : unsigned(9 downto 0);
	signal s_numberGo : std_logic := '0';

begin
	
	process(DataIn_1,DataIn_2)
	
	begin
	
		if(DataIn_1 <= DataIn_2) then --se dataIn_1 for menor que o dataIn_2
			s_start <= unsigned(DataIn_1); --dataIn_1 passa a ser o limite inferior do intervalo
			s_finish <= unsigned(DataIn_2); --dataIn_2 passa a ser o limite superior do intervalo
		else
			s_start <= unsigned(DataIn_2); --dataIn_2 passa a ser o limite inferior do intervalo
			s_finish <= unsigned(DataIn_1);--dataIn_1 passa a ser o limite superior do intervalo
		end if;
	
	end process;
	
	process(clk)
	
	begin
		if (rising_edge(clk)) then
			if (reset = '1') then
				s_counterValue <= (others => '0');
				done <= '0';
			elsif(load = '1') then
				s_counterValue <= s_start;
				s_numberGo <= '1';
				done <= '0';
			elsif (enable = '1' and s_numberGo = '0') then
				if(s_counterValue < s_finish) then --enquanto o valor do contador for menor que o limite superior do intervalo
					s_counterValue <= s_counterValue + 1; --continua a incrementar
					s_numberGo <= '1';
					done <= '0';
				elsif(s_counterValue = s_finish) then
					done <= '1';
					s_numberGo <= '0';
				end if;
			else
				s_numberGo <= '0';
			end if;
		end if;
	
	end process;
	
	numberGo <= s_numberGo;
	counterValue <= std_logic_vector(s_counterValue);
end Behavioral;