library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity delay is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           delay_clks : in  STD_LOGIC_VECTOR (28 downto 0);
           delay_clk : out  STD_LOGIC);
end delay;

architecture Behavioral of delay is

	signal clk_buffer : std_logic := '0';
	signal counter : integer range 0 to (2**delay_clks'high) - 1 := 0;
	
	
begin

	delay_clk <= clk_buffer;
	
	process(clk, rst)
	begin
		if(rising_edge(clk)) then
			if(rst = '1') then
				counter <= 0;
				clk_buffer <= '0';
			else
				if(counter = 0) then
					clk_buffer <= not clk_buffer;
				end if;
				counter <= counter + 1;
			end if;
		end if;
	end process;

end Behavioral;

