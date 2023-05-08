
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Encoder is
Port ( y : in STD_LOGIC_VECTOR (2 downto 0); -- Takes in a 3 bit in
           x : out STD_LOGIC_VECTOR (2 downto 0));  -- out is a 3 bit out
end Encoder;

architecture Behavioral of Encoder is
component NOT2 -- calls the not gate 
    Port (A : in std_logic; 
    outP : out std_logic);
end component;

component AND3ins -- Calls 3 ins And
    Port(A, B, C : in std_logic;
     outP : out std_logic);
end component;

component OR2 -- Calls Or
  Port (A, B : in std_logic; 
  C : out std_logic);
end component;  

component XOR2 -- Calls Xor
  Port (A, B : in std_logic; 
  C : out std_logic);
end component;

signal y0Not, y1Not, y2Not : std_logic; -- Temp signals for port mapping
signal temp1, temp2 : std_logic;
begin
x(0) <= y(2);  -- This is the negative Flag 
U1 : NOT2 port map(y(0), y0Not); 
U2 : NOT2 port map(y(1), y1Not);
U3 : NOT2 port map(y(2), y2Not);
U4 : AND3ins port map(y2Not, y(1), y(0), temp1);
U5 : AND3ins port map(y(2), y1Not, y0Not, temp2);
U6 : OR2 port map(temp1, temp2, x(1));
U7 : XOR2 port map(y(1), y(0), x(2));

-- This truth Table was found in the Slides and online
-- The truth table was found in my research and is shown above
end Behavioral;
