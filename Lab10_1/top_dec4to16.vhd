library IEEE;
use IEEE.std_logic_1164.all;
use work.dec4to16_pkg.all;

entity lab10 is
    port(
        SW   : in  std_logic_vector(4 downto 0);
        LEDR : out std_logic_vector(15 downto 0)
    );
end entity;

architecture Behavioral of lab10 is
    signal dout : std_logic_vector(15 downto 0);
begin
    U_DEC16 : dec4to16
        port map(
            en => Sw(4),
            a  => SW(3 downto 0),
            y  => dout
        );

    LEDR <= dout;
end architecture;