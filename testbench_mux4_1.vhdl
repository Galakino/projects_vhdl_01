library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture sim of testbench is

  -- Componente a testar
  component mux4_1
    port (
      i_I0 : in  std_logic;
      i_I1 : in  std_logic;
      i_I2 : in  std_logic;
      i_I3 : in  std_logic;
      i_S1 : in  std_logic;
      i_S0 : in  std_logic;
      o_S  : out std_logic
    );
  end component;

  -- Sinais internos para simulação
  signal w_I0 : std_logic := '0';
  signal w_I1 : std_logic := '0';
  signal w_I2 : std_logic := '0';
  signal w_I3 : std_logic := '0';
  signal w_S1 : std_logic := '0';
  signal w_S0 : std_logic := '0';
  signal w_S  : std_logic;

begin

  -- Instância do DUT (Device Under Test)
  u_UUT: mux4_1
    port map (
      i_I0 => w_I0,
      i_I1 => w_I1,
      i_I2 => w_I2,
      i_I3 => w_I3,
      i_S1 => w_S1,
      i_S0 => w_S0,
      o_S  => w_S
    );

  -- Estímulos de teste
  stim_proc: process
  begin
    -- Definir entradas iniciais
    w_I0 <= '0'; w_I1 <= '1'; w_I2 <= '0'; w_I3 <= '0';
    w_S1 <= '0'; w_S0 <= '1'; wait for 10 ns; -- Deve selecionar I1

    -- Testa mudando os dados
    w_I0 <= '1'; w_I1 <= '1'; w_I2 <= '1'; w_I3 <= '0';
    w_S1 <= '1'; w_S0 <= '1'; wait for 10 ns; -- Deve selecionar I3

    wait; -- mantém a simulação aberta
  end process;

end sim;
