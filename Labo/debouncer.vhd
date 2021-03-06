library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity debouncer is
   port (
	clk: in std_logic;
	sig_in: in std_logic;
	rst: in std_logic;
	sync_out: out std_logic
	);
end debouncer;

architecture behav of debouncer is
    
signal pres_shift, next_shift: std_logic_vector(3 downto 0);
signal ld_sh: std_logic;

begin
    
sync_out <= pres_shift(0);

syn_debouncer: process(clk)
begin
    
if rising_edge(clk) then
    if rst = '1' then
          pres_shift <= (others => '0'); -- zet toestand shift register op 0000
    else
          pres_shift <= next_shift;
    end if;
end if;

end process syn_debouncer;

com_debouncer: process(pres_shift, sig_in)
begin
	ld_sh <= sig_in xor pres_shift(0);
	if(ld_sh = '1') then
   		next_shift <= sig_in & pres_shift(2 DOWNTO 0);
	else
   		next_shift <= (others => pres_shift(0)) ;
	end if;

end process com_debouncer; 
    
end behav;
    