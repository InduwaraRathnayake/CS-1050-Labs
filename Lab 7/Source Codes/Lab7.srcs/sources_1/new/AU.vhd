----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2024 10:52:44 AM
-- Design Name: 
-- Module Name: AU - Behavioral
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

entity AU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC);
end AU;

architecture Behavioral of AU is
    component Reg 
            port( D : in STD_LOGIC_VECTOR (3 downto 0);
               EN : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (3 downto 0));
    end component ;

    component RCA_4 is
        Port ( A0 : in STD_LOGIC;
               A1 : in STD_LOGIC;
               A2 : in STD_LOGIC;
               A3 : in STD_LOGIC;
               B0 : in STD_LOGIC;
               B1 : in STD_LOGIC;
               B2 : in STD_LOGIC;
               B3 : in STD_LOGIC;
               C_in : in STD_LOGIC;
               S0 : out STD_LOGIC;
               S1 : out STD_LOGIC;
               S2 : out STD_LOGIC;
               S3 : out STD_LOGIC;
               C_out : out STD_LOGIC);
    end component; 
    
    component Slow_Clk is
        Port ( Clk_in : in STD_LOGIC;
               Clk_out : out STD_LOGIC);
    end component;   


signal SlowClkOut : std_logic;
signal RegAOutput : STD_LOGIC_VECTOR (3 downto 0);
signal RegBOutput : STD_LOGIC_VECTOR (3 downto 0);

signal RCAOutput : STD_LOGIC_VECTOR (3 downto 0);
signal carryOut : std_logic;
signal notEnRegSel : STD_LOGIC;
signal EnRegSel : STD_LOGIC;

begin
EnRegSel <= RegSel;
notEnRegSel <= not RegSel;

SlowClk : Slow_Clk
    port map(
        Clk_in => Clk,
        Clk_out => SlowClkOut);

RegA : Reg
    port map(
        D => A,
        EN => notEnRegSel,
        Clk =>SlowClkOut,
        Q => RegAOutput
        );
        
RegB : Reg
    port map(
        D => A,
        EN => EnRegSel,
        Clk =>SlowClkOut,
        Q => RegBOutput
        );

 RCA : RCA_4
    port map(
       A0 => RegAOutput(0),
       A1 => RegAOutput(1),
       A2 => RegAOutput(2),
       A3 => RegAOutput(3),
       
       B0 => RegBOutput(0),
       B1 => RegBOutput(1),
       B2 => RegBOutput(2),
       B3 => RegBOutput(3),
       
       C_in => '0',
       S0 => RCAOutput(0),
       S1 => RCAOutput(1),
       S2 => RCAOutput(2),
       S3 => RCAOutput(3),
       C_out => carryOut);

S <= RCAOutput ;
Carry <= carryOut;

Zero <= not(RCAOutput(0) or RCAOutput(1) or RCAOutput(2) or RCAOutput(3) or carryOut ); 

end Behavioral;
