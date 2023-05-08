----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2023 05:09:48 PM
-- Design Name: 
-- Module Name: Incrementor - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Incrementor is
  Port( x : in std_logic_vector(7 downto 0);
        Cin : in std_logic;
        y : out std_logic_vector(7 downto 0);
        Cout : out std_logic);
end Incrementor;

architecture Behavioral of Incrementor is

component half_adder
      Port (a : in std_logic; b : in std_logic; cout : out std_logic; sum : out std_logic);
end component;

signal c1, c2, c3, c4, c5, c6, c7, c8 : std_logic;
begin

FA1 : half_adder port map(x(0), Cin, c1, y(0));
FA2 : half_adder port map(x(1), c1, c2, y(1));
FA3 : half_adder port map(x(2), c2, c3, y(2));
FA4 : half_adder port map(x(3), c3, c4, y(3));
FA5 : half_adder port map(x(4), c4, c5, y(4)); 
FA6 : half_adder port map(x(5), c5, c6, y(5));
FA7 : half_adder port map(x(6), c6, c7, y(6)); 
FA8 : half_adder port map(x(7), c7, Cout, y(7)); 
--FA9 : half_adder port map(x(8), c8, Cout, y(8)); 
 
 



end Behavioral;
