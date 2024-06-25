SELECT 
         D.UNIT_CODE,
         D.CUATM,
         SUM(CASE WHEN D.CAPITOL IN (416) AND D.RIND = '010' THEN D.COL16 ELSE NULL  END) AS COL1
        
       
        
        
FROM
  CIS2.VW_DATA_ALL_GC  D
  
  ----
  -----
WHERE
  (D.PERIOADA IN (1059))  AND   
   D.FORM IN (58) 

  

  
  GROUP BY 
         D.UNIT_CODE,
         D.CUATM
