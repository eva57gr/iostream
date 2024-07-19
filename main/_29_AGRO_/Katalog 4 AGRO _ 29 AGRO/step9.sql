DECLARE -- ====================================================================

CURSOR C IS

  SELECT 
                  C.CUIIO,
                  C.CUIIO_VERS,
                  C.DENUMIRE,
                  C.CUATM,
                  C.CFP,
                  C.CFOJ, 
                  C.CAEM2,
                  C.IDNO        
  
  FROM USER_BANCU.VW_4_AGRO_1061  C
         
;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS2.RENIM SET
--DENUMIRE = CR.DENUMIRE,
--CUATM = CR.CUATM,
--CFP = CR.CFP,
CFOJ = CR.CFOJ
--CAEM2 = CR.CAEM2,
--IDNO = CR.IDNO

WHERE
CUIIO = CR.CUIIO AND 
CUIIO_VERS = CR.CUIIO_VERS
AND CUIIO_VERS = 2012
;
END LOOP;
END;