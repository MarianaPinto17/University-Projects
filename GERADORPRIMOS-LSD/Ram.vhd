library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Ram is
	port(writeClk    : in std_logic;
		  writeEnable : in std_logic;
        writeData   : in std_logic_vector(9 downto 0);
		  address     : in std_logic_vector(7 downto 0);
		  readData    : out std_logic_vector(9 downto 0);
		  done        : out std_logic);
end Ram;

architecture Behavioral of Ram is
	
	constant NUM_WORDS : integer := 256; --como ha 168 numeros primos possiveis no intervalo dado, a ram tera 256 posiçoes para os armazenar
	subtype TDataWord is std_logic_vector(9 downto 0); 
	type TMemory is array (0 to NUM_WORDS-1) of TDataWord;
	signal s_memory : TMemory;
	
begin
	process(writeClk)
		begin
		if (rising_edge(writeClk)) then
			if (writeEnable = '1') then
				s_memory(to_integer(unsigned(address))) <= writeData;
				done <= '1';
			else
				done <= '0';
			end if;
		end if;
	end process;
		readData <= s_memory(to_integer(unsigned(address)));
end Behavioral;




