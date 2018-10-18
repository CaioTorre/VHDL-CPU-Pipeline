library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity adder is
	port	(a:	in  std_logic_vector(0 to 31);
			b:	in  std_logic_vector(0 to 31);
			g:	out std_logic_vector(0 to 31));
end adder;

architecture add of adder is
begin
	g <= a + b;
end;