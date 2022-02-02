library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity tb_coffe_machine is
end entity;

architecture Behavioral of tb_coffe_machine is

component coffe_machine is

port(

clk : in std_logic;
rst : in std_logic;

secim_tusu : in std_logic;
numara : in std_logic_vector(2 downto 0);

cay_veriliyor : out std_logic;
nescafe_veriliyor: out std_logic;
sicak_cikolata_veriliyor : out std_logic;
Turk_kahvesi_veriliyor : out std_logic


);

end component;



signal clk :  std_logic;
signal rst :  std_logic;

signal secim_tusu :  std_logic;
signal numara :  std_logic_vector(2 downto 0);

signal cay_veriliyor :  std_logic;
signal nescafe_veriliyor:  std_logic;
signal sicak_cikolata_veriliyor :  std_logic;
signal Turk_kahvesi_veriliyor :  std_logic;

constant clock_period : time:=20ns;

begin 

clock_process: process
begin 

clk<='0';
wait for clock_period/2;

clk<='1';
wait for clock_period/2;

end process;

uut : coffe_machine port map(

clk=>clk,
rst=>rst,

secim_tusu=>secim_tusu,
numara=>numara,

cay_veriliyor=>cay_veriliyor,
nescafe_veriliyor=>nescafe_veriliyor,
sicak_cikolata_veriliyor=>sicak_cikolata_veriliyor,
Turk_kahvesi_veriliyor=>Turk_kahvesi_veriliyor
);

stim_process : process
begin

rst<='1';
secim_tusu<='0';
numara<=(others=>'0');
wait for 100ns;

rst<='0';
wait for clock_period*2;




secim_tusu<='1';
numara<="001";
wait for clock_period;
secim_tusu<='0';
wait for clock_period*20;

-----------------------------------------------------------------------

secim_tusu<='1';
numara<="010";
wait for clock_period;
secim_tusu<='0';
wait for clock_period*20;


-----------------------------------------------------------------------

secim_tusu<='1';
numara<="011";
wait for clock_period;
secim_tusu<='0';
wait for clock_period*20;

-----------------------------------------------------------------------

secim_tusu<='1';
numara<="100";
wait for clock_period;
secim_tusu<='0';
wait for clock_period*20;








wait;
end process;
end Behavioral;





