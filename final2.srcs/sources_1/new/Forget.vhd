----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2019 11:10:35 AM
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

entity Forget is
  Port (
  xt : in matrix_1_4;
  ht_1 : in matrix_1_8;
  f_out : out matrix_1_8
  );
end Forget;


       
                   

architecture Behavioral of Forget is
constant wf : matrix_4_8 := ( ( single_float_to_slv(-0.02987039), single_float_to_slv(0.04314025), single_float_to_slv(0.53898245), single_float_to_slv(0.41512847), single_float_to_slv(-0.80487585), single_float_to_slv(-0.09355235), single_float_to_slv(-0.41942886), single_float_to_slv(-0.357487) ),
                              ( single_float_to_slv(0.73685104), single_float_to_slv(0.3203586), single_float_to_slv(-0.49644002), single_float_to_slv(-0.05589191), single_float_to_slv(0.5361538), single_float_to_slv(0.4786008), single_float_to_slv(0.18015783), single_float_to_slv(0.536344) ),
                              ( single_float_to_slv(-0.27975634), single_float_to_slv(-0.32213825), single_float_to_slv(0.44963884), single_float_to_slv(-0.1668127), single_float_to_slv(-0.72459227), single_float_to_slv(-0.5951743), single_float_to_slv(-0.12105721), single_float_to_slv(-0.8235756) ),
                              ( single_float_to_slv(-0.1605476), single_float_to_slv(0.14743894), single_float_to_slv(0.2773945), single_float_to_slv(0.29888842), single_float_to_slv(0.533289), single_float_to_slv(0.8247989), single_float_to_slv(0.08690736), single_float_to_slv(0.56370485) )
                            );
                            
 constant uf : matrix_8_8 := ( ( single_float_to_slv(0.12014879), single_float_to_slv(-0.0524535), single_float_to_slv(-0.12467378), single_float_to_slv(-0.03299288), single_float_to_slv(0.4924234), single_float_to_slv(-0.24017411), single_float_to_slv(0.03967816), single_float_to_slv(0.35719723) ),
                               ( single_float_to_slv(-0.1104935), single_float_to_slv(0.12806204), single_float_to_slv(0.16687083), single_float_to_slv(0.3333305), single_float_to_slv(-0.02045518), single_float_to_slv(-0.16147594), single_float_to_slv(-0.13974743), single_float_to_slv(-0.38790867) ),
                               ( single_float_to_slv(0.2634898), single_float_to_slv(0.23817575), single_float_to_slv(-0.07626809), single_float_to_slv(0.05557626), single_float_to_slv(-0.04142026), single_float_to_slv(0.2815075), single_float_to_slv(0.05502056), single_float_to_slv(0.34272337) ),
                               ( single_float_to_slv(-0.05009506), single_float_to_slv(0.06229772), single_float_to_slv(-0.0626516), single_float_to_slv(0.45941448), single_float_to_slv(-0.3453443), single_float_to_slv(-0.3853578), single_float_to_slv(-0.08171016),single_float_to_slv(-0.05097225) ),
                               ( single_float_to_slv(-0.23506312), single_float_to_slv(0.12299766), single_float_to_slv(0.18684718), single_float_to_slv(-0.15129495), single_float_to_slv(0.28006473), single_float_to_slv(0.30475447), single_float_to_slv(-0.1648891), single_float_to_slv(0.2405248) ), 
                               ( single_float_to_slv(-0.059511), single_float_to_slv(-0.04555352), single_float_to_slv(-0.19750983),  single_float_to_slv(0.03688432),  single_float_to_slv(0.166731), single_float_to_slv(0.14389813), single_float_to_slv(0.19836815), single_float_to_slv(-0.19307654) ),
                               ( single_float_to_slv(-0.0608201), single_float_to_slv(-0.6685579), single_float_to_slv(-0.14629643), single_float_to_slv(0.2732291), single_float_to_slv(-0.1487119), single_float_to_slv(-0.5028979), single_float_to_slv(-0.19989286), single_float_to_slv(-0.60279423) ),
                               ( single_float_to_slv(-0.01670908), single_float_to_slv(0.25028083), single_float_to_slv(0.06285841), single_float_to_slv(0.08058461), single_float_to_slv(0.05506877), single_float_to_slv(0.09961189), single_float_to_slv(0.21074672), single_float_to_slv(0.26627186) )
                             );
 constant bf : matrix_1_8 := ( single_float_to_slv(1.1545736), single_float_to_slv(1.2713808), single_float_to_slv(1.0521708), single_float_to_slv(1.2388046), single_float_to_slv(1.3204008), single_float_to_slv(1.2830889), single_float_to_slv(1.1497107), single_float_to_slv(1.1425042) );

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
add_module : add_3_matrix_1_8 port map ( in1 => res1, in2 => res2, in3 => bf, out_add => f_out);


end Behavioral;
