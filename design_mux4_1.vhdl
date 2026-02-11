library ieee;
use ieee.std_logic_1164.all;

entity mux4_1 is
  port (
    i_I0 : in  std_logic;
    i_I1 : in  std_logic;
    i_I2 : in  std_logic;
    i_I3 : in  std_logic;
    i_S1 : in  std_logic; -- seletor mais significativo
    i_S0 : in  std_logic; -- seletor menos significativo
    o_S  : out std_logic
  );
end mux4_1;

architecture structural of mux4_1 is

  -- sinais internos
  signal w_Y0 : std_logic;
  signal w_Y1 : std_logic;
  
  -- componente do mux2_1
  component mux2_1
    port (
      i_A   : in  std_logic;
      i_B   : in  std_logic;
      i_SEL : in  std_logic;
      o_S   : out std_logic
    );
  end component;
  
begin

  -- Primeiro nível
  u_MUX0: mux2_1
    port map (
      i_A   => i_I0,
      i_B   => i_I1,
      i_SEL => i_S0,
      o_S   => w_Y0
    );

  u_MUX1: mux2_1
    port map (
      i_A   => i_I2,
      i_B   => i_I3,
      i_SEL => i_S0,
      o_S   => w_Y1
    );

  -- Segundo nível
  u_MUX2: mux2_1
    port map (
      i_A   => w_Y0,
      i_B   => w_Y1,
      i_SEL => i_S1,
      o_S   => o_S
    );

end structural;

-- /* - bloco utilizado por fora (mux2_1) para construção hierárquica do mux4_1
  library IEEE; 
  use IEEE.std_logic_1164.all;
  
  entity mux2_1 is
    port (
      i_SEL : in  std_logic;
      i_A   : in  std_logic;
      i_B   : in  std_logic;
      o_S   : out std_logic
    );
  end mux2_1;
  
  architecture arch_1 of mux2_1 is
  begin
    o_S <= (i_A and not i_SEL) or (i_B and i_SEL);
  end arch_1;
--*/
