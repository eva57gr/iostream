
SELECT 

CUIIO,
COUNT (CUIIO) AS CNT

FROM 

(
SELECT
           DISTINCT 
           R.CUIIO,
           R.CUATM,
           MAX(R.CUIIO_VERS) CUIIO_VERS,
           MAX(R.DENUMIRE) DENUMIRE 
          
         

  
FROM 
  CIS2.VW_DATA_ALL D 
                INNER JOIN CIS2.RENIM  R  ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
 
WHERE
  D.PERIOADA IN (1064) AND 


  D.FORM IN (45)    
 
GROUP BY
   R.CUIIO,
   R.CUATM
--   R.DENUMIRE
   
   
   ORDER BY 
   R.CUIIO)
   
   
   
   
   GROUP BY 
   CUIIO
   
   HAVING 
   
   COUNT (CUIIO) > 1
  ORDER BY
   CUIIO