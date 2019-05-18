----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2019 01:00:02 PM
-- Design Name: 
-- Module Name: tanh - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity NAdder is
    generic (  n : integer := 2
 );
Port (
  X_adder : in  myArray32(n-1 downto 0);
  Y_adder : out std_logic_vector(31 downto 0)
  );end NAdder;

architecture Behavioral of NAdder is
--signal sum : std_logic_vector(31 downto 0) ;
begin
process (X_adder)
variable sum : signed(31 downto 0):=(others => '0');
begin
    sum := (others => '0');
    for i in 0 to n-1 loop
        sum := (signed(sum) + signed(X_adder(i)));
    end loop;
    Y_adder <= std_logic_vector(sum) ;
end process;
end Behavioral;

