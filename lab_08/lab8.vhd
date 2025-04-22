library ieee;
use ieee.std_logic_1164.all;
use work.components_pkg.all;

entity lab8 is
    port(
        SW   : in  std_logic_vector(3 downto 0);   -- SW3-SW2 = m, SW1-SW0 = q
        HEX7 : out std_logic_vector(0 to 6);       -- produto m*q
        HEX5 : out std_logic_vector(0 to 6);       -- m
        HEX3 : out std_logic_vector(0 to 6)        -- q
    );
end entity lab8;

architecture main of lab8 is
    -- sinais internos
    signal m, q         : std_logic_vector(1 downto 0);
    signal and0, and1, and2, and3 : std_logic;
    signal s1, s2, c1, c2 : std_logic;
    signal prod         : std_logic_vector(3 downto 0);
    signal m_ext, q_ext : std_logic_vector(3 downto 0);
begin
    -- separar entradas
    m <= SW(3 downto 2);
    q <= SW(1 downto 0);

    -- extender para 4 bits para display
    m_ext <= "00" & m;
    q_ext <= "00" & q;

    -- produtos parciais (ANDs)
    and0 <= m(0) and q(0);
    and1 <= m(1) and q(0);
    and2 <= m(0) and q(1);
    and3 <= m(1) and q(1);

    -- instanciar somadores completos
    FA1: full_adder port map(
        a    => and1,
        b    => and2,
        cin  => '0',
        sum  => s1,
        cout => c1
    );
    FA2: full_adder port map(
        a    => and3,
        b    => c1,
        cin  => '0',
        sum  => s2,
        cout => c2
    );

    -- formar resultado
    prod(0) <= and0;
    prod(1) <= s1;
    prod(2) <= s2;
    prod(3) <= c2;

    -- função de conversão para 7 segmentos
    function to7seg(x : std_logic_vector(3 downto 0)) return std_logic_vector is
        variable seg : std_logic_vector(0 to 6);
    begin
        case x is
            when "0000" => seg := "0000001"; -- 0
            when "0001" => seg := "1001111"; -- 1
            when "0010" => seg := "0010010"; -- 2
            when "0011" => seg := "0000110"; -- 3
            when "0100" => seg := "1001100"; -- 4
            when "0101" => seg := "0100100"; -- 5
            when "0110" => seg := "0100000"; -- 6
            when "0111" => seg := "0001111"; -- 7
            when "1000" => seg := "0000000"; -- 8
            when "1001" => seg := "0000100"; -- 9
            when others => seg := "1111111";
        end case;
        return seg;
    end function;

    -- mapear displays
    HEX5 <= to7seg(m_ext);
    HEX3 <= to7seg(q_ext);
    HEX7 <= to7seg(prod);

end architecture main;