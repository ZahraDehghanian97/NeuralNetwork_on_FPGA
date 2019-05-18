----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2019 01:01:23 PM
-- Design Name: 
-- Module Name: sigmoid - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sigmoid is
    Port (
     X_sigmoid : in STD_LOGIC_VECTOR(15 downto 0);
     clk_sigmoid : in STD_LOGIC;
     Y_sigmoid : out STD_LOGIC_VECTOR(15 downto 0)
               
    );
end sigmoid;

architecture Behavioral of sigmoid is

begin
    Y_sigmoid <= X_sigmoid ;

end Behavioral;
