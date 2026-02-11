library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture tb of testbench is

  -- DUT component
  component demux1_2 is
    port (
      i_SEL : in  std_logic;
      i_A   : in  std_logic;
      o_Y1  : out std_logic;
      o_Y2  : out std_logic
    );
  end component;

  signal w_SEL : std_logic;
  signal w_A   : std_logic;
  signal w_Y1  : std_logic;
  signal w_Y2  : std_logic;

begin

  -- Connect DUT
  u_DUT: demux1_2
    port map (
      i_SEL => w_SEL,
      i_A   => w_A,
      o_Y1  => w_Y1,
      o_Y2  => w_Y2
    );

  process
  begin
    -- Implementação de testbench
  
    w_SEL <= '0'; w_A <= '1'; 
    wait for 1 ns;
    assert (w_Y2 = '0' and w_Y1 = '1') report "erro" severity error;


    w_SEL <= '1'; w_A <= '1';
    wait for 1 ns;
    assert (w_Y2 = '1' and w_Y1 = '0') report "erro" severity error;
    
    -- Clear inputs
    w_SEL <= '0';
    w_A   <= '0';

    assert false report "Test done." severity note;
    wait;
  end process;

end tb;
