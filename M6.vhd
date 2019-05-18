----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2019 04:35:02 PM
-- Design Name: 
-- Module Name: MNMultiplyer - Behavioral
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
use work.types.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MNMultiplyer is
generic (  n : integer := 2;
           m : integer := 2
 );
Port (
  X1 : in matrix16(m-1 downto 0 ,n-1 downto 0);
  X2 : in matrix16(m-1 downto 0 ,n-1 downto 0);
  clk : in std_logic;
  Y : out matrix32(m-1 downto 0 ,n-1 downto 0)
  );
end MNMultiplyer;

architecture Behavioral of MNMultiplyer is
component multiply is
    Port ( 
        input1 : in std_logic_vector(15 downto 0);
        input2 : in std_logic_vector(15 downto 0);
        clk_multiply : in std_logic;
        result : out std_logic_vector(31 downto 0)
           );
end component;
begin
        
    row: for I in 0 to m-1 generate
        begin
        col :
         for J in 0 to n-1 generate
         begin
            m : 
            multiply port map (input1=> X1(I,J),input2=>X2(I,J), clk_multiply=>clk , result=> Y(I,J));
         end  generate;
    end  generate ;         
end Behavioral;
