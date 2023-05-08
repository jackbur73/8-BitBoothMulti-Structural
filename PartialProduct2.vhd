
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PP2 is
  Port (inP : in std_logic_vector(7 downto 0); -- Takes in a 8 bit array
        encoder_value : in std_logic_vector(2 downto 0); -- 3 bit input for decoder
        outP : out std_logic_vector(15 downto 0)); -- spits out a 16 bit out
end PP2;

architecture Behavioral of PP2 is -- Calls left shift and 2s comp
component left_shift
Port (x : in std_logic_vector(7 downto 0); -- 8 bit array and 3 bit array input
        left_shift_flag : in std_logic_vector(2 downto 0);
        y : out std_logic_vector(7 downto 0)); -- 8 bit out
end component;

component twos_complement
port (
    a : in  std_logic_vector(7 downto 0);
    twoscomp : out std_logic_vector(7 downto 0)
  );
end component;

  signal shiftoutput : std_logic_vector(7 downto 0); -- Shift out temp
signal twosoutput : std_logic_vector(7 downto 0); -- Temp for 2s out Final
signal sign : std_logic; -- sign

begin

U1: twos_complement port map(inP, twosoutput); -- calls 2 comp
sign <= encoder_value(0);
U2: left_shift port map(twosoutput, encoder_value, shiftoutput);


outP(1 downto 0) <= ('0', '0'); -- First 2 bits are always zero because shift 2
outP(9 downto 2) <= shiftoutput; -- out is bit 3 - 10
outP(15 downto 10) <= (sign, sign, sign, sign, sign, sign);
end Behavioral;
