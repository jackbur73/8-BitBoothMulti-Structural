
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PP1 is
  Port (inP : in std_logic_vector(7 downto 0); -- takes in a 8 bit binary array
        encoder_value : in std_logic_vector(2 downto 0); -- decoder value
        outP : out std_logic_vector(15 downto 0)); -- spits out a shifter 
end PP1;

architecture Behavioral of PP1 is
component left_shift
Port (x : in std_logic_vector(7 downto 0);-- takes in a 8 bit binary array
        left_shift_flag : in std_logic_vector(2 downto 0); -- Shifter value
        y : out std_logic_vector(7 downto 0));-- Spits out a 8 bit binary array
end component;

component twos_complement
port (
    a : in  std_logic_vector(7 downto 0);
    twos_comp_flag : in std_logic; -- This is an element either 1 or 0
    twoscomp : out std_logic_vector(7 downto 0)
  );
end component;

signal twosoutput : std_logic_vector(7 downto 0);
signal shiftoutput : std_logic_vector(7 downto 0);
signal sign : std_logic;

begin

U1: twos_complement port map(inP, encoder_value(0), twosoutput);
sign <= '0' when encoder_value = "000" else '0' when encoder_value = "001" else twosoutput(7);
U2: left_shift port map(twosoutput, encoder_value, shiftoutput);


outP(7 downto 0) <= shiftoutput;
outP(15 downto 8) <= (sign, sign, sign, sign, sign, sign, sign, sign);

end Behavioral;
