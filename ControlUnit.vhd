library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ControlUnit is
	port (opcode:	in  std_logic_vector(0 to 5);
			pcsrc:	out std_logic;
			jmptp:	out std_logic;
			wb:		out std_logic_vector(0 to 1);
			mem:		out std_logic_vector(0 to 2);
			ex:		out std_logic_vector(0 to 3));
end ControlUnit;

architecture ctrl of ControlUnit is
begin
	process(opcode)
	begin
		case opcode is
			when "000000" => -- NOP
				pcsrc			<= '1';
				mem(2)		<= '0';
				mem(0)		<= '0';
				wb(1)			<= '0';
				
			when "000001" => -- ADD
				pcsrc			<= '0';
				ex(1 to 2)	<= "00";
				ex(0)			<= '0';
				ex(3)			<= '1';
				mem(2)		<= '0';
				mem(0)		<= '0';
				wb(0)			<= '0';
				wb(1)			<= '1';
				
			when "000010" => -- SUB
				pcsrc			<= '0';
				ex(1 to 2)	<= "01";
				ex(0)			<= '0';
				ex(3)			<= '1';
				mem(2)		<= '0';
				mem(0)		<= '0';
				wb(0)			<= '0';
				wb(1)			<= '1';
				
			when "000011" => -- ADDI
				pcsrc			<= '0';
				ex(1 to 2)	<= "00";
				ex(0)			<= '1';
				ex(3)			<= '0';
				mem(2)		<= '0';
				mem(0)		<= '0';
				wb(0)			<= '0';
				wb(1)			<= '1';
				
			when "000100" => -- SUBI
				pcsrc			<= '0';
				ex(1 to 2)	<= "01";
				ex(0)			<= '1';
				ex(3)			<= '0';
				mem(2)		<= '0';
				mem(0)		<= '0';
				wb(0)			<= '0';
				wb(1)			<= '1';
				
			when "000101" => -- LW
				pcsrc			<= '0';
				ex(1 to 2)	<= "00";
				ex(0)			<= '1';
				ex(3)			<= '0';
				mem(2)		<= '0';
				mem(0)		<= '0';
				mem(1)		<= '1';
				wb(0)			<= '1';
				wb(1)			<= '1';
			
			when "000110" => -- SW
				pcsrc			<= '0';
				ex(1 to 2)	<= "00";
				ex(0)			<= '1';
				mem(2)		<= '0';
				mem(0)		<= '1';
				wb(0)			<= '0';
				wb(1)			<= '0';
				
			when "000111" => -- AND
				pcsrc			<= '0';
				ex(1 to 2)	<= "10";
				ex(0)			<= '0';
				ex(3)			<= '1';
				mem(2)		<= '0';
				mem(0)		<= '0';
				wb(0)			<= '0';
				wb(1)			<= '1';
				
			when "001000" => -- OR
				pcsrc			<= '0';
				ex(1 to 2)	<= "11";
				ex(0)			<= '0';
				ex(3)			<= '1';
				mem(2)		<= '0';
				mem(0)		<= '0';
				wb(0)			<= '0';
				wb(1)			<= '1';
				
			when "001001" => -- ANDI
				pcsrc			<= '0';
				ex(1 to 2)	<= "10";
				ex(0)			<= '1';
				ex(3)			<= '0';
				mem(2)		<= '0';
				mem(0)		<= '0';
				wb(0)			<= '0';
				wb(1)			<= '1';
				
			when "001010" => -- ORI
				pcsrc			<= '0';
				ex(1 to 2)	<= "11";
				ex(0)			<= '1';
				ex(3)			<= '0';
				mem(2)		<= '0';
				mem(0)		<= '0';
				wb(0)			<= '0';
				wb(1)			<= '1';
				
			when "001011" => -- BEQ
				pcsrc			<= '0';
				ex(1 to 2)	<= "01";
				ex(0)			<= '1';
				mem(2)		<= '1';
				mem(0)		<= '0';
				wb(0)			<= '0';
				wb(1)			<= '0';
				
			when "001100" => -- J
				pcsrc			<= '1';
				jmptp			<= '0';
				mem(0)		<= '0';
				wb(0)			<= '0';
				wb(1)			<= '0';
				
			when "001101" => -- JR
				pcsrc			<= '1';
				jmptp			<= '1';
				mem(0)		<= '0';
				wb(0)			<= '0';
				wb(1)			<= '0';
			
			when others => 
				pcsrc			<= '1';
				mem(2)		<= '0';
				mem(0)		<= '0';
				wb(1)			<= '0';
		end case;
	end process;
end;