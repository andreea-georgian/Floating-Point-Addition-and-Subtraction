----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.01.2023 04:49:45
-- Design Name: 
-- Module Name: BarrelShifter_sim - Behavioral
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

entity BarrelShifter_sim is
end BarrelShifter_sim;

architecture Behavioral of BarrelShifter_sim is

component Barrel_shifter is
port(nrIn : in std_logic_vector(23 downto 0);
     rightShift : in std_logic;
     shift_amount : in std_logic_vector(4 downto 0);
     nrOut : out std_logic_vector(23 downto 0));
end component;

signal nrIn, nrOut : std_logic_vector(23 downto 0);
signal rightShift : std_logic;
signal shift_amount : std_logic_vector(4 downto 0);

begin

    comp : barrel_shifter port map (nrIn, rightShift, shift_amount, nrOut);
    
    process
    begin
        nrIn <= "101010000000000000000000";
        rightShift <= '1';
        shift_amount <= "00001";
        wait for 20 ns;
    end process;

end Behavioral;
