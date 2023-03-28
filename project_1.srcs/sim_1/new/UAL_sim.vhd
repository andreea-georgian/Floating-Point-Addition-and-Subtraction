----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.01.2023 05:07:06
-- Design Name: 
-- Module Name: UAL_sim - Behavioral
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

entity UAL_sim is
end UAL_sim;

architecture Behavioral of UAL_sim is

component UAL_virgula_mobila is
port ( clk, en, op, reset : in STD_LOGIC;
       nrO1, nrO2 : out std_logic_vector(31 downto 0);
       changeO : out std_logic_vector(1 downto 0);
       signRez : out std_logic;
       exponent_rez : out std_logic_vector(7 downto 0);
       mantisa_rez : out std_logic_vector(22 downto 0));
end component;

signal clk, en, op, reset, signRez : std_logic;
signal nrO1, nrO2 : std_logic_vector(31 downto 0);
signal changeO : std_logic_vector(1 downto 0);
signal exponent_rez : std_logic_vector(7 downto 0);
signal mantisa_rez : std_logic_vector(22 downto 0);

begin

    comp : UAL_virgula_mobila port map (clk, en, op, reset, nrO1, nrO2, changeO, signRez, exponent_rez, mantisa_rez);
    
    process
    begin
        clk <= '0';
        en <= '0';
        op <= '0';
        reset <= '0';
        wait for 20 ns;
        clk <= '1';
        wait for 20 ns;
        clk <= '0';
        wait for 20 ns;
        clk <= '1';
        wait for 20 ns;
        clk <= '0';
        wait for 20 ns;
        clk <= '1';
        wait for 20 ns;
        clk <= '0';
        wait for 20 ns;
        clk <= '1';
        wait for 20 ns;
        en <= '1';
        clk <= '0';
        wait for 20 ns;
        clk <= '1';
        wait for 20 ns;
    end process;

end Behavioral;
