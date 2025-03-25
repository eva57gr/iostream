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
        L.IDNO
       
        
        FROM  USER_BANCU."16_AGRO" L 
          
        
      
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