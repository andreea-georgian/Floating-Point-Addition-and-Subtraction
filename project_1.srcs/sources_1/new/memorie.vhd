----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.11.2022 21:34:45
-- Design Name: 
-- Module Name: memorie - Behavioral
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

entity memorie is
port (clk, en, rst : in std_logic;
      rd1, rd2 : out std_logic_vector (31 downto 0));
end memorie;

architecture Behavioral of memorie is

type memReg is array (0 to 8) of std_logic_vector (31 downto 0);
signal mem : memReg := (
                B"0_01110010_01101111000000000110100",
                B"0_10001001_00111010000000000001000",
                --B"0_10000011_00011000000000000000000", --17.5
                --B"0_10000001_01010000000000000000000", --5.25
                B"1_10000010_01001000000000000000000", -- -10.25
                B"0_10000100_10010110000000000000000", -- 50.75
                B"0_01110100_00000110001001001101111", -- 0.0005
                B"1_10000000_00010011001100110011010", -- -2.15
                B"0_10000101_11001101011001100110011", -- 115.35
                B"1_10000101_01000010100111101011100", -- -80.655
                others => x"00000000");

signal PC : std_logic_vector(31 downto 0) := (others => '0');

begin
    
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                PC <= (others => '0');
            elsif en = '1' then
                PC <= PC + 1;
            end if;
        end if;
    end process;
    
    rd1 <= mem(conv_integer(PC(2 downto 0)));
    rd2 <= mem(conv_integer(PC(2 downto 0)) + 1);

end Behavioral;
