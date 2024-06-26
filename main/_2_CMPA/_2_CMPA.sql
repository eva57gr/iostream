SELECT 
                   DISTINCT FC.UNIT_CODE,
                   FC.NAME,
                   R.CUATM,
                   CASE WHEN R.COL1 = 0 THEN NULL ELSE R.COL1 END AS COL1,
                   CASE WHEN R.COL2 = 0 THEN NULL ELSE R.COL2 END AS COL2,
                   CASE WHEN R.COL3 = 0 THEN NULL ELSE R.COL3 END AS COL3,
                   CASE WHEN R.COL4 = 0 THEN NULL ELSE R.COL4 END AS COL4,
                   CASE WHEN R.COL5 = 0 THEN NULL ELSE R.COL5 END AS COL5,
                   CASE WHEN R.COL6 = 0 THEN NULL ELSE R.COL6 END AS COL6,
                   CASE WHEN R.COL7 = 0 THEN NULL ELSE R.COL7 END AS COL7      

                   FROM

(

               SELECT 
                 DISTINCT 
                 
                   FC.UNIT_CODE,
                   FC.UNIT_CODE_VERS,

                   MAX(RR.NAME) NAME

              FROM
              (  

             SELECT 
                   FC.UNIT_CODE,
                   FC.UNIT_CODE_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT

              FROM CIS2.FORM_REG_UNIT_GC  FC
                   INNER JOIN (  
                   
                   SELECT UNIT_CODE, MAX (UNIT_CODE_VERS) UNIT_CODE_VERS
                                   FROM CIS2.FORM_REG_UNIT_GC
                                  WHERE FORM IN (:pFORM_2) AND UNIT_CODE_VERS <= :pPERIOADA_2
                               GROUP BY UNIT_CODE
                               
                               
                               ) BB
                       ON (    BB.UNIT_CODE = FC.UNIT_CODE
                           AND BB.UNIT_CODE_VERS = FC.UNIT_CODE_VERS)
                         

                           
             WHERE 
             FC.FORM IN (:pFORM_2) AND FC.STATUT <> '3' 
             
             
             ORDER BY
             FC.UNIT_CODE_VERS
             
             
             
             ) FC
             
              LEFT JOIN  CIS2.REG_UNIT_GC RR 
                               ON RR.UNIT_CODE = FC.UNIT_CODE
                           AND RR.UNIT_CODE_VERS = FC.UNIT_CODE_VERS
                           
                           
                           GROUP BY
                                              FC.UNIT_CODE,
                                              FC.UNIT_CODE_VERS

             
             
             
             ) FC LEFT JOIN (
             
             
             SELECT 
         D.UNIT_CODE,
         D.CUATM,
         SUM(CASE WHEN D.CAPITOL IN (416) AND D.RIND = '010' THEN D.COL16 ELSE NULL  END) AS COL1,
         SUM(CASE WHEN D.CAPITOL IN (416) AND D.RIND = '020' THEN D.COL16 ELSE NULL  END) AS COL2,
         SUM(CASE WHEN D.CAPITOL IN (416) AND D.RIND = '030' THEN D.COL16 ELSE NULL  END) AS COL3,
         SUM(CASE WHEN D.CAPITOL IN (416) AND D.RIND = '040' THEN D.COL16 ELSE NULL  END) AS COL4,
         SUM(CASE WHEN D.CAPITOL IN (416) AND D.RIND = '050' THEN D.COL16 ELSE NULL  END) AS COL5,
         SUM(CASE WHEN D.CAPITOL IN (416) AND D.RIND IN  ('060','070','080','090') THEN D.COL16 ELSE NULL  END) AS COL6,
         SUM(CASE WHEN D.CAPITOL IN (416) AND D.RIND IN ('100') THEN D.COL16 ELSE NULL  END) AS COL7
         
         
        
       
        
        
FROM
  CIS2.VW_DATA_ALL_GC  D
  
  
  
  ----
  -----
WHERE
  (D.PERIOADA IN (:pPERIOADA_2))  AND   
   D.FORM IN (:pFORM_2) 

  

  
  GROUP BY 
         D.UNIT_CODE,
         D.CUATM

             
             ) R ON R.UNIT_CODE = FC.UNIT_CODE
             
             
--             WHERE 
--             R.UNIT_CODE IS NULL  