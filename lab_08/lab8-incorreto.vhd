library ieee;
use ieee.std_logic_1164.all;

entity lab8 is
    port (
        SW    : in std_logic_vector(3 downto 0);  -- SW3 SW2 = m, SW1 SW0 = q
        HEX7  : out std_logic_vector(0 to 6);     -- produto (m * q)
        HEX5  : out std_logic_vector(0 to 6);     -- m
        HEX3  : out std_logic_vector(0 to 6)      -- q
    );
end entity;

architecture main of lab8 is
    signal m, q       : std_logic_vector(1 downto 0);
    signal and0, and1, and2, and3 : std_logic;
    signal s1, s2, c1, c2 : std_logic;
    signal prod       : std_logic_vector(3 downto 0);
    signal m_ext, q_ext : std_logic_vector(3 downto 0);
begin

    -- Separar m e q das chaves
    m <= SW(3 downto 2);
    q <= SW(1 downto 0);

    -- Extensões para 4 bits (para usar no display)
    m_ext <= "00" & m;
    q_ext <= "00" & q;

    -- Lógica de multiplicação com ANDs e dois somadores completos
    and0 <= m(0) and q(0);
    and1 <= m(1) and q(0);
    and2 <= m(0) and q(1);
    and3 <= m(1) and q(1);

    -- Somadores
    s1 <= and1 xor and2;
    c1 <= (and1 and and2);

    s2 <= and3 xor c1;
    c2 <= and3 and c1;

    -- Produto final de 4 bits
    prod(0) <= and0;
    prod(1) <= s1;
    prod(2) <= s2;
    prod(3) <= c2;

    -- Display de m (HEX5)
    with m_ext select
        HEX5 <= "0000001" when "0000",
                "1001111" when "0001",
                "0010010" when "0010",
                "0000110" when "0011",
                "1001100" when "0100",
                "0100100" when "0101",
                "0100000" when "0110",
                "0001111" when "0111",
                "0000000" when "1000",
                "0000100" when "1001",
                "1111111" when others;

    -- Display de q (HEX3)
    with q_ext select
        HEX3 <= "0000001" when "0000",
                "1001111" when "0001",
                "0010010" when "0010",
                "0000110" when "0011",
                "1001100" when "0100",
                "0100100" when "0101",
                "0100000" when "0110",
                "0001111" when "0111",
                "0000000" when "1000",
                "0000100" when "1001",
                "1111111" when others;

    -- Display do produto (HEX7)
    with prod select
        HEX7 <= "0000001" when "0000",
                "1001111" when "0001",
                "0010010" when "0010",
                "0000110" when "0011",
                "1001100" when "0100",
                "0100100" when "0101",
                "0100000" when "0110",
                "0001111" when "0111",
                "0000000" when "1000",
                "0000100" when "1001",
                "1111111" when others;

end architecture;