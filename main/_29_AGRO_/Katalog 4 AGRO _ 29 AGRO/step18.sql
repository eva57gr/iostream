DECLARE -- ====================================================================

CURSOR C IS

 SELECT
                   R.CUIIO,
                   R.CUIIO_VERS,
                   L.DENUMIRE,
                   L.CUATM,
                   L.CFP,
                   L.CFOJ,
                   L.CAEM2,
                   L.IDNO

            FROM USER_BANCU.VW_4_AGRO_2013 L RIGHT JOIN USER_BANCU.VW_29_AGRO_1061 R ON R.CUIIO = L.CUIIO 
            
            WHERE 
            R.CUIIO IS NOT NULL     ;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS2.RENIM SET

DENUMIRE = CR.DENUMIRE,
CUATM = CR.CUATM,
CFP = CR.CFP,
CFOJ = CR.CFOJ,
CAEM2 = CR.CAEM2,
IDNO = CR.IDNO

WHERE
CUIIO = CR.CUIIO AND 
CUIIO_VERS = CR.CUIIO_VERS;
END LOOP;
END;