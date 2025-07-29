SELECT 
--     d.cuiio,   
     SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||'9.2.2'||';%'
      AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL1 --2147040775
     

     FROM VW_DATA_ALL D
         INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE)) 
         
         
                 
       
   WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  
  D.FORM IN (44)
  AND D.CAPITOL IN (405) 
--  and CI.ITEM_CODE in ('9.2.2')
  
  
--  GROUP BY 
--  d.cuiio
----  CII.SHOW_ORDER,  
----  CII.NAME
