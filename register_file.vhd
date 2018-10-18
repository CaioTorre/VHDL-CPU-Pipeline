library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity register_file is
	port	(regwrite: in std_logic;
			clock: in std_logic;
			read_register_1:	in  std_logic_vector(0 to 4);
			read_register_2:	in  std_logic_vector(0 to 4);
			write_register:		in  std_logic_vector(0 to 4);
			write_data:			in  std_logic_vector(0 to 31);
			read_data_1: 		out std_logic_vector(0 to 31);
			read_data_2: 		out std_logic_vector(0 to 31));
end register_file;

architecture regs of register_file is
	type register_type is array(0 to 31) of std_logic_vector(0 to 31);
	signal registers: register_type;
begin
	process(clock)
	begin
		if (clock'EVENT and clock = '1' and regwrite = '1') then
			registers(to_integer(unsigned(write_register))) <= write_data;
		end if;
	end process;
	
	read_data_1 <= registers(to_integer(unsigned(read_register_1)));
	read_data_2 <= registers(to_integer(unsigned(read_register_2)));
end;