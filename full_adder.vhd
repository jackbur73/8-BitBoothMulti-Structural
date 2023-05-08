----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2023 05:23:58 PM
-- Design Name: 
-- Module Name: full_adder - Behavioral
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

entity FullAdder is
  Port (A, B, Cin : in std_logic;
        sum, Cout : out std_logic);
end FullAdder;

architecture Behavioral of FullAdder is
signal stemp1, ctemp1, ctemp2, ctmep3 : std_logic;

component XOR2
  Port (A, B : in std_logic; 
  C : out std_logic);
end component;

component OR2
  Port (A , B : in std_logic; 
  C : out std_logic);
end component;

component AND2
    Port(A , B : in std_logic;
         C : out std_logic);
end component;

begin
U1 : XOR2 port map(a, b, stemp1);
U2 : XOR2 port map(stemp1, cin, sum);
U3 : AND2 port map(a, b, ctemp1);
U4 : AND2 port map(stemp1, cin, ctemp2);
U5 : XOR2 port map(ctemp1, ctemp2, cout);

end Behavioral;
