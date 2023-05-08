
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR2 is
  Port (A, B : in std_logic;  -- has 2 inputs
  C : out std_logic); -- Basic Xor Gate
end XOR2; -- 1 output

architecture structural of XOR2 is
begin
  C <= a xor b; -- output is a xor b
end structural;
