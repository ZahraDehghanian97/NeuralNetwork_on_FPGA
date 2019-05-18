----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2019 03:34:50 PM
-- Design Name: 
-- Module Name: MPPNMultipliyer - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MPPNMultipliyer is
   generic ( n : integer := 1;
            p : integer := 1;
           m : integer := 1
 );
Port (
  X1 : in matrix16(m-1 downto 0 ,p-1 downto 0);
  X2 : in matrix16(p-1 downto 0 ,n-1 downto 0);
  clk : in std_logic;
  Y : out matrix32(m-1 downto 0 ,n-1 downto 0)
  );
end MPPNMultipliyer;

architecture Behavioral of MPPNMultipliyer is
begin
    process(X1,X2)
    variable sum : std_logic_vector(31 downto 0):=(Others => '0');
    variable in1 :matrix16(m-1 downto 0 ,p-1 downto 0);
    variable in2 :matrix16(p-1 downto 0 ,n-1 downto 0);
    variable tempOut : matrix32(m-1 downto 0 ,n-1 downto 0);
    variable temp : std_logic_vector(31 downto 0);
     begin
        in1 := X1;
        in2 := X2;
        for i in 0 to m-1 loop
            for j in 0 to n-1 loop
                sum := (Others => '0');
                for k in 0 to p-1 loop
                    temp := (in1( i, k )) * (in2( k, j) );
                    sum := sum + temp ;
                    if( k = p-1 ) then 
                        tempOut(i,j) := sum;
                     else
                        tempOut(i,j) := (others=> '0');
                    end if;
                end loop;
            end loop;
        end loop;  
        Y<= tempOut; 
    end process;
   
end Behavioral;
