----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2019 12:54:05 PM
-- Design Name: 
-- Module Name: dot_multiplier_1_8 - Behavioral
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
use work.neurals_utils.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dot_multiplier_1_8 is
  Port ( 
  in_1 : in matrix_1_8;
  in_2 : in matrix_1_8;
  out_dot_mul : out matrix_1_8
  );
end dot_multiplier_1_8;

architecture Behavioral of dot_multiplier_1_8 is

component multiplier_module is
    Port (
       inputx : in std_logic_vector(31 downto 0);
       inputy : in std_logic_vector(31 downto 0);
       output : out std_logic_vector(31 downto 0));
end component;

begin

F: for I in 7 downto 0 generate
    MODULE: multiplier_module port map( inputx => in_1(I), inputy => in_2(I), output => out_dot_mul(I));
   end generate F;

end Behavioral;
