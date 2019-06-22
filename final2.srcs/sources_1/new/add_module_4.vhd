
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add_module_4 is
    Port ( 
    input1 : in real;
    input2 : in real;
    input3 : in real;
    input4 : in real;
    out_add : out real
    );
end add_module_4;

architecture Behavioral of add_module_4 is
signal temp1 , temp2 : real;
component add_module is
    Port (
       inputx : in real;
       inputy : in real;
       output : out real);
end component ;
begin
    s1 : add_module port map(inputx=>input1, inputy=>input2,output=>temp1);
    s2 : add_module port map(inputx=>input3, inputy=>input4,output=>temp2);
    s3 : add_module port map(inputx=>temp1, inputy=>temp2,output=>out_add );
end Behavioral;
