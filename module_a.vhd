library IEEE;
use IEEE.std_logic_1164.all;

entity module_a is
port (
   clk: in std_logic;
   input_a: in std_logic;
   output_a: out std_logic
);
end module_a;

architecture behav of module_a is
begin
    
output_a <= input_a;

end behav;