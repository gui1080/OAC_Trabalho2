library ieee;
use ieee.std_logic_1164.ALL;

entity COMP4 is
	port(
		A, B : in std_logic_vector(3 downto 0);
		ALTB_IN, AEQB_IN, AGTB_IN : in std_logic;
		ALTB_OUT, AEQB_OUT, AGTB_OUT : out std_logic
		);
end COMP4;

architecture ARC of COMP4 is
	component COMP1 is
		port(
			A, B, ALTB_IN, AEQB_IN, AGTB_IN : in std_logic;
			ALTB_OUT, AEQB_OUT, AGTB_OUT : out std_logic
			);
	end component;

	signal LT1, GT1, EQ1 : std_logic;
	signal LT2, GT2, EQ2 : std_logic;
	signal LT3, GT3, EQ3 : std_logic;

	begin
		U0 : COMP1 port map(A(0), B(0), ALTB_IN, AEQB_IN, AGTB_IN, LT1, EQ1, GT1);
		U1 : COMP1 port map(A(1), B(1), LT1, EQ1, GT1, LT2, EQ2, GT2);
		U2 : COMP1 port map(A(2), B(2), LT2, EQ2, GT2, LT3, EQ3, GT3);
		U3 : COMP1 port map(A(3), B(3), LT3, EQ3, GT3, ALTB_OUT, AEQB_OUT, AGTB_OUT);
end ARC;
