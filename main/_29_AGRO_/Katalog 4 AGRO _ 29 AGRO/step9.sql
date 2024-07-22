DECLARE -- ====================================================================

CURSOR C IS

 SELECT *
           
        FROM USER_BANCU.PRODMOLD
        WHERE
        TIP IS  NOT NULL
        
        
        

         
;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS.RENIM SET
--DENUMIRE = CR.DENUMIRE,
--CUATM = CR.CUATM,
--CFP = CR.CFP,
--CFOJ = CR.CFOJ
--CAEM2 = CR.CAEM2
--IDNO = CR.IDNO
ETAPA_PROD = CR.TIP

WHERE
CUIIO = CR.CUIIO AND 
CUIIO_VERS = CR.CUIIO_VERS
--AND CUIIO_VERS = 2012
;
END LOOP;
END;