
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity add_module_8 is
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
end add_module_8;

architecture Behavioral of add_module_8 is
signal temp1 , temp2,temp3,temp4,temp5,temp6,temp7 : std_logic_vector(31 downto 0);
component add_module is
    Port (
       inputx : in std_logic_vector(31 downto 0);
       inputy : in std_logic_vector(31 downto 0);
       output : out std_logic_vector(31 downto 0));
end component ;
begin
    s1 : add_module port map(inputx=>input1, inputy=>input2,output=>temp1);
    s2 : add_module port map(inputx=>input3, inputy=>input4,output=>temp2);
    s3 : add_module port map(inputx=>input5, inputy=>input6,output=>temp3);
    s4 : add_module port map(inputx=>input7, inputy=>input8,output=>temp4);
    s5 : add_module port map(inputx=>temp1, inputy=>temp2,output=>temp5);
    s6 : add_module port map(inputx=>temp3, inputy=>temp4,output=>temp6);
    s7 : add_module port map(inputx=>temp5, inputy=>temp6,output=>out_add );

end Behavioral;
