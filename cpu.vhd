library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity cpu is
	port(clock:in std_logic;
			deb_current_pc:	out std_logic_vector(0 to 31);
			deb_current_instr: out std_logic_vector(0 to 31);
			deb_regfile_all_0:	out std_logic_vector(0 to 31);
			deb_regfile_all_1:	out std_logic_vector(0 to 31);
			deb_regfile_all_2:	out std_logic_vector(0 to 31);
			deb_regfile_all_3:	out std_logic_vector(0 to 31);
			deb_regfile_all_4:	out std_logic_vector(0 to 31);
			deb_alu_result:		out std_logic_vector(0 to 31);
			deb_write_data:		out std_logic_vector(0 to 31);
			deb_alu_src_a:			out std_logic_vector(0 to 31);
			deb_alu_src_b:			out std_logic_vector(0 to 31);
			deb_alu_op:				out std_logic_vector(0 to 1);
			deb_alu_src:			out std_logic);
--			deb_regfile_all_5:	out std_logic_vector(0 to 31);
--			deb_regfile_all_6:	out std_logic_vector(0 to 31);
--			deb_regfile_all_7:	out std_logic_vector(0 to 31);
--			deb_regfile_all_8:	out std_logic_vector(0 to 31);
--			deb_regfile_all_9:	out std_logic_vector(0 to 31);
--			deb_regfile_all_10:	out std_logic_vector(0 to 31);
--			deb_regfile_all_11:	out std_logic_vector(0 to 31);
--			deb_regfile_all_12:	out std_logic_vector(0 to 31);
--			deb_regfile_all_13:	out std_logic_vector(0 to 31);
--			deb_regfile_all_14:	out std_logic_vector(0 to 31);
--			deb_regfile_all_15:	out std_logic_vector(0 to 31);
--			deb_regfile_all_16:	out std_logic_vector(0 to 31);
--			deb_regfile_all_17:	out std_logic_vector(0 to 31);
--			deb_regfile_all_18:	out std_logic_vector(0 to 31);
--			deb_regfile_all_19:	out std_logic_vector(0 to 31);
--			deb_regfile_all_20:	out std_logic_vector(0 to 31);
--			deb_regfile_all_21:	out std_logic_vector(0 to 31);
--			deb_regfile_all_22:	out std_logic_vector(0 to 31);
--			deb_regfile_all_23:	out std_logic_vector(0 to 31);
--			deb_regfile_all_24:	out std_logic_vector(0 to 31);
--			deb_regfile_all_25:	out std_logic_vector(0 to 31);
--			deb_regfile_all_26:	out std_logic_vector(0 to 31);
--			deb_regfile_all_27:	out std_logic_vector(0 to 31);
--			deb_regfile_all_28:	out std_logic_vector(0 to 31);
--			deb_regfile_all_29:	out std_logic_vector(0 to 31);
--			deb_regfile_all_30:	out std_logic_vector(0 to 31);
--			deb_regfile_all_31:	out std_logic_vector(0 to 31));
--			address:	in  std_logic_vector(0 to 31);
--			mem_write:	in std_logic;
--			write_data:	in  std_logic_vector(0 to 31);
--			mem_read:	in 	std_logic;
--			read_data:	out std_logic_vector(0 to 31));
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
				write_register:	in  std_logic_vector(0 to 4);
				write_data:			in  std_logic_vector(0 to 31);
				read_data_1: 		out std_logic_vector(0 to 31);
				read_data_2: 		out std_logic_vector(0 to 31);
				deb_regfile_0:		out std_logic_vector(0 to 31);
				deb_regfile_1:		out std_logic_vector(0 to 31);
				deb_regfile_2:		out std_logic_vector(0 to 31);
				deb_regfile_3:		out std_logic_vector(0 to 31);
				deb_regfile_4:		out std_logic_vector(0 to 31));
--				deb_regfile_5:		out std_logic_vector(0 to 31);
--				deb_regfile_6:		out std_logic_vector(0 to 31);
--				deb_regfile_7:		out std_logic_vector(0 to 31);
--				deb_regfile_8:		out std_logic_vector(0 to 31);
--				deb_regfile_9:		out std_logic_vector(0 to 31);
--				deb_regfile_10:	out std_logic_vector(0 to 31);
--				deb_regfile_11:	out std_logic_vector(0 to 31);
--				deb_regfile_12:	out std_logic_vector(0 to 31);
--				deb_regfile_13:	out std_logic_vector(0 to 31);
--				deb_regfile_14:	out std_logic_vector(0 to 31);
--				deb_regfile_15:	out std_logic_vector(0 to 31);
--				deb_regfile_16:	out std_logic_vector(0 to 31);
--				deb_regfile_17:	out std_logic_vector(0 to 31);
--				deb_regfile_18:	out std_logic_vector(0 to 31);
--				deb_regfile_19:	out std_logic_vector(0 to 31);
--				deb_regfile_20:	out std_logic_vector(0 to 31);
--				deb_regfile_21:	out std_logic_vector(0 to 31);
--				deb_regfile_22:	out std_logic_vector(0 to 31);
--				deb_regfile_23:	out std_logic_vector(0 to 31);
--				deb_regfile_24:	out std_logic_vector(0 to 31);
--				deb_regfile_25:	out std_logic_vector(0 to 31);
--				deb_regfile_26:	out std_logic_vector(0 to 31);
--				deb_regfile_27:	out std_logic_vector(0 to 31);
--				deb_regfile_28:	out std_logic_vector(0 to 31);
--				deb_regfile_29:	out std_logic_vector(0 to 31);
--				deb_regfile_30:	out std_logic_vector(0 to 31);
--				deb_regfile_31:	out std_logic_vector(0 to 31));
	end component;
	
	component data_mem
		port	(address:	in  std_logic_vector(0 to 31);
				clock:		in  std_logic;
				mem_write:	in  std_logic;
				write_data:	in  std_logic_vector(0 to 31);
				mem_read:	in  std_logic;
				read_data:	out std_logic_vector(0 to 31));
	end component;
	
	component adder
		port	(a:	in  std_logic_vector(0 to 31);
				b:		in  std_logic_vector(0 to 31);
				g:		out std_logic_vector(0 to 31));
	end component;
	
	component mux21_32 is
		port	(a:	in  std_logic_vector(0 to 31);
				b:		in  std_logic_vector(0 to 31);
				sel:	in  std_logic;
				g:		out std_logic_vector(0 to 31));
	end component;
	
	component mux21_5 is
		port	(a:	in  std_logic_vector(0 to 4);
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
		port	(a: 	in  std_logic_vector(0 to 31);
				 b:	out std_logic_vector(0 to 31));
	end component;
	
	component ula is
		port (regA: 	in  std_logic_vector(0 to 31);
				regB: 	in  std_logic_vector(0 to 31);
				op:		in  std_logic_vector(0 to  1);
				ula_out: out std_logic_vector(0 to 31);
				zero: 	out std_logic);
	end component;
	
	--========== REGISTRADORES DE PIPELINE ==========
	component pipelineRegIFID is
		port (clock:	in		std_logic;
	
			in_pc:		in		std_logic_vector(0 to 31);
			out_pc:		out	std_logic_vector(0 to 31);
			
			in_instr:	in		std_logic_vector(0 to 31);
			out_instr:	out	std_logic_vector(0 to 31));
	end component;
	
	component pipelineRegIDEX is
		port (clock:	in		std_logic;
			in_WB:		in		std_logic_vector(0 to 1);
			in_ME:		in		std_logic_vector(0 to 2);
			in_EX:		in		std_logic_vector(0 to 3);
			out_WB:		out	std_logic_vector(0 to 1);
			out_ME:		out	std_logic_vector(0 to 2);
			out_EX:		out	std_logic_vector(0 to 3);
			
			in_pc:		in		std_logic_vector(0 to 31);
			out_pc:		out	std_logic_vector(0 to 31);
			
			in_read1:	in		std_logic_vector(0 to 31);
			out_read1:	out	std_logic_vector(0 to 31);
			
			in_read2:	in		std_logic_vector(0 to 31);
			out_read2:	out	std_logic_vector(0 to 31);
			
			in_imed:		in		std_logic_vector(0 to 31);
			out_imed:	out	std_logic_vector(0 to 31);
			
			in_rt:		in		std_logic_vector(0 to 4);
			out_rt:		out	std_logic_vector(0 to 4);
			in_rd:		in		std_logic_vector(0 to 4);
			out_rd:		out	std_logic_vector(0 to 4));
	end component;
	
	component pipelineRegEXMEM is
		port (clock:	in		std_logic;
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
	end component;

	component pipelineRegMEMWB is
		port (clock:	in		std_logic;
			in_WB:		in		std_logic_vector(0 to 1);
			out_WB:		out	std_logic_vector(0 to 1);
			
			in_rdData:	in		std_logic_vector(0 to 31);
			out_rdData:	out	std_logic_vector(0 to 31);
			
			in_addr:		in		std_logic_vector(0 to 31);
			out_addr:	out	std_logic_vector(0 to 31);
			
			in_regdst:	in		std_logic_vector(0 to 4);
			out_regdst:	out	std_logic_vector(0 to 4));
	end component;
	
	component ControlUnit is
		port (opcode:	in  std_logic_vector(0 to 5);
			pcsrc:		out std_logic;
			jmptp:		out std_logic;
			wb:			out std_logic_vector(0 to 1);
			mem:			out std_logic_vector(0 to 2);
			ex:			out std_logic_vector(0 to 3));
	end component;
	
	--signal clock:				std_logic;
	--========== SINAIS INSTRUCTION FETCH ==========
	signal pc_instr_mem:			std_logic_vector(0 to 31);
	signal instr_mem_ifid:		std_logic_vector(0 to 31);

	signal PCSrc:					std_logic;
	signal add_pcsrc_mux_0:		std_logic_vector(0 to 31);
	signal add_pcsrc_mux_1:		std_logic_vector(0 to 31);
	
	signal pc_update:				std_logic_vector(0 to 31);
	
	--========== SINAIS INSTRUCTION DECODE ==========
	signal pc_mais_quatro_ID:	std_logic_vector(0 to 31);
	
	signal RegWrite:				std_logic;
	signal Instruction:			std_logic_vector(0 to 31);
	signal OPCode:					std_logic_vector(0 to 5);
	signal Read_Register_1:		std_logic_vector(0 to 4);
	signal Read_Register_2:		std_logic_vector(0 to 4);
	signal Write_Register:		std_logic_vector(0 to 4);
	signal Write_Data:			std_logic_vector(0 to 31);
	signal Read_Data_1:			std_logic_vector(0 to 31);
	signal Read_Data_2:			std_logic_vector(0 to 31);
	
	signal Imediato:				std_logic_vector(0 to 15);
	signal Imediato_ext_ID:		std_logic_vector(0 to 31);
	
	signal Rt_ID:					std_logic_vector(0 to 4);
	signal Rd_ID:					std_logic_vector(0 to 4);
	
	--signal Jump_imed_ID:			std_logic_vector(0 to 26);
	signal Jump_imed_x_quatro:	std_logic_vector(0 to 31);
	signal Jump_concat:			std_logic_vector(0 to 31);
	signal JumpType:				std_logic;
	signal pcselect_mux_0:		std_logic_vector(0 to 31);
	signal pcselect_mux_1:		std_logic_vector(0 to 31);
	signal IsBranch:				std_logic;
	
	signal ctrl_WB_ID:			std_logic_vector(0 to 1);
	signal ctrl_ME_ID:			std_logic_vector(0 to 2);
	signal ctrl_EX_ID:			std_logic_vector(0 to 3);
	
	--========== SINAIS EXECUTE ==========
	signal Imediato_ext_EX:		std_logic_vector(0 to 31);
	signal pc_mais_quatro_EX:	std_logic_vector(0 to 31);
	signal imed_ext_x_quatro:	std_logic_vector(0 to 31);
	signal Branch_addr:			std_logic_vector(0 to 31);
	
	signal ULA_Src_A:				std_logic_vector(0 to 31);
	signal ULA_Src_B:				std_logic_vector(0 to 31);
	signal ULA_Result:			std_logic_vector(0 to 31);
	signal ULA_Zero:				std_logic;
	
	signal ALUSrc:					std_logic;
	signal alusrc_mux_0:			std_logic_vector(0 to 31);
	signal alusrc_mux_1:			std_logic_vector(0 to 31);
	signal ULA_Op:					std_logic_vector(0 to 1);
	
	--signal ULA_Control_Op:		std_logic_vector(0 to 1);
	signal RegDst:					std_logic;
	signal regdst_mux_0:			std_logic_vector(0 to 4);
	signal regdst_mux_1:			std_logic_vector(0 to 4);
	signal regdst_mux_out:		std_logic_vector(0 to 4);
	
	signal ctrl_WB_EX:			std_logic_vector(0 to 1);
	signal ctrl_ME_EX:			std_logic_vector(0 to 2);
	signal ctrl_EX_EX:			std_logic_vector(0 to 3);
	
	--========== SINAIS MEMORY ==========
	signal address_MEM:			std_logic_vector(0 to 31);
	signal memWrite:				std_logic;
	signal writeData_MEM:		std_logic_vector(0 to 31);
	signal memRead:				std_logic;
	signal readData_MEM:			std_logic_vector(0 to 31);
	
	signal branch_and_0:			std_logic;
	signal branch_and_1:			std_logic;
	
	signal regDst_MEM:			std_logic_vector(0 to 4);
	
	signal ctrl_WB_ME:			std_logic_vector(0 to 1);
	signal ctrl_ME_ME:			std_logic_vector(0 to 2);
	
	--========== SINAIS WRITEBACK ==========
	signal memtoreg_mux_0:		std_logic_vector(0 to 31);
	signal memtoreg_mux_1:		std_logic_vector(0 to 31);
	signal memToReg:				std_logic;
	
	signal ctrl_WB_WB:			std_logic_vector(0 to 1);
	
begin 
	--========== PASSAGEM DE SINAIS PARA DEBUG ==========
	deb_current_pc <= pc_instr_mem;
	deb_current_instr <= instr_mem_ifid;
	deb_alu_result <= ULA_Result;
	deb_write_data <= Write_Data;
	deb_alu_src_a <= ULA_Src_A;
	deb_alu_src_b <= ULA_Src_B;
	deb_alu_op <= ULA_Op;
	deb_alu_src <= ALUSrc;
	
	--========== COMPONENTES INSTRUCTION FETCH ==========
	instruction_memory:	instr_mem			port map (pc_instr_mem, instr_mem_ifid);
	add_pc_mais_quatro:	adder					port map (pc_instr_mem, "00000000000000000000000000000100", add_pcsrc_mux_0);
	isbranch_mux:			mux21_32				port map (add_pcsrc_mux_0, add_pcsrc_mux_1, IsBranch, pcselect_mux_0);
	pc:						program_counter	port map (clock, pc_update, pc_instr_mem);

	--========== REGISTRADOR IF/ID ==========
	ifid:	pipelineRegIFID	port map (clock, 
												add_pcsrc_mux_0, pc_mais_quatro_ID, 
												instr_mem_ifid, Instruction);
	
	--========== COMPONENTES INSTRUCTION DECODE ==========
	OPCode				<= Instruction( 0 to  5);
	--Jump_imed_ID		<= Instruction( 6 to 31);
	Read_Register_1	<= Instruction( 6 to 10);
	Read_Register_2	<= Instruction(11 to 15);
	Imediato				<= Instruction(16 to 31);
	Rt_ID					<= Instruction(11 to 15);
	Rd_ID					<= Instruction(16 to 20);
	
	registers:			register_file	port map (RegWrite, clock, Read_Register_1, Read_Register_2, Write_Register, Write_Data, Read_Data_1, Read_Data_2,
																deb_regfile_all_0,  deb_regfile_all_1,  deb_regfile_all_2,  deb_regfile_all_3,  deb_regfile_all_4);--,  deb_regfile_all_5);--,  deb_regfile_all_6,  deb_regfile_all_7,
--																deb_regfile_all_8,  deb_regfile_all_9,  deb_regfile_all_10, deb_regfile_all_11, deb_regfile_all_12, deb_regfile_all_13, deb_regfile_all_14, deb_regfile_all_15,
--																deb_regfile_all_16, deb_regfile_all_17, deb_regfile_all_18, deb_regfile_all_19, deb_regfile_all_20, deb_regfile_all_21, deb_regfile_all_22, deb_regfile_all_23,
--																deb_regfile_all_24, deb_regfile_all_25, deb_regfile_all_26, deb_regfile_all_27, deb_regfile_all_28, deb_regfile_all_29, deb_regfile_all_30, deb_regfile_all_31);
	dec_sign_extend:	sign_extend		port map (Imediato, Imediato_ext_ID);
	jumptype_mux:		mux21_32			port map (Jump_concat, Read_Data_1, JumpType, pcselect_mux_1);
	pcsrc_mux:			mux21_32			port map (pcselect_mux_0, pcselect_mux_1, PCSrc, pc_update);
	shift_jump:			shift_left_2	port map (Instruction, Jump_imed_x_quatro);
	Jump_concat <= pc_mais_quatro_ID(0 to 3) & Jump_imed_x_quatro(4 to 31);
	
	ctrl:					ControlUnit		port map (OPCode, PCSrc, JumpType, ctrl_WB_ID, ctrl_ME_ID, ctrl_EX_ID);
	
	--========== REGISTRADOR ID/EX ==========
	idex:	pipelineRegIDEX	port map (clock, 
												ctrl_WB_ID, ctrl_ME_ID, ctrl_EX_ID,
												ctrl_WB_EX, ctrl_ME_EX, ctrl_EX_EX, 
												pc_mais_quatro_ID, pc_mais_quatro_EX, 
												Read_Data_1, ULA_Src_A,
												Read_Data_2, alusrc_mux_0,
												Imediato_ext_ID, Imediato_ext_EX,
												Rt_ID, regdst_mux_0,
												Rd_ID, regdst_mux_1);
	
	
	--========== COMPONENTES EXECUTE ==========
	calcula_branch:	adder				port map (pc_mais_quatro_EX, imed_ext_x_quatro, Branch_addr);
	ula_main:			ula				port map (ULA_Src_A, ULA_Src_B, ULA_Op, ULA_Result, ULA_Zero); --Removed ULA_Control_Op
	alusrc_mux:			mux21_32			port map (alusrc_mux_0, alusrc_mux_1, ALUSrc, ULA_Src_B);
	regdst_mux:			mux21_5			port map (regdst_mux_0, regdst_mux_1, RegDst, regdst_mux_out);
	shift_exec:			shift_left_2	port map (Imediato_ext_EX, imed_ext_x_quatro);
	
	ALUSrc <= ctrl_EX_EX(0);
	ULA_Op <= ctrl_EX_EX(1 to 2);
	RegDst <= ctrl_EX_EX(3);

	--========== REGISTRADOR EX/MEM ==========
	exme:	pipelineRegEXMEM	port map (clock, 
												ctrl_WB_EX, ctrl_ME_EX,
												ctrl_WB_ME, ctrl_ME_ME,
												Branch_addr, add_pcsrc_mux_1,
												ULA_Zero, branch_and_1,
												ULA_Result, address_MEM,
												alusrc_mux_0, writeData_MEM,
												regdst_mux_out, regDst_MEM);
	
	--========== COMPONENTES MEMORY ==========
	data_memory:	data_mem	port map (address_MEM, clock, memWrite, writeData_MEM, memRead, readData_MEM);
	
	memWrite <= ctrl_ME_ME(0);
	memRead <= ctrl_ME_ME(1);
	branch_and_0 <= ctrl_ME_ME(2);
	IsBranch <= branch_and_0 and branch_and_1;

	--========== REGISTRADOR MEM/WB ==========
	mewb:	pipelineRegMEMWB	port map (clock, 
												ctrl_WB_ME, ctrl_WB_WB,
												readData_MEM, memtoreg_mux_1,
												address_MEM, memtoreg_mux_0,
												regDst_MEM, Write_Register);
	
	--========== COMPONENTES WRITEBACK ==========
	memtoreg_mux:	mux21_32	port map	(memtoreg_mux_0, memtoreg_mux_1, MemToReg, Write_Data);
	
	MemToReg <= ctrl_WB_WB(0);
	RegWrite <= ctrl_WB_WB(1);
end;