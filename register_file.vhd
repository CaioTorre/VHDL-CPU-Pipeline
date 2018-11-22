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
			read_data_2: 		out std_logic_vector(0 to 31);
			deb_regfile_0:		out std_logic_vector(0 to 31);
			deb_regfile_1:		out std_logic_vector(0 to 31);
			deb_regfile_2:		out std_logic_vector(0 to 31);
			deb_regfile_3:		out std_logic_vector(0 to 31);
			deb_regfile_4:		out std_logic_vector(0 to 31);
			deb_regfile_5:		out std_logic_vector(0 to 31);
			deb_regfile_6:		out std_logic_vector(0 to 31);
			deb_regfile_7:		out std_logic_vector(0 to 31);
			deb_regfile_8:		out std_logic_vector(0 to 31);
			deb_regfile_9:		out std_logic_vector(0 to 31);
			deb_regfile_10:	out std_logic_vector(0 to 31));
--			deb_regfile_11:	out std_logic_vector(0 to 31);
--			deb_regfile_12:	out std_logic_vector(0 to 31);
--			deb_regfile_13:	out std_logic_vector(0 to 31);
--			deb_regfile_14:	out std_logic_vector(0 to 31);
--			deb_regfile_15:	out std_logic_vector(0 to 31);
--			deb_regfile_16:	out std_logic_vector(0 to 31);
--			deb_regfile_17:	out std_logic_vector(0 to 31);
--			deb_regfile_18:	out std_logic_vector(0 to 31);
--			deb_regfile_19:	out std_logic_vector(0 to 31);
--			deb_regfile_20:	out std_logic_vector(0 to 31);
--			deb_regfile_21:	out std_logic_vector(0 to 31);
--			deb_regfile_22:	out std_logic_vector(0 to 31);
--			deb_regfile_23:	out std_logic_vector(0 to 31);
--			deb_regfile_24:	out std_logic_vector(0 to 31);
--			deb_regfile_25:	out std_logic_vector(0 to 31);
--			deb_regfile_26:	out std_logic_vector(0 to 31);
--			deb_regfile_27:	out std_logic_vector(0 to 31);
--			deb_regfile_28:	out std_logic_vector(0 to 31);
--			deb_regfile_29:	out std_logic_vector(0 to 31);
--			deb_regfile_30:	out std_logic_vector(0 to 31);
--			deb_regfile_31:	out std_logic_vector(0 to 31));
end register_file;

architecture regs of register_file is
	type register_type is array(0 to 31) of std_logic_vector(0 to 31);
	signal registers: register_type;
begin
	deb_regfile_0  <= registers(0);
	deb_regfile_1  <= registers(1);
	deb_regfile_2  <= registers(2);
	deb_regfile_3  <= registers(3);
	deb_regfile_4  <= registers(4);
	deb_regfile_5  <= registers(5);
	deb_regfile_6  <= registers(6);
	deb_regfile_7  <= registers(7);
	deb_regfile_8  <= registers(8);
	deb_regfile_9  <= registers(9);
	deb_regfile_10 <= registers(10);
--	deb_regfile_11 <= registers(11);
--	deb_regfile_12 <= registers(12);
--	deb_regfile_13 <= registers(13);
--	deb_regfile_14 <= registers(14);
--	deb_regfile_15 <= registers(15);
--	deb_regfile_16 <= registers(16);
--	deb_regfile_17 <= registers(17);
--	deb_regfile_18 <= registers(18);
--	deb_regfile_19 <= registers(19);
--	deb_regfile_20 <= registers(20);
--	deb_regfile_21 <= registers(21);
--	deb_regfile_22 <= registers(22);
--	deb_regfile_23 <= registers(23);
--	deb_regfile_24 <= registers(24);
--	deb_regfile_25 <= registers(25);
--	deb_regfile_26 <= registers(26);
--	deb_regfile_27 <= registers(27);
--	deb_regfile_28 <= registers(28);
--	deb_regfile_29 <= registers(29);
--	deb_regfile_30 <= registers(30);
--	deb_regfile_31 <= registers(31);
	
	process(clock)
	begin
		if (clock'EVENT and clock = '1' and regwrite = '1' and not (write_register = "00000") ) then
			registers(to_integer(unsigned(write_register))) <= write_data;
		end if;
	end process;
	
	read_data_1 <= registers(to_integer(unsigned(read_register_1)));
	read_data_2 <= registers(to_integer(unsigned(read_register_2)));
end;