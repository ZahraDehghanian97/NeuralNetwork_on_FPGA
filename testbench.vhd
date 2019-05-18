-------------------------------------------------------------------------------
-- File Downloaded from http://www.nandland.com
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;
 
entity test is
end test;
 
 
architecture behave of test is
 
  -----------------------------------------------------------------------------
  -- Declare the Component Under Test
  -----------------------------------------------------------------------------
component sigmoid is
      Port (
       X_sigmoid : in STD_LOGIC_VECTOR(15 downto 0);
       clk_sigmoid : in STD_LOGIC;
       Y_sigmoid : out STD_LOGIC_VECTOR(15 downto 0)
                 
      );
  end component;
  
  -----------------------------------------------------------------------------
  -- Testbench Internal Signals
  -----------------------------------------------------------------------------
  file file_input : text;
  file file_output : text;
 signal clk : std_logic;
 signal signal_input : std_logic_vector(15 downto 0) := (others => '0');
 signal signal_output : std_logic_vector(15 downto 0);
   
begin
 
  -----------------------------------------------------------------------------
  -- Instantiate and Map UUT
  -----------------------------------------------------------------------------
  moduleSigmoid : sigmoid  port map (
      X_sigmoid => signal_input,
      Y_sigmoid => signal_output,
      clk_sigmoid    => clk
      );
 
 
  ---------------------------------------------------------------------------
  -- This procedure reads the file input_vectors.txt which is located in the
  -- simulation project area.
  -- It will read the data in and send it to the ripple-adder component
  -- to perform the operations.  The result is written to the
  -- output_results.txt file, located in the same directory.
  ---------------------------------------------------------------------------
  process
    variable v_ILINE     : line;
    variable v_OLINE     : line;
    variable v_ADD_TERM1 : std_logic_vector(15 downto 0);
    variable v_ADD_TERM2 : std_logic_vector(15 downto 0);
    variable v_SPACE     : character;
     
  begin
 
    file_open(file_input, "D:\university\FPGA\finalProject\FinalProject_phase1\FinalProject_phase1.srcs\sources_1\new\input.txt",  read_mode);
    file_open(file_output, "D:\university\FPGA\finalProject\FinalProject_phase1\FinalProject_phase1.srcs\sources_1\new\output.txt", write_mode);
 
    while not endfile(file_input) loop
      readline(file_input, v_ILINE);
      read(v_ILINE, v_ADD_TERM1);
   
 
      -- Pass the variable to a signal to allow the ripple-carry to use it
      signal_input <= v_ADD_TERM1;
      
      wait for 5 ns;
 
      write(v_OLINE, signal_output, left, 16);
      writeline(file_output, v_OLINE);
    end loop;
 
    file_close(file_input);
    file_close(file_output);
     
    wait;
  end process;
 
end behave;