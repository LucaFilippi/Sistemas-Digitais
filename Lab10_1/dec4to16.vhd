library IEEE;
use IEEE.std_logic_1164.all;
use work.dec2to4_pkg.all;

entity dec4to16 is
    port(
        en : in  std_logic;
        a  : in  std_logic_vector(3 downto 0);
        y  : out std_logic_vector(15 downto 0)
    );
end entity;

architecture Structural of dec4to16 is
    signal en_lo : std_logic_vector(3 downto 0);
    signal y_lo  : std_logic_vector(3 downto 0) := (others => '0');
begin
    U_DEC_EN : dec2to4
        port map(
            en => en,
            a  => a(3 downto 2),
            y  => en_lo
        );

    GEN_DEC : for i in 0 to 3 generate
        U_DEC_i : dec2to4
            port map(
                en => en_lo(i),
                a  => a(1 downto 0),
                y  => y( (i*4+3) downto (i*4) )
            );
    end generate;
end architecture;