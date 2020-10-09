library IEEE;
use IEEE.std_logic_1164.all;

entity module_b is
port (
   clk: in std_logic;
   input_b: in std_logic;
   output_b: out std_logic
);
end module_b;

architecture behav of module_b is
begin
    
output_b <= not(input_b);

end behav;