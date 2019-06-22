----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/22/2019 10:57:26 AM
-- Design Name: 
-- Module Name: neural_network_lstm - Behavioral
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
use work.neurals_utils.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity neural_network_lstm is
  Port (
    clk : in std_logic;
    input : in array_20;
    output : out matrix_1_2;
    enable : in std_logic
  );
end neural_network_lstm;

architecture Behavioral of neural_network_lstm is
component LSTM_Cell IS
 PORT (
 clk : IN STD_LOGIC;
 xt : IN matrix_1_4;
 ct_1 : IN matrix_1_8;
 ht_1 : IN matrix_1_8;
 ht : OUT matrix_1_8;
 c_t : OUT matrix_1_8;
 ready : OUT STD_LOGIC;
 enable : in std_logic );
end component;

type cel_ct is array (1 to 19) of matrix_1_8;
type cel_ht is array (1 to 19) of matrix_1_8;
type cel_ready is array(1 to 20) of std_logic;
signal CELL_ct : cel_ct;
signal CELL_ht : cel_ht; 
signal CELL_ready : cel_ready := (others => '0');
begin

module1: LSTM_Cell port map (clk => clk, xt => input(1), ct_1 => (others => 0.0), ht_1 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
                             ht => CELL_ht(1), c_t => CELL_ct(1), ready => CELL_ready(1), enable => enable);
module20: LSTM_Cell port map (clk => clk, xt => input(20), ct_1 => CELL_ht(19) , ht_1 => CELL_ht(19),
                             ht => CELL_ht(20), c_t => CELL_ct(20), ready => CELL_ready(20), enable =>  CELL_ready(19));

for_generate : for I in 2 to 19 generate
moduleI : LSTM_Cell port map (clk => clk, xt => input(I), ct_1 => CELL_ct(I-1), ht_1 => CELL_ht(I-1),
                             ht => CELL_ht(I), c_t => CELL_ct(I), ready => CELL_ready(I), enable => CELL_ready(I-1));  
end generate;
end Behavioral;
