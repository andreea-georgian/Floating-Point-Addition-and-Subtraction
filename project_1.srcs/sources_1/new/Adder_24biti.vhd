----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2022 02:23:27
-- Design Name: 
-- Module Name: Adder_24biti - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder_24biti is
port (x, y : in std_logic_vector (23 downto 0);
      s : out std_logic_vector (23 downto 0);
      cout : out std_logic);
end Adder_24biti;

architecture Behavioral of Adder_24biti is

component Carry_Lookahead_Adder is
port (x, y : in std_logic_vector (3 downto 0);
      cin : in std_logic;
      s : out std_logic_vector (3 downto 0);
      cout : out std_logic);
end component;

signal carry : std_logic_vector(4 downto 0);

begin

    adder0 : Carry_lookahead_Adder port map (x => x(3 downto 0), y => y(3 downto 0), cin => '0', s => s(3 downto 0), cout => carry(0));
    adder1 : Carry_Lookahead_Adder port map (x => x(7 downto 4), y => y(7 downto 4), cin => carry(0), s => s(7 downto 4), cout => carry(1));
    adder2 : Carry_Lookahead_Adder port map (x => x(11 downto 8), y => y(11 downto 8), cin => carry(1), s => s(11 downto 8), cout => carry(2));
    adder3 : Carry_Lookahead_Adder port map (x => x(15 downto 12), y => y(15 downto 12), cin => carry(2), s => s(15 downto 12), cout => carry(3));
    adder4 : Carry_Lookahead_Adder port map (x => x(19 downto 16), y => y(19 downto 16), cin => carry(3), s => s(19 downto 16), cout => carry(4));
    adder5 : Carry_Lookahead_Adder port map (x => x(23 downto 20), y => y(23 downto 20), cin => carry(4), s => s(23 downto 20), cout => cout);

end Behavioral;
