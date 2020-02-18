library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Intervalo is
	port(enable   : in std_logic;
		  inserir  : in std_logic_vector(9 downto 0);
		  wrongNum : out std_logic; --saida para o caso do numero estar errado 
		  data     : out std_logic_vector(9 downto 0));
end Intervalo;

architecture Behavioral of Intervalo is
	signal s_data: unsigned(9 downto 0);
begin
	
	process(inserir, enable)
		begin
				if (unsigned(inserir) >= 0 and unsigned(inserir) < 1024) then --verificar que o valor esta entre 1 e 1000
					wrongNum <= '1';
				else
					wrongNum <= '0';
				end if;
				
				if (enable = '1') then
					s_data <= unsigned(inserir);
				end if;
			
	end process;
	data <= std_logic_vector(s_data);
end Behavioral;