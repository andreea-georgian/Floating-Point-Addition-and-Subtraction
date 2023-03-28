----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.01.2023 05:28:18
-- Design Name: 
-- Module Name: normalizare_sim - Behavioral
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

entity normalizare_sim is
end normalizare_sim;

architecture Behavioral of normalizare_sim is

component normalizare is
port ( mantIn : in std_logic_vector(23 downto 0);
       mantOut : out std_logic_vector(23 downto 0));
end component;

signal mantIn, mantOut : std_logic_vector(23 downto 0);

begin
    
    comp : normalizare port map (mantIn, mantOut);
    
    process
    begin
        mantIn <= "000001101100010011110011";
        wait for 20 ns;
        mantIn <= "001111001101111111111111";
        wait for 20 ns;
        mantIn <= "100000111111110000000000";
        wait for 20 ns;
    end process;

end Behavioral;
