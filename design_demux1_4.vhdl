library ieee;
use ieee.std_logic_1164.all;

entity demux1_4 is
  port (
    i_I    : in  std_logic;  -- entrada
    i_SEL0 : in  std_logic;  -- seletor 1 
    i_SEL1 : in  std_logic;  -- seletor 2 
    o_Y0   : out std_logic;  -- saídas
    o_Y1   : out std_logic;
    o_Y2   : out std_logic;
    o_Y3   : out std_logic
  );
end demux1_4;

architecture arch_1 of demux1_4 is

  -- sinais internos
  signal w_Z1 : std_logic;
  signal w_Z2 : std_logic;
  
  -- componente do demux1_2
  component demux1_2
    port (
      i_A   : in  std_logic;
      i_SEL : in  std_logic;
      o_Y1  : out std_logic;
      o_Y2  : out std_logic
    );
  end component;

begin

  -- Primeiro nível
  u_DEMUX0: demux1_2
    port map (
      i_A   => i_I,
      i_SEL => i_SEL0,
      o_Y1  => w_Z1,
      o_Y2  => w_Z2
    );

  u_DEMUX1: demux1_2
    port map (
      i_A   => w_Z1,
      i_SEL => i_SEL1,
      o_Y1  => o_Y0,
      o_Y2  => o_Y1
    );

  -- Segundo nível
  u_DEMUX2: demux1_2
    port map (
      i_A   => w_Z2,
      i_SEL => i_SEL1,
      o_Y1  => o_Y2,
      o_Y2  => o_Y3
    );

end arch_1;

-- /* bloco externo demux1_2 utilizado como forma de hierarquia

    library ieee;
use ieee.std_logic_1164.all;

entity demux1_2 is
  port (
    i_SEL : in  std_logic;
    i_A   : in  std_logic;
    o_Y1  : out std_logic;
    o_Y2  : out std_logic
  );
end demux1_2;

architecture arch_1 of demux1_2 is
begin

  -- Implementação da arquitetura demux1_2
  o_Y1 <= i_A and not i_SEL; -- saída 1
  o_Y2 <= i_A and i_SEL;     -- saída 2

end arch_1;

-- */
