library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ula is 
	port (regA: in std_logic_vector(0 to 31);
			regB: in std_logic_vector(0 to 31);
			op:	in std_logic_vector(0 to  1);
			ula_out: out std_logic_vector(0 to 31);
			zero: out std_logic);
end ula;

architecture alu of ula is 
	signal res: std_logic_vector(0 to 31);
begin
	process(regA, regB, op)
	begin
		case op is
			when "00" => res <= regA + regB;
			when "01" => res <= regA - regB;
			when "10" => res <= regA and regB;
			when "11" => res <= regA or regB;
			when others => res <= "00000000000000000000000000000000";
		end case;
		
		if(res = "00000000000000000000000000000000") then
			zero <= '1';
		else
			zero <= '0';
		end if;
		
		ula_out <= res;
	end process;
end alu;