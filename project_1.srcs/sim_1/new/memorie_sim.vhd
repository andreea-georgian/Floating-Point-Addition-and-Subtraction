----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.01.2023 05:16:09
-- Design Name: 
-- Module Name: memorie_sim - Behavioral
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

entity memorie_sim is
end memorie_sim;

architecture Behavioral of memorie_sim is

component memorie is
port (clk, en, rst : in std_logic;
      rd1, rd2 : out std_logic_vector (31 downto 0));
end component;

signal clk, en, rst : std_logic;
signal rd1, rd2 : std_logic_vector(31 downto 0);

begin

    comp : memorie port map (clk, en, rst, rd1, rd2);
    
    process
    begin
        clk <= '0';
        en <= '1';
        rst <= '0';
        wait for 20 ns;
        clk <= '1';
        wait for 20 ns;
    end process;

end Behavioral;
