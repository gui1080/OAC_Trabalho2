---------------------------------------------------------------------------------------------
--		Organização e Arquitetura de Computadores - Turma C
--			Trabalho 2 - VHDL
--				Unb -2/2019
--
-- Nome: Gabriel Matheus			Matrícula: 17/0103498
-- Nome: Guilherme Braga			Matrícula: 17/0162290
-- Nome: Victor Eduardo			  Matrícula: 17/0115127
--
-- Link para o trabalho no Github --> https://github.com/therealguib545/OAC_Trabalho2
--
---------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity imediatos is
    Port ( inst : in  STD_LOGIC_VECTOR (31 downto 0);
           imm32 : out  STD_LOGIC_VECTOR (31 downto 0));
end imediatos;

architecture Behavioral of imediatos is

	signal opcode: std_logic_vector (6 downto 0);            -- o opcode que pegamos da instrução vai para este sinal
	signal default: std_logic_vector (31 downto 0);          -- sinal default para operações inválidas ou operações sem imediato
	signal aux: std_logic_vector (19 downto 0);              -- auxiliar criado para as operações em que há a necessidade de repetir o bit inst(31) 20 vezes
	signal aux_j: std_logic_vector (11 downto 0);            -- auxiliar para a instrução de tipo J

begin

	default <= (others => '0');                              -- sinal padrão é zero
	opcode <= inst(6 downto 0);                              -- opcode são estes 7 bits da instrução
	aux <= (others => inst(31));                             -- repetição do bit para ajudar na concatenação
	aux_j <= (others => inst(31));                           -- repetição do bit para ajudar na concatenação (instrução tipo J)

-- O switch case a seguir faz as determinadas concatenações de acordo com o pedido do trabalho
	imm32 <= (aux & inst(31 downto 20))																			when opcode = "0000011" else
				(aux & inst(31 downto 20)) 																		when opcode = "0010011" else
				(aux & inst(31 downto 20))																			when opcode = "1100111" else
				(aux & inst(31 downto 25) & inst(11 downto 7))    											when opcode = "0100011" else
				(aux & inst(7) & inst(30 downto 25) & inst(11 downto 8) & '0')		   				when opcode = "1100011" else
				(inst(31 downto 12) & "000000000000")															when opcode = "0010111" else
				(inst(31 downto 12) & "000000000000")															when opcode = "0110111" else
				(aux_j & inst(19 downto 12) & inst(20) & inst (30 downto 21) & '0')  				when opcode = "1101111" else
			   default;

end Behavioral;
