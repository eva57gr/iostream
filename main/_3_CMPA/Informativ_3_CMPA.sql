SELECT 
                   DISTINCT FC.UNIT_CODE,
                   FC.NAME,
                   R.CUATM,
                   CASE WHEN R.COL1 = 0 THEN NULL ELSE R.COL1 END AS COL1,
                   CASE WHEN R.COL2 = 0 THEN NULL ELSE R.COL2 END AS COL2
                 
                      

                   FROM

(

SELECT FC.UNIT_CODE,
                   FC.UNIT_CODE_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT,
                   RR.NAME
              FROM CIS2.FORM_REG_UNIT_GC  FC
                   INNER JOIN (  
                   
                   SELECT UNIT_CODE, MAX (UNIT_CODE_VERS) UNIT_CODE_VERS
                                   FROM CIS2.FORM_REG_UNIT_GC
                                  WHERE FORM IN (:pFORM) AND UNIT_CODE_VERS <= :pPERIOADA
                               GROUP BY UNIT_CODE
                               
                               
                               ) BB
                       ON (    BB.UNIT_CODE = FC.UNIT_CODE
                           AND BB.UNIT_CODE_VERS = FC.UNIT_CODE_VERS)
                         
                         INNER JOIN  CIS2.REG_UNIT_GC RR 
                               ON RR.UNIT_CODE = BB.UNIT_CODE
                           AND RR.UNIT_CODE_VERS = BB.UNIT_CODE_VERS
                           
             WHERE 
             FC.FORM IN (:pFORM) AND FC.STATUT <> '3' 
             
             
             
             ) FC LEFT JOIN (
             
             
             SELECT 
         D.UNIT_CODE,
         D.CUATM,
         SUM(CASE WHEN D.CAPITOL IN (1115) AND D.RIND = '6000' THEN D.COL1 ELSE NULL  END) AS COL1,
         SUM(CASE WHEN D.CAPITOL IN (1116) AND D.RIND = '6200' THEN D.COL1 ELSE NULL  END) AS COL2
         
         
         
        
       
        
        
FROM
  CIS2.VW_DATA_ALL_GC  D
  
  
  
  ----
  -----
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
   D.FORM IN (:pFORM) 
   -- AND D.UNIT_CODE =822223
  

  
  GROUP BY 
         D.UNIT_CODE,
         D.CUATM

             
             ) R ON R.UNIT_CODE = FC.UNIT_CODE
             
             
--             WHERE 
--             R.UNIT_CODE IS NULL  