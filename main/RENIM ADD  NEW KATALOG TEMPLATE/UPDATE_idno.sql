DECLARE -- ====================================================================

CURSOR C IS

SELECT 
  CUIIO,
  
  IDNO  

--------------------------------
------------------------------------
FROM USER_BANCU.IDNO 
            
            --------------------------------
            ;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS2.RENIM SET

--DENUMIRE = CR.DENUMIRE,
--CUATM = CR.CUATM,
--CFP = CR.CFP,
--CFOJ = CR.CFOJ,
--CAEM2 = CR.CAEM2,
IDNO = CR.IDNO

WHERE
CUIIO = CR.CUIIO; 
--AND 
--CUIIO_VERS = CR.CUIIO_VERS;
END LOOP;
END;

---------------------------