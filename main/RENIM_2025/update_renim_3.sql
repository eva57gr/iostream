DECLARE -- ====================================================================

CURSOR C IS


 SELECT 
 
        L.CUIIO,
        L.CUIIO_VERS,
        L.DENUMIRE,
        L.CUATM,
        L.CFP,
        L.CFOJ,
        L.CAEM2
       
        
        FROM  ADD_NEW_SU_M3_2024 L 
           LEFT JOIN CIS2.RENIM R 
        
        ON L.CUIIO =   R.CUIIO AND L.CUIIO_VERS = R.CUIIO_VERS
        
        WHERE
        R.CUIIO IS NOT   NULL 
          ;
---------------------------
BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS2.RENIM SET

DENUMIRE = CR.DENUMIRE,
CUATM = CR.CUATM,
CFP = CR.CFP,
CFOJ = CR.CFOJ,
CAEM2 = CR.CAEM2


WHERE
CUIIO = CR.CUIIO 
AND 
CUIIO_VERS = CR.CUIIO_VERS 
;
END LOOP;
END;

---------------------------












SELECT
  D.CUIIO,
  D.CUIIO_VERS,
  D.DENUMIRE,
  D.CUATM,
  D.CFP,
 
  D.CAEM2,
  D.ETAPA_PROD
 
  FROM USER_BANCU.PROD_24 D