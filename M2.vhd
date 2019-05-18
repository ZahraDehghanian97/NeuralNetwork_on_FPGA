----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2019 12:44:30 PM
-- Design Name: 
-- Module Name: M2 - Behavioral
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


entity MNTanh is
generic ( 
        n : integer := 2;
        m : integer := 2
 );
Port (
  X : in matrix16(m-1 downto 0 ,n-1 downto 0);
  clk : in std_logic;
  Y : out matrix16(m-1 downto 0 ,n-1 downto 0)
  );
end MNTanh;

architecture Behavioral of MNTanh is

component tanh is
    Port ( 
        X_tanh : in std_logic_vector(15 downto 0);
        clk_tanh : in std_logic;
        Y_tanh : out std_logic_vector(15 downto 0)
           );
end component;
--signal w1,w2 : std_logic_vector(15 downto 0):= (Others => '0');
begin
--    test : for d in 0 to 1 generate
--        begin
--        s : sigmoid2 port map (X_sigmoid=>w1,clk_sigmoid=>clk , Y_sigmoid =>w2);
--        end generate ;
        
    row: for I in 0 to m-1 generate
        begin
        col :
         for J in 0 to n-1 generate
         begin
            myTanh : 
            tanh port map (X_tanh=> X(I,J), clk_tanh=>clk , Y_tanh => Y(I,J));
         end  generate;
    end  generate  ;
end Behavioral;
