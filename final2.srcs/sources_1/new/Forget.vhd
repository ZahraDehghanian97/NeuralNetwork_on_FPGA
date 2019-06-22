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
library std;
use std.textio.all;
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
function init_w return matrix_4_8 is
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
function init_b return matrix_1_8 is
      file vec_file: text open read_mode is "C:\Users\sepidmnoroozi\Documents\8\fpga\project_2\NeuralNetwork_on_FPGA\final2.srcs\sources_1\new\bf_file.txt";
      variable iline: line;
      variable data_read: real;
      variable x: integer := 0;
      variable res_t : matrix_1_8 ;
    begin
      while not endfile (vec_file) loop
        readline (vec_file, iline);
        read(iline,data_read);
        res_t(x) := data_read;
        x := x + 1;
      end loop;
      return res_t;
    end function;
function init_u return matrix_8_8 is
        file vec_file: text open read_mode is "C:\Users\sepidmnoroozi\Documents\8\fpga\project_2\NeuralNetwork_on_FPGA\final2.srcs\sources_1\new\uf_file.txt";
        variable iline: line;
        variable data_read: real;
        variable y: integer := 0;
        variable x: integer := 0;
        variable res_t : matrix_8_8 ;
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


signal w : matrix_4_8;     
signal u : matrix_8_8;
signal b : matrix_1_8; 

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


w <= init_w;
u <= init_u;
b <= init_b;
mul_module0 : multiply_matrix_1_4_8 port map ( in1 => xt, in2 => w, out_multiply => res1);
mul_module1 : multiply_matrix_1_8_8 port map ( in1 => ht_1, in2 => u, out_multiply => res2);
add_module : add_3_matrix_1_8 port map ( in1 => res1, in2 => res2, in3 => b, out_add => f_out);


end Behavioral;
