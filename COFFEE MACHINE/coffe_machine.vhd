library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity coffe_machine is

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

end entity;


architecture arch of coffe_machine is


type state_type is (IDLE,SECIM,cay,nescafe,sicak_cikolata,Turk_kahvesi);
signal state : state_type;

begin


process(clk,rst)
begin
if(rst='1') then 


cay_veriliyor<='0';
nescafe_veriliyor<='0';
sicak_cikolata_veriliyor<='0';
Turk_kahvesi_veriliyor<='0';
state<=IDLE;

elsif(rising_edge(clk)) then 

case state is 
----------------------------------------------------------------------------------
when IDLE=>

cay_veriliyor<='0';
nescafe_veriliyor<='0';
sicak_cikolata_veriliyor<='0';
Turk_kahvesi_veriliyor<='0';

if(secim_tusu='1') then 

state<=SECIM;

else

state<=IDLE;

end if;
----------------------------------------------------------------------------------------------

when SECIM => 

if(numara="001") then

cay_veriliyor<='1';
state<=cay;

elsif(numara="010") then

nescafe_veriliyor<='1';
state<=nescafe;

elsif(numara="011") then

sicak_cikolata_veriliyor<='1';
state<=sicak_cikolata;

elsif(numara="100") then

Turk_kahvesi_veriliyor<='1';
state<=Turk_kahvesi;

end if;

-----------------------------------------------------------------------------------------

when cay => 

state<=IDLE;
cay_veriliyor<='0';

--------------------------------------------------------------------------------------

when nescafe => 

state<=IDLE;
nescafe_veriliyor<='0';

--------------------------------------------------------------------------------------

when sicak_cikolata => 

state<=IDLE;
sicak_cikolata_veriliyor<='0';

---------------------------------------------------------------------------------

when Turk_kahvesi => 

state<=IDLE;
Turk_kahvesi_veriliyor<='0';




---------------------------------------------------------------------------------------

when others => 



cay_veriliyor<='0';
nescafe_veriliyor<='0';
sicak_cikolata_veriliyor<='0';
Turk_kahvesi_veriliyor<='0';
state<=IDLE;


 end case;
 end if;
 end process;
 end arch;

















