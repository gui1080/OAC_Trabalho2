library ieee;
use ieee.std_logic_1164.all;

entity COMP1 is
	port(
		A, B, ALTB_IN, AEQB_IN, AGTB_IN : in std_logic;
		ALTB_OUT, AEQB_OUT, AGTB_OUT : out std_logic
		);
end COMP1;

architecture ARC of COMP1 is
	begin
		ALTB_OUT <= (not(A) and B) or ((not(A xor B)) and ALTB_IN);
		--ALTB_OUT <= ((not(A) and B) or not(A xor B)) and ALTB_IN;
		AEQB_OUT <= (not(A xor B)) and AEQB_IN;
		AGTB_OUT <= (A and not(B)) or (not(A xor B) and AGTB_IN);
		--AGTB_OUT <= ((A and not(B)) or not(A xor B)) and AGTB_IN;		
		
end ARC;