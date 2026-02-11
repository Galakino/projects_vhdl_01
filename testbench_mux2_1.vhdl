library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;
  
architecture tb of testbench is-- DUT component
  
  component mux2_1 is
    port (
    i_SEL : in std_logic;
    i_A : in std_logic;
    i_B : in std_logic;
    o_S : out std_logic
    );
  end component;
  
  signal w_SEL : std_logic;
  signal w_A : std_logic;
  signal w_B : std_logic;
  signal w_S : std_logic;

begin
  
  -- Connect DUT  
  u_DUT: mux2_1
    port map (
    i_SEL => w_SEL,
    i_A => w_A,
    i_B => w_B,
    o_S => w_S
    );
process
begin
  
  -- Implementacao de testbench para duas condicoes
  w_SEL <= ’0’; w_A <= ’1’; w_B <= ’0’;
  wait for 1 ns;
  assert (w_S = ’1’) report "Linha 3" severity error;
  
  w_SEL <= ’1’; w_A <= ’0’; w_B <= ’1’;
  wait for 1 ns;
  assert (w_S = ’1’) report "Linha 4" severity error;

  -- Clear inputs
  w_SEL <= ’0’;
  w_A <= ’0’;
  w_B <= ’0’;

  assert false report "Test done." severity note;
wait;
end process;
end tb;
