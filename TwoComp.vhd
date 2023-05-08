
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity twos_complement is
  port (
    a        : in  std_logic_vector(7 downto 0); -- Has an input of a 8 bit array and a flag
    twos_comp_flag : in std_logic;
    twoscomp : out std_logic_vector(7 downto 0)
  );
end entity twos_complement;

architecture structural of twos_complement is

component XOR2 -- Calls the Xor Gate
  Port (A, B : in std_logic;
  C : out std_logic);
end component;

component FullAdder is -- Calls the Full Adder
  Port (A, B, Cin : in std_logic;
        sum, Cout : out std_logic);
end component;

 
  signal out_temp      : std_logic_vector(7 downto 0);
  signal temp_sum   : std_logic_vector(7 downto 0); -- Temp vars
  signal carry_out : std_logic;
  signal Cout : std_logic_vector ( 7 downto 0);
  

begin
    --add sign to binary number
  temp_sum(7 downto 0) <= a(7 downto 0);
  -- Calls the Xor 8 times

  U1: XOR2 port map(temp_sum(0), twos_comp_flag, out_temp(0)); 
  U2: XOR2 port map(temp_sum(1), twos_comp_flag, out_temp(1));
  U3: XOR2 port map(temp_sum(2), twos_comp_flag, out_temp(2));
  U4: XOR2 port map(temp_sum(3), twos_comp_flag, out_temp(3));
  U5: XOR2 port map(temp_sum(4), twos_comp_flag, out_temp(4));
  U6: XOR2 port map(temp_sum(5), twos_comp_flag, out_temp(5));
  U7: XOR2 port map(temp_sum(6), twos_comp_flag, out_temp(6));
  U8: XOR2 port map(temp_sum(7), twos_comp_flag, out_temp(7));
-- Calls the Full Adder to add 1
    -- This is because Xor 8 times and then add 1 is 2 comp truth table
U9 : FullAdder port map ( out_temp(0) , twos_comp_flag , '0' , twoscomp(0) , Cout(0));
U10 : FullAdder port map ( out_temp(1) , twos_comp_flag , Cout(0) , twoscomp(1) , Cout(1));
U11 : FullAdder port map ( out_temp(2) , twos_comp_flag , Cout(1) , twoscomp(2) , Cout(2));
U12 : FullAdder port map ( out_temp(3) , twos_comp_flag , Cout(2) , twoscomp(3) , Cout(3));
U13 : FullAdder port map ( out_temp(4) , twos_comp_flag , Cout(3) , twoscomp(4) , Cout(4));
U14 : FullAdder port map ( out_temp(5) , twos_comp_flag , Cout(4) , twoscomp(5) , Cout(5));
U15 : FullAdder port map ( out_temp(6) , twos_comp_flag , Cout(5) , twoscomp(6) , Cout(6));
U16 : FullAdder port map ( out_temp(7) , twos_comp_flag , Cout(6) , twoscomp(7) , Cout(7));

end architecture structural;
