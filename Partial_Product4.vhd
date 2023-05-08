----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2023 07:58:04 PM
-- Design Name: 
-- Module Name: Partial_Product4 - Behavioral
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


entity PP4 is
  Port (inP : in std_logic_vector(7 downto 0);
        encoder_value : in std_logic_vector(2 downto 0);
        outp : out std_logic_vector(15 downto 0));
end PP4;

architecture Behavioral of PP4 is
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

signal twosoutput : std_logic_vector(7 downto 0);
signal shiftoutput : std_logic_vector(7 downto 0);
signal sign : std_logic;

begin
U1: twos_complement port map(inP, encoder_value(0), twosoutput);
sign <= '0' when encoder_value = "000" else '0' when encoder_value = "001" else twosoutput(7);
U2: left_shift port map(twosoutput, encoder_value, shiftoutput);



outP(5 downto 0) <= ('0', '0','0', '0','0', '0');

outP(13 downto 6) <= shiftoutput;
outP(15 downto 14) <= (sign, sign);

end Behavioral;