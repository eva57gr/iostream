DECLARE -- ====================================================================

CURSOR C IS

  SELECT
  ORDINE,
  CUIIO,
  CUIIO_VERS,
  DENUMIRE,
  CUATM,
  CFP,
  CFOJ,
  CAEM2,
  IDNO
  
  FROM USER_BANCU.RENIM_24_F
  
  WHERE
  CUIIO IS NOT NULL 
  
  ORDER BY
  ORDINE
            
            --------------------------------
            ;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS2.RENIM SET

DENUMIRE = CR.DENUMIRE,
CUATM = CR.CUATM,
CFP = CR.CFP,
CFOJ = CR.CFOJ,
CAEM2 = CR.CAEM2,
TIP = CR.TIP,
IDNO = CR.IDNO

WHERE
CUIIO = CR.CUIIO 
AND 
CUIIO_VERS = CR.CUIIO_VERS;
END LOOP;
END;

---------------------------