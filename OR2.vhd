

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR2 is
  Port (A, B : in std_logic; -- Takes in 2 in
  C : out std_logic); -- has 1 out
end OR2;

architecture structural of OR2 is
begin
    C <= a or b ; -- out is a or b
end structural;
