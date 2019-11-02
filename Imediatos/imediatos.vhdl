----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:32:48 11/01/2019 
-- Design Name: 
-- Module Name:    imediatos - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity imediatos is
    Port ( inst : in  STD_LOGIC_VECTOR (31 downto 0);
           imm32 : out  STD_LOGIC_VECTOR (31 downto 0));
end imediatos;

architecture Behavioral of imediatos is

	signal opcode: std_logic_vector (6 downto 0);
	signal default: std_logic_vector (31 downto 0);
	signal aux: std_logic_vector (19 downto 0);
	signal aux_j: std_logic_vector (11 downto 0);

begin
	
	default <= (others => '0');
	opcode <= inst(6 downto 0);
	aux <= (others => inst(31));
	aux_j <= (others => inst(31));
	
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

