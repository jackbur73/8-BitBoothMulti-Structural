
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOT2 is -- Basic not Gate
  Port (A : in std_logic; -- Takes in 1 in and has 1 out
  outP  : out std_logic);
end NOT2;

architecture Behavioral of NOT2 is
begin
    outP <= not(a); -- Out is Not input
end Behavioral;
