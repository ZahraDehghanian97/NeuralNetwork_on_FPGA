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
 ct : OUT matrix_1_8;
 ready : OUT STD_LOGIC );
END LSTM_Cell;

architecture Behavioral of LSTM_Cell is

begin


end Behavioral;
