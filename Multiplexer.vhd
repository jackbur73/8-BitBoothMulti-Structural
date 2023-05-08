
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexer is -- Multiplexer takes in 3 inputs
  Port (x, y, sel : in std_logic;
        output : out std_logic); -- Has one output
end multiplexer;

architecture Behavioral of multiplexer is

component AND2 -- Calls an and Gate
    Port(A, B : in std_logic;
         C : out std_logic);
end component;

component OR2 -- Calls the Or gate
  Port (A, B: in std_logic; 
  C : out std_logic);
end component;

component NOT2 -- Calls the Not Gate
    Port (A : in std_logic; 
    outP : out std_logic);
end component;

signal temp1, temp2, temp3 : std_logic; -- 3 temp variables
begin

U1: AND2 port map(sel, y, temp1); -- truth table for the multiplexer
U2: NOT2 port map(sel, temp2);
U3: AND2 port map(temp2, x, temp3);
U4: OR2 port map(temp1, temp3, output);

end Behavioral;
