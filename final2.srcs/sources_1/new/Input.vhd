----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/30/2019 07:30:53 PM
-- Design Name: 
-- Module Name: Input - Behavioral
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
use work.neurals_utils.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Input is
Port (
  xt : in matrix_1_4;
  ht_1 : in matrix_1_8;
  i_out : out matrix_1_8
  );
end Input;

architecture Behavioral of Input is
constant wi : matrix_4_8 := ( ( single_float_to_slv(0.13965783), single_float_to_slv(-0.04775485), single_float_to_slv(0.34143683), single_float_to_slv(0.28217432), single_float_to_slv(0.05485592), single_float_to_slv(0.5929077), single_float_to_slv(-0.14488743), single_float_to_slv(0.0269083) ),
                              ( single_float_to_slv(-0.26471546), single_float_to_slv(0.21732531), single_float_to_slv(-0.63501525), single_float_to_slv(-0.5341712), single_float_to_slv(0.4722219), single_float_to_slv(0.1886938), single_float_to_slv(0.16185956), single_float_to_slv(-0.1487629) ),
                              ( single_float_to_slv(0.3210674), single_float_to_slv(0.32791585), single_float_to_slv(0.24699497), single_float_to_slv(-0.19182979), single_float_to_slv(0.21832567), single_float_to_slv(0.22613047), single_float_to_slv(0.1668725), single_float_to_slv(-0.10851475) ),
                              ( single_float_to_slv(0.09162864), single_float_to_slv(-0.22094683), single_float_to_slv(-0.7704977), single_float_to_slv(-0.27422312), single_float_to_slv(-0.5308995), single_float_to_slv(-0.19721255), single_float_to_slv(-0.10660882), single_float_to_slv(-0.28635386) )
                            );
                            
 signal ui : matrix_8_8 := (others => ( others => single_float_to_slv(0.0) ));
 constant bi : matrix_1_8 := ( single_float_to_slv(1.1545736), single_float_to_slv(1.2713808), single_float_to_slv(1.0521708), single_float_to_slv(1.2388046), single_float_to_slv(1.3204008), single_float_to_slv(1.2830889), single_float_to_slv(1.1497107), single_float_to_slv(1.1425042) );

signal res1, res2 : matrix_1_8 ;

component multiply_matrix_1_4_8 is
    Port ( 
        in1 : in matrix_1_4;
        in2 : in matrix_4_8;
        out_multiply : out matrix_1_8 );
end component;
component multiply_matrix_1_8_8 is
    Port ( 
        in1 : in matrix_1_8;
        in2 : in matrix_8_8;
        out_multiply : out matrix_1_8 );
end component;
component add_3_matrix_1_8 is
Port (
  in1 : in matrix_1_8;
  in2 : in matrix_1_8;
  in3 : in matrix_1_8;
  out_add : out matrix_1_8
  );
end component;

begin
mul_module0 : multiply_matrix_1_4_8 port map ( in1 => xt, in2 => wf, out_multiply => res1);
mul_module1 : multiply_matrix_1_8_8 port map ( in1 => ht_1, in2 => uf, out_multiply => res2);
add_module : add_3_matrix_1_8 port map ( in1 => res1, in2 => res2, in3 => bf, out_add => i_out);

end Behavioral;
