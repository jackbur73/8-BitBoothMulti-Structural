----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2023 07:58:04 PM
-- Design Name: 
-- Module Name: Partial_Product2 - Behavioral
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

entity PP2 is
  Port (inP : in std_logic_vector(7 downto 0);
        encoder_value : in std_logic_vector(2 downto 0);
        outP : out std_logic_vector(15 downto 0));
end PP2;

architecture Behavioral of PP2 is
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


outP(1 downto 0) <= ('0', '0');
outP(9 downto 2) <= shiftoutput;
outP(15 downto 10) <= (sign, sign, sign, sign, sign, sign);
end Behavioral;