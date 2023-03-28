----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.11.2022 22:07:46
-- Design Name: 
-- Module Name: UAL_virgula_mobila - Behavioral
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

entity UAL_virgula_mobila is
port ( clk, en, op, reset : in STD_LOGIC;
       nrO1, nrO2 : out std_logic_vector(31 downto 0);
       changeO : out std_logic_vector(1 downto 0);
       signRez : out std_logic;
       exponent_rez : out std_logic_vector(7 downto 0);
       mantisa_rez : out std_logic_vector(22 downto 0));
end UAL_virgula_mobila;

architecture Behavioral of UAL_virgula_mobila is

component MPG is
    Port ( en : out STD_LOGIC;
           input : in STD_LOGIC;
           clock : in STD_LOGIC);
end component;

component memorie is
port (clk, en, rst : in std_logic;
      rd1, rd2 : out std_logic_vector (31 downto 0));
end component;

component semn_mantise is
port (clk : in std_logic;
      change : in std_logic_vector(1 downto 0);
      mantisa1, mantisa2 : in std_logic_vector(23 downto 0);
      mantisaRez1, mantisaRez2 : out std_logic_vector(23 downto 0));
end component;

component Adder_24biti is
port (x, y : in std_logic_vector (23 downto 0);
      s : out std_logic_vector (23 downto 0);
      cout : out std_logic);
end component;

component normalizare is
port ( mantIn : in std_logic_vector(23 downto 0);
       mantOut : out std_logic_vector(23 downto 0));
end component;

component UC is
port (op : in std_logic;
      nr1, nr2 : in std_logic_vector(31 downto 0);
      change : out std_logic_vector(1 downto 0);
      rezSign : out std_logic);
end component;

component aliniere_mantise is
port(clk : in std_logic;
     exp1In, exp2In : in std_logic_vector(7 downto 0);
     mantissa1In, mantissa2In : std_logic_vector(23 downto 0);
     exp1Out, exp2Out : out std_logic_vector(7 downto 0);
     mantissa1Out, mantissa2Out : out std_logic_vector(23 downto 0));
end component;

signal nr1, nr2, rez : std_logic_vector(31 downto 0);
signal overflow : std_logic;
signal change : std_logic_vector (1 downto 0);
signal mantisa1, mantisa2, muxMant1, muxMant2, semnMant1, semnMant2, mantAdd, mantRez : std_logic_vector(23 downto 0);
signal exp1, exp2 : std_logic_vector(7 downto 0);

begin

    mem : memorie port map (clk => clk, en => en, rst => reset, rd1 => nr1, rd2 => nr2);
    alin_mantisa : aliniere_mantise port map (clk, nr1(30 downto 23), nr2(30 downto 23), muxMant1, muxMant2, exp1, exp2, mantisa1, mantisa2);
    semn_mantisa : semn_mantise port map (clk => clk, change => change, mantisa1 => mantisa1, mantisa2 => mantisa2, mantisaRez1 => semnMant1, mantisaRez2 => semnMant2);
    adder : adder_24biti port map (x => semnMant1, y => semnMant2, s => mantAdd, cout => overflow);
    normalizer : normalizare port map (mantAdd, mantRez);
    control_unit : UC port map (op, nr1, nr2, change, signRez);
    
    muxMant1 <= '1' & nr1(22 downto 0);
    muxMant2 <= '1' & nr2(22 downto 0);
    
    exponent_rez <= exp2;
    mantisa_rez <= mantRez(22 downto 0);
    
    nrO1 <= nr1;
    nrO2 <= nr2;
    
    changeO <= change;
    
end Behavioral;
