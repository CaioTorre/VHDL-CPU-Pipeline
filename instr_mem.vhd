library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity instr_mem is
	port (address: in std_logic_vector(0 to 31);
			instruction: out std_logic_vector(0 to 31) := "00000000000000000000000000000000");
end instr_mem;

architecture imem of instr_mem is
	type mem_type is array(0 to 100) of std_logic_vector(0 to 7);
	signal memory: mem_type;
begin
	--memory(0) <= "00000000000000000000000000000000";
	--memory(1) <= "01010101010101010101010101010101";
	--memory(0) <= "00000000";
	--memory(1) <= "00000000";
	--memory(2) <= "00000000";
	--memory(3) <= "00000000";
	
	--memory(4) <= "01010101";
	--memory(5) <= "01010101";
	--memory(6) <= "01010101";
	--memory(7) <= "01010101";
	
	memory(0)  <= "00001100"; -- ADDI
	memory(1)  <= "00100001"; -- $1, $1
	memory(2)  <= "01010101"; -- 01010...
	memory(3)  <= "01010101";
	
	memory(4)  <= "00000000"; -- NOP
	memory(5)  <= "00000000";
	memory(6)  <= "00000000";
	memory(7)  <= "00000000";
	
	memory(8)  <= "00001000"; -- SUB
	memory(9)  <= "01100110";
	memory(10) <= "00101000";
	memory(11) <= "00000000";
	
	memory(12) <= "00010100";
	memory(13) <= "01001000";
	memory(14) <= "00000000";
	memory(15) <= "00000000";
	
	--instruction <= memory(to_integer(unsigned(address)));
	process (address)
	begin
		instruction <= memory(to_integer(unsigned(address))) & memory(to_integer(unsigned(address)) + 1) & memory(to_integer(unsigned(address)) + 2) & memory(to_integer(unsigned(address)) + 3);
	end process;
end;