-- Simple full-adder with carry gate design
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sum_gate is
port(
  a: in std_logic;
  b: in std_logic;
  cin: in std_logic;
  sum: out std_logic;
  cout: out std_logic);
end sum_gate;

architecture rtl of sum_gate is
begin
  process(a, b, cin) is
  begin
  
  	sum <= (a xor b) xor (cin);
    cout <= (a and cin) or (a and b) or (b and cin);
    
  end process;
end rtl;
------------------------------------------------------------

-- Testbench for OR gate
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component sum_gate is
port(
  a: in std_logic;
  b: in std_logic;
  cin: in std_logic;
  sum: out std_logic;
  cout: out std_logic);
end component;

signal a_in, b_in, cin_in, sum_out, cout_out: std_logic;

begin

  -- Connect DUT
  DUT: sum_gate port map(a_in, b_in, cin_in, sum_out, cout_out);

  process
  begin
    a_in <= '0';
    b_in <= '0';
    cin_in <= '0';
    wait for 1 ns;
    assert(sum_out='0') report "sum Fail 0/0/0" severity error;
    assert(cout_out='0') report "carry out Fail 0/0/0" severity error;
    
   	
  
    a_in <= '0';
    b_in <= '0';
    cin_in <= '1';
    wait for 1 ns;
    assert(sum_out='1') report "sum Fail 0/0/1" severity error;
    assert(cout_out='0') report "carry Fail 0/0/1" severity error;

   
    a_in <= '0';
    b_in <= '1';
    cin_in <= '0';
    wait for 1 ns;
    assert(sum_out='1') report "sum Fail 0/1/0" severity error;
    assert(cout_out='0') report "carry Fail 0/1/0" severity error;
    
    a_in <= '0';
    b_in <= '1';
    cin_in <= '1';
    wait for 1 ns;
    assert(sum_out='0') report "sum Fail 0/1/1" severity error;
    assert(cout_out='1') report "carry Fail 0/1/1" severity error;
    
    a_in <= '1';
    b_in <= '0';
    cin_in <= '0';
    wait for 1 ns;
    assert(sum_out='1') report "sum Fail 1/0/0" severity error;
    assert(cout_out='0') report "carry Fail 1/0/0" severity error;
    
    a_in <= '1';
    b_in <= '0';
    cin_in <= '1';
    wait for 1 ns;
    assert(sum_out='0') report "sum Fail 1/0/1" severity error;
    assert(cout_out='1') report "carry Fail 1/0/1" severity error;
    
    a_in <= '1';
    b_in <= '1';
    cin_in <= '0';
    wait for 1 ns;
    assert(sum_out='0') report "sum Fail 1/1/0" severity error;
    assert(cout_out='1') report "carry Fail 1/1/0" severity error;
    
    a_in <= '1';
    b_in <= '1';
    cin_in <= '1';
    wait for 1 ns;
    assert(sum_out='1') report "sum Fail 1/1/1"severity error;
    assert(cout_out='1') report "carry Fail 1/1/1"severity error;
    
    
    -- Clear inputs
    a_in <= '0';
    b_in <= '0';
    cin_in<= '0';

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
