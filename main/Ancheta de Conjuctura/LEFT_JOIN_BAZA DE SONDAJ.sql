
SELECT 
 
L.CUIIO,
R.CUIIO
FROM

(

SELECT
 DISTINCT D.CUIIO
FROM
VW_DATA_ALL  D                                  
WHERE
  (D.PERIOADA=:PERIOADA) AND

   D.CAPITOL IN (1197,1199)
   
   AND D.FORM = 74
  
  
  GROUP BY
  D.CUIIO 
  
  
  
  ) L  LEFT JOIN (
  SELECT 
CUIIO     
    FROM CIS2.X_BAZA_SONDAJ
    
    WHERE 
    ANUL = 2023
   -- ANUL = 2023

--AND PERS_IT <> 0
    
    
  ) R ON R.CUIIO = L.CUIIO 
  
  
  WHERE 
  R.CUIIO IS NULL 



  