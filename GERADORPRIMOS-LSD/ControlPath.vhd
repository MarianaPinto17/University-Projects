library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ControlPath is
	port(clk           : in  std_logic;
		  KEY           : in  std_logic_vector(2 downto 0); 
		  s_valid1      : in  std_logic; --sinal da validaçao do 1º numero inserido
		  s_valid2		 : in  std_logic; --sinal da validaçao do 2º numero inserido
		  cont1_done    : in  std_logic; --sinal da finalizaçao do contador 1
		  numberGo1     : in  std_logic; --sinal para mandar o numero para o contador 2
		  cont2_done    : in  std_logic; --sinal da finalizaçao do contador 2
		  numberGo2     : in  std_logic; --sinal para mandar o numero para o resto
		  ram_done      : in  std_logic; --sinal se a ram acabou de escrever
		  resto_done    : in  std_logic; --sinal se o resto ta feito
		  equals_zero   : in  std_logic; --sinal se e igual a zero ou nao
		  visor_done    : in  std_logic; --sinal para mostrar que mostrou os numeros todos
		  loadStandBy   : out std_logic := '0'; --sinal para o load do cont1
		  loadNumberGo2 : out std_logic := '0'; --sinal para entrar no load do cont2
		  En_intro      : out std_logic := '0';
		  En_Valid_1    : out std_logic := '0';
		  En_Valid_2	 : out std_logic := '0';
		  En_cont1      : out std_logic := '0';
		  En_cont2      : out std_logic := '0';
		  En_res        : out std_logic := '0';
		  En_comp       : out std_logic := '0';
		  En_ram        : out std_logic := '0';
		  En_visor      : out std_logic := '0';
		  stOut         : out std_logic_vector(2 downto 0));
end ControlPath;

architecture Behavioral of ControlPath is

	type State is (Ins_Val1, Valid_1,Valid_2, Ins_Val2, StandBy, Cont1, Cont2, Calc_Res, Comp, Ram, Visor);
	signal pState, nState : State;
	
	signal s_ins2, ins2 : std_logic := '0';

begin

	process(clk)
	begin
		if(rising_edge(clk)) then
			if(KEY(0) = '1') then
				ins2 <= '0';
				pState <= Ins_Val1;
			else
				ins2 <= s_ins2;
				pState <= nState;
			end if;
		end if;
	end process;
	
	process(KEY,s_valid1,s_valid2, cont1_done, numberGo1, cont2_done, numberGo2, ram_done, resto_done,  equals_zero, visor_done, pState, ins2, clk)
	begin
	
	En_intro 	  <= '0';
	En_Valid_1    <= '0';
	En_Valid_2	  <= '0';
	En_cont1		  <= '0';
	En_cont2		  <= '0';
	En_res		  <= '0';
	En_comp		  <= '0';
	En_ram 		  <= '0';
	En_visor		  <= '0';
	loadNumberGo2 <= '0';
	loadStandBy   <= '0';
	
	
		case pState is
				when Ins_Val1 =>
					En_intro <= '1';
					if(KEY(1) = '1') then
						nState <= Valid_1;
					else
						nState <= Ins_Val1;
					end if;
					
				when Valid_1 =>
					En_Valid_1 <= '1';
					if(s_valid1 = '1' and KEY = "000") then
						nState <= Ins_Val2;
					elsif(s_valid1 = '0') then
						nState <= Ins_Val1;
					else
						nState <= Valid_1;
					end if;
				
				
				when Ins_Val2 =>
					En_intro <= '1';
					if(KEY(1) = '1') then
						nState <= Valid_2;
					else
						nState <= Ins_Val2;
					end if;
				
				when Valid_2 =>
					En_Valid_2 <= '1';
					if(s_valid2 = '1') then
						nState <= StandBy;
					else
						nState <= Ins_Val2;
					end if;
				
				when StandBy =>
					loadStandBy <= '1';
					if(KEY(2) = '1') then
						nState <= Cont1;
					else
						nState <= StandBy;
					end if;
				
				when Cont1 =>
					En_cont1 <= '1';
					loadNumberGo2 <='1';
					if(KEY(2) = '1') then
						nState <= Cont1;
					elsif(numberGo1 = '1') then
						nState <= Cont2;
					elsif(cont1_done = '1') then
						nState <= Visor;
					else
						nState <= Cont1;
					end if;
				
				when Cont2 =>
					En_cont2 <= '1';
					if(KEY(2) = '1') then
						nState <= Cont1;
					elsif(numberGo2 = '1') then
						nState <= Calc_Res;
					elsif(cont2_done = '1') then 
						nState <= Ram;
					else
						nState <= Cont2;
					end if;
					
				when Calc_Res =>
					En_res <= '1';
					if(KEY(2) = '1') then
						nState <= Cont1;
					elsif(resto_done = '1') then
						nState <= Comp;
					else
						nState <= Calc_Res;
					end if;
				
				when Comp =>
					En_comp <= '1';
					if(KEY(2) = '1') then
						nState <= Cont1;
					elsif(equals_zero = '1') then
						nState <= Cont1;
					elsif(equals_zero = '0') then
						nState <= Cont2;
					else
						nState <= Comp;
					end if;
				
				when Ram =>
					En_ram <= '1';
					if(KEY(2) = '1') then
						nState <= Cont1;
					elsif(ram_done = '1') then
						nState <= Cont1;
					else
						nState <= Ram;
					end if;
				
				when Visor =>
					En_visor <= '1';
					if(visor_done = '1' and KEY(2) = '1') then
							nstate <= Cont1;
					elsif(visor_done = '1') then
						nstate <= Visor;
					else
						nstate <= Visor;
					end if;
				
				when others =>
					s_ins2 <= '0';
					nState <= Ins_Val1;
				end case;
	end process;


	with pState select
		stOut <= "001" when Ins_val1,
					"010" when Ins_val2,
					"100" when StandBy,
					"111" when others;
	
end Behavioral;