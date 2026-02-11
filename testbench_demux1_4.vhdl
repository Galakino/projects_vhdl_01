library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture sim of testbench is
    -- Componente a testar (DUT: Device Under Test)
    component demux1_4
        Port (
            i_I   : in  STD_LOGIC; -- entrada
            i_SEL0 : in  STD_LOGIC; -- seletor1
            i_SEL1 : in  STD_LOGIC; -- seletor2
            o_Y0  : out STD_LOGIC; -- saídas:
            o_Y1  : out STD_LOGIC;
            o_Y2  : out STD_LOGIC;
            o_Y3  : out STD_LOGIC
        );
    end component;

    -- Sinais internos para simulação
    signal w_I      : STD_LOGIC := '0';
    signal w_SEL0   : STD_LOGIC := '0';
    signal w_SEL1   : STD_LOGIC := '0';
    signal w_Y0, w_Y1, w_Y2, w_Y3 : STD_LOGIC;
    
begin
    -- Instância do DUT
    u_UUT: demux1_4
        port map (
            i_I   => w_I,
            i_SEL0 => w_SEL0,
            i_SEL1 => w_SEL1,
            o_Y0  => w_Y0,
            o_Y1  => w_Y1,
            o_Y2  => w_Y2,
            o_Y3  => w_Y3
        );

    -- Estímulos de teste
    stim_proc: process
    begin
    
    -- Testando combinações e mudando o valor da entrada
    
        -- Ativa entrada
        w_I <= '1';
        w_SEL0 <= '0'; w_SEL1 <= '0'; wait for 10 ns; -- Deve ativar Y0       
        w_SEL0 <= '0'; w_SEL1 <= '1'; wait for 10 ns; -- Deve ativar Y2

        wait; -- mantém simulação aberta
    end process;
end sim;
