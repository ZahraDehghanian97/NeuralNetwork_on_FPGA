
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add_module_4 is
    Port ( 
    input1 : in std_logic_vector(31 downto 0);
    input2 : in std_logic_vector(31 downto 0);
    input3 : in std_logic_vector(31 downto 0);
    input4 : in std_logic_vector(31 downto 0);
    out_add : out std_logic_vector(31 downto 0)
    );
end add_module_4;

architecture Behavioral of add_module_4 is
signal temp1 , temp2 : std_logic_vector(31 downto 0);
component add_module is
    Port (
       inputx : in std_logic_vector(31 downto 0);
       inputy : in std_logic_vector(31 downto 0);
       output : out std_logic_vector(31 downto 0));
end component ;
begin
    s1 : add_module port map(inputx=>input1, inputy=>input2,output=>temp1);
    s2 : add_module port map(inputx=>input3, inputy=>input4,output=>temp2);
    s3 : add_module port map(inputx=>temp1, inputy=>temp2,output=>out_add );
end Behavioral;
