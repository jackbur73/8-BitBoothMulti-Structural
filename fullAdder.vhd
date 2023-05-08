
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
  Port (A, B, Cin : in std_logic; -- has 3 inputs
        sum, Cout : out std_logic); -- has 2 outputs 
end FullAdder;

architecture Behavioral of FullAdder is
signal stemp1 : std_logic;
signal ctemp1, ctemp2, ctmep3 : std_logic; -- has 3 temp carries
-- has 1 sum temp

component XOR2 -- Calls Xor gate
  Port (A, B : in std_logic; 
  C : out std_logic);
end component;

component OR2 -- calls or gate
  Port (A , B : in std_logic; 
  C : out std_logic);
end component;

component AND2 -- calls and gate with 2 ins
    Port(A , B : in std_logic;
         C : out std_logic);
end component;

begin -- Truth table for the full adder which was found in lab 1
U1 : XOR2 port map(a, b, stemp1);
U2 : XOR2 port map(stemp1, cin, sum);
U3 : AND2 port map(a, b, ctemp1);
U4 : AND2 port map(stemp1, cin, ctemp2);
U5 : XOR2 port map(ctemp1, ctemp2, cout);

end Behavioral;
