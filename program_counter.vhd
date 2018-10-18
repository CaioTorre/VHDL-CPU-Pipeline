library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity program_counter is
	port	(clock:	in  std_logic;
			pc_upd:	in  std_logic_vector(0 to 31);
			pc:		out std_logic_vector(0 to 31) := "00000000000000000000000000000000");
end program_counter;

architecture count of program_counter is
begin 
	process (clock, pc_upd)
	begin
		if (clock'event and clock = '1') then 
			pc <= pc_upd;
		end if;
	end process;
end;