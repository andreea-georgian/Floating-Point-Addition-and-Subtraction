----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2022 18:13:59
-- Design Name: 
-- Module Name: aliniere_mantise_sim - Behavioral
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

entity aliniere_mantise_sim is
end aliniere_mantise_sim;

architecture Behavioral of aliniere_mantise_sim is

component aliniere_mantise is
port(clk : in std_logic;
     exp1In, exp2In : in std_logic_vector(7 downto 0);
     mantissa1In, mantissa2In : std_logic_vector(23 downto 0);
     exp1Out, exp2Out : out std_logic_vector(7 downto 0);
     mantissa1Out, mantissa2Out : out std_logic_vector(23 downto 0));
end component;

signal clk : std_logic;
signal exp1In, exp2In, exp1Out, exp2Out : std_logic_vector(7 downto 0);
signal mantissa1In, mantissa2In, mantissa1Out, mantissa2Out : std_logic_vector(23 downto 0);

begin

    comp : aliniere_mantise port map (clk, exp1In, exp2In, mantissa1In, mantissa2In, exp1Out, exp2Out, mantissa1Out, mantissa2Out);

    process
    begin
        clk <= '0';
        exp1In <= "10000001";
        exp2In <= "10000100";
        mantissa1In <= "101010000000000000000000";
        mantissa2In <= "100011000000000000000000";
        wait for 20 ns;
        clk <= '1';
        wait for 20 ns;
        
    end process;

end Behavioral;
