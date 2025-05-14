SELECT
           DISTINCT R.CUIIO,
           MAX(R.CUIIO_VERS) CUIIO_VERS,
           MAX(R.DENUMIRE) DENUMIRE,
           MAX(R.CUATM) CUATM,
           MAX(R.CFP) CFP,
           MAX(R.CFOJ) CFOJ,
           MAX(R.COCM) COCM,
           MAX(R.CAEM2) CAEM2,
           MAX(R.CAEM) CAEM,
           MAX(R.IDNO) IDNO 

  
FROM 
  CIS2.VW_DATA_ALL D INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
                INNER JOIN CIS2.RENIM  R  ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
 
WHERE
  D.PERIOADA IN (1064) AND 


  D.FORM IN (45)    
 
GROUP BY
  R.CUIIO
--  ,
--           R.CUIIO_VERS,
--           R.DENUMIRE,
--           R.CUATM,
--           R.CFP,
--           R.CFOJ,
--           R.COCM,
--           R.CAEM2,
--           R.CAEM,
--           R.IDNO;