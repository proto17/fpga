library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.conv_std_logic_vector;

entity buttons is
    Port ( rst : in  STD_LOGIC;
           up : in  STD_LOGIC;
           down : in  STD_LOGIC;
           leds : out  STD_LOGIC_VECTOR (7 downto 0));
end buttons;

architecture Behavioral of buttons is

	signal counter : integer range 0 to 255 := 0;
	
begin

	leds <= conv_std_logic_vector(counter, 8);

	process(up, down, rst)
	begin
		if(rising_edge(rst)) then
			counter <= 0;
		elsif(rising_edge(up)) then
			if(counter < 255) then
				counter <= counter + 1;
			end if;
		elsif(rising_edge(down)) then
			if(counter > 0) then
				counter <= counter - 1;
			end if;
		end if;
	end process;
end Behavioral;

