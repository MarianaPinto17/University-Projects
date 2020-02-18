library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Resto is
	port(input_1  : in std_logic_vector(9 downto 0);
		  input_2  : in std_logic_vector(9 downto 0);
		  clk      : in std_logic;
		  done     : out std_logic;
		  output   : out std_logic_vector(9 downto 0));
end Resto;

architecture Behavioral of Resto is
	signal s_output: unsigned(9 downto 0);
	
begin
	process(clk)
	begin
		
			if(rising_edge(clk)) then
				done <= '0';
				if(unsigned(input_1) = to_unsigned(0,10)) then
					s_output <= to_unsigned(0,10);
				elsif(unsigned(input_1) = to_unsigned(1,10)) then
					s_output <= to_unsigned(0,10);
					done <= '1';
				elsif(unsigned(input_1) = to_unsigned(2,10)) then
					s_output <= to_unsigned(1,10); --exceçao para o caso de o valor ser 2
					done <= '1';
				elsif(unsigned(input_1) = to_unsigned(3,10)) then
					s_output <= to_unsigned(1,10);
					done <= '1';
				else
					s_output <= unsigned(input_1) rem unsigned(input_2); --divisao
					done <= '1';
				end if;
			end if;
	end process;
	
	output <=std_logic_vector(s_output);
end Behavioral;
	
		  