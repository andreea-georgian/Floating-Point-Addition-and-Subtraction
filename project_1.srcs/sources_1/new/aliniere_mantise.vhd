----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2022 17:38:26
-- Design Name: 
-- Module Name: aliniere_mantise - Behavioral
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

entity aliniere_mantise is
port(clk : in std_logic;
     exp1In, exp2In : in std_logic_vector(7 downto 0);
     mantissa1In, mantissa2In : std_logic_vector(23 downto 0);
     exp1Out, exp2Out : out std_logic_vector(7 downto 0);
     mantissa1Out, mantissa2Out : out std_logic_vector(23 downto 0));
end aliniere_mantise;

architecture Behavioral of aliniere_mantise is

component Barrel_shifter is
port(nrIn : in std_logic_vector(23 downto 0);
     rightShift : in std_logic;
     shift_amount : in std_logic_vector(4 downto 0);
     nrOut : out std_logic_vector(23 downto 0));
end component;

signal mantissaIn, mantissaOut : std_logic_vector(23 downto 0);
signal difExp : std_logic_vector(7 downto 0);

begin
    
    comp : Barrel_shifter port map (mantissaIn, '1', difExp(4 downto 0), mantissaOut);

    process(clk)
    begin
        if rising_edge(clk) then
            if exp1In > exp2In then
                exp1Out <= exp1In;
                exp2Out <= exp1In;
                difExp <= exp1In - exp2In;
                mantissaIn <= mantissa2In;
                mantissa1Out <= mantissa1In;
                mantissa2Out <= mantissaOut;
            elsif exp1In < exp2In then
                exp1Out <= exp2In;
                exp2Out <= exp2In;
                difExp <= exp2In - exp1In;
                mantissaIn <= mantissa1In;
                mantissa1Out <= mantissaOut;
                mantissa2Out <= mantissa2In;
            else
                exp1Out <= exp1In;
                exp2Out <= exp2In;
                mantissa1Out <= mantissa1In;
                mantissa2Out <= mantissa2In;
            end if;
        end if;
    end process;

end Behavioral;
