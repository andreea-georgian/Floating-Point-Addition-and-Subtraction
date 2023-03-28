----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.12.2022 02:31:21
-- Design Name: 
-- Module Name: semn_mantise_sim - Behavioral
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

entity semn_mantise_sim is
end semn_mantise_sim;

architecture Behavioral of semn_mantise_sim is

component semn_mantise is
port (clk : in std_logic;
      change : in std_logic_vector(1 downto 0);
      mantisa1, mantisa2 : in std_logic_vector(23 downto 0);
      mantisaRez1, mantisaRez2 : out std_logic_vector(23 downto 0));
end component;

signal change : std_logic_vector(1 downto 0);
signal clk : std_logic;
signal mantisa1, mantisa2, mantisaRez1, mantisaRez2 : std_logic_vector(23 downto 0);

begin

    comp : semn_mantise port map (clk => clk, change => change, mantisa1 => mantisa1, mantisa2 => mantisa2, mantisaRez1 => mantisaRez1, mantisaRez2 => mantisaRez2);
    
    process
    begin
        clk <= '0';
        change <= "00";
        mantisa1 <= "101010000000000000000000";
        mantisa2 <= "101010000000000000000000";
        wait for 20 ns;
        clk <= '1';
        wait for 20 ns;
        clk <= '0';
        change <= "01";
        wait for 20 ns;
        clk <= '1';
        wait for 20 ns;
        change <= "10";
        clk <= '0';
        wait for 20 ns;
        clk <= '1';
        wait for 20 ns;
        change <= "11";
        clk <= '0';
        wait for 20 ns;
        clk <= '1';
        wait for 20 ns;
    end process;

end Behavioral;
