SELECT *
  FROM USER_BANCU.KATALOG_24_2013; 


INSERT INTO USER_BANCU.KATALOG_24_2013 
(
             CUIIO,
             CUIIO_VERS,
             DENUMIRE,
             CUATM,
             CFP,
             CFOJ,
             COCM,
             CAEM2,
             CAEM,
             IDNO
 
 )




           SELECT
             CUIIO,
             CUIIO_VERS,
             DENUMIRE,
             CUATM,
             CFP,
             CFOJ,
             COCM,
             CAEM2,
             CAEM,
             IDNO 
 FROM USER_BANCU.VW_24_AGRO_2013;

;
SELECT *

FROM VW_24_AGRO_2013 

;
CREATE OR REPLACE FORCE VIEW VW_24_AGRO_2013 
(
           CUIIO,
           CUIIO_VERS,
           DENUMIRE,
           CUATM,
           CFP,
           CFOJ,
           COCM,
           CAEM2,
           CAEM,
           IDNO
 
 )
AS 



SELECT
           R.CUIIO,
           R.CUIIO_VERS,
           R.DENUMIRE,
           R.CUATM,
           R.CFP,
           R.CFOJ,
           R.COCM,
           R.CAEM2,
           R.CAEM,
           R.IDNO

  
FROM 
  CIS2.VW_DATA_ALL D INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
                INNER JOIN CIS2.RENIM  R  ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
 
WHERE
  D.PERIOADA IN (2013) AND 


  D.FORM IN (27)    
 
GROUP BY
  R.CUIIO,
           R.CUIIO_VERS,
           R.DENUMIRE,
           R.CUATM,
           R.CFP,
           R.CFOJ,
           R.COCM,
           R.CAEM2,
           R.CAEM,
           R.IDNO
 
  
