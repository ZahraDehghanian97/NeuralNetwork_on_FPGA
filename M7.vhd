----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2019 04:43:56 PM
-- Design Name: 
-- Module Name: NSoftmax - Behavioral
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
use IEEE.STD_LOGIC_signed.ALL;
use work.types.all ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NSoftmax is
   generic (  n : integer := 2
 );
Port (
  X : in myArray32(n-1 downto 0);
  Y : out myArray32(n-1 downto 0)
  );
end NSoftmax;

architecture Behavioral of NSoftmax is
component expo is 
generic ( 
     n : integer := 2
 );
Port (
  X_expo : in myArray32(n-1 downto 0);
  clk_expo : in std_logic ;
  Y_expo : out myArray32(n-1 downto 0)
  );
    end component;
signal exi : myArray32(n-1 downto 0);
begin
process(exi)
variable exiVar : myArray32(n-1 downto 0);
variable e : std_logic_vector(31 downto 0):= "00001010110111111000010101000000";
variable sum : std_logic_vector(31 downto 0):=(others=>'0');
variable result : myArray32(n-1 downto 0);
variable temp :  std_logic_vector(31 downto 0):=(others=>'0');
begin
    exiVar := exi;
    sum := (others=>'0');
    for i in 0 to n-1 loop
       temp : exiVar(i);
       sum := sum + temp;
   end loop;
   for j in 0 to n-1 loop
          result(j):= ((exiVar(j)) / sum );    
      end loop ;
   Y <= result;
end process;
myExpo : expo port map (X_expo => X , clk_expo=>clk , Y_expo => exi);
end Behavioral;
