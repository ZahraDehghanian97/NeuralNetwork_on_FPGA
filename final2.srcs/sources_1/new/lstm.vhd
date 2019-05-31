----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2019 10:35:43 AM
-- Design Name: 
-- Module Name: scd - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use work.neurals_utils.all ;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY LSTM_Cell IS
 PORT (
 clk : IN STD_LOGIC;
 xt : IN matrix_1_4;
 ct_1 : IN matrix_1_8;
 ht_1 : IN matrix_1_8;
 ht : OUT matrix_1_8;
 c_t : OUT matrix_1_8;
 ready : OUT STD_LOGIC );
END LSTM_Cell;

architecture Behavioral of LSTM_Cell is
component dot_multiplier_1_8 is
  Port ( 
  in_1 : in matrix_1_8;
  in_2 : in matrix_1_8;
  out_dot_mul : out matrix_1_8
  );
end component ;
component Ct is
 Port (
 xt : in matrix_1_4;
 ht_1 : in matrix_1_8;
 out_ct : out matrix_1_8;
 clk : in std_logic;
 enable : in std_logic
 );
end component ;
component Ot is
  Port (
  xt : in matrix_1_4;
  ht_1 : in matrix_1_8;
  out_ot : out matrix_1_8;
  clk : in std_logic;
  enable : in std_logic
  );
end component;
component  Ft is
 Port (
 xt : in matrix_1_4;
 ht_1 : in matrix_1_8;
 out_ft : out matrix_1_8;
 clk : in std_logic;
 enable : in std_logic
 );
end component ;
component It is
  Port (
  xt : in matrix_1_4;
  ht_1 : in matrix_1_8;
  out_it : out matrix_1_8;
  clk : in std_logic;
  enable : in std_logic
  );
end component ;
component add_module is
    Port (
       inputx : in std_logic_vector(31 downto 0);
       inputy : in std_logic_vector(31 downto 0);
       output : out std_logic_vector(31 downto 0));
end component;
component add_2_matrix_1_8 is
Port (
  in1 : in matrix_1_8;
  in2 : in matrix_1_8;
  out_add : out matrix_1_8
  );
end component ;
component tanh_module is
    Port (
           clk : in std_logic;
           enable : in std_logic;
           input : in std_logic_vector(31 downto 0);
           output : out std_logic_vector(31 downto 0));
end component ;
signal out_f, out_o,out_i,out_c ,out_ct_1_ht,out_it_ct,out_add,out_tanh: matrix_1_8;
begin
f1 : Ft port map (xt=>xt ,ht_1=>ht_1,out_ft=>out_f,clk=>clk,enable=> '1');
i1 : It port map (xt=>xt ,ht_1=>ht_1,out_it=>out_i,clk=>clk,enable=> '1');
o1 : Ot port map (xt=>xt ,ht_1=>ht_1,out_ot=>out_o,clk=>clk,enable=> '1');
c1 : Ct port map (xt=>xt ,ht_1=>ht_1,out_ct=>out_c,clk=>clk,enable=> '1');
d_ct_1_ht : dot_multiplier_1_8 port map ( in_1 =>out_f,in_2=>ct_1,out_dot_mul=> out_ct_1_ht);
d_it_ct : dot_multiplier_1_8 port map ( in_1 =>out_i,in_2=>out_c,out_dot_mul=> out_it_ct);
a_d_d : add_2_matrix_1_8 port map (in1 =>out_ct_1_ht,in2=>out_it_ct ,out_add=> out_add);
c_t<= out_add ;
F: for I in 7 downto 0 generate
    module1: tanh_module port map( clk => clk, enable => '1', input => out_add(I), output => out_tanh(I));
   end generate F;
d_out_tanh_ot : dot_multiplier_1_8 port map ( in_1 =>out_o,in_2=>out_tanh,out_dot_mul=> ht);
end Behavioral;
