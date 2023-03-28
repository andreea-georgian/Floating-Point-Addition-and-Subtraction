----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.11.2022 19:02:15
-- Design Name: 
-- Module Name: Carry_Lookahead_Adder - Behavioral
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

entity Carry_Lookahead_Adder is
port (x, y : in std_logic_vector (3 downto 0);
      cin : in std_logic;
      s : out std_logic_vector (3 downto 0);
      cout : out std_logic);
end Carry_Lookahead_Adder;

architecture Behavioral of Carry_Lookahead_Adder is
signal p, g: std_logic_vector (3 downto 0);
signal t : std_logic_vector(3 downto 1);

component sumator_1bit is
port (a, b, cin : in std_logic;
      s, p, g : out std_logic);
end component;

component generator_anticipat is
port (p, g : in std_logic_vector (3 downto 0);
      tin : in std_logic;
      tout : out std_logic_vector (4 downto 1));
end component;
begin
    sumator0 : sumator_1bit port map (a => x(0), b => y(0), cin => cin, s => s(0), p => p(0), g => g(0));
    sumator1 : sumator_1bit port map (a => x(1), b => y(1), cin => t(1), s => s(1), p => p(1), g => g(1));
    sumator2 : sumator_1bit port map (a => x(2), b => y(2), cin => t(2), s => s(2), p => p(2), g => g(2));
    sumator3 : sumator_1bit port map (a => x(3), b => y(3), cin => t(3), s => s(3), p => p(3), g => g(3));
    generator : generator_anticipat port map (p => p, g => g, tin => cin, tout(3 downto 1) => t, tout(4) => cout); 
end Behavioral;
