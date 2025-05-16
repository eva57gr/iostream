DECLARE -- ====================================================================

CURSOR C IS

 SELECT 
TRIM(L.CUIIO) CUIIO,
TRIM(R.CUIIO_VERS) CUIIO_VERS,
TRIM(L.CAEM2) CAEM2
FROM USER_BANCU.M1_1064 L LEFT JOIN (
SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (76) AND CUIIO_VERS <= 1064
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (76) AND FC.STATUT <> '3'
             and FC.FORM_VERS = 1004 
) R ON R.CUIIO = L.CUIIO 

WHERE
R.CUIIO IS NOT NULL

  
 
            
            --------------------------------
            ;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS2.RENIM SET
--
--DENUMIRE = CR.DENUMIRE,
--CUATM = CR.CUATM
--CFP = CR.CFP
----CFOJ = CR.CFOJ,
CAEM2 = CR.CAEM2
--IDNO = CR.IDNO

WHERE
CUIIO = CR.CUIIO 
AND 
CUIIO_VERS = CR.CUIIO_VERS;
END LOOP;
END;

---------------------------