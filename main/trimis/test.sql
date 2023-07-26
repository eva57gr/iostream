SELECT 
 
    D.CUIIO,
    SUM(D.COL4) COL1,
    SUM(D.COL4) / CR.COL1 AS COL2,
    CR.COL1 AS COL3 
FROM CIS2.DATA_ALL D 
        
        CROSS JOIN (
        SELECT
           D.PERIOADA,
            SUM(D.COL1) AS COL1
                        
                  FROM DATA_ALL D
                        WHERE
                          (D.PERIOADA = :pPERIOADA) AND        
                            
                          
                           D.ID_MD  = 44519 
                           
                           
                           GROUP BY 
                           D.PERIOADA
                           
                         
  ) CR
        ----------------------------------------------------------------------------   
        
   WHERE 

  (D.PERIOADA = :pPERIOADA) AND 
  (D.FORM =44) AND
 
  D.FORM IN (44) 
  
  AND D.CUIIO = 19206
 
  GROUP BY 

  D.CUIIO,
  CR.COL1
  
  ORDER BY
  D.CUIIO
  
  
 