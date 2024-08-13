----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2024 12:24:57 PM
-- Design Name: 
-- Module Name: AU_Sim - Behavioral
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

entity AU_Sim is
--  Port ( );
end AU_Sim;

architecture Behavioral of AU_Sim is
component AU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC);
end component;

signal A, S : STD_LOGIC_VECTOR (3 downto 0);
signal Clk: std_logic := '0';
signal RegSel, Zero, Carry : STD_LOGIC;

begin
UUT : AU  port map(
        A => A,
        S => S,
        Clk => Clk,
        RegSel => RegSel,
        Zero => Zero,
        Carry => Carry);
         
process begin
    Clk <= not Clk;
    wait for 5ns;
end process;

process begin 
    
    RegSel <= '1';
    A<= "1110";
    wait for 200ns;
    
    RegSel <= '0';
    A<= "0110";
    wait for 200ns;
    
    RegSel <= '1';
    A<= "1101";
    wait for 200ns;
    
    RegSel <= '0';
    A<= "0101";
    wait for 200ns;
    
    RegSel <= '1';
    A<= "0000";
    wait for 200ns;
    
    RegSel <= '0';
    A<= "0000";
    wait for 200ns;

end process;

end Behavioral;

