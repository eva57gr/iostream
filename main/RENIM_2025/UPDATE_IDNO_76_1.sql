DECLARE -- ====================================================================

CURSOR C IS

  SELECT
  
  CUIIO,
  CUIIO_VERS,
  IDNO
  FROM CIS2.RENIM
  
  WHERE
  CUIIO_VERS = 2013
  
 
            
            --------------------------------
            ;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS2.RENIM SET
--
--DENUMIRE = CR.DENUMIRE,
--CUATM = CR.CUATM
--CFP = CR.CFP,
--CFOJ = CR.CFOJ,
--CAEM2 = CR.CAEM2,
IDNO = CR.IDNO

WHERE
CUIIO = CR.CUIIO 
--AND 
--CUIIO_VERS = CR.CUIIO_VERS

;
END LOOP;
END;

---------------------------