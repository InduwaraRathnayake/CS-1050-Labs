----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2024 04:54:52 PM
-- Design Name: 
-- Module Name: TB Multiplier_4 - Behavioral
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

entity TB_Multiplier_4 is
--  Port ( );
end TB_Multiplier_4;

architecture Behavioral of TB_Multiplier_4 is
component Multiplier_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal A,B : STD_LOGIC_VECTOR (3 downto 0);
signal Y :  STD_LOGIC_VECTOR (7 downto 0);

begin
UUT : Multiplier_4 port map(A,B,Y);

process begin
    A <= "1110";
    B <= "0110";
    
    wait for 200 ns;
    
    A <= "1101";
    B <= "0101";
    
    wait for 200 ns;
        
    A <= "1111";
    B <= "1001";
    
    wait for 200 ns;

    A <= "1010";
    B <= "0101";
    
    wait for 200 ns; 

    A <= "1111";
    B <= "1111";
   
    wait;
end process;  

end Behavioral;
