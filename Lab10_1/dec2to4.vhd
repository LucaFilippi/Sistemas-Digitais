library IEEE;
use IEEE.std_logic_1164.all;

entity dec2to4 is
    port(
        en : in  std_logic;
        a  : in  std_logic_vector(1 downto 0);
        y  : out std_logic_vector(3 downto 0)
    );
end entity;

architecture Behavioral of dec2to4 is
begin
    process(en, a)
    begin
        if en = '1' then
            case a is
                when "00" => y <= "0001";
                when "01" => y <= "0010";
                when "10" => y <= "0100";
                when "11" => y <= "1000";
                when others => y <= (others => '0');
            end case;
        else
            y <= (others => '0');
        end if;
    end process;
end architecture;