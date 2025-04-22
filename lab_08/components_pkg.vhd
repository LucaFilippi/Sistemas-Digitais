library ieee;
use ieee.std_logic_1164.all;

package components_pkg is
    component full_adder
        port(
            a   : in  std_logic;
            b   : in  std_logic;
            cin : in  std_logic;
            sum : out std_logic;
            cout: out std_logic
        );
    end component;
end package components_pkg;

package body components_pkg is
end package body components_pkg;