library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity mux21_5 is
	port	(a:		in  std_logic_vector(0 to 4);
			b:		in  std_logic_vector(0 to 4);
			sel:	in  std_logic;
			g:		out std_logic_vector(0 to 4));
end mux21_5;

architecture m of mux21_5 is
begin
	process(sel, a, b)
	begin
		if (sel = '0') then 
			g <= a;
		else 
			g <= b;
		end if;
	end process;
end;