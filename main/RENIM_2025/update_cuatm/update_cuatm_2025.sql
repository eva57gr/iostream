DECLARE -- ====================================================================

CURSOR C IS


SELECT
  D.CUIIO,
  D.CUIIO_VERS,
 -- D.DENUMIRE,
  D.CUATM
  --D.CFP,
 -- D.CAEM2,
  --D.IDNO
   FROM USER_BANCU.AGRO_24 D
  
--  WHERE 
--  CUIIO = 40091981
  ;
---------------------------
BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS2.RENIM SET

--  STATUT = '3'
--DENUMIRE = CR.DENUMIRE,
CUATM = CR.CUATM
--IDNO = CR.IDNO
--CFP = CR.CFP,
--CFOJ = CR.CFOJ,
--CAEM2 = CR.CAEM2,
--ETAPA_PROD = CR.ETAPA_PROD
--TIP = CR.TIP,
--IDNO = CR.IDNO

WHERE
CUIIO = CR.CUIIO 
AND 
CUIIO_VERS IN (2013,2014)  

--AND FORM = 63
--AND FORM_VERS = 2000
--AND STATUT = '1' 

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