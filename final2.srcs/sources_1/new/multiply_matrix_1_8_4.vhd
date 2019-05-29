library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.neurals_utils.all ;


entity multiply_matrix_1_8_8 is
    Port ( 
        in1 : in matrix_1_8;
        in2 : in matrix_8_8;
        out_multiply : out matrix_1_8 );
end multiply_matrix_1_8_8;

architecture Behavioral of multiply_matrix_1_8_8 is
component multiplier_module is
    Port (
       inputx : in std_logic_vector(31 downto 0);
       inputy : in std_logic_vector(31 downto 0);
       output : out std_logic_vector(31 downto 0));
end component;
component add_module_8 is
 Port ( 
 input1 : in std_logic_vector(31 downto 0);
 input2 : in std_logic_vector(31 downto 0);
 input3 : in std_logic_vector(31 downto 0);
 input4 : in std_logic_vector(31 downto 0);
 input5 : in std_logic_vector(31 downto 0);
 input6 : in std_logic_vector(31 downto 0);
 input7 : in std_logic_vector(31 downto 0);
 input8 : in std_logic_vector(31 downto 0);
 out_add : out std_logic_vector(31 downto 0)
 );
end component ;
signal output : matrix_8_8;
begin
    row: for I in 0 to 7 generate
        begin
        col :
         for J in 0 to 7 generate
         begin
            S : 
            multiplier_module port map (inputx=> in1(J), inputy=>in2(J,I) , output =>output(J,I));
         end  generate;
    end  generate  ;  
     a: for I in 0 to 7 generate
               begin
               sum : add_module_8 port map (input1=> output(0,I),input2=> output(1,I),input3=> output(2,I),input4=> output(3,I),input5=> output(4,I),input6=> output(5,I),input7=> output(6,I),input8=> output(7,I),out_add=>out_multiply(I));
           end  generate  ;    

end Behavioral ;