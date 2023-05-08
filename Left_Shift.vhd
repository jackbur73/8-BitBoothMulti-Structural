----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2023 03:42:42 PM
-- Design Name: 
-- Module Name: Left_Shift - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Left_Shift is
  Port (x : in std_logic_vector(7 downto 0);
        left_shift_flag : in std_logic_vector(2 downto 0);
        y : out std_logic_vector(7 downto 0));
end Left_Shift;

architecture Behavioral of Left_Shift is
component multiplexer
Port (x, y, sel : in std_logic;
        output : out std_logic);
end component;

signal temp : std_logic_vector(7 downto 0);
signal left_shift_flagt : std_logic_vector(2 downto 0);

begin

-- if the left shift flag = 000 or 111 --> do nothing
-- if the left shift flag = 100 --> do not preform shift
U1: multiplexer port map('0', x(0), left_shift_flag(2), temp(0));
U2: multiplexer port map('0', x(1), left_shift_flag(2), temp(1));
U3: multiplexer port map('0', x(2), left_shift_flag(2), temp(2));
U4: multiplexer port map('0', x(3), left_shift_flag(2), temp(3));
U5: multiplexer port map('0', x(4), left_shift_flag(2), temp(4));
U6: multiplexer port map('0', x(5), left_shift_flag(2), temp(5));
U7: multiplexer port map('0', x(6), left_shift_flag(2), temp(6));
U8: multiplexer port map('0', x(7), left_shift_flag(2), temp(7));

-- if the left shift flag = 010 --> preform left shift
U9: multiplexer port map( temp(0), '0', left_shift_flag(1), y(0));
U10: multiplexer port map(temp(1), x(0), left_shift_flag(1), y(1));
U11: multiplexer port map(temp(2), x(1), left_shift_flag(1), y(2));
U12: multiplexer port map(temp(3), x(2), left_shift_flag(1), y(3));
U13: multiplexer port map(temp(4), x(3), left_shift_flag(1), y(4));
U14: multiplexer port map(temp(5), x(4), left_shift_flag(1), y(5));
U15: multiplexer port map(temp(6), x(5), left_shift_flag(1), y(6));
U16: multiplexer port map(temp(7), x(6), left_shift_flag(1), y(7));


end Behavioral;
