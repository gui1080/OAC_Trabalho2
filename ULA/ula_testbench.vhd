--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:09:07 10/31/2019
-- Design Name:   
-- Module Name:   /home/castorzaum/Documents/Projetos/SD/Projetos ISE/ULA_OAC/ula-testbench.vhd
-- Project Name:  ULA_OAC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ula
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
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
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
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
	
	A <= ("00000000000000000000000000001010");
	B <= ("00000000000000000000000000000101");
	op <= "0000";
	
	wait for 20 ns;
	
	assert(result = "00000000000000000000000000001111") report "Falhou: op = 0000 - SUM" severity ERROR;
	
	-- TESTE SUB OP 0001

	op <= "0001";
	
	wait for 20 ns;
	
	assert(result = "00000000000000000000000000000101") report "Falhou: op = 0001 - SUB" severity ERROR;
	
	-- TESTE SHIFT LEFT OP 0010

	op <= "0010";
	
	wait for 20 ns;
	
	assert(result = "00000000000000000000000101000000") report "Falhou: op = 0010 - SHIFT LEFT" severity ERROR;
	
	-- TESTE A < B -SIGNED OP 0011

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
	
	assert(result = "00000000000000000000000000001111") report "Falhou: op = 0101 - A XOR B" severity ERROR;
	
	-- TESTE A SHIFT RIGHT LOGIC B OP 0110

	op <= "0110";
	
	wait for 20 ns;
	
	assert(result = "00000000000000000000000000000000") report "Falhou: op = 0110 - A SHIFT RIGHT LOGIC B" severity ERROR;
	
	-- TESTE A SHIFT RIGHT ARITH B OP 0111

	op <= "0111";
	
	wait for 20 ns;
	
	assert(result = "00000000000000000000000000000000") report "Falhou: op = 0111 - A SHIFT RIGHT ARITH B" severity ERROR;
	
	-- TESTE A OR B OP 1000

	op <= "1000";
	
	wait for 20 ns;
	
	assert(result = "00000000000000000000000000001111") report "Falhou: op = 1000 - A OR B" severity ERROR;
	
	-- TESTE A AND B OP 1001

	op <= "1001";
	
	wait for 20 ns;
	
	assert(result = "00000000000000000000000000000000") report "Falhou: op = 1001 - A AND B" severity ERROR;
	
	-- TESTE A EQUAL B OP 1010

	op <= "1010";
	
	wait for 20 ns;
	
	assert(result = "00000000000000000000000000000000") report "Falhou: op = 1010 - A EQUAL B" severity ERROR;
	
	-- TESTE A NOT EQUAL B OP 1011

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
