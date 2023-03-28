----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.11.2022 18:52:30
-- Design Name: 
-- Module Name: generator_transport - Behavioral
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

entity generator_anticipat is
port (p, g : in std_logic_vector (3 downto 0);
      tin : in std_logic;
      tout : out std_logic_vector (4 downto 1));
end generator_anticipat;

architecture Behavioral of generator_anticipat is

begin
    tout(1) <= g(0) or (p(0) and tin);
    tout(2) <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and tin);
    tout(3) <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and tin);
    tout(4) <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0)) or (p(3) and p(2) and p(1) and p(0) and tin);
end Behavioral;
