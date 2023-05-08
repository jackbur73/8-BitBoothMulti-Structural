library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Left_Shift is
  Port (x : in std_logic_vector(7 downto 0); -- Takes in a 8 bit x and a 3 bit y for the # of shifts
        left_shift_flag : in std_logic_vector(2 downto 0); 
        y : out std_logic_vector(7 downto 0)); -- Outputs a 8 bit
end Left_Shift;

architecture Behavioral of Left_Shift is
component multiplexer -- Calls a multiplxer for high and low
Port (x, y, sel : in std_logic;
        output : out std_logic);
end component;

signal temp : std_logic_vector(7 downto 0); -- Temp signals
signal flagTemp : std_logic_vector(2 downto 0); -- Temp Flag

begin

-- Calls the Multi based on the FlagTemp
-- the MultiPlexer truth table is 
  -- (0,0,0) And (0,0,1) and (0,1,1) and (1,0,0) -> 0
  -- ( 0,1,0 ) and (1,0,1 ) and ( 1,1,0) and (1,1,1) ->1
U1: multiplexer port map('0', x(0), flagTemp(2), temp(0));
U2: multiplexer port map('0', x(1), flagTemp(2), temp(1));
U3: multiplexer port map('0', x(2), flagTemp(2), temp(2));
U4: multiplexer port map('0', x(3), flagTemp(2), temp(3));
U5: multiplexer port map('0', x(4), flagTemp(2), temp(4));
U6: multiplexer port map('0', x(5), flagTemp(2), temp(5));
U7: multiplexer port map('0', x(6), flagTemp(2), temp(6));
U8: multiplexer port map('0', x(7), flagTemp(2), temp(7));

--Calls the Multi based on the FlagTemp
  -- Follows the truth table from above
U9: multiplexer port map( temp(0), '0', flagTemp(1), y(0));
U10: multiplexer port map(temp(1), x(0), flagTemp(1), y(1));
U11: multiplexer port map(temp(2), x(1), flagTemp(1), y(2));
U12: multiplexer port map(temp(3), x(2), flagTemp(1), y(3));
U13: multiplexer port map(temp(4), x(3), flagTemp(1), y(4));
U14: multiplexer port map(temp(5), x(4), flagTemp(1), y(5));
U15: multiplexer port map(temp(6), x(5), flagTemp(1), y(6));
U16: multiplexer port map(temp(7), x(6), flagTemp(1), y(7));

end Behavioral;
