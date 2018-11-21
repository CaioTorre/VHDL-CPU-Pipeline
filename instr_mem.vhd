library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity instr_mem is
	port (address: in std_logic_vector(0 to 31);
			instruction: out std_logic_vector(0 to 31) := "00000000000000000000000000000000");
end instr_mem;

architecture imem of instr_mem is
	type mem_type is array(0 to 384) of std_logic_vector(0 to 7);
	signal memory: mem_type;
begin
--	memory(0)  <= "00001100"; -- ADDI
--	memory(1)  <= "00000001"; -- $1, $1
--	memory(2)  <= "00000000"; -- 5
--	memory(3)  <= "00010101";
--	
--	memory(4)  <= "00000000"; -- NOP
--	memory(5)  <= "00000000";
--	memory(6)  <= "00000000";
--	memory(7)  <= "00000000";
--	
--	memory(8)  <= "00000000"; -- NOP
--	memory(9)  <= "00000000";
--	memory(10) <= "00000000";
--	memory(11) <= "00000000";
--	
--	memory(12) <= "00000000"; -- NOP
--	memory(13) <= "00000000";
--	memory(14) <= "00000000";
--	memory(15) <= "00000000";
--	
--	memory(16) <= "00011000"; -- SW
--	memory(17) <= "00000001";
--	memory(18) <= "00000000";
--	memory(19) <= "00000000";
--	
--	memory(20) <= "00000000"; -- NOP
--	memory(21) <= "00000000";
--	memory(22) <= "00000000";
--	memory(23) <= "00000000";
--	
--	memory(24) <= "00000000"; -- NOP
--	memory(25) <= "00000000";
--	memory(26) <= "00000000";
--	memory(27) <= "00000000";
--	
--	memory(28) <= "00000000"; -- NOP
--	memory(29) <= "00000000";
--	memory(30) <= "00000000";
--	memory(31) <= "00000000";
--	
--	memory(32) <= "00010100"; -- SW
--	memory(33) <= "00000100";
--	memory(34) <= "00000000";
--	memory(35) <= "00000000";
	
		memory(0) <= "00001100";
	memory(1) <= "01000001";
	memory(2) <= "00000000";
	memory(3) <= "00000011";-- addi 1,2,-858993460

	memory(4) <= "00000000";
	memory(5) <= "00000000";
	memory(6) <= "00000000";
	memory(7) <= "00000000";-- nop 1,2,-858993460

	memory(8) <= "00000000";
	memory(9) <= "00000000";
	memory(10) <= "00000000";
	memory(11) <= "00000000";-- nop 1,2,-858993460

	memory(12) <= "00000000";
	memory(13) <= "00000000";
	memory(14) <= "00000000";
	memory(15) <= "00000000";-- nop 1,2,-858993460

	memory(16) <= "00011000";
	memory(17) <= "00000001";
	memory(18) <= "00000000";
	memory(19) <= "00000000";-- sw 1,0,-858993460

	memory(20) <= "00000000";
	memory(21) <= "00000000";
	memory(22) <= "00000000";
	memory(23) <= "00000000";-- nop 1,0,-858993460

	memory(24) <= "00000000";
	memory(25) <= "00000000";
	memory(26) <= "00000000";
	memory(27) <= "00000000";-- nop 1,0,-858993460

	memory(28) <= "00000000";
	memory(29) <= "00000000";
	memory(30) <= "00000000";
	memory(31) <= "00000000";-- nop 1,0,-858993460

	memory(32) <= "00010100";
	memory(33) <= "00000010";
	memory(34) <= "00000000";
	memory(35) <= "00000000";-- lw 2,0,-858993460

	memory(36) <= "00000000";
	memory(37) <= "00000000";
	memory(38) <= "00000000";
	memory(39) <= "00000000";-- nop 2,0,-858993460

	memory(40) <= "00000000";
	memory(41) <= "00000000";
	memory(42) <= "00000000";
	memory(43) <= "00000000";-- nop 2,0,-858993460

	memory(44) <= "00000000";
	memory(45) <= "00000000";
	memory(46) <= "00000000";
	memory(47) <= "00000000";-- nop 2,0,-858993460

	memory(48) <= "00000100";
	memory(49) <= "00100010";
	memory(50) <= "00011000";
	memory(51) <= "00000000";-- add 3,1,2

	--instruction <= memory(to_integer(unsigned(address)));
	process (address)
	begin
		instruction <= memory(to_integer(unsigned(address))) & memory(to_integer(unsigned(address)) + 1) & memory(to_integer(unsigned(address)) + 2) & memory(to_integer(unsigned(address)) + 3);
	end process;
end;