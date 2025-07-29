SELECT 
--     d.cuiio,   
     SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||'9.2.2'||';%'
      AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL1,
           SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||'9.2.1'||';%'
      AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL2,
                 SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||'7.1'||';%'
      AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL3,
                 SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||'3.7.2'||';%'
      AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL4,
                 SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||'3.4'||';%'
      AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL5,
                   SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||'3.11'||';%'
      AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL6,
                   SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||'10.3.5'||';%'
      AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL7,
                      SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||'10.2.2'||';%'
      AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL8,
                         SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||'10.2.1.3'||';%'
      AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL9,
                             SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||'10.2.1.2'||';%'
      AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL10,
                                  SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||'10.1.2'||';%'
      AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL11,
               SUM(CASE WHEN  D.CAPITOL IN (405)   AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||'10.1.1.1'||';%'
      AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL12
               
     

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
