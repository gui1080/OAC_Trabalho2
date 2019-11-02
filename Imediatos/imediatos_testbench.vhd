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

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY imediatos_testbench IS
END imediatos_testbench;

ARCHITECTURE behavior OF imediatos_testbench IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT imediatos
    PORT(
         inst : IN  std_logic_vector(31 downto 0);
         imm32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal inst : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal imm32 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with
   -- appropriate port name

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: imediatos PORT MAP (
          inst => inst,
          imm32 => imm32
        );
 
   process
   begin

	-- TESTE TIPO R

	inst <= "00000000000000000000001010110011";

	wait for 20 ns;

	assert(imm32 = "00000000000000000000000000000000") report "Falhou: - tipo r" severity ERROR;

	-- TESTE TIPO S

	inst <= "00000010010101000010111000100011";

	wait for 20 ns;

	assert(imm32 = "00000000000000000000000000111100") report "Falhou: - tipo s" severity ERROR;

   end process;

END behavior;
