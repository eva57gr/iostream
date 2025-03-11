DECLARE -- ====================================================================

CURSOR C IS

 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ,
        L.CAEM2,
        RTRIM(TRIM(L.IDNO)) AS IDNO
         FROM  USER_BANCU.AGRO_16 L
        
        WHERE
        (L.IDNO IS NOT NULL
        AND  
        L.IDNO NOT IN ('???????'))
        AND 
        L.CFOJ IS NOT NULL
        
        AND 
           
        L.CFP IS NOT NULL
        
        ORDER BY        
        IDNO


            ;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS2.RENIM SET

--DENUMIRE = CR.DENUMIRE,
--CUATM = CR.CUATM,
CFP = CR.CFP,
CFOJ = CR.CFOJ,
--CAEM2 = CR.CAEM2,
IDNO = CR.IDNO

WHERE
CUIIO = CR.CUIIO 
AND 
CUIIO_VERS = CR.CUIIO_VERS;
END LOOP;
END;

---------------------------