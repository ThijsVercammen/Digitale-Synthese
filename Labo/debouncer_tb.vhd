library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity debouncer_tb is
end debouncer_tb;

architecture structural of debouncer_tb is 

-- Component Declaration
component debouncer
port (
	clk: in std_logic;
	sig_in: in std_logic;
	rst: in std_logic;
	sync_out: out std_logic
  );
end component;

-- uut1, uut2 verschillend initaties van component counter, handig om meerdere counters te gebruiken (ipv copy paste)
for uut : debouncer use entity work.debouncer(behav);
 
constant period : time := 100 ns;
constant delay  : time :=  10 ns;
signal end_of_sim : boolean := false;

-- interne testcomponent waarden, moeten niet noodzakelijk hetzelfde zijn als de entiteit
signal clk:  std_logic;
signal rst:  std_logic;
signal sig_in:  std_logic;
signal sync_out: std_logic;

BEGIN

	uut: debouncer PORT MAP(
	-- links naam entiteit, rechts naam testcomponent
      clk => clk,
      rst => rst,
      sig_in => sig_in,
      sync_out => sync_out);

	clock : process
   begin 
       clk <= '0';
       wait for period/2;
     loop
       clk <= '0';
       wait for period/2;
       clk <= '1';
       wait for period/2;
       exit when end_of_sim;
     end loop;
     wait;
   end process clock;
	
tb : PROCESS
-- procedure -> functie aanmaken die kan opgeroepen worden
   procedure tbvector(constant stimvect : in std_logic_vector(1 downto 0))is
     begin
      sig_in <= stimvect(1);
      rst <= stimvect(0);

       wait for period;
   end tbvector;
   BEGIN
       
      tbvector("01");
      tbvector("01");
      tbvector("00");
      tbvector("00");
      -- wait for period*10 -> hou signaal 10 clk periodes aan
      tbvector("10");
      tbvector("10");
      tbvector("10");
      tbvector("10");
      tbvector("00");
      tbvector("00");
      tbvector("01");
      tbvector("01");   
                        
      end_of_sim <= true;
      wait;
   END PROCESS;

  END;





