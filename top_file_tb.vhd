library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity top_file_tb is
end;

architecture bench of top_file_tb is

  component top_file
  port (
     clk: in std_logic;
     global_input: in std_logic;
     global_output: out std_logic
  );
  end component;

  signal clk: std_logic;
  signal global_input: std_logic;
  signal global_output: std_logic ;

begin

  uut: top_file port map ( clk           => clk,
                           global_input  => global_input,
                           global_output => global_output );

  stimulus: process
  begin

   clk <= '1';
   global_input <= '0';
   wait for 10 ms;
   global_input <= '1';
   wait for 10 ms;

   wait;
  end process;


end;