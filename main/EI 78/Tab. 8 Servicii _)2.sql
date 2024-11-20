


SELECT 



     
   -- CI.ITEM_CODE,   
   
   DISTINCT   D.CUIIO, 
    TRIM(D.COL31) AS CODUL,

     ROUND((SUM(CASE WHEN  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) )/1000,1) AS COL3

     FROM VW_DATA_ALL D

         

             
             
             
      --    INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE))
         
--          INNER JOIN VW_CLS_CLASS_ITEM CII ON (CII.CLASS_CODE IN ('CSPM2')
--          
--     
--          AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||TRIM(CII.ITEM_CODE)||';%')
   
        -------------------------------------------------------------------------------
        
        ------------------------------------------------------------------------------       
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  --(:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND D.CAPITOL IN (407) 
  
  GROUP BY 
  D.CUIIO,
TRIM(D.COL31)


HAVING 
ROUND((SUM(CASE WHEN  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) )/1000,1) > 0

ORDER BY
TRIM(D.COL31)


  

  




  
