library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.neurals_utils.all;
library std;
use std.textio.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity classify is
    Port ( 
    clk : in std_logic;
    enable : in std_logic;
    ready : out std_logic;
    ht : in matrix_1_8;
    c_output : out matrix_1_2 );
end classify;

architecture Behavioral of classify is
signal w : matrix_8_2 ;
constant b1 : real := -0.3260368;
constant b2 : real := -0.0219169;
signal m_output : matrix_1_2;
signal tmp_c_output : matrix_1_2;
component sigmoid_module is
    Port (
           clk : in std_logic;
           enable : in std_logic;
           input : in real;
           output : out real);
end component ;
component multiply_matrix_1_8_2 is
    Port ( 
        in1 : in matrix_1_8;
        in2 : in matrix_8_2;
        out_multiply : out matrix_1_2 );
end component ;
function init_w return matrix_8_2 is
        file vec_file: text open read_mode is "C:\Users\sepidmnoroozi\Documents\8\fpga\project_2\NeuralNetwork_on_FPGA\final2.srcs\sources_1\new\weo_file.txt";
        variable iline: line;
        variable data_read: real;
        variable y: integer := 0;
        variable x: integer := 0;
        variable res_t : matrix_8_2 ;
      begin
        while not endfile (vec_file) loop
          readline (vec_file, iline);
          read(iline,data_read);
          res_t(x,y) := data_read;
          if ( y = 2 ) then
            y := 0;
            x := x + 1;
          else 
            y := y + 1;
          end if;
        end loop;
        return res_t;
      end function;
signal counter : integer := 0 ;

begin
w<=init_w;
m : multiply_matrix_1_8_2 port map (in1=>ht ,in2=>w , out_multiply=>m_output);
m_output(0)<= m_output(0)+ b1;
m_output(1)<= m_output(1)+ b2;
s1 : sigmoid_module port map (clk,enable , m_output(0),tmp_c_output(0));
s2 : sigmoid_module port map (clk,enable , m_output(1),tmp_c_output(1));
process (clk)
begin 
 if rising_edge(clk) and enable ='1' then
    if counter =7 then 
        ready<= '1';
        c_output <= tmp_c_output;
    else 
        counter<= counter+1 ;
    end if ;
    end if ;
end process;
end Behavioral;
