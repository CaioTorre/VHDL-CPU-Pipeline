library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity data_mem is
	port	(address:	in  std_logic_vector(0 to 31);
			clock:		in std_logic;
			mem_write:	in std_logic;
			write_data:	in  std_logic_vector(0 to 31);
			mem_read:	in 	std_logic;
			read_data:	out std_logic_vector(0 to 31));
end data_mem;

architecture imem of data_mem is
	type mem_type is array(0 to 4294967295) of std_logic_vector(0 to 31);
	signal memory: mem_type;
begin
	memory(0) <= "00000000000000000000000000000000";
	memory(1) <= "01010101010101010101010101010101";
	
	process(clock)
	begin
		if (clock'EVENT and clock = '1') then
			if (mem_write = '1') then
				memory(to_integer(unsigned(address))) <= write_data;
			end if;
			if (mem_read = '1') then 
				read_data <= memory(to_integer(unsigned(address)));
			end if;
		end if;
	end process;
end;