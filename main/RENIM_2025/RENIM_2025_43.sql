DECLARE -- ====================================================================

CURSOR C IS


     SELECT
  D.CUIIO,
  D.CUIIO_VERS,
  D.DENUMIRE,
  D.CUATM,
  D.CFP,
  D.CFOJ,
  D.CAEM2,
  D.IDNO
  FROM USER_BANCU.RENIM_5_CON D
            ;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS2.FORM_CUIIO SET

  STATUT = '3'
--DENUMIRE = CR.DENUMIRE,
--CUATM = CR.CUATM
--CFP = CR.CFP,
--CFOJ = CR.CFOJ,
--CAEM2 = CR.CAEM2,
--TIP = CR.TIP,
--IDNO = CR.IDNO

WHERE
CUIIO = CR.CUIIO 
AND 
CUIIO_VERS = CR.CUIIO_VERS

AND FORM = 18
AND FORM_VERS = 1004
AND STATUT = '1' 

;
END LOOP;
END;

---------------------------