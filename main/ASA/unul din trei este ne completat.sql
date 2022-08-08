SELECT 
       DISTINCT  D.CUIIO,  
       
                     D.CAPITOL,
                     D.CAPITOL_DEN,
                     SUM(D.COL1) AS COL1,
                     D.COL31     
 
            FROM CIS2.VW_DATA_ALL D
                    WHERE 
                    D.FORM IN (64)
                    AND D.PERIOADA = 2010   
                   AND D.CAPITOL IN (1178,1179,1180,1129)
                    GROUP BY 
                    D.CUIIO,
                    D.CAPITOL,
                    D.CAPITOL_DEN,
                    D.COL31  
                    
                    HAVING 
--                   SUM(CASE  WHEN D.CAPITOL IN (1178,1179,1180) THEN NVAL(D.COL1) ELSE 0 END ) > 0
                   
--                   AND 
--                   
                (   
               D.COL31  LIKE  '45%' 
                    OR
                      D.COL31  LIKE  '46%'
                     OR 
                     
                      D.COL31  LIKE  '47%'   
                      
                      )
                   

AND SUM(D.COL1) > 0 
                   ORDER BY 
                   D.CUIIO,
                   D.CAPITOL
                   
         