library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.conv_std_logic_vector;

entity composite is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           led : out  STD_LOGIC);
end composite;

architecture Behavioral of composite is

	component delay is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           delay_clks : in  STD_LOGIC_VECTOR (28 downto 0);
           delay_clk : out  STD_LOGIC);
	end component;
	
	signal slow_clk : std_logic := '0';
	signal led_buffer : std_logic := '0';
	
begin

	led <= led_buffer;

	my_delay : delay port map(
		clk => clk,
		rst => rst,
		delay_clks => conv_std_logic_vector(50000000, 29),
		delay_clk => slow_clk);

	process(slow_clk, rst)
	begin
		if(rising_edge(slow_clk)) then
			if(rst = '1') then
				led_buffer <= '0';
			else
				led_buffer <= not led_buffer;
			end if;
		end if;
	end process;

end Behavioral;

