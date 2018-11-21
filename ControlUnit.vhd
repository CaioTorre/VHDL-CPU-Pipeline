library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ControlUnit is
	port (opcode:	in  std_logic_vector(0 to 5);
			pcsrc:	out std_logic := '0';
			jmptp:	out std_logic := '0';
			wb:		out std_logic_vector(0 to 1) := "00";
			mem:		out std_logic_vector(0 to 2) := "000";
			ex:		out std_logic_vector(0 to 3) := "0000");
end ControlUnit;

architecture ctrl of ControlUnit is
begin
	process(opcode)
	begin
		case opcode is
			when "000000" => -- NOP
				pcsrc			<= '0';
				ex				<= "XXXX";
				mem			<= "0X0";
				--mem(2)		<= '0';
				--mem(0)		<= '0';
				wb				<= "X0";
				--wb(1)			<= '0';
				
			when "000001" => -- ADD
				pcsrc			<= '0';
				ex 			<=	"0001";
				--ex(1 to 2)	<= "00";
				--ex(0)			<= '0';
				--ex(3)			<= '1';
				mem			<= "0X0";
				--mem(2)		<= '0';
				--mem(0)		<= '0';
				wb <= "01";
				--wb(0)			<= '0';
				--wb(1)			<= '1';
				
			when "000010" => -- SUB
				pcsrc			<= '0';
				ex 			<= "0011";
				--ex(1 to 2)	<= "01";
				--ex(0)			<= '0';
				--ex(3)			<= '1';
				mem			<= "0X0";
				--mem(2)		<= '0';
				--mem(0)		<= '0';
				wb				<= "01";
				--wb(0)			<= '0';
				--wb(1)			<= '1';
				
			when "000011" => -- ADDI
				pcsrc			<= '0';
				ex				<= "1000";
				--ex(1 to 2)	<= "00";
				--ex(0)			<= '1';
				--ex(3)			<= '0';
				mem			<= "0X0";
				--mem(2)		<= '0';
				--mem(0)		<= '0';
				wb				<= "01";
				--wb(0)			<= '0';
				--wb(1)			<= '1';
				
			when "000100" => -- SUBI
				pcsrc			<= '0';
				ex				<= "1010";
				--ex(1 to 2)	<= "01";
				--ex(0)			<= '1';
				--ex(3)			<= '0';
				mem			<= "0X0";
				--mem(2)		<= '0';
				--mem(0)		<= '0';
				wb				<= "01";
				--wb(0)			<= '0';
				--wb(1)			<= '1';
				
			when "000101" => -- LW
				pcsrc			<= '0';
				ex				<= "1000";
				--ex(1 to 2)	<= "00";
				--ex(0)			<= '1';
				--ex(3)			<= '0';
				mem			<= "010";
				--mem(2)		<= '0';
				--mem(0)		<= '0';
				--mem(1)		<= '1';
				wb				<= "11";
				--wb(0)			<= '1';
				--wb(1)			<= '1';
			
			when "000110" => -- SW
				pcsrc			<= '0';
				ex				<= "100X";
				--ex(1 to 2)	<= "00";
				--ex(0)			<= '1';
				mem			<= "1X0";
				--mem(2)		<= '0';
				--mem(0)		<= '1';
				wb				<= "00";
				--wb(0)			<= '0';
				--wb(1)			<= '0';
				
			when "000111" => -- AND
				pcsrc			<= '0';
				ex				<= "0101";
				--ex(1 to 2)	<= "10";
				--ex(0)			<= '0';
				--ex(3)			<= '1';
				mem			<= "0X0";
				--mem(2)		<= '0';
				--mem(0)		<= '0';
				wb				<= "01";
				--wb(0)			<= '0';
				--wb(1)			<= '1';
				
			when "001000" => -- OR
				pcsrc			<= '0';
				ex				<= "0111";
				--ex(1 to 2)	<= "11";
				--ex(0)			<= '0';
				--ex(3)			<= '1';
				mem			<= "0X0";
				--mem(2)		<= '0';
				--mem(0)		<= '0';
				wb				<= "01";
				--wb(0)			<= '0';
				--wb(1)			<= '1';
				
			when "001001" => -- ANDI
				pcsrc			<= '0';
				ex				<= "1100";
				--ex(1 to 2)	<= "10";
				--ex(0)			<= '1';
				--ex(3)			<= '0';
				mem			<= "0X0";
				--mem(2)		<= '0';
				--mem(0)		<= '0';
				wb				<= "01";
				--wb(0)			<= '0';
				--wb(1)			<= '1';
				
			when "001010" => -- ORI
				pcsrc			<= '0';
				ex				<= "1110";
				--ex(1 to 2)	<= "11";
				--ex(0)			<= '1';
				--ex(3)			<= '0';
				mem			<= "0X0";
				--mem(2)		<= '0';
				--mem(0)		<= '0';
				wb				<= "01";
				--wb(0)			<= '0';
				--wb(1)			<= '1';
				
			when "001011" => -- BEQ
				pcsrc			<= '0';
				ex				<= "001X";
				--ex(1 to 2)	<= "01";
				--ex(0)			<= '0'; -- was 1
				mem			<= "0X1";
				--mem(2)		<= '1';
				--mem(0)		<= '0';
				wb				<= "00";
				--wb(0)			<= '0';
				--wb(1)			<= '0';
				
			when "001100" => -- J
				pcsrc			<= '1';
				jmptp			<= '0';
				ex				<= "XXXX";
				mem			<= "0XX";
				--mem(0)		<= '0';
				wb				<= "00";
				--wb(0)			<= '0';
				--wb(1)			<= '0';
				
			when "001101" => -- JR
				pcsrc			<= '1';
				jmptp			<= '1';
				ex				<= "XXXX";
				mem			<= "0XX";
				--mem(0)		<= '0';
				wb				<= "00";
				--wb(0)			<= '0';
				--wb(1)			<= '0';
			
			when others => 
				pcsrc			<= '0';
				ex				<= "XXXX";
				mem			<= "0X0";
				--mem(2)		<= '0';
				--mem(0)		<= '0';
				wb				<= "00";
				--wb(1)			<= '0';
		end case;
	end process;
end;