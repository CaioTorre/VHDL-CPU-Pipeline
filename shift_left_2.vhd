library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity shift_left_2 is
	port	(a: in  std_logic_vector(0 to 31);
			b:	out std_logic_vector(0 to 31));
end shift_left_2;

architecture shl of shift_left_2 is
begin
	b <= a(2 to 31) & "00";
end;