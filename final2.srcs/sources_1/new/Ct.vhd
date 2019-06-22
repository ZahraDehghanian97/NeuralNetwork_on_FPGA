

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

entity Ct is
  Port (
  xt : in matrix_1_4;
  ht_1 : in matrix_1_8;
  out_ct : out matrix_1_8;
  clk : in std_logic;
  enable : in std_logic
  );
end Ct;

architecture Behavioral of Ct is

component Candidate is
  Port (
  xt : in matrix_1_4;
  ht_1 : in matrix_1_8;
  c_out : out matrix_1_8
  );
end component;
component tanh_module is
    Port (
           clk : in std_logic;
           enable : in std_logic;
           input : in real;
           output : out real);
end component;

signal res_forget : matrix_1_8;
signal counter : integer := 0;
signal tmp_res : matrix_1_8; 
begin

module0 : Candidate port map ( xt => xt, ht_1 => ht_1, c_out => res_forget);
F: for I in 7 downto 0 generate
    module1: tanh_module port map( clk => clk, enable => enable, input => res_forget(I), output => tmp_res(I));
   end generate F;
process(clk)
begin
if (rising_edge(clk)) then
    if(enable ='1') then
        counter <= counter + 1;
        if (counter = 7) then
            out_ct <= tmp_res;
        end if;
    else
        counter <= 0;
    end if;
end if;
end process;

end Behavioral;
