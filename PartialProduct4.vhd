
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PP4 is -- Takes in a 8 bit array and a 3 bit array of encoder
  Port (inP : in std_logic_vector(7 downto 0);
        encoder_value : in std_logic_vector(2 downto 0);
        outp : out std_logic_vector(15 downto 0));
end PP4;

architecture Behavioral of PP4 is -- calls left shift and 2 comp
component left_shift
Port (x : in std_logic_vector(7 downto 0);
        left_shift_flag : in std_logic_vector(2 downto 0);
        y : out std_logic_vector(7 downto 0));
end component;

component twos_complement
port (
    a        : in  std_logic_vector(7 downto 0);
    twos_comp_flag : in std_logic;
    twoscomp : out std_logic_vector(7 downto 0)
  );
end component;

  
signal shiftoutput : std_logic_vector(7 downto 0); -- temp for shift out
signal sign : std_logic; -- sign
signal twosoutput : std_logic_vector(7 downto 0); -- twos out put temp

begin -- port mapping
U1: twos_complement port map(inP, encoder_value(0), twosoutput);
sign <= '0' when encoder_value = "000" else '0' when encoder_value = "001" else twosoutput(7);
  -- This logic line tells if sign is postive or nefative
U2: left_shift port map(twosoutput, encoder_value, shiftoutput);



outP(5 downto 0) <= ('0', '0','0', '0','0', '0');
-- The first 6 are always 0 because left shift 2 digits 3 times
outP(13 downto 6) <= shiftoutput;
outP(15 downto 14) <= (sign, sign); -- top 2 bits are sign

end Behavioral;
