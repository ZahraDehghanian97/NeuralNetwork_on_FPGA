----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/22/2019 03:59:35 PM
-- Design Name: 
-- Module Name: pipe_tanh - Behavioral
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
use work.neurals_utils.all ;

entity pipe_tanh is
  Port (
    input : in array_8;
    output : out array_8;
    clk : in std_logic;
    ready : out std_logic
   );
end pipe_tanh;

architecture Behavioral of pipe_tanh is
component tanh_module is
    Port (
           clk : in std_logic;
           enable : in std_logic;
           input : in real;
           output : out real);
end component;
signal counter : integer := 0;
signal in_tanh, out_tanh : real;
begin

module : tanh_module port map (clk=>clk, enable=>'1', input=>in_tanh, output => out_tanh);

process(clk)
begin
if(rising_edge(clk)) then
    case counter is
    when 0 => 
            in_tanh <= input(1);
    when 1 => 
            in_tanh <= input(2);
    when 2 => 
            in_tanh <= input(3);
    when 3 => 
            in_tanh <= input(4);
    when 4 => 
            in_tanh <= input(5);
            output(1)<= out_tanh ;
    when 5 => 
            in_tanh <= input(6);
            output(2)<= out_tanh ;
    when 6 => 
            in_tanh <= input(7);
            output(3)<= out_tanh ;     
    when 7 => 
            in_tanh <= input(8);
            output(4)<= out_tanh ;            
    when 8 => 
            output(5)<= out_tanh ;
    when 9 => 
            output(6)<= out_tanh ;            
    when 10 => 
            output(7)<= out_tanh ;                                   
    when 11 => 
            output(8)<= out_tanh ;
            ready <= '1';   
    end case ;
    counter <= counter + 1;             
end if;
end process;

end Behavioral;
