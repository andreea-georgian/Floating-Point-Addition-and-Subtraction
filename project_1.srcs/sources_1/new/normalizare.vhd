----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.01.2023 05:17:15
-- Design Name: 
-- Module Name: normalizare - Behavioral
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

entity normalizare is
port ( mantIn : in std_logic_vector(23 downto 0);
       mantOut : out std_logic_vector(23 downto 0));
end normalizare;

architecture Behavioral of normalizare is

component Barrel_shifter is
port(nrIn : in std_logic_vector(23 downto 0);
     rightShift : in std_logic;
     shift_amount : in std_logic_vector(4 downto 0);
     nrOut : out std_logic_vector(23 downto 0));
end component;

signal count : std_logic_vector(4 downto 0) := "00000";

begin

    comp : barrel_shifter port map (mantIn, '0', count, mantOut);

    process(mantIn)
    begin
        if mantIn(23) = '1' then count <= "00000";
        elsif mantIn(22) = '1' then count <= "00001";
        elsif mantIn(21) = '1' then count <= "00010";
        elsif mantIn(20) = '1' then count <= "00011";
        elsif mantIn(19) = '1' then count <= "00100";
        elsif mantIn(18) = '1' then count <= "00101";
        elsif mantIn(17) = '1' then count <= "00110";
        elsif mantIn(16) = '1' then count <= "00111";
        elsif mantIn(15) = '1' then count <= "01000";
        elsif mantIn(14) = '1' then count <= "01001";
        elsif mantIn(13) = '1' then count <= "01010";
        elsif mantIn(12) = '1' then count <= "01011";
        elsif mantIn(11) = '1' then count <= "01100";
        elsif mantIn(10) = '1' then count <= "01101";
        elsif mantIn(9) = '1' then count <= "01110";
        elsif mantIn(8) = '1' then count <= "01111";
        elsif mantIn(7) = '1' then count <= "10000";
        elsif mantIn(6) = '1' then count <= "10001";
        elsif mantIn(5) = '1' then count <= "10010";
        elsif mantIn(4) = '1' then count <= "10011";
        elsif mantIn(3) = '1' then count <= "10100";
        elsif mantIn(2) = '1' then count <= "10101";
        elsif mantIn(1) = '1' then count <= "10110";
        elsif mantIn(0) = '1' then count <= "10111";
        else count <= "11000";
        end if;
    end process;
        
end Behavioral;
