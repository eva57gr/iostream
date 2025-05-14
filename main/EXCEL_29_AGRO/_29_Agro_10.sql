SELECT

   D.*
--           DISTINCT 
--           R.CUIIO,
--           MAX(R.DENUMIRE) DENUMIRE 
          
         

  
FROM 
  CIS2.VW_DATA_ALL D 
           --     INNER JOIN CIS2.RENIM  R  ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
 
WHERE
  D.PERIOADA IN (1064) AND 


  D.FORM IN (45)
  
  AND D.CUIIO = 400018      
 
--GROUP BY
--   R.CUIIO
--  -- R.DENUMIRE
--   
--   
--   ORDER BY 
--   R.CUIIO