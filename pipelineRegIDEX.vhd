library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity pipelineRegIDEX is
	port (clock:		in		std_logic;
			in_WB:		in		std_logic_vector(0 to 1);
			in_ME:		in		std_logic_vector(0 to 2);
			in_EX:		in		std_logic_vector(0 to 3);
			out_WB:		out	std_logic_vector(0 to 1) := "00";
			out_ME:		out	std_logic_vector(0 to 2) := "000";
			out_EX:		out	std_logic_vector(0 to 3) := "0000";
			
			in_pc:		in		std_logic_vector(0 to 31);
			out_pc:		out	std_logic_vector(0 to 31) := "00000000000000000000000000000000";
			
			in_read1:	in		std_logic_vector(0 to 31);
			out_read1:	out	std_logic_vector(0 to 31) := "00000000000000000000000000000000";
			
			in_read2:	in		std_logic_vector(0 to 31);
			out_read2:	out	std_logic_vector(0 to 31) := "00000000000000000000000000000000";
			
			in_imed:		in		std_logic_vector(0 to 31);
			out_imed:	out	std_logic_vector(0 to 31) := "00000000000000000000000000000000";
			
			in_rt:		in		std_logic_vector(0 to 4);
			out_rt:		out	std_logic_vector(0 to 4) := "00000";
			in_rd:		in		std_logic_vector(0 to 4);
			out_rd:		out	std_logic_vector(0 to 4) := "00000");
end pipelineRegIDEX;

architecture a of pipelineRegIDEX is

begin
	process(clock)
	begin
		if (clock'EVENT and clock = '1') then
			out_WB		<= in_WB;
			out_ME		<= in_ME;
			out_EX		<= in_EX;
			out_pc		<= in_pc;
			out_read1	<= in_read1;
			out_read2	<= in_read2;
			out_imed		<= in_imed;
			out_rt		<= in_rt;
			out_rd		<= in_rd;
		end if;
	end process;
end;