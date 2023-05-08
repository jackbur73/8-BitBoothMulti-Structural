
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND2 is
  Port (A, B : in std_logic; -- This has a input of A and B 
        C : out std_logic); -- Output C
end AND2;

architecture Behavioral of AND2 is -- Used in FullAdder and other Future modules

begin

C <= A and B; -- All the logic needed
end Behavioral;
