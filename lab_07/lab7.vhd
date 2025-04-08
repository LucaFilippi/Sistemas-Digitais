library ieee;
use ieee.std_logic_1164.all;

entity lab7 is
    port (
        SW     : in std_logic_vector(8 downto 0); -- SW8 a SW0
        HEX7   : out std_logic_vector(0 to 6); -- Cout
        HEX5   : out std_logic_vector(0 to 6); -- Soma (S)
        HEX3   : out std_logic_vector(0 to 6); -- A
        HEX1   : out std_logic_vector(0 to 6); -- B
        HEX0   : out std_logic_vector(0 to 6)  -- Cin
    );
end entity;

architecture main of lab7 is
    signal a, b, s : std_logic_vector(3 downto 0);
    signal cin, cout : std_logic;
    signal c1, c2, c3 : std_logic;
begin

    -- Atribuições das entradas
    a   <= SW(8 downto 5);
    b   <= SW(4 downto 1);
    cin <= SW(0);

    -- Somador completo em ripple carry (4 full adders)
    s(0) <= a(0) xor b(0) xor cin;
    c1   <= (a(0) and b(0)) or (a(0) and cin) or (b(0) and cin);

    s(1) <= a(1) xor b(1) xor c1;
    c2   <= (a(1) and b(1)) or (a(1) and c1) or (b(1) and c1);

    s(2) <= a(2) xor b(2) xor c2;
    c3   <= (a(2) and b(2)) or (a(2) and c2) or (b(2) and c2);

    s(3) <= a(3) xor b(3) xor c3;
    cout <= (a(3) and b(3)) or (a(3) and c3) or (b(3) and c3);

    -- Display HEX5 - Soma
    with s select
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
                "0001000" when "1010",
                "1100000" when "1011",
                "0110001" when "1100",
                "1000010" when "1101",
                "0110000" when "1110",
                "0111000" when "1111",
                "1111111" when others;

    -- Display HEX3 - A
    with a select
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
                "0001000" when "1010",
                "1100000" when "1011",
                "0110001" when "1100",
                "1000010" when "1101",
                "0110000" when "1110",
                "0111000" when "1111",
                "1111111" when others;

    -- Display HEX1 - B
    with b select
        HEX1 <= "0000001" when "0000",
                "1001111" when "0001",
                "0010010" when "0010",
                "0000110" when "0011",
                "1001100" when "0100",
                "0100100" when "0101",
                "0100000" when "0110",
                "0001111" when "0111",
                "0000000" when "1000",
                "0000100" when "1001",
                "0001000" when "1010",
                "1100000" when "1011",
                "0110001" when "1100",
                "1000010" when "1101",
                "0110000" when "1110",
                "0111000" when "1111",
                "1111111" when others;

    -- Display HEX0 - Cin
    with cin select
        HEX0 <= "0000001" when '0',
                "1001111" when '1',
                "1111111" when others;

    -- Display HEX7 - Cout
    with cout select
        HEX7 <= "0000001" when '0',
                "1001111" when '1',
                "1111111" when others;

end architecture;