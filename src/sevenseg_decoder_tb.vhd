----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2025 06:23:47 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
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

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is
    component sevenseg_decoder is
        Port (  i_hex : in STD_LOGIC_VECTOR (3 downto 0);
                o_seg_n : out STD_LOGIC_VECTOR (6 downto 0)
           );
         end component sevenseg_decoder;
         
    signal w_sw : std_logic_vector (3 downto 0);
    signal w_seg : std_logic_vector (6 downto 0);
      
begin
    
    sevenseg_decoder_uut: sevenseg_decoder port map (
        i_hex => w_sw,
        o_seg_n => w_seg
        ); 
    
    test_proccess: process
    begin
    
        w_sw <= x"0"; wait for 10 ns;
            assert(w_seg = NOT "0111111") report "bad 0" severity failure; 
        w_sw <= x"5"; wait for 10 ns; 
            assert(w_seg = NOT "1101101") report "bad 5" severity failure;
        w_sw <= x"D"; wait for 10 ns;
            assert(w_seg = NOT "1011110")report "bad D" severity failure; 
           wait; 
     
   end process; 
   
end test_bench;
