
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PP3 is
  Port (inP : in std_logic_vector(7 downto 0); -- Takes in a 8 bit array
        encoder_value : in std_logic_vector(2 downto 0); -- takes in a 3 bit encode value
        outP : out std_logic_vector(15 downto 0)); -- 16 bit out
end PP3;

architecture Behavioral of PP3 is -- Calls left shift
component left_shift
Port (x : in std_logic_vector(7 downto 0);
        left_shift_flag : in std_logic_vector(2 downto 0);
        y : out std_logic_vector(7 downto 0));
end component;


component twos_complement -- Calls 2 comp
port (
    a        : in  std_logic_vector(7 downto 0);
    twoscomp : out std_logic_vector(7 downto 0)
  );
end component;

  
signal shiftoutput : std_logic_vector(7 downto 0); -- shift output temp
signal twosoutput : std_logic_vector(7 downto 0); -- 2s comp output temp
signal sign : std_logic; -- sign

begin
  -- Port mapping with 2 comp and left shift
U1: twos_complement port map(inP, twosoutput);
sign <= encoder_value(0);
U2: left_shift port map(twosoutput, encoder_value, shiftoutput);



outP(3 downto 0) <= ('0', '0','0', '0'); -- Skips the first 4 since left shift 2 twice because of booth algo
outP(11 downto 4) <= shiftoutput;
outp(15 downto 12) <= (sign, sign, sign, sign);

end Behavioral;
