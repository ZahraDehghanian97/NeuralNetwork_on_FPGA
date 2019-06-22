----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2019 11:25:27 AM
-- Design Name: 
-- Module Name: matrix_multiply_1_4_8 - Behavioral
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
use work.neurals_utils.all ;
entity multiply_matrix_1_4_8 is
    Port ( 
        in1 : in matrix_1_4;
        in2 : in matrix_4_8;
        out_multiply : out matrix_1_8 );
end multiply_matrix_1_4_8;

architecture Behavioral of multiply_matrix_1_4_8 is
component multiplier_module is
    Port (
       inputx : in real;
       inputy : in real;
       output : out real);
end component;
component add_module_4 is
    Port ( 
    input1 : in real;
    input2 : in real;
    input3 : in real;
    input4 : in real;
    out_add : out real
    );
end component;
signal output : matrix_4_8;
begin
    row: for I in 0 to 7 generate
        begin
        col :
         for J in 0 to 3 generate
         begin
            S : 
            multiplier_module port map (inputx=> in1(J), inputy=>in2(J,I) , output =>output(J,I));
         end  generate;
    end  generate  ;   
    a: for I in 0 to 7 generate
            begin
            sum : add_module_4 port map (input1=> output(0,I),input2=> output(1,I),input3=> output(2,I),input4=> output(3,I),out_add=>out_multiply(I));
        end  generate  ;   
end Behavioral;
