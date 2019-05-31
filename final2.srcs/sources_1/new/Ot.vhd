

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

entity Ot is
  Port (
  xt : in matrix_1_4;
  ht_1 : in matrix_1_8;
  out_ot : out matrix_1_8;
  clk : in std_logic;
  enable : in std_logic
  );
end Ot;

architecture Behavioral of Ot is

component Output is
  Port (
  xt : in matrix_1_4;
  ht_1 : in matrix_1_8;
  o_out : out matrix_1_8
  );
end component;
component sigmoid_module is
    Port (
           clk : in std_logic;
           enable : in std_logic;
           input : in std_logic_vector(31 downto 0);
           output : out std_logic_vector(31 downto 0));
end component;

signal res_forget : matrix_1_8;
signal counter : integer := 0;
signal tmp_res : matrix_1_8; 
begin

module0 : Output port map ( xt => xt, ht_1 => ht_1, o_out => res_forget);
F: for I in 7 downto 0 generate
    module1: sigmoid_module port map( clk => clk, enable => enable, input => res_forget(I), output => tmp_res(I));
   end generate F;
process(clk)
begin
if (rising_edge(clk)) then
    counter <= counter + 1;
    if (counter = 7) then
        out_ot <= tmp_res;
    end if;
end if;
end process;




end Behavioral;
