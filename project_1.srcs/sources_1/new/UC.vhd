----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2022 18:37:06
-- Design Name: 
-- Module Name: UC - Behavioral
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

entity UC is
port (op : in std_logic;
      nr1, nr2 : in std_logic_vector(31 downto 0);
      change : out std_logic_vector(1 downto 0);
      rezSign : out std_logic);
end UC;

architecture Behavioral of UC is

begin
    
    process(nr1(31), nr2(31), op)
    begin
        if op = '0' then
            if nr1(31) = nr2(31) then
                change(0) <= '0';
                change(1) <= '0';        
            else    
                change(0) <= nr1(31);
                change(1) <= nr2(31);
            end if;
        else 
            if nr1(31) = nr2(31) then
                change(0) <= nr1(31);
                change(1) <= not nr2(31);
            else    
                change(0) <= '0';
                change(1) <= '0';
            end if;
        end if;
    end process; 
    
    process(nr1, nr2, op)
    begin
        if op = '0' then  
            if nr1(31) = nr2(31) then rezSign <= nr1(31);
            else
                if nr1(30 downto 23) > nr2(30 downto 23) then rezSign <= nr1(31);
                elsif nr1(30 downto 23) < nr2(30 downto 23) then rezSign <= nr2(31);
                elsif nr1(22 downto 0) > nr2(22 downto 0) then rezSign <= nr1(31);
                else rezSign <= nr2(31);
                end if;
            end if;
        else 
            if nr1(31) /= nr2(31) then rezSign <= nr1(31);
            else
                if nr1(30 downto 23) > nr2(30 downto 23) then rezSign <= nr1(31);
                elsif nr1(30 downto 23) < nr2(30 downto 23) then rezSign <= not nr2(31);
                elsif nr1(22 downto 0) > nr2(22 downto 0) then rezSign <= nr1(31);
                else rezSign <= not nr2(31);
                end if;
            end if;
        end if;
    end process;
    
end Behavioral;
