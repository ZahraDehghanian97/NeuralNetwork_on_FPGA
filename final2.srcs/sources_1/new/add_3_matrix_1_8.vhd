----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/30/2019 06:36:08 PM
-- Design Name: 
-- Module Name: add_3_matrix_1_8 - Behavioral
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

entity add_3_matrix_1_8 is
Port (
  in1 : in matrix_1_8;
  in2 : in matrix_1_8;
  in3 : in matrix_1_8;
  out_add : out matrix_1_8
  );
end add_3_matrix_1_8;

architecture Behavioral of add_3_matrix_1_8 is
component add_module is
    Port (
       inputx : in real;
       inputy : in real;
       output : out real);
end component;
signal tmp : matrix_1_8 ;

begin

F: for I in 7 downto 0 generate
    MODULE: add_module port map( inputx => in1(I), inputy => in2(I), output => tmp(I));
    MODULE1: add_module port map( inputx => tmp(I), inputy => in3(I), output => out_add(I));
   end generate F;
   
   
end Behavioral;
