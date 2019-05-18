
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package types is

    type matrix16  is array (natural range <>, natural range <>)
                       of std_logic_vector(15 downto 0);
     type matrix32 is array (natural range <>, natural range <>)
                       of std_logic_vector(31 downto 0);
    type myArray32 is array (natural range <>) of std_logic_vector(31 downto 0);
end package;

---------------------------simple description : how to use :)
--subtype t_dim1 is std_logic_vector(31 downto 0);
--type t_dim1_vector is array(natural range <>) of t_dim1;
--subtype t_dim2 is t_dim1_vector(0 to c1_r2);
--type t_dim3_vector is array(natural range <>) of t_dim2;
--subtype t_dim3 is t_dim3_vector(0 to r1);


--use work.types.all;  ------------remember put tis in first of your code 

--signal matrix3 : t_dim3;
--signal matrix2 : t_dim2;
--signal matrix1 : t_dim1;
--signal slv : std_logic_vector(31 downto 0);
--signal sl : std_logic;

--matrix2 <= matrix3(i);
--matrix1 <= matrix2(j);
--matrix1 <= matrix3(i)(j);
--slv <= matrix3(i)(j);
--sl <= matrix3(i)(j)(k);
