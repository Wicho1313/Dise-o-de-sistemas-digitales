library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

ENTITY EXAMEN IS

	PORT(clr,CLK,C: IN STD_LOGIC;	
		 Q: INOUT STD_LOGIC_VECTOR (2 DOWNTO 0);
		 DISP: OUT STD_LOGIC_VECTOR (6 DOWNTO 0));		 
END ENTITY;

ARCHITECTURE A_EXAMEN OF EXAMEN IS
	CONSTANT DIG1 : STD_LOGIC_VECTOR(6 DOWNTO 0):= "1001111";
	CONSTANT DIG2 : STD_LOGIC_VECTOR(6 DOWNTO 0):= "0010010";
	CONSTANT DIG3 : STD_LOGIC_VECTOR(6 DOWNTO 0):= "0000110";
	CONSTANT DIG4 : STD_LOGIC_VECTOR(6 DOWNTO 0):= "1001100";
	CONSTANT DIG5 : STD_LOGIC_VECTOR(6 DOWNTO 0):= "0100100";
	CONSTANT DIG6 : STD_LOGIC_VECTOR(6 DOWNTO 0):= "0100000";
	CONSTANT APAG : STD_LOGIC_VECTOR(6 DOWNTO 0):= "1111111";

BEGIN 
   PROCESS (CLK,clr,Q)
   BEGIN 
		IF (clr='1') THEN 
			DISP<=APAG;
		ELSIF(CLK'EVENT AND CLK='1')THEN 
			case c is
				when '1' => Q<= Q+1;
				when others => Q<=Q;
			end case;
		END IF;
	END PROCESS;
	
	COD: PROCESS(Q)
	BEGIN
		CASE Q IS
			WHEN "001" => DISP<=DIG1;
			WHEN "010" => DISP<=DIG2;
			WHEN "011" => DISP<=DIG3;
			WHEN "100" => DISP<=DIG4;
			WHEN "101" => DISP<=DIG5;
			WHEN "110" => DISP<=DIG6;
			WHEN OTHERS => DISP<=DIG1;
		END CASE;
	 END PROCESS COD;
END A_EXAMEN;