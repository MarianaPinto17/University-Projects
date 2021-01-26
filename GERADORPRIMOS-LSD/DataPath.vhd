                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity DataPath is
	port(clk           : in std_logic;
	     En_intro      : in std_logic;
		  En_Valid_1    : in std_logic;
		  En_Valid_2	 : in std_logic;
		  En_cont1      : in std_logic;
		  En_cont2      : in std_logic;
		  En_res        : in std_logic;
		  En_comp       : in std_logic;
		  En_ram        : in std_logic;
		  En_visor      : in std_logic;
		  loadStandBy   : in std_logic;
		  loadNumberGo2 : in std_logic;
		  s_valid1      : out std_logic;
		  s_valid2		 : out std_logic;
		  cont1_done    : out std_logic; 
		  numberGo1     : out std_logic; 
		  cont2_done    : out std_logic; 
		  numberGo2     : out std_logic; 
		  ram_done      : out std_logic; 
		  resto_done    : out std_logic; 
		  equals_zero   : out std_logic; 
		  visor_done    : out std_logic;
		  reset         : in std_logic;
		  insert        : in std_logic_vector(9 downto 0);
		  LEDR          : out std_logic_vector(0 downto 0);
		  LEDG          : out std_logic_vector(0 downto 0);
		  HEX0          : out std_logic_vector(6 downto 0);
		  HEX1          : out std_logic_vector(6 downto 0);
		  HEX2          : out std_logic_vector(6 downto 0);
		  HEX3          : out std_logic_vector(6 downto 0));
end DataPath;

architecture Behavioral of DataPath is
	
	
	signal s_data1,s_data2,s_data : std_logic_vector(9 downto 0); --sinal para os dados de saida do modulo intervalo
	signal s_counterValue1        : std_logic_vector(9 downto 0); --sinal do valor do primeiro contador
	signal s_counterValue2        : std_logic_vector(9 downto 0); --sinal do valor do segundo contador
	signal s_counterValue3        : std_logic_vector(7 downto 0); --sinal do valor do contador da ram
	signal s_output               : std_logic_vector(9 downto 0); --sinal do valor do resto da divisao
	signal s_readData             : std_logic_vector(9 downto 0); --sinal do output da ram para visualizaçao nos displays
	signal s_ram_done             : std_logic;
	signal s_cont1_done           : std_logic;
	signal hex_uni, hex_dez, hex_cen, hex_mil : std_logic_vector(3 downto 0); --sinais para os valores em bcd, prontos para visualizaçao nos displays
	signal s_adress : std_logic_vector(7 downto 0); --Sinal do indice da ram
	signal s_outAddress, s_ramAddress : std_logic_vector(7 downto 0);
	signal hex_uni2, hex_dez2, hex_cen2, hex_mil2 : std_logic_vector(3 downto 0);
	signal s_equals_zero : std_logic;
	signal s_numberGo1,s_numberGo2 : std_logic;
	signal s_cont2res, s_reset_count2 : std_logic;
	signal s_visor_done : std_logic;
	
begin
	
	cont1_done <= s_cont1_done;
	equals_zero <= s_equals_zero;
	numberGo1 <= s_numberGo1;
	
	Intervalo1 : entity work.Intervalo(Behavioral)
						port map(enable => En_Valid_1, 
									inserir => insert,
									wrongNum => s_valid1,
									data => s_data1);
					
	Intervalo2 : entity work.Intervalo(Behavioral)
						port map(enable => En_Valid_2, 
									inserir => insert,
									wrongNum => s_valid2,
									data => s_data2);
	
	Counter_1 : entity work.Counter_1(Behavioral)
						port map(clk => clk,
									DataIn_1 => s_data1,
									DataIn_2 => s_data2,
									reset => reset,
									load => loadStandBy,
									enable => En_cont1,
									done => s_cont1_done,
									numberGo => s_numberGo1,
									counterValue => s_counterValue1);
									
	s_reset_count2 <= reset or s_numberGo1;
	
	Counter_2 : entity work.Counter_2(Behavioral)
						port map(clk => clk,
									DataIn => s_counterValue1,
									reset => reset,
									enable => En_cont2, 
									load => loadNumberGo2,
									done => cont2_done,
									numberGo => numberGo2,
									counterValue => s_counterValue2);
	
	Resto : entity work.Resto(Behavioral)
					port map(input_1 => s_counterValue1,
								input_2 => s_counterValue2,
								clk => clk,
								done => resto_done,
								output => s_output);
	
	
	Comp : entity work.Comp(Behavioral)
				port map(operand1 => s_output,
							clk => clk,
							equals => s_equals_zero);
							
	Ram  : entity work.Ram(Behavioral)
				port map(writeClk => clk,
							writeEnable => En_Ram, 
							writeData => s_counterValue1,
							address => s_ramAddress,
							done => s_ram_done,
							readData => s_readData);
							
	s_ramAddress <= s_outAddress when(En_visor = '1') else s_counterValue3;
							
	Counter_Ram : entity work.Counter_Ram(Behavioral)
							port map(reset => reset,
										clk => clk,
										enable => s_ram_done, 
										counterValue => s_counterValue3);
	
	visor : entity work.visor(Behavioral)
				port map(clk => clk,
							enable => En_visor,
							input => s_counterValue3,
							done =>	s_visor_done,
							outAddress => s_outAddress);
	
	
	s_data <= s_readData when (En_visor = '1') else insert;
		
	Bin2Bcd : entity work.Bin2Bcd(Behavioral)
					port map(input => s_data,
								HEX0 => hex_uni,
								HEX1 => hex_dez,
								HEX2 => hex_cen,
								HEX3 => hex_mil);
	
	
	Bin7SegDecoder_uni : entity work.Bin7SegDecoder(Behavioral)
								port map(enable => '1', 
											binInput => hex_uni,
											decOut_n => HEX0);
	
	Bin7SegDecoder_dez : entity work.Bin7SegDecoder(Behavioral)
								port map(enable => '1', 
											binInput => hex_dez,
											decOut_n => HEX1);
	
	Bin7SegDecoder_cen : entity work.Bin7SegDecoder(Behavioral)
								port map(enable => '1', 
											binInput => hex_cen,
											decOut_n => HEX2);
	
	Bin7SegDecoder_mil : entity work.Bin7SegDecoder(Behavioral)
								port map(enable => '1', 
											binInput => hex_mil,
											decOut_n => HEX3);


									
	ram_done <= s_ram_done; 
	LEDG(0) <= s_cont1_done;


end Behavioral;