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
use ieee.numeric_std.all;

ENTITY ula_testbench IS
END ula_testbench;

ARCHITECTURE behavior OF ula_testbench IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT ula
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         op : IN  std_logic_vector(3 downto 0);
         result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal op : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(31 downto 0);

begin

	uut: ula PORT MAP (
          A => A,
          B => B,
          op => op,
          result => result
        );

	process
	begin

	-- TESTE SUM OP 0000

	A <= ("01001110000001000001000011001010");
	B <= ("00001000011000000001000001100101");
	op <= "0000";

	wait for 20 ns;

	assert(result = "01010110011001000010000100101111") report "Falhou: op = 0000 - SUM" severity ERROR;

	-- TESTE SUB OP 0001

	op <= "0001";

	wait for 20 ns;

	assert(result = "01000101101001000000000001100101") report "Falhou: op = 0001 - SUB" severity ERROR;

	-- TESTE SHIFT LEFT OP 0010

	A <= ("01001110000001000001000011001010");
	B <= ("00000000000000000000000000000101");
	op <= "0010";

	wait for 20 ns;

	assert(result = "11000000100000100001100101000000") report "Falhou: op = 0010 - SHIFT LEFT" severity ERROR;

	-- TESTE A < B -SIGNED OP 0011

	A <= ("01001110000001000001000011001010");
	B <= ("00001000011000000001000001100101");
	op <= "0011";

	wait for 20 ns;

	assert(result = "00000000000000000000000000000000") report "Falhou: op = 0011 - A < B -SIGNED" severity ERROR;

	-- TESTE A < B -UNSIGNED OP 0100

	op <= "0100";

	wait for 20 ns;

	assert(result = "00000000000000000000000000000000") report "Falhou: op = 0100 - A < B -UNSIGNED" severity ERROR;

	-- TESTE A XOR B OP 0101

	op <= "0101";

	wait for 20 ns;

	assert(result = "01000110011001000000000010101111") report "Falhou: op = 0101 - A XOR B" severity ERROR;

	-- TESTE A SHIFT RIGHT LOGIC B OP 0110

	A <= ("01001110000001000001000011001010");
	B <= ("00000000000000000000000000000101");
	op <= "0110";

	wait for 20 ns;

	assert(result = "00000010011100000010000010000110") report "Falhou: op = 0110 - A SHIFT RIGHT LOGIC B" severity ERROR;

	-- TESTE A SHIFT RIGHT ARITH B OP 0111

	op <= "0111";

	wait for 20 ns;

	assert(result = "00000010011100000010000010000110") report "Falhou: op = 0111 - A SHIFT RIGHT ARITH B" severity ERROR;

	-- TESTE A OR B OP 1000

	A <= ("01001110000001000001000011001010");
	B <= ("00001000011000000001000001100101");
	op <= "1000";

	wait for 20 ns;

	assert(result = "01001110011001000001000011101111") report "Falhou: op = 1000 - A OR B" severity ERROR;

	-- TESTE A AND B OP 1001

	op <= "1001";

	wait for 20 ns;

	assert(result = "00001000000000000001000001000000") report "Falhou: op = 1001 - A AND B" severity ERROR;

	A <= ("01001110000001000001000011001010");
	B <= ("01001110000001000001000011001010");
	-- TESTE A EQUAL B OP 1010

	op <= "1010";

	wait for 20 ns;

	assert(result = "00000000000000000000000000000001") report "Falhou: op = 1010 - A EQUAL B" severity ERROR;

	-- TESTE A NOT EQUAL B OP 1011

	A <= ("01001110000001000001000011001010");
	B <= ("00001000011000000001000001100101");
	op <= "1011";

	wait for 20 ns;

	assert(result = "00000000000000000000000000000001") report "Falhou: op = 1011 - A NOT EQUAL B" severity ERROR;

	-- TESTE A GREATER B (SIGNED) OP 1100

	op <= "1100";

	wait for 20 ns;

	assert(result = "00000000000000000000000000000001") report "Falhou: op = 1100 - A GREATER B (SIGNED)" severity ERROR;

	-- TESTE A GREATER B (UNSIGNED) OP 1101

	op <= "1101";

	wait for 20 ns;

	assert(result = "00000000000000000000000000000001") report "Falhou: op = 1101 - A GREATER B (UNSIGNED)" severity ERROR;

	-- TESTE DEFAULT OP 1111

	op <= "1111";

	wait for 20 ns;

	assert(result = "11111111111111111111111111111111") report "Falhou: op = 1111 - DEFAULT" severity ERROR;

	report "FIM" severity NOTE;

	end process;
end behavior;
