----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2024 05:27:58 PM
-- Design Name: 
-- Module Name: Counter_sim - Behavioral
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

entity Counter_sim is
--  Port ( );
end Counter_sim;

architecture Behavioral of Counter_sim is
component Counter is
    Port ( Dir : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Dir, Res: std_logic;
signal Clk: std_logic := '0';
signal Q : std_logic_vector(2 downto 0);


begin
UUT : Counter port map(Dir, Res, Clk, Q);

process begin

    Clk <= not Clk;
    wait for 3ns;
    
end process;

process begin

    Res <= '1';
    wait for 60ns;

    Res <= '0';
    Dir <= '0';
    wait for 359  ns;
    
    Dir <= '1';
    wait for 359  ns; 
      
    Dir <= '0';
    wait;

end process;
    
end Behavioral;
