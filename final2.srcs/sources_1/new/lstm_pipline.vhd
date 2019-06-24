----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/23/2019 09:10:55 AM
-- Design Name: 
-- Module Name: lstm_pipline - Behavioral
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
use ieee.math_real.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
use work.neurals_utils.all ;

entity lstm_pipline is
  Port (
    ht_1 : in matrix_1_8;
    ct_1 : in matrix_1_8;
    xt : in matrix_1_4;
    ct : out matrix_1_8;
    ht : out matrix_1_8;
    clk : in std_logic
  );
end lstm_pipline;

architecture Behavioral of lstm_pipline is

component Candidate is
Port (
  xt : in matrix_1_4;
  ht_1 : in matrix_1_8;
  c_out : out matrix_1_8
  );
end component;

component Forget is
  Port (
  xt : in matrix_1_4;
  ht_1 : in matrix_1_8;
  f_out : out matrix_1_8
  );
end component;
component Input is
Port (
  xt : in matrix_1_4;
  ht_1 : in matrix_1_8;
  i_out : out matrix_1_8
  );
end component;
component Output is
Port (
  xt : in matrix_1_4;
  ht_1 : in matrix_1_8;
  o_out : out matrix_1_8
  );
end component;
component tanh_module is
    Port (
           clk : in std_logic;
           enable : in std_logic;
           input : in real;
           output : out real);
end component;
component sigmoid_module is
    Port (
           clk : in std_logic;
           enable : in std_logic;
           input : in real;
           output : out real);
end component;

signal c_out, i_out, f_out, o_out : matrix_1_8;
signal tanh_enable, sigmoid_enable : std_logic := '1';
signal tanh_final_enable : std_logic := '0';
signal tanh_delay1, tanh_delay2 : real;
signal tanh_in, tanh_out, tanh_final_in, tanh_final_out, sigmoid1_in, sigmoid1_out, sigmoid2_in, sigmoid2_out, sigmoid3_in, sigmoid3_out : real; 
signal counter : integer := 0;
signal outsum, s3 : real := 0.0 ;
begin
module0 : Candidate port map (xt => xt, ht_1 => ht_1, c_out => c_out);
module1 : Input port map (xt => xt, ht_1 => ht_1, i_out => i_out);
module2 : Output port map (xt => xt, ht_1 => ht_1, o_out => o_out);
module3 : Forget port map (xt => xt, ht_1 => ht_1, f_out => f_out);

module_tanh1 : tanh_module port map (clk => clk, enable => tanh_enable, input => tanh_in, output => tanh_out);
module_tanh2 : tanh_module port map (clk => clk, enable => tanh_final_enable, input => tanh_final_in, output => tanh_final_out);
module_sigmoid1 :  sigmoid_module port map (clk => clk, enable => sigmoid_enable, input => sigmoid1_in, output => sigmoid1_out);
module_sigmoid2 :  sigmoid_module port map (clk => clk, enable => sigmoid_enable, input => sigmoid2_in, output => sigmoid2_out);
module_sigmoid3 :  sigmoid_module port map (clk => clk, enable => sigmoid_enable, input => sigmoid3_in, output => sigmoid3_out);

sigmoid1_in <= f_out;
sigmoid2_in <= i_out;
sigmoid3_in <= o_out;
tanh_in <= c_out;
tanh_final_in <= outsum;


process(clk)
begin
if(rising_edge(clk)) then
    if(counter >= 7) then
        outsum <= (sigmoid1_out * ct_1(counter-7))+ (sigmoid2_out * tanh_delay2);
        ct((counter-7)mod 8) <= outsum;
--        if(counter-7 < 8) then
--            ct(counter-7) <= outsum;
--        end if;
        s3 <= sigmoid3_out;
        tanh_final_enable <= '1';
    end if;
    if (counter >= 11) then 
--        if(counter-11 < 8) then
--            ht(counter-11) <= s3 * tanh_final_out;
--        end if;
        ht((counter-11)mod 8) <= s3 * tanh_final_out;
    end if;
    tanh_delay1 <= tanh_out;
    tanh_delay2 <= tanh_delay1;
    counter <= counter + 1;
end if;
end process;

end Behavioral;