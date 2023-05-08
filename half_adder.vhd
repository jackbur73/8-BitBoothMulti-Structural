----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2023 05:40:59 PM
-- Design Name: 
-- Module Name: half_adder - Behavioral
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

entity half_adder is
  Port (a : in std_logic; b : in std_logic; cout : out std_logic; sum : out std_logic);
end half_adder;

architecture Behavioral of half_adder is
component XOR2
  Port (A, B : in std_logic; 
  C : out std_logic);
end component;

component AND2
    Port(A, B : in std_logic;
         C : out std_logic);
end component;
begin

U1 : XOR2 port map(a, b, sum);
U2 : AND2 port map(a, b, cout);

end Behavioral;
