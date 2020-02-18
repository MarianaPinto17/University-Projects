library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Visor is
	port(enable    : in std_logic;
		  clk       : in std_logic;
		  input		: in std_logic_vector(7 downto 0);
		  done		: out std_logic;
		  outAddress : out std_logic_vector(7 downto 0));
end Visor;


architecture Behavioral of Visor is
 
	signal count   : unsigned(25 downto 0) := to_unsigned(0, 26);
	signal s_addr  : unsigned(7 downto 0) := to_unsigned(0,8);

begin

	outAddress <= std_logic_vector(s_addr);
	
	
	process(clk)
	begin
		if(rising_edge(clk)) then
			if(enable = '1') then
				if(unsigned(s_addr)<(unsigned(input)-to_unsigned(1,8))) then
					if(count < to_unsigned(25, 26)) then
						count <= count + 1; 
						done <= '0';
					else
						count <= to_unsigned(0,26);
						s_addr <= s_addr + 1;
						done <= '0';
					end if;
				else
					done <= '1';
				end if;
			 else
				count <= to_unsigned(0,26);
				s_addr <= to_unsigned(0,8);
			end if;
		end if;
	end process;

end Behavioral;