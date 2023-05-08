----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2023 01:49:40 PM
-- Design Name: 
-- Module Name: Encoder - Behavioral
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

entity Encoder is
Port ( y : in STD_LOGIC_VECTOR (2 downto 0);
           x : out STD_LOGIC_VECTOR (2 downto 0)); 
end Encoder;

architecture Behavioral of Encoder is
component NOT2
    Port (A : in std_logic; 
    outP : out std_logic);
end component;

component AND3ins
    Port(A, B, C : in std_logic;
     outP : out std_logic);
end component;

component OR2
  Port (A, B : in std_logic; 
  C : out std_logic);
end component;  

component XOR2
  Port (A, B : in std_logic; 
  C : out std_logic);
end component;

signal y0Not, y1Not, y2Not : std_logic;
signal temp1, temp2 : std_logic;
begin
x(0) <= y(2);  -- This is the negative Flag 
U1 : NOT2 port map(y(0), y0Not); 
U2 : NOT2 port map(y(1), y1Not);
U3 : NOT2 port map(y(2), y2Not);
U4 : AND3ins port map(y2Not, y(1), y(0), temp1);
U5 : AND3ins port map(y(2), y1Not, y0Not, temp2);
U6 : OR2 port map(temp1, temp2, x(1));
U7 : XOR2 port map(y(1), y(0), x(2));


-- The truth table was found in my research and is shown above
end Behavioral;
