library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity cpu is
	port(clock:in std_logic;
			address:	in  std_logic_vector(0 to 31);
			mem_write:	in std_logic;
			write_data:	in  std_logic_vector(0 to 31);
			mem_read:	in 	std_logic;
			read_data:	out std_logic_vector(0 to 31));
end cpu;

architecture a of cpu is
	component instr_mem
		port (address: in std_logic_vector(0 to 31);
				instruction: out std_logic_vector(0 to 31));
	end component;
	
	component register_file
		port	(regwrite: in std_logic;
				clock: in std_logic;
				read_register_1:	in  std_logic_vector(0 to 4);
				read_register_2:	in  std_logic_vector(0 to 4);
				write_register:		in  std_logic_vector(0 to 4);
				write_data:			in  std_logic_vector(0 to 31);
				read_data_1: 		out std_logic_vector(0 to 31);
				read_data_2: 		out std_logic_vector(0 to 31));
	end component;
	
	component data_mem
		port	(address:	in  std_logic_vector(0 to 31);
				clock:		in std_logic;
				mem_write:	in std_logic;
				write_data:	in  std_logic_vector(0 to 31);
				mem_read:	in 	std_logic;
				read_data:	out std_logic_vector(0 to 31));
	end component;
	
	component adder
		port	(a:	in  std_logic_vector(0 to 31);
				b:	in  std_logic_vector(0 to 31);
				g:	out std_logic_vector(0 to 31));
	end component;
	
	component mux21_32 is
		port	(a:		in  std_logic_vector(0 to 31);
				b:		in  std_logic_vector(0 to 31);
				sel:	in  std_logic;
				g:		out std_logic_vector(0 to 31));
	end component;
	
	component mux21_5 is
		port	(a:		in  std_logic_vector(0 to 4);
				b:		in  std_logic_vector(0 to 4);
				sel:	in  std_logic;
				g:		out std_logic_vector(0 to 4));
	end component;
	
	component program_counter is
		port	(clock:	in  std_logic;
				pc_upd:	in  std_logic_vector(0 to 31);
				pc:		out std_logic_vector(0 to 31));
	end component;
	
	component sign_extend is
		port	(a:	in  std_logic_vector(0 to 15);
				b:	out std_logic_vector(0 to 31));
	end component;

	component shift_left_2 is
		port	(a: in  std_logic_vector(0 to 31);
				b:	out std_logic_vector(0 to 31));
	end component;

	--signal clock:				std_logic;
	--========== SINAIS INSTRUCTION FETCH ==========
	signal pc_instr_mem:		std_logic_vector(0 to 31);
	signal instr_mem_ifid:		std_logic_vector(0 to 31);

	signal PCSrc:				std_logic;
	signal add_pcsrc_mux_0:		std_logic_vector(0 to 31);
	signal add_pcsrc_mux_1:		std_logic_vector(0 to 31);
	
	signal pc_update:			std_logic_vector(0 to 31);
	
	--========== SINAIS INSTRUCTION DECODE ==========
	signal pc_mais_quatro_id:	std_logic_vector(0 to 31);
	
	signal RegWrite:			std_logic;
	signal Instruction:			std_logic_vector(0 to 31);
	signal Read_Register_1:		std_logic_vector(0 to 4);
	signal Read_Register_2:		std_logic_vector(0 to 4);
	signal Write_Register:		std_logic_vector(0 to 4);
	signal t_Write_Data:			std_logic_vector(0 to 31);
	signal Read_Data_1:			std_logic_vector(0 to 31);
	signal Read_Data_2:			std_logic_vector(0 to 31);
	
	signal Imediato:			std_logic_vector(0 to 15);
	signal Imediato_ext_ID:		std_logic_vector(0 to 31);
	
	--========== SINAIS EXECUTE ==========
	signal Imediato_ext_EX:		std_logic_vector(0 to 31);
	signal pc_mais_quatro:		std_logic_vector(0 to 31);
	signal imed_ext_x_quatro:	std_logic_vector(0 to 31);
	signal Branch_addr:			std_logic_vector(0 to 31);
	
	signal ULA_Src_A:			std_logic_vector(0 to 31);
	signal ULA_Src_B:			std_logic_vector(0 to 31);
	signal ULA_Result:			std_logic_vector(0 to 31);
	signal ULA_Zero:			std_logic;
	
	signal ALUSrc:				std_logic;
	signal alusrc_mux_0:		std_logic_vector(0 to 31);
	signal alusrc_mux_1:		std_logic_vector(0 to 31);
	signal ULA_Op:				std_logic_vector(0 to 2);
	
	signal ALUOp:				std_logic_vector(0 to 2);
	signal RegDst:				std_logic;
	signal regdst_mux_0:		std_logic_vector(0 to 4);
	signal regdst_mux_1:		std_logic_vector(0 to 4);
	signal regdst_mux_out:		std_logic_vector(0 to 4);
begin 
	--========== COMPONENTES INSTRUCTION FETCH ==========
	instruction_memory:	instr_mem			port map (pc_instr_mem, instr_mem_ifid);
	add_pc_mais_quatro:	adder					port map (pc_instr_mem, "00000000000000000000000000000100", add_pcsrc_mux_0);
	pcsrc_mux:				mux21_32				port map (add_pcsrc_mux_0, add_pcsrc_mux_1, PCSrc, pc_update);
	pc:						program_counter	port map (clock, pc_update, pc_instr_mem);

	--========== COMPONENTES INSTRUCTION DECODE ==========
	registers:			register_file	port map (RegWrite, clock, Read_Register_1, Read_Register_2, Write_Register, Write_Data, Read_Data_1, Read_Data_2);
	dec_sign_extend:	sign_extend		port map (Imediato, Imediato_ext_ID);
	
	--========== COMPONENTES EXECUTE ==========
	calcula_branch:		adder			port map (pc_mais_quatro, imed_ext_x_quatro, Branch_addr);
	--ula:				alu				port map (ULA_Src_A, ULA_Src_B, ULA_Op, ULA_Result, ULA_Zero);
	alusrc_mux:			mux21_32		port map (alusrc_mux_0, alusrc_mux_1, ALUSrc, ULA_Src_B);
	regdst_mux:			mux21_5			port map (regdst_mux_0, regdst_mux_1, RegDst, regdst_mux_out);
	shift_exec:			shift_left_2	port map (Imediato_ext_EX, imed_ext_x_quatro);
	
	--
	data_memory:	data_mem	port map (address, clock, mem_write, write_data, mem_read, read_data);
end;