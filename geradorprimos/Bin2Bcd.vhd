library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Bin2Bcd is
	port(input : in std_logic_vector(9 downto 0); 
	     HEX0  : out std_logic_vector(3 downto 0);
		  HEX1  : out std_logic_vector(3 downto 0);
		  HEX2  : out std_logic_vector(3 downto 0);
		  HEX3  : out std_logic_vector(3 downto 0));
end Bin2Bcd;
		  
architecture Behavioral of Bin2Bcd is
begin
	HEX0 <= std_logic_vector(((unsigned(input) rem 1000) rem 100) rem 10)(3 downto 0);
	HEX1 <= std_logic_vector(((unsigned(input) rem 1000) rem 100) / 10)(3 downto 0);
	HEX2 <= std_logic_vector((unsigned(input) rem 1000) / 100)(3 downto 0);
	HEX3 <= std_logic_vector(unsigned(input) / 1000)(3 downto 0);
end Behavioral;