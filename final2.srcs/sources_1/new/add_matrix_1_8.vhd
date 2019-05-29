----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2019 11:26:42 AM
-- Design Name: 
-- Module Name: add_matrix_1_8 - Behavioral
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

entity add_2_matrix_1_8 is
  Port (
  in_1 : in matrix_1_8;
  in_2 : in matrix_1_8;
  out_add : out matrix_1_8
  );
end add_2_matrix_1_8;


architecture Behavioral of add_2_matrix_1_8 is
component add_module is
    Port (
       inputx : in std_logic_vector(31 downto 0);
       inputy : in std_logic_vector(31 downto 0);
       output : out std_logic_vector(31 downto 0));
end component;

begin

F: for I in 7 downto 0 generate
    MODULE: add_module port map( inputx => in_1(I), inputy => in_2(I), output => out_add(I));
   end generate F;

end Behavioral;
