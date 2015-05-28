-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2015.1
-- Copyright (C) 2015 Xilinx Inc. All rights reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity example is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    a_req_din : OUT STD_LOGIC;
    a_req_full_n : IN STD_LOGIC;
    a_req_write : OUT STD_LOGIC;
    a_rsp_empty_n : IN STD_LOGIC;
    a_rsp_read : OUT STD_LOGIC;
    a_address : OUT STD_LOGIC_VECTOR (31 downto 0);
    a_datain : IN STD_LOGIC_VECTOR (31 downto 0);
    a_dataout : OUT STD_LOGIC_VECTOR (31 downto 0);
    a_size : OUT STD_LOGIC_VECTOR (31 downto 0);
    stream_in_TDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    stream_in_TVALID : IN STD_LOGIC;
    stream_in_TREADY : OUT STD_LOGIC;
    byte_wroffset : IN STD_LOGIC_VECTOR (31 downto 0);
    ctrl_reg : IN STD_LOGIC_VECTOR (31 downto 0);
    status_reg : OUT STD_LOGIC_VECTOR (31 downto 0);
    status_reg_ap_vld : OUT STD_LOGIC;
    interrupt_r : OUT STD_LOGIC;
    interrupt_r_ap_vld : OUT STD_LOGIC );
end;


architecture behav of example is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "example,hls_ip_2015_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z010clg400-1,HLS_INPUT_CLOCK=4.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.500000,HLS_SYN_LAT=133,HLS_SYN_TPT=none,HLS_SYN_MEM=1,HLS_SYN_DSP=0,HLS_SYN_FF=226,HLS_SYN_LUT=95}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (6 downto 0) := "0000010";
    constant ap_ST_st3_fsm_2 : STD_LOGIC_VECTOR (6 downto 0) := "0000100";
    constant ap_ST_st4_fsm_3 : STD_LOGIC_VECTOR (6 downto 0) := "0001000";
    constant ap_ST_pp0_stg0_fsm_4 : STD_LOGIC_VECTOR (6 downto 0) := "0010000";
    constant ap_ST_st8_fsm_5 : STD_LOGIC_VECTOR (6 downto 0) := "0100000";
    constant ap_ST_st9_fsm_6 : STD_LOGIC_VECTOR (6 downto 0) := "1000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_80 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010000000";
    constant ap_const_lv8_80 : STD_LOGIC_VECTOR (7 downto 0) := "10000000";
    constant ap_const_lv8_1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_bdd_25 : BOOLEAN;
    signal byte_wroffset_0_data_reg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal byte_wroffset_0_vld_reg : STD_LOGIC := '0';
    signal byte_wroffset_0_ack_out : STD_LOGIC;
    signal ctrl_reg_0_data_reg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal ctrl_reg_0_vld_reg : STD_LOGIC := '0';
    signal ctrl_reg_0_ack_out : STD_LOGIC;
    signal status_reg_1_data_reg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal status_reg_1_vld_reg : STD_LOGIC := '0';
    signal status_reg_1_vld_in : STD_LOGIC;
    signal status_reg_1_ack_in : STD_LOGIC;
    signal int_pending : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal count : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal indvar_reg_178 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_sig_cseq_ST_st2_fsm_1 : STD_LOGIC;
    signal ap_sig_bdd_138 : BOOLEAN;
    signal tmp_1_fu_216_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_1_reg_349 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_cseq_ST_st3_fsm_2 : STD_LOGIC;
    signal ap_sig_bdd_151 : BOOLEAN;
    signal brmerge_fu_226_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal brmerge_reg_359 : STD_LOGIC_VECTOR (0 downto 0);
    signal exitcond_fu_231_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_cseq_ST_st4_fsm_3 : STD_LOGIC;
    signal ap_sig_bdd_162 : BOOLEAN;
    signal ap_sig_bdd_167 : BOOLEAN;
    signal i_1_fu_237_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal a_addr_reg_372 : STD_LOGIC_VECTOR (31 downto 0);
    signal exitcond3_fu_267_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal exitcond3_reg_377 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_cseq_ST_pp0_stg0_fsm_4 : STD_LOGIC;
    signal ap_sig_bdd_183 : BOOLEAN;
    signal ap_reg_ppiten_pp0_it0 : STD_LOGIC := '0';
    signal ap_reg_ppiten_pp0_it1 : STD_LOGIC := '0';
    signal ap_reg_ppstg_exitcond3_reg_377_pp0_it1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_bdd_193 : BOOLEAN;
    signal ap_reg_ppiten_pp0_it2 : STD_LOGIC := '0';
    signal indvar_next_fu_273_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal is_0iter_fu_284_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal is_0iter_reg_391 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_reg_ppstg_is_0iter_reg_391_pp0_it1 : STD_LOGIC_VECTOR (0 downto 0);
    signal buff_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal buff_load_reg_395 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_5_fu_294_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_sig_cseq_ST_st8_fsm_5 : STD_LOGIC;
    signal ap_sig_bdd_221 : BOOLEAN;
    signal buff_address0 : STD_LOGIC_VECTOR (6 downto 0);
    signal buff_ce0 : STD_LOGIC;
    signal buff_we0 : STD_LOGIC;
    signal buff_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_reg_167 : STD_LOGIC_VECTOR (7 downto 0);
    signal int_pending_flag_phi_fu_193_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal int_pending_flag_reg_189 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_cseq_ST_st9_fsm_6 : STD_LOGIC;
    signal ap_sig_bdd_252 : BOOLEAN;
    signal int_pending_loc_phi_fu_204_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal int_pending_loc_reg_201 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_3_fu_243_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_6_fu_279_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_7_fu_257_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal rev_fu_314_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal int_pending_flag_s_fu_320_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_2_fu_212_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_fu_248_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal tmp_8_fu_307_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (6 downto 0);

    component example_buff IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (6 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (31 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    buff_U : component example_buff
    generic map (
        DataWidth => 32,
        AddressRange => 128,
        AddressWidth => 7)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => buff_address0,
        ce0 => buff_ce0,
        we0 => buff_we0,
        d0 => buff_d0,
        q0 => buff_q0);





    -- the current state (ap_CS_fsm) of the state machine. --
    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_st1_fsm_0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    -- ap_reg_ppiten_pp0_it0 assign process. --
    ap_reg_ppiten_pp0_it0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_4) and not((ap_sig_bdd_193 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2))) and not((ap_const_lv1_0 = exitcond3_fu_267_p2)))) then 
                    ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and not(ap_sig_bdd_167) and not((ap_const_lv1_0 = exitcond_fu_231_p2)))) then 
                    ap_reg_ppiten_pp0_it0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    -- ap_reg_ppiten_pp0_it1 assign process. --
    ap_reg_ppiten_pp0_it1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_4) and not((ap_sig_bdd_193 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2))) and (ap_const_lv1_0 = exitcond3_fu_267_p2))) then 
                    ap_reg_ppiten_pp0_it1 <= ap_const_logic_1;
                elsif ((((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and not(ap_sig_bdd_167) and not((ap_const_lv1_0 = exitcond_fu_231_p2))) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_4) and not((ap_sig_bdd_193 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2))) and not((ap_const_lv1_0 = exitcond3_fu_267_p2))))) then 
                    ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    -- ap_reg_ppiten_pp0_it2 assign process. --
    ap_reg_ppiten_pp0_it2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_reg_ppiten_pp0_it2 <= ap_const_logic_0;
            else
                if (not((ap_sig_bdd_193 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))) then 
                    ap_reg_ppiten_pp0_it2 <= ap_reg_ppiten_pp0_it1;
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and not(ap_sig_bdd_167) and not((ap_const_lv1_0 = exitcond_fu_231_p2)))) then 
                    ap_reg_ppiten_pp0_it2 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    -- byte_wroffset_0_data_reg assign process. --
    byte_wroffset_0_data_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                byte_wroffset_0_data_reg <= ap_const_lv32_0;
            else
                if (((not((not((ap_const_logic_1 = ap_start)) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0))) and (ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_0 = byte_wroffset_0_vld_reg)) or (not((not((ap_const_logic_1 = ap_start)) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0))) and (ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_1 = byte_wroffset_0_vld_reg) and (ap_const_logic_1 = byte_wroffset_0_ack_out)))) then 
                    byte_wroffset_0_data_reg <= byte_wroffset;
                end if; 
            end if;
        end if;
    end process;


    -- byte_wroffset_0_vld_reg assign process. --
    byte_wroffset_0_vld_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                
            else
            end if;
        end if;
    end process;


    -- ctrl_reg_0_data_reg assign process. --
    ctrl_reg_0_data_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ctrl_reg_0_data_reg <= ap_const_lv32_0;
            else
                if (((not((not((ap_const_logic_1 = ap_start)) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0))) and (ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_0 = ctrl_reg_0_vld_reg)) or (not((not((ap_const_logic_1 = ap_start)) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0))) and (ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_1 = ctrl_reg_0_vld_reg) and (ap_const_logic_1 = ctrl_reg_0_ack_out)))) then 
                    ctrl_reg_0_data_reg <= ctrl_reg;
                end if; 
            end if;
        end if;
    end process;


    -- ctrl_reg_0_vld_reg assign process. --
    ctrl_reg_0_vld_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                
            else
            end if;
        end if;
    end process;


    -- status_reg_1_data_reg assign process. --
    status_reg_1_data_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                status_reg_1_data_reg <= ap_const_lv32_0;
            else
                if (((not((not((ap_const_logic_1 = ap_start)) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0))) and (ap_const_logic_1 = status_reg_1_vld_in) and (ap_const_logic_0 = status_reg_1_vld_reg)) or (not((not((ap_const_logic_1 = ap_start)) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0))) and (ap_const_logic_1 = status_reg_1_vld_in) and (ap_const_logic_1 = status_reg_1_vld_reg) and (ap_const_logic_1 = ap_const_logic_1)))) then 
                    status_reg_1_data_reg <= tmp_5_fu_294_p2;
                end if; 
            end if;
        end if;
    end process;


    -- status_reg_1_vld_reg assign process. --
    status_reg_1_vld_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                status_reg_1_vld_reg <= ap_const_logic_0;
            else
                if ((not((not((ap_const_logic_1 = ap_start)) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0))) and (ap_const_logic_1 = status_reg_1_vld_in) and (ap_const_logic_0 = status_reg_1_vld_reg))) then 
                    status_reg_1_vld_reg <= ap_const_logic_1;
                elsif (((ap_const_logic_0 = status_reg_1_vld_in) and (ap_const_logic_1 = status_reg_1_vld_reg) and (ap_const_logic_1 = ap_const_logic_1))) then 
                    status_reg_1_vld_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    -- i_reg_167 assign process. --
    i_reg_167_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and (ap_const_lv1_0 = exitcond_fu_231_p2) and not(ap_sig_bdd_167))) then 
                i_reg_167 <= i_1_fu_237_p2;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm_2) and (ap_const_lv1_0 = brmerge_fu_226_p2))) then 
                i_reg_167 <= ap_const_lv8_0;
            end if; 
        end if;
    end process;

    -- indvar_reg_178 assign process. --
    indvar_reg_178_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_4) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_193 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2))) and (ap_const_lv1_0 = exitcond3_fu_267_p2))) then 
                indvar_reg_178 <= indvar_next_fu_273_p2;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and not(ap_sig_bdd_167) and not((ap_const_lv1_0 = exitcond_fu_231_p2)))) then 
                indvar_reg_178 <= ap_const_lv8_0;
            end if; 
        end if;
    end process;

    -- int_pending_flag_reg_189 assign process. --
    int_pending_flag_reg_189_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_6) and not((status_reg_1_ack_in = ap_const_logic_0)) and (ap_const_lv1_0 = brmerge_reg_359))) then 
                int_pending_flag_reg_189 <= ap_const_lv1_1;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm_2) and not((ap_const_lv1_0 = brmerge_fu_226_p2)))) then 
                int_pending_flag_reg_189 <= ap_const_lv1_0;
            end if; 
        end if;
    end process;

    -- int_pending_loc_reg_201 assign process. --
    int_pending_loc_reg_201_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_6) and not((status_reg_1_ack_in = ap_const_logic_0)) and (ap_const_lv1_0 = brmerge_reg_359))) then 
                int_pending_loc_reg_201 <= ap_const_lv1_1;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm_2) and not((ap_const_lv1_0 = brmerge_fu_226_p2)))) then 
                int_pending_loc_reg_201 <= int_pending;
            end if; 
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and not(ap_sig_bdd_167) and not((ap_const_lv1_0 = exitcond_fu_231_p2)))) then
                    a_addr_reg_372(29 downto 0) <= tmp_7_fu_257_p1(32 - 1 downto 0)(29 downto 0);
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_4) and not((ap_sig_bdd_193 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2))))) then
                ap_reg_ppstg_exitcond3_reg_377_pp0_it1 <= exitcond3_reg_377;
                ap_reg_ppstg_is_0iter_reg_391_pp0_it1 <= is_0iter_reg_391;
                buff_load_reg_395 <= buff_q0;
                exitcond3_reg_377 <= exitcond3_fu_267_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm_2)) then
                brmerge_reg_359 <= brmerge_fu_226_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st8_fsm_5)) then
                count <= tmp_5_fu_294_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_6) and not((status_reg_1_ack_in = ap_const_logic_0)) and not((ap_const_lv1_0 = int_pending_flag_s_fu_320_p2)))) then
                int_pending <= rev_fu_314_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_4) and not((ap_sig_bdd_193 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2))) and (ap_const_lv1_0 = exitcond3_fu_267_p2))) then
                is_0iter_reg_391 <= is_0iter_fu_284_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then
                tmp_1_reg_349 <= tmp_1_fu_216_p2;
            end if;
        end if;
    end process;
    byte_wroffset_0_vld_reg <= '0';
    ctrl_reg_0_vld_reg <= '0';
    a_addr_reg_372(31 downto 30) <= "00";

    -- the next state (ap_NS_fsm) of the state machine. --
    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, status_reg_1_ack_in, brmerge_fu_226_p2, exitcond_fu_231_p2, ap_sig_bdd_167, exitcond3_fu_267_p2, ap_reg_ppiten_pp0_it0, ap_reg_ppiten_pp0_it1, ap_sig_bdd_193, ap_reg_ppiten_pp0_it2)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not((ap_start = ap_const_logic_0))) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                ap_NS_fsm <= ap_ST_st3_fsm_2;
            when ap_ST_st3_fsm_2 => 
                if ((ap_const_lv1_0 = brmerge_fu_226_p2)) then
                    ap_NS_fsm <= ap_ST_st4_fsm_3;
                else
                    ap_NS_fsm <= ap_ST_st9_fsm_6;
                end if;
            when ap_ST_st4_fsm_3 => 
                if ((not(ap_sig_bdd_167) and not((ap_const_lv1_0 = exitcond_fu_231_p2)))) then
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_4;
                elsif (((ap_const_lv1_0 = exitcond_fu_231_p2) and not(ap_sig_bdd_167))) then
                    ap_NS_fsm <= ap_ST_st4_fsm_3;
                else
                    ap_NS_fsm <= ap_ST_st4_fsm_3;
                end if;
            when ap_ST_pp0_stg0_fsm_4 => 
                if ((not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and not((ap_sig_bdd_193 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2))) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_193 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2))) and not((ap_const_lv1_0 = exitcond3_fu_267_p2)) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))))) then
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_4;
                elsif ((((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and not((ap_sig_bdd_193 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2))) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1))) or ((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_193 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2))) and not((ap_const_lv1_0 = exitcond3_fu_267_p2)) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))) then
                    ap_NS_fsm <= ap_ST_st8_fsm_5;
                else
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_4;
                end if;
            when ap_ST_st8_fsm_5 => 
                ap_NS_fsm <= ap_ST_st9_fsm_6;
            when ap_ST_st9_fsm_6 => 
                if (not((status_reg_1_ack_in = ap_const_logic_0))) then
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                else
                    ap_NS_fsm <= ap_ST_st9_fsm_6;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXXX";
        end case;
    end process;
    a_address <= a_addr_reg_372;
    a_dataout <= buff_load_reg_395;

    -- a_req_din assign process. --
    a_req_din_assign_proc : process(ap_reg_ppstg_exitcond3_reg_377_pp0_it1, ap_sig_bdd_193, ap_reg_ppiten_pp0_it2, ap_reg_ppstg_is_0iter_reg_391_pp0_it1)
    begin
        if ((((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and not((ap_sig_bdd_193 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2))) and not((ap_const_lv1_0 = ap_reg_ppstg_is_0iter_reg_391_pp0_it1))) or ((ap_const_lv1_0 = ap_reg_ppstg_exitcond3_reg_377_pp0_it1) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and not((ap_sig_bdd_193 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))))) then 
            a_req_din <= ap_const_logic_1;
        else 
            a_req_din <= ap_const_logic_0;
        end if; 
    end process;


    -- a_req_write assign process. --
    a_req_write_assign_proc : process(ap_reg_ppstg_exitcond3_reg_377_pp0_it1, ap_sig_bdd_193, ap_reg_ppiten_pp0_it2, ap_reg_ppstg_is_0iter_reg_391_pp0_it1)
    begin
        if ((((ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and not((ap_sig_bdd_193 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2))) and not((ap_const_lv1_0 = ap_reg_ppstg_is_0iter_reg_391_pp0_it1))) or ((ap_const_lv1_0 = ap_reg_ppstg_exitcond3_reg_377_pp0_it1) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and not((ap_sig_bdd_193 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))))) then 
            a_req_write <= ap_const_logic_1;
        else 
            a_req_write <= ap_const_logic_0;
        end if; 
    end process;

    a_rsp_read <= ap_const_logic_0;
    a_size <= ap_const_lv32_80;

    -- ap_done assign process. --
    ap_done_assign_proc : process(status_reg_1_ack_in, ap_sig_cseq_ST_st9_fsm_6)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_6) and not((status_reg_1_ack_in = ap_const_logic_0)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_idle assign process. --
    ap_idle_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm_0)
    begin
        if ((not((ap_const_logic_1 = ap_start)) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_ready assign process. --
    ap_ready_assign_proc : process(status_reg_1_ack_in, ap_sig_cseq_ST_st9_fsm_6)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_6) and not((status_reg_1_ack_in = ap_const_logic_0)))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_rst_n_inv assign process. --
    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    -- ap_sig_bdd_138 assign process. --
    ap_sig_bdd_138_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_138 <= (ap_const_lv1_1 = ap_CS_fsm(1 downto 1));
    end process;


    -- ap_sig_bdd_151 assign process. --
    ap_sig_bdd_151_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_151 <= (ap_const_lv1_1 = ap_CS_fsm(2 downto 2));
    end process;


    -- ap_sig_bdd_162 assign process. --
    ap_sig_bdd_162_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_162 <= (ap_const_lv1_1 = ap_CS_fsm(3 downto 3));
    end process;


    -- ap_sig_bdd_167 assign process. --
    ap_sig_bdd_167_assign_proc : process(stream_in_TVALID, exitcond_fu_231_p2)
    begin
                ap_sig_bdd_167 <= ((stream_in_TVALID = ap_const_logic_0) and (ap_const_lv1_0 = exitcond_fu_231_p2));
    end process;


    -- ap_sig_bdd_183 assign process. --
    ap_sig_bdd_183_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_183 <= (ap_const_lv1_1 = ap_CS_fsm(4 downto 4));
    end process;


    -- ap_sig_bdd_193 assign process. --
    ap_sig_bdd_193_assign_proc : process(a_req_full_n, ap_reg_ppstg_exitcond3_reg_377_pp0_it1)
    begin
                ap_sig_bdd_193 <= ((a_req_full_n = ap_const_logic_0) and (ap_const_lv1_0 = ap_reg_ppstg_exitcond3_reg_377_pp0_it1));
    end process;


    -- ap_sig_bdd_221 assign process. --
    ap_sig_bdd_221_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_221 <= (ap_const_lv1_1 = ap_CS_fsm(5 downto 5));
    end process;


    -- ap_sig_bdd_25 assign process. --
    ap_sig_bdd_25_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_25 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
    end process;


    -- ap_sig_bdd_252 assign process. --
    ap_sig_bdd_252_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_252 <= (ap_const_lv1_1 = ap_CS_fsm(6 downto 6));
    end process;


    -- ap_sig_cseq_ST_pp0_stg0_fsm_4 assign process. --
    ap_sig_cseq_ST_pp0_stg0_fsm_4_assign_proc : process(ap_sig_bdd_183)
    begin
        if (ap_sig_bdd_183) then 
            ap_sig_cseq_ST_pp0_stg0_fsm_4 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_pp0_stg0_fsm_4 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st1_fsm_0 assign process. --
    ap_sig_cseq_ST_st1_fsm_0_assign_proc : process(ap_sig_bdd_25)
    begin
        if (ap_sig_bdd_25) then 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st2_fsm_1 assign process. --
    ap_sig_cseq_ST_st2_fsm_1_assign_proc : process(ap_sig_bdd_138)
    begin
        if (ap_sig_bdd_138) then 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st3_fsm_2 assign process. --
    ap_sig_cseq_ST_st3_fsm_2_assign_proc : process(ap_sig_bdd_151)
    begin
        if (ap_sig_bdd_151) then 
            ap_sig_cseq_ST_st3_fsm_2 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st3_fsm_2 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st4_fsm_3 assign process. --
    ap_sig_cseq_ST_st4_fsm_3_assign_proc : process(ap_sig_bdd_162)
    begin
        if (ap_sig_bdd_162) then 
            ap_sig_cseq_ST_st4_fsm_3 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st4_fsm_3 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st8_fsm_5 assign process. --
    ap_sig_cseq_ST_st8_fsm_5_assign_proc : process(ap_sig_bdd_221)
    begin
        if (ap_sig_bdd_221) then 
            ap_sig_cseq_ST_st8_fsm_5 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st8_fsm_5 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st9_fsm_6 assign process. --
    ap_sig_cseq_ST_st9_fsm_6_assign_proc : process(ap_sig_bdd_252)
    begin
        if (ap_sig_bdd_252) then 
            ap_sig_cseq_ST_st9_fsm_6 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st9_fsm_6 <= ap_const_logic_0;
        end if; 
    end process;

    brmerge_fu_226_p2 <= (int_pending or tmp_1_reg_349);

    -- buff_address0 assign process. --
    buff_address0_assign_proc : process(ap_sig_cseq_ST_st4_fsm_3, ap_sig_cseq_ST_pp0_stg0_fsm_4, ap_reg_ppiten_pp0_it0, tmp_3_fu_243_p1, tmp_6_fu_279_p1)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3)) then 
            buff_address0 <= tmp_3_fu_243_p1(7 - 1 downto 0);
        elsif (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_4) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) then 
            buff_address0 <= tmp_6_fu_279_p1(7 - 1 downto 0);
        else 
            buff_address0 <= "XXXXXXX";
        end if; 
    end process;


    -- buff_ce0 assign process. --
    buff_ce0_assign_proc : process(ap_sig_cseq_ST_st4_fsm_3, ap_sig_bdd_167, ap_sig_cseq_ST_pp0_stg0_fsm_4, ap_reg_ppiten_pp0_it0, ap_sig_bdd_193, ap_reg_ppiten_pp0_it2)
    begin
        if ((((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and not(ap_sig_bdd_167)) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_4) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((ap_sig_bdd_193 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2)))))) then 
            buff_ce0 <= ap_const_logic_1;
        else 
            buff_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    buff_d0 <= stream_in_TDATA;

    -- buff_we0 assign process. --
    buff_we0_assign_proc : process(exitcond_fu_231_p2, ap_sig_cseq_ST_st4_fsm_3, ap_sig_bdd_167)
    begin
        if ((((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and (ap_const_lv1_0 = exitcond_fu_231_p2) and not(ap_sig_bdd_167)))) then 
            buff_we0 <= ap_const_logic_1;
        else 
            buff_we0 <= ap_const_logic_0;
        end if; 
    end process;


    -- byte_wroffset_0_ack_out assign process. --
    byte_wroffset_0_ack_out_assign_proc : process(status_reg_1_ack_in, ap_sig_cseq_ST_st9_fsm_6)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_6) and not((status_reg_1_ack_in = ap_const_logic_0)))) then 
            byte_wroffset_0_ack_out <= ap_const_logic_1;
        else 
            byte_wroffset_0_ack_out <= ap_const_logic_0;
        end if; 
    end process;


    -- ctrl_reg_0_ack_out assign process. --
    ctrl_reg_0_ack_out_assign_proc : process(status_reg_1_ack_in, ap_sig_cseq_ST_st9_fsm_6)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_6) and not((status_reg_1_ack_in = ap_const_logic_0)))) then 
            ctrl_reg_0_ack_out <= ap_const_logic_1;
        else 
            ctrl_reg_0_ack_out <= ap_const_logic_0;
        end if; 
    end process;

    exitcond3_fu_267_p2 <= "1" when (indvar_reg_178 = ap_const_lv8_80) else "0";
    exitcond_fu_231_p2 <= "1" when (i_reg_167 = ap_const_lv8_80) else "0";
    i_1_fu_237_p2 <= std_logic_vector(unsigned(i_reg_167) + unsigned(ap_const_lv8_1));
    indvar_next_fu_273_p2 <= std_logic_vector(unsigned(indvar_reg_178) + unsigned(ap_const_lv8_1));

    -- int_pending_flag_phi_fu_193_p4 assign process. --
    int_pending_flag_phi_fu_193_p4_assign_proc : process(brmerge_reg_359, int_pending_flag_reg_189, ap_sig_cseq_ST_st9_fsm_6)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_6) and (ap_const_lv1_0 = brmerge_reg_359))) then 
            int_pending_flag_phi_fu_193_p4 <= ap_const_lv1_1;
        else 
            int_pending_flag_phi_fu_193_p4 <= int_pending_flag_reg_189;
        end if; 
    end process;

    int_pending_flag_s_fu_320_p2 <= (int_pending_flag_phi_fu_193_p4 or tmp_8_fu_307_p3);

    -- int_pending_loc_phi_fu_204_p4 assign process. --
    int_pending_loc_phi_fu_204_p4_assign_proc : process(brmerge_reg_359, ap_sig_cseq_ST_st9_fsm_6, int_pending_loc_reg_201)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_6) and (ap_const_lv1_0 = brmerge_reg_359))) then 
            int_pending_loc_phi_fu_204_p4 <= ap_const_lv1_1;
        else 
            int_pending_loc_phi_fu_204_p4 <= int_pending_loc_reg_201;
        end if; 
    end process;

    interrupt_r <= (int_pending_loc_phi_fu_204_p4(0) and rev_fu_314_p2(0));

    -- interrupt_r_ap_vld assign process. --
    interrupt_r_ap_vld_assign_proc : process(status_reg_1_ack_in, ap_sig_cseq_ST_st9_fsm_6)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_6) and not((status_reg_1_ack_in = ap_const_logic_0)))) then 
            interrupt_r_ap_vld <= ap_const_logic_1;
        else 
            interrupt_r_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    is_0iter_fu_284_p2 <= "1" when (indvar_reg_178 = ap_const_lv8_0) else "0";
    rev_fu_314_p2 <= (tmp_8_fu_307_p3 xor ap_const_lv1_1);
    status_reg <= status_reg_1_data_reg;

    -- status_reg_1_ack_in assign process. --
    status_reg_1_ack_in_assign_proc : process(status_reg_1_vld_reg)
    begin
        if (((ap_const_logic_0 = status_reg_1_vld_reg) or ((ap_const_logic_1 = status_reg_1_vld_reg) and (ap_const_logic_1 = ap_const_logic_1)))) then 
            status_reg_1_ack_in <= ap_const_logic_1;
        else 
            status_reg_1_ack_in <= ap_const_logic_0;
        end if; 
    end process;


    -- status_reg_1_vld_in assign process. --
    status_reg_1_vld_in_assign_proc : process(ap_sig_cseq_ST_st8_fsm_5)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st8_fsm_5)) then 
            status_reg_1_vld_in <= ap_const_logic_1;
        else 
            status_reg_1_vld_in <= ap_const_logic_0;
        end if; 
    end process;

    status_reg_ap_vld <= status_reg_1_vld_reg;

    -- stream_in_TREADY assign process. --
    stream_in_TREADY_assign_proc : process(exitcond_fu_231_p2, ap_sig_cseq_ST_st4_fsm_3, ap_sig_bdd_167)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and (ap_const_lv1_0 = exitcond_fu_231_p2) and not(ap_sig_bdd_167))) then 
            stream_in_TREADY <= ap_const_logic_1;
        else 
            stream_in_TREADY <= ap_const_logic_0;
        end if; 
    end process;

    tmp_1_fu_216_p2 <= (tmp_2_fu_212_p1 xor ap_const_lv1_1);
    tmp_2_fu_212_p1 <= ctrl_reg_0_data_reg(1 - 1 downto 0);
    tmp_3_fu_243_p1 <= std_logic_vector(resize(unsigned(i_reg_167),64));
    tmp_5_fu_294_p2 <= std_logic_vector(unsigned(count) + unsigned(ap_const_lv32_80));
    tmp_6_fu_279_p1 <= std_logic_vector(resize(unsigned(indvar_reg_178),64));
    tmp_7_fu_257_p1 <= std_logic_vector(resize(unsigned(tmp_fu_248_p4),64));
    tmp_8_fu_307_p3 <= ctrl_reg_0_data_reg(1 downto 1);
    tmp_fu_248_p4 <= byte_wroffset_0_data_reg(31 downto 2);
end behav;