library IEEE;
use IEEE.std_logic_1164.all;

package dec2to4_pkg is
    component dec2to4
        port(
            en : in  std_logic;
            a  : in  std_logic_vector(1 downto 0);
            y  : out std_logic_vector(3 downto 0)
        );
    end component;
end package;

package body dec2to4_pkg is

end package body;