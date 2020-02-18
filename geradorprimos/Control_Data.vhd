library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Control_Data is
	port(clk         : in  std_logic;
		  KEY         : in  std_logic_vector(2 downto 0); 
		  SW          : in std_logic_vector(9 downto 0);
		  CLOCK_50    : in std_logic;
		  LEDG        : out std_logic_vector(0 downto 0);
		  LEDR        : out std_logic_vector(3 downto 0); 
		  HEX0        : out std_logic_vector(6 downto 0);
		  HEX1        : out std_logic_vector(6 downto 0);
		  HEX2        : out std_logic_vector(6 downto 0);
		  HEX3        : out std_logic_vector(6 downto 0));
end Control_Data;

architecture Shell of Control_Data is

	signal s_s_valid1,s_s_valid2, s_cont1_done, s_numberGo1, s_cont2_done, s_numberGo2, s_ram_done, s_resto_done, s_equals_zero, s_visor_done : std_logic;
	signal s_En_intro, s_En_Valid_1,s_En_Valid_2, s_En_cont1, s_En_cont2, s_En_res, s_En_comp, s_En_ram, s_En_visor : std_logic;
	signal s_loadStandBy : std_logic;
	signal s_loadNumberGo2 : std_logic;
	signal s_KEY : std_logic_vector(2 downto 0);
	signal clock : std_logic;
	signal s_sw : std_logic_vector(9 downto 0);
	
	
	begin
	
	
	
	s_KEY <= not KEY;
	
	clockDiv : entity work.ClkDividerN(Behavioral)
			generic map(divFactor => 2500000)
			port map(clkIn  => CLOCK_50,
				         clkOut => clock);
	
	
						

	
	ControlPath : entity work.ControlPath(Behavioral)
						port map(clk => clock,
									KEY => s_KEY,
									s_valid1 => s_s_valid1,
									s_valid2 => s_s_valid2,
									cont1_done => s_cont1_done,
									numberGo1 => s_numberGo1,
									cont2_done => s_cont2_done,
									numberGo2 => s_numberGo2,
									ram_done => s_ram_done,
									resto_done => s_resto_done,
									equals_zero => s_equals_zero,
									visor_done => s_visor_done, --sinais para ligar o control ao data path
									loadStandBy => s_loadStandBy,
									loadNumberGo2 => s_loadNumberGo2,
									En_intro => s_En_intro,
									En_Valid_1 => s_En_Valid_1,
									En_Valid_2 => s_En_Valid_2,
									En_cont1 => s_En_cont1,
									En_cont2 => s_En_cont2,
									En_res => s_En_res,
									En_comp => s_En_comp,
									En_ram => s_En_ram,
									En_visor => s_En_visor,
									stOut => LEDR(3 downto 1));
	
	DataPath    : entity work.DataPath(Behavioral)
						port map(clk => clock,
									reset => s_KEY(0),
									insert => SW(9 downto 0),
									s_valid1 => s_s_valid1,
									s_valid2 => s_s_valid2,
									cont1_done => s_cont1_done,
									numberGo1 => s_numberGo1,
									cont2_done => s_cont2_done,
									numberGo2 => s_numberGo2,
									ram_done => s_ram_done,
									resto_done => s_resto_done,
									equals_zero => s_equals_zero,
									visor_done => s_visor_done,
									loadStandBy => s_loadStandBy,
									loadNumberGo2 => s_loadNumberGo2,
									En_intro => s_En_intro, --sinais para ligar o control ao data path
									En_Valid_1 => s_En_Valid_1,
									En_Valid_2 => s_En_Valid_2,
									En_cont1 => s_En_cont1,
									En_cont2 => s_En_cont2,
									En_res => s_En_res,
									En_comp => s_En_comp,
									En_ram => s_En_ram,
									LEDG => LEDG(0 downto 0),
									En_visor => s_En_visor,
									LEDR => LEDR(0 downto 0),
									HEX0 => HEX0,
									HEX1 => HEX1,
									HEX2 => HEX2,
									HEX3 => HEX3);
													
end Shell;