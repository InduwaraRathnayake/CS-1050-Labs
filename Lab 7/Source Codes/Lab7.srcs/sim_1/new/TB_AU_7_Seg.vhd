----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2024 12:07:39 PM
-- Design Name: 
-- Module Name: TB_AU_7_Seg - Behavioral
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

entity TB_AU_7_Seg is
--  Port ( );
end TB_AU_7_Seg;

architecture Behavioral of TB_AU_7_Seg is

component AU_7_seg is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           RegSel : in STD_LOGIC;
           S_LED : out STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Carry : out STD_LOGIC;
           Zero : out STD_LOGIC;
           AnodeSelector : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A, S_LED, AnodeSelector : STD_LOGIC_VECTOR (3 downto 0);
signal RegSel, Carry, Zero : STD_LOGIC;
signal S_7Seg : STD_LOGIC_VECTOR (6 downto 0);
signal Clk : STD_LOGIC := '0';

begin
UUT : AU_7_seg
    port map (
        A => A,
        Clk => Clk,
        RegSel => RegSel,
        S_LED => S_LED,
        S_7Seg => S_7Seg,
        Carry => Carry,
        Zero => Zero,
        AnodeSelector => AnodeSelector
        );
  
process begin
    Clk <= not Clk;
    wait for 5ns;
end process;
    
process begin
 
    RegSel <= '1';
    A<= "1110";
    wait for 100ns;
    
    RegSel <= '0';
    A<= "0110";
    wait for 100ns;
    
    RegSel <= '1';
    A<= "1101";
    wait for 100ns;
    
    RegSel <= '0';
    A<= "0101";
    wait for 100ns;
    
    RegSel <= '1';
    A<= "0000";
    wait for 100ns;
    
    RegSel <= '0';
    A<= "0000";
    wait for 100ns;
    
    RegSel <= '1';
    A<= "1111";
    wait for 100ns;
    
    RegSel <= '0';
    A<= "0011";
    wait for 100ns;
    
    RegSel <= '1';
    A<= "1010";
    wait for 100ns;
    
    RegSel <= '0';
    A<= "0001";
    wait for 100ns;
    

end process;

end Behavioral;
