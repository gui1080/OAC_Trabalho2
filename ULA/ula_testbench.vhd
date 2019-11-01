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
	
	A <= (others => '0');
	B <= (others => '1');
	op <= "0000";
	
	wait for 500 ns;
	
	assert(result = B) report "Falhou: op = 0000 - SOMA" severity ERROR;
	
	report "FIM" severity NOTE;
	
	end process;
end behavior;
