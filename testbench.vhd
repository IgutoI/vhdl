-- Testbench for OR gate
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

component uc is
port(
  entrada: in std_logic_vector(7 downto 0);
  saida: out std_logic_vector(7 downto 0));
end component;

signal entrada_in, saida_out: std_logic_vector(7 downto 0);

begin

  DUT: uc port map(entrada_in, saida_out);

  process
  begin
    entrada_in <= "00000001";

    wait for 10 ns;
    
    entrada_in <= "00000001";

    wait for 10 ns;
    
    entrada_in <= "00000011";

    wait for 10 ns;
    
    entrada_in <= "00000111";

    wait for 10 ns;
    
    entrada_in <= "00100011";

    wait for 10 ns;
    
    wait;
  end process;
end tb;
