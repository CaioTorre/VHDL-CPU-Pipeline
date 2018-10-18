library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity sign_extend is
	port	(a:	in  std_logic_vector(0 to 15);
			b:	out std_logic_vector(0 to 31));
end sign_extend;

architecture ext of sign_extend is 
begin
	process(a)
	begin
		if (a(0) = '0') then
			b <= "0000000000000000" & a;
		else 
			b <= "1111111111111111" & a;
		end if;
	end process;
end;