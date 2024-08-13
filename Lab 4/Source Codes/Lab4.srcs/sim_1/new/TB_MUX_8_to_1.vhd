----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2024 12:08:31 PM
-- Design Name: 
-- Module Name: TB_MUX_8_to_1 - Behavioral
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

entity TB_MUX_8_to_1 is
--  Port ( );
end TB_MUX_8_to_1;

architecture Behavioral of TB_MUX_8_to_1 is
component MUX_8_to_1
    Port ( 
    S : in STD_LOGIC_VECTOR (2 downto 0);
    D : in STD_LOGIC_VECTOR (7 downto 0);
    EN : in STD_LOGIC;
    Y : out STD_LOGIC);
end component;

signal S : STD_LOGIC_VECTOR (2 downto 0);
signal D : STD_LOGIC_VECTOR (7 downto 0);
signal EN : STD_LOGIC;
signal Y : STD_LOGIC;

begin
UUT: MUX_8_to_1 port map(
    S => S,
    D => D,
    EN => EN,
    Y => Y
);

process
begin

    EN <= '1';
    D <= "11111111";
    S <= "110";
    WAIT FOR 100 ns;
    
    S <= "101";
    WAIT FOR 100 ns;
    
    S <= "111";
    WAIT FOR 100 ns;
    
    D <= "10101010";
    S <= "110";
    WAIT FOR 100 ns;
    
    S <= "101";
    WAIT FOR 100 ns;
    
    S <= "111";
    WAIT FOR 100 ns;
    
    D <= "01100011";
    S <= "110";
    WAIT FOR 100 ns;
    
    S <= "101"; 
    WAIT FOR 100 ns;
    
    S <= "111";
    WAIT FOR 100 ns;
    
    EN <= '0';
    
    WAIT ;

end process;


end Behavioral;
