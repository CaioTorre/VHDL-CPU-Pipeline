library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity instr_mem is
	port (address: in std_logic_vector(0 to 31);
			instruction: out std_logic_vector(0 to 31));
end instr_mem;

architecture imem of instr_mem is
	type mem_type is array(0 to 100) of std_logic_vector(0 to 31);
	signal memory: mem_type;
begin
	memory(0) <= "00000000000000000000000000000000";
	memory(1) <= "01010101010101010101010101010101";
	
	instruction <= memory(to_integer(unsigned(address)));
end;