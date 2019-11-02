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


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- Entradas e saídas da entidade:
entity ula is
		generic (DATA_WIDTH : natural := 32);
		port (
				A, B	: in std_logic_vector(DATA_WIDTH -1 downto 0);			-- Operando A e B
				op  	: in std_logic_vector(3 downto 0);									-- Operação
				result: out std_logic_vector(DATA_WIDTH -1 downto 0)			-- Resultado
		);
end entity ula;

architecture ula of ula is

-- Sinais de comparação
-- Em um process, se faz todas as dadas comparações, e se atribui a resposta a um determinado vetor
-- Ao final, apenas ligamos o resultado na saída caso seja pedido

signal   sinal_A_menor_com_sinal, sinal_default, sinal_A_menor_sem_sinal: STD_LOGIC_VECTOR (DATA_WIDTH -1 downto 0);
signal   sinal_A_igual_B, sinal_A_dif_B: STD_LOGIC_VECTOR (DATA_WIDTH -1 downto 0);
signal   sinal_A_maiorigual_B_com_sinal, sinal_A_maiorigual_B_sem_sinal: STD_LOGIC_VECTOR (DATA_WIDTH -1 downto 0);

-- obs: "Algumas operações (ex.:+,-) não funcionarão com std_logic_vector.
-- Para isso, será necessário converter para signed ou unsigned, realizar a
-- operação, e depois reconverter pra std_logic_vector.

begin

------------------------------------------------- process começa aqui

	process(op)
		begin

			sinal_A_menor_com_sinal <= (others => '0');					-- enchemos o vetor com zeros
			if (signed(A) < signed(B)) then
					sinal_A_menor_com_sinal(0) <= '1';							-- se a condição é satisfeita, colocamos o 1 na posição (0)
			end if;

			sinal_A_menor_sem_sinal <= (others => '0');					-- enchemos o vetor com zeros
			if (unsigned(A) < unsigned(B)) then
					sinal_A_menor_sem_sinal(0) <= '1';							-- se a condição é satisfeita, colocamos o 1 na posição (0)
			end if;

			sinal_A_igual_B <= (others => '0');									-- enchemos o vetor com zeros
			if (unsigned(A) = unsigned(B)) then
					sinal_A_igual_B(0) <= '1';											-- se a condição é satisfeita, colocamos o 1 na posição (0)
			end if;

			sinal_A_dif_B <= (others => '0');										-- enchemos o vetor com zeros
			if (unsigned(A) /= unsigned(B)) then
					sinal_A_dif_B(0) <= '1';												-- se a condição é satisfeita, colocamos o 1 na posição (0)
			end if;

			sinal_A_maiorigual_B_com_sinal <= (others => '0');	-- enchemos o vetor com zeros
			if (signed(A) >= signed(B)) then
					sinal_A_maiorigual_B_com_sinal(0) <= '1';				-- se a condição é satisfeita, colocamos o 1 na posição (0)
			end if;

			sinal_A_maiorigual_B_sem_sinal <= (others => '0');	-- enchemos o vetor com zeros
			if (unsigned(A) >= unsigned(B)) then
					sinal_A_maiorigual_B_sem_sinal(0) <= '1';				-- se a condição é satisfeita, colocamos o 1 na posição (0)
			end if;

			-- se a condição testada não é satisfeita, retornamos o vetor original cheio de zeros

		end process;

---------------------------------------- process termina aqui

sinal_default <= (others => '1');													-- para debug: se a operação é inválida, retornamos um vetor apenas com 1 em todas as posições

-- O switch case a seguir segue as especificações da ULA dadas no pedido do trabalho

result <= std_logic_vector(signed(A) + signed(B))												when op="0000" else
					std_logic_vector(signed(A) - signed(B))										when op="0001" else
					std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(B)))) 	when op="0010" else
					sinal_A_menor_com_sinal 															when op="0011" else
					sinal_A_menor_sem_sinal 															when op="0100" else
					std_logic_vector(unsigned(A) xor unsigned(B)) 								when op="0101" else
					std_logic_vector(shift_right(unsigned(A), to_integer(unsigned(B)))) 	when op="0110" else
					std_logic_vector(shift_right(signed(A), to_integer(unsigned(B)))) 	when op="0111" else
					std_logic_vector(A or B) 															when op="1000" else
					std_logic_vector(A and B) 															when op="1001" else
					sinal_A_igual_B 																		when op="1010" else
					sinal_A_dif_B 																			when op="1011" else
					sinal_A_maiorigual_B_com_sinal 													when op="1100" else
					sinal_A_maiorigual_B_sem_sinal 													when op="1101" else
					sinal_default;
end ula;
