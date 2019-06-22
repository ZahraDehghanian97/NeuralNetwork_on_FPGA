
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity add_module_8 is
 Port ( 
 input1 : in real;
 input2 : in real;
 input3 : in real;
 input4 : in real;
 input5 : in real;
 input6 : in real;
 input7 : in real;
 input8 : in real;
 out_add : out real
 );
end add_module_8;

architecture Behavioral of add_module_8 is
signal temp1 , temp2,temp3,temp4,temp5,temp6,temp7 : real;
component add_module is
    Port (
       inputx : in real;
       inputy : in real;
       output : out real);
end component;

begin
    s1 : add_module port map(inputx=>input1, inputy=>input2,output=>temp1);
    s2 : add_module port map(inputx=>input3, inputy=>input4,output=>temp2);
    s3 : add_module port map(inputx=>input5, inputy=>input6,output=>temp3);
    s4 : add_module port map(inputx=>input7, inputy=>input8,output=>temp4);
    s5 : add_module port map(inputx=>temp1, inputy=>temp2,output=>temp5);
    s6 : add_module port map(inputx=>temp3, inputy=>temp4,output=>temp6);
    s7 : add_module port map(inputx=>temp5, inputy=>temp6,output=>out_add );

end Behavioral;
