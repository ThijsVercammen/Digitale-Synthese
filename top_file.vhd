library IEEE;
use IEEE.std_logic_1164.all;
entity top_file is
port (
   clk: in std_logic;
   global_input: in std_logic;
   global_output: out std_logic
);
end top_file;

architecture behav of top_file is
    
component module_a
port(
   clk, input_a: in std_logic;
   output_a: out std_logic);
end component;

component module_b
port(
   clk, input_b: in std_logic;
   output_b: out std_logic);
end component;

signal int_signal: std_logic;

begin
    
module_a_inst: module_a
port map(
   input_a => global_input,
   output_a => int_signal,
   clk => clk
);

module_b_inst: module_b
port map(
   input_b => int_signal,
   output_b => global_output,
   clk => clk
);

end behav;
