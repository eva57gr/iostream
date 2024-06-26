SELECT   
         CASE 
              WHEN TO_CHAR(D.PERIOADA) = '1054'  THEN 'TRM II 2022' 
              WHEN TO_CHAR(D.PERIOADA) = '1055'  THEN 'TRM III 2022'
              WHEN TO_CHAR(D.PERIOADA) = '1053'  THEN 'TRM IV 2022'
              WHEN TO_CHAR(D.PERIOADA) = '1052'  THEN 'TRM I  2022'  
         ELSE  TO_CHAR(D.PERIOADA) END TRIMESTRU,
     --    D.PERIOADA,   
         D.UNIT_CODE,
         D.CUATM,
         D.RIND,
         SUM(D.COL3) AS COL1,
         SUM(D.COL4) AS COL2,
         SUM(D.COL5) AS COL3
        
FROM
  CIS2.VW_DATA_ALL_GC  D

  WHERE
  (D.PERIOADA IN (1055,1054,1053,1052))  AND   
   D.FORM IN (:pFORM) 
   AND D.CAPITOL IN (1198) 
   -- AND D.UNIT_CODE = 822295
  

  
  GROUP BY 
         D.PERIOADA,
         D.UNIT_CODE,
         D.CUATM,
         D.RIND
         
         
         ORDER BY 
           D.UNIT_CODE,
          
         D.RIND