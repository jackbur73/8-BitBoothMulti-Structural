
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PP1 is
  Port (inP : in std_logic_vector(7 downto 0); -- takes in a 8 bit binary array
        encoder_value : in std_logic_vector(2 downto 0); -- decoder value
        outP : out std_logic_vector(15 downto 0)); -- spits out a shifter 
end PP1;

architecture Behavioral of PP1 is
component left_shift -- Calls out Left Shift for Shifting
Port (x : in std_logic_vector(7 downto 0);-- takes in a 8 bit binary array
        left_shift_flag : in std_logic_vector(2 downto 0); -- Shifter value
        y : out std_logic_vector(7 downto 0));-- Spits out a 8 bit binary array
end component;

component twos_complement -- Calls 2 comp if needed
port (
    a : in  std_logic_vector(7 downto 0);
    twoscomp : out std_logic_vector(7 downto 0)
  );
end component;
  
signal shiftoutput : std_logic_vector(7 downto 0); -- Temp for 2s comp
signal twosoutput : std_logic_vector(7 downto 0); -- Out temp for 2s comp
signal sign : std_logic; -- Has a sign based on logic line below

begin
sign <= encoder_value(0) ;

U1: twos_complement port map(inP, twosoutput);
U2: left_shift port map(twosoutput, encoder_value, shiftoutput);


outP(7 downto 0) <= shiftoutput;
outP(15 downto 8) <= (sign, sign, sign, sign, sign, sign, sign, sign); -- Saves sign

end Behavioral;
