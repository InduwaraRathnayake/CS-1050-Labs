----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2024 02:23:10 PM
-- Design Name: 
-- Module Name: D_FF_Sim - Behavioral
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

entity D_FF_Sim is
--  Port ( );
end D_FF_Sim;

architecture Behavioral of D_FF_Sim is

component D_FF
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end component;

signal D, Res, Clk : std_logic;
signal Q, Qbar : std_logic;

begin
UUT: D_FF port map(D,Res,Clk,Q,Qbar);

process begin
    D <= '0';
    Res <= '0';
    Clk <= '0';
    
    wait for 100 ns; 
    D <= '1';
      
    wait for 100 ns;
    D <= '0';
    Clk <= '1';
    
    wait for 100 ns;   
    D <= '1';
    
    wait for 100 ns;  
    Clk <= '0';
    
    wait for 100 ns;        
    Clk <= '1';
     
    wait for 100 ns;
    Clk <= '0';
    
    wait for 100 ns;   
    D <= '0';
    
    wait for 100 ns;        
    Clk <= '1';
     
    wait for 100 ns;
    Clk <= '0';

    wait for 100 ns;   
    D <= '1';
    
    wait for 100 ns;        
    Clk <= '1';
     
    wait for 100 ns;
    Clk <= '0';
    
    wait for 100ns;
    Res <='1';
    
    wait for 100 ns;        
    Clk <= '1';
     
    wait for 100 ns;
    Clk <= '0';
    
    wait for 100 ns;   
    D <= '0';

    wait;
end process;

end Behavioral;
