library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity pipelineRegEXMEM is
	port (clock:		in		std_logic;
			in_WB:		in		std_logic_vector(0 to 1);
			in_ME:		in		std_logic_vector(0 to 2);
			out_WB:		out	std_logic_vector(0 to 1);
			out_ME:		out	std_logic_vector(0 to 2);
			
			in_pc:		in		std_logic_vector(0 to 31);
			out_pc:		out	std_logic_vector(0 to 31);
			
			in_zero:		in		std_logic;
			out_zero:	out	std_logic;
			
			in_result:	in		std_logic_vector(0 to 31);
			out_result:	out	std_logic_vector(0 to 31);
			
			in_wrData:	in		std_logic_vector(0 to 31);
			out_wrData:	out	std_logic_vector(0 to 31);
			
			in_regdst:	in		std_logic_vector(0 to 4);
			out_regdst:	out	std_logic_vector(0 to 4));
end pipelineRegEXMEM;

architecture a of pipelineRegEXMEM is

begin
	process(clock)
	begin
		if (clock'EVENT and clock = '1') then
			out_WB 		<= in_WB;
			out_ME 		<= in_ME;
			out_pc 		<= in_pc;
			out_zero 	<= in_zero;
			out_result 	<= in_result;
			out_wrData 	<= in_wrData;
			out_regdst 	<= in_regdst;
		end if;
	end process;
end;