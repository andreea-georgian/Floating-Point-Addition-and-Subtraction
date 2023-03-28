----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.11.2022 22:25:06
-- Design Name: 
-- Module Name: semn_mantise - Behavioral
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

entity semn_mantise is
port (clk : in std_logic;
      change : in std_logic_vector(1 downto 0);
      mantisa1, mantisa2 : in std_logic_vector(23 downto 0);
      mantisaRez1, mantisaRez2 : out std_logic_vector(23 downto 0));
end semn_mantise;

architecture Behavioral of semn_mantise is

begin

    process(clk)
    begin
        if change(0) = '1' then
            mantisaRez1 <= not mantisa1 + 1;
        else 
            mantisaRez1 <= mantisa1;
        end if;
        if change(1) = '1' then
            mantisaRez2 <= not mantisa2 + 1;
        else 
            mantisaRez2 <= mantisa2;
        end if;
    end process;

end Behavioral;
