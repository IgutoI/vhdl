library IEEE;
use IEEE.std_logic_1164.all;

entity instrucion_and is
port(
	a: in std_logic;
    b: in std_logic;
    c: out std_logic;
    
end intruction_and;

architecture logica_and of instruction_and is
begin
    
    process(a, b) is
    begin
    	variable v_and, v_or, v_xor, v_not: std_logic;
        
        	c <= (a and b);
        
    end process;
    
end logica_and;
	
