----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.01.2023 03:18:23
-- Design Name: 
-- Module Name: Barrel_shifter - Behavioral
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

entity Barrel_shifter is
port(nrIn : in std_logic_vector(23 downto 0);
     rightShift : in std_logic;
     shift_amount : in std_logic_vector(4 downto 0);
     nrOut : out std_logic_vector(23 downto 0));
end Barrel_shifter;

architecture Behavioral of Barrel_shifter is

type intermediate_results is array (0 to 5) of std_logic_vector(31 downto 0);
signal ir : intermediate_results; 

begin

    ir(0) <= x"00" & nrIn;
    nrOut <= ir(5)(23 downto 0);
    
    gen : for i in 0 to 4 generate
        process(ir(i), rightShift, shift_amount)
        begin
            if rightShift = '1' then
                if shift_amount(i) = '0' then
                    ir(i + 1) <= ir(i);
                else
                    ir(i + 1) <= ((2**i - 1) downto 0 => '0') & ir(i)(31 downto 2**i);
                end if;
            else
                if shift_amount(i) = '0' then
                    ir(i + 1) <= ir(i);
                else
                    ir(i + 1) <= ir(i)((31 - 2**i) downto 0) & ((2**i - 1) downto 0 => '0');
                end if;
            end if;
        end process;
    end generate; 

end Behavioral;
