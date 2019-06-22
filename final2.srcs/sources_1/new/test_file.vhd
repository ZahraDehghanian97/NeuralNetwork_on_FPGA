----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/30/2019 08:02:52 PM
-- Design Name: 
-- Module Name: test_file - Behavioral
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
library std;
use std.textio.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_file is
  Port (
  output : out matrix_4_8
   );
end test_file;

architecture Behavioral of test_file is
--signal ui : matrix_8_8 := (others => ( others => single_float_to_slv(0.0) ));  
function output_init return matrix_4_8 is
    file vec_file: text open read_mode is "C:\Users\sepidmnoroozi\Documents\8\fpga\project_2\NeuralNetwork_on_FPGA\final2.srcs\sources_1\new\wf_file.txt";
    variable iline: line;
    variable data_read: real;
    variable y: integer := 0;
    variable x: integer := 0;
    variable res_t : matrix_4_8 ;
  begin
    while not endfile (vec_file) loop
      readline (vec_file, iline);
      read(iline,data_read);
      res_t(x,y) := data_read;
      if ( y = 7 ) then
        y := 0;
        x := x + 1;
      else 
        y := y + 1;
      end if;
    end loop;
    return res_t;
  end function;
begin

output <= output_init;
----output <= ( ( single_float_to_slv(-0.02987039), single_float_to_slv(0.04314025), single_float_to_slv(0.53898245), single_float_to_slv(0.41512847), single_float_to_slv(-0.80487585), single_float_to_slv(-0.09355235), single_float_to_slv(-0.41942886), single_float_to_slv(-0.357487) ),
--                              ( single_float_to_slv(0.73685104), single_float_to_slv(0.3203586), single_float_to_slv(-0.49644002), single_float_to_slv(-0.05589191), single_float_to_slv(0.5361538), single_float_to_slv(0.4786008), single_float_to_slv(0.18015783), single_float_to_slv(0.536344) ),
--                              ( single_float_to_slv(-0.27975634), single_float_to_slv(-0.32213825), single_float_to_slv(0.44963884), single_float_to_slv(-0.1668127), single_float_to_slv(-0.72459227), single_float_to_slv(-0.5951743), single_float_to_slv(-0.12105721), single_float_to_slv(-0.8235756) ),
--                              ( single_float_to_slv(-0.1605476), single_float_to_slv(0.14743894), single_float_to_slv(0.2773945), single_float_to_slv(0.29888842), single_float_to_slv(0.533289), single_float_to_slv(0.8247989), single_float_to_slv(0.08690736), single_float_to_slv(0.56370485) )
--                            );
end Behavioral;
