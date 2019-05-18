library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.types.all;

entity MNSigmoid is
 generic ( n : integer := 2;
           m : integer := 2
 );
Port (
  X : in matrix16(m-1 downto 0 ,n-1 downto 0);
  clk : in std_logic;
  Y : out matrix16(m-1 downto 0 ,n-1 downto 0)
  );
end MNSigmoid;

architecture Behavioral of MNSigmoid is
component sigmoid is
    Port ( 
        X_sigmoid : in std_logic_vector(15 downto 0);
        clk_sigmoid : in std_logic;
        Y_sigmoid : out std_logic_vector(15 downto 0)
           );
end component;
--signal w1,w2 : std_logic_vector(15 downto 0):= (Others => '0');
begin
--    test : for d in 0 to 1 generate
--        begin
--        s : sigmoid2 port map (X_sigmoid=>w1,clk_sigmoid=>clk , Y_sigmoid =>w2);
--        end generate ;
        
    row: for I in 0 to m-1 generate
        begin
        col :
         for J in 0 to n-1 generate
         begin
            S : 
            sigmoid port map (X_sigmoid=> X(I,J), clk_sigmoid=>clk , Y_sigmoid => Y(I,J));
         end  generate;
    end  generate  ;
end Behavioral;