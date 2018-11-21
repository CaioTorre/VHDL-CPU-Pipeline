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
	memory(0) <= "00001100";
	memory(1) <= "00000001";
	memory(2) <= "00000000";
	memory(3) <= "00000000";-- addi 1,0,0-- addi 0

	memory(4) <= "00001100";
	memory(5) <= "00000010";
	memory(6) <= "00000000";
	memory(7) <= "00000000";-- addi 2,0,0-- addi 0

	memory(8) <= "00001100";
	memory(9) <= "00000011";
	memory(10) <= "00000000";
	memory(11) <= "00000000";-- addi 3,0,0-- addi 0

	memory(12) <= "00001100";
	memory(13) <= "00000100";
	memory(14) <= "00000000";
	memory(15) <= "00000001";-- addi 4,0,1-- addi 1

	memory(16) <= "00001100";
	memory(17) <= "00000101";
	memory(18) <= "00000000";
	memory(19) <= "00000111";-- addi 5,0,7-- addi 7

	memory(20) <= "00000000";
	memory(21) <= "00000000";
	memory(22) <= "00000000";
	memory(23) <= "00000000";

	memory(24) <= "00000000";
	memory(25) <= "00000000";
	memory(26) <= "00000000";
	memory(27) <= "00000000";

	memory(28) <= "00000000";
	memory(29) <= "00000000";
	memory(30) <= "00000000";
	memory(31) <= "00000000";

	memory(32) <= "00101100";
	memory(33) <= "10100011";
	memory(34) <= "00000000";
	memory(35) <= "00011001";-- beq 3,5,25-- beq 25

	memory(36) <= "00000000";
	memory(37) <= "00000000";
	memory(38) <= "00000000";
	memory(39) <= "00000000";

	memory(40) <= "00000000";
	memory(41) <= "00000000";
	memory(42) <= "00000000";
	memory(43) <= "00000000";

	memory(44) <= "00000000";
	memory(45) <= "00000000";
	memory(46) <= "00000000";
	memory(47) <= "00000000";

	memory(48) <= "00101100";
	memory(49) <= "10000011";
	memory(50) <= "00000000";
	memory(51) <= "00000101";-- beq 3,4,5-- beq 5

	memory(52) <= "00000000";
	memory(53) <= "00000000";
	memory(54) <= "00000000";
	memory(55) <= "00000000";

	memory(56) <= "00000000";
	memory(57) <= "00000000";
	memory(58) <= "00000000";
	memory(59) <= "00000000";

	memory(60) <= "00000000";
	memory(61) <= "00000000";
	memory(62) <= "00000000";
	memory(63) <= "00000000";

	memory(64) <= "00110000";
	memory(65) <= "00000000";
	memory(66) <= "00000000";
	memory(67) <= "00010111";-- j 23

	memory(68) <= "00000000";
	memory(69) <= "00000000";
	memory(70) <= "00000000";
	memory(71) <= "00000000";

	memory(72) <= "00001100";
	memory(73) <= "00000001";
	memory(74) <= "00000000";
	memory(75) <= "00000001";-- addi 1,0,1-- addi 1

	memory(76) <= "00001100";
	memory(77) <= "00000010";
	memory(78) <= "00000000";
	memory(79) <= "00000000";-- addi 2,0,0-- addi 0

	memory(80) <= "00110000";
	memory(81) <= "00000000";
	memory(82) <= "00000000";
	memory(83) <= "00011101";-- j 29

	memory(84) <= "00000000";
	memory(85) <= "00000000";
	memory(86) <= "00000000";
	memory(87) <= "00000000";

	memory(88) <= "00000000";
	memory(89) <= "00000000";
	memory(90) <= "00000000";
	memory(91) <= "00000000";

	memory(92) <= "00000100";
	memory(93) <= "00100010";
	memory(94) <= "00001000";
	memory(95) <= "00000000";-- add 1,1,2

	memory(96) <= "00000000";
	memory(97) <= "00000000";
	memory(98) <= "00000000";
	memory(99) <= "00000000";

	memory(100) <= "00000000";
	memory(101) <= "00000000";
	memory(102) <= "00000000";
	memory(103) <= "00000000";

	memory(104) <= "00000000";
	memory(105) <= "00000000";
	memory(106) <= "00000000";
	memory(107) <= "00000000";

	memory(108) <= "00001000";
	memory(109) <= "00100010";
	memory(110) <= "00010000";
	memory(111) <= "00000000";-- sub 2,1,2

	memory(112) <= "00000000";
	memory(113) <= "00000000";
	memory(114) <= "00000000";
	memory(115) <= "00000000";

	memory(116) <= "00000000";
	memory(117) <= "00000000";
	memory(118) <= "00000000";
	memory(119) <= "00000000";

	memory(120) <= "00001100";
	memory(121) <= "01100011";
	memory(122) <= "00000000";
	memory(123) <= "00000001";-- addi 3,3,1-- addi 1

	memory(124) <= "00110000";
	memory(125) <= "00000000";
	memory(126) <= "00000000";
	memory(127) <= "00001000";-- j 8

	memory(128) <= "00000000";
	memory(129) <= "00000000";
	memory(130) <= "00000000";
	memory(131) <= "00000000";

	memory(132) <= "00000000";
	memory(133) <= "00000000";
	memory(134) <= "00000000";
	memory(135) <= "00000000";

	memory(136) <= "00000100";
	memory(137) <= "00000001";
	memory(138) <= "00010000";
	memory(139) <= "00000000";-- add 2,0,1

	memory(140) <= "00000100";
	memory(141) <= "00000001";
	memory(142) <= "00011000";
	memory(143) <= "00000000";-- add 3,0,1

	--instruction <= memory(to_integer(unsigned(address)));
	process (address)
	begin
		instruction <= memory(to_integer(unsigned(address))) & memory(to_integer(unsigned(address)) + 1) & memory(to_integer(unsigned(address)) + 2) & memory(to_integer(unsigned(address)) + 3);
	end process;
end;