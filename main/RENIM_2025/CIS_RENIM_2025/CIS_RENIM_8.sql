DECLARE -- ====================================================================

CURSOR C IS

 SELECT 
 
        TRIM(L.CUIIO) CUIIO ,
        L.CUIIO_VERS,
        TRIM(L.DENUMIRE)  DENUMIRE,
        TRIM(L.CUATM) CUATM,
        TRIM(L.CFP) CFP,
        TRIM(L.CAEM2)  CAEM2
        FROM   USER_BANCU.INVEST_2 L
  
 
            
            --------------------------------
            ;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS.RENIM SET
--
DENUMIRE = CR.DENUMIRE,
CUATM = CR.CUATM,
CFP = CR.CFP,
--CFOJ = CR.CFOJ,
CAEM2 = CR.CAEM2
--IDNO = CR.IDNO

WHERE
CUIIO = CR.CUIIO 
AND 
CUIIO_VERS = CR.CUIIO_VERS;
END LOOP;
END;

---------------------------