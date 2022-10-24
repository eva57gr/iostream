/* Formatted on 10/18/2022 6:15:26 PM (QP5 v5.326) */
  
  SELECT L.CUIIO 
  
  FROM 
  (

  SELECT DISTINCT D.CUIIO
    FROM CIS2.VW_DATA_ALL D
   WHERE D.capitol <> 1199 AND D.PERIOADA IN (1054) AND D.FORM IN (74) ---2121 All ROWS
   --AND D.RIND IN  ('1','2','3','4','5','6','7')
GROUP BY D.CUIIO


) L  LEFT JOIN (

  SELECT DISTINCT D.CUIIO
    FROM CIS2.VW_DATA_ALL D
   WHERE D.capitol =  1199 AND D.PERIOADA IN (1054) AND D.FORM IN (74) ---2121 All ROWS
   AND D.RIND IN  ('1','2','3','4','5','6','7')
GROUP BY D.CUIIO


) R ON R.CUIIO = L.CUIIO 

WHERE 
R.CUIIO IS NULL 
           
        
          
          

            