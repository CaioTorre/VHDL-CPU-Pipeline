library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity mux21_32 is
	port	(a:		in  std_logic_vector(0 to 31);
			b:		in  std_logic_vector(0 to 31);
			sel:	in  std_logic;
			g:		out std_logic_vector(0 to 31));
end mux21_32;

architecture m of mux21_32 is
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