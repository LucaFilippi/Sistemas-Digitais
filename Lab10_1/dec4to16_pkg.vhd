library IEEE;
use IEEE.std_logic_1164.all;

package dec4to16_pkg is
    component dec4to16
        port(
            en : in  std_logic;
            a  : in  std_logic_vector(3 downto 0);
            y  : out std_logic_vector(15 downto 0)
        );
    end component;
end package;

package body dec4to16_pkg is
end package body;