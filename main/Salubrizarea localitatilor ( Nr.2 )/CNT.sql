SELECT
 
 COUNT (DISTINCT D.CUIIO) AS CNT
               
     
    FROM CIS2.VW_DATA_ALL D 
    
           
    WHERE 
    
    D.PERIOADA IN (:pPERIOADA)
    AND D.FORM IN (:pFORM)    
    AND D.CAPITOL IN (365)
    AND D.RIND IN ('0000000')