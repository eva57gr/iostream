SELECT 
     d.cuiio,   
     SUM(CASE WHEN  D.CAPITOL IN (405) and CI.ITEM_CODE in ('62.01.11','62.01.12','62.02.10','62.02.20','62.02.30','62.03.11','62.03.12','62.09.20','63.11.11','63.11.12','63.11.13','63.11.19', '95.11')
      AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL1,
      
           SUM(CASE WHEN  D.CAPITOL IN (405) and CI.ITEM_CODE in ('58.21.2','58.21.3','58.29.31','58.29.32','58.29.40','62.01.21','62.01.29')
      AND D.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) AS COL2,
      
       SUM(CASE 
             WHEN D.CAPITOL IN (405) 
               AND CI.ITEM_CODE IN (
                    '64.11.10','64.19.11','64.19.12','64.19.21','64.19.22',
                    '64.19.23','64.19.24','64.19.25','64.19.26','64.19.29',
                    '64.19.30','64.2','64.3','64.91.10','64.92.11','64.92.12',
                    '64.92.13','64.92.14','64.92.15','64.92.16','64.92.19',
                    '64.99.11','64.99.19','66.11','66.12','66.19','66.30.11'
               )
               AND D.RIND NOT IN ('1','-')  
             THEN CIS2.NVAL(D.COL4) 
             ELSE 0 
         END) AS COL3,
      SUM(CASE 
             WHEN D.CAPITOL IN (405) 
               AND CI.ITEM_CODE IN (
                    '49.41.1','49.41.2','49.42.1'
               )
               AND D.RIND NOT IN ('1','-')  
             THEN CIS2.NVAL(D.COL4) 
             ELSE 0 
         END) AS COL4,
         SUM(CASE 
             WHEN D.CAPITOL IN (405) 
               AND CI.ITEM_CODE IN (
                    '53.10.11','53.10.12','53.10.13','53.10.14','53.10.19',
                    '53.20.11','53.20.12','53.20.19'
               )
               AND D.RIND NOT IN ('1','-')  
             THEN CIS2.NVAL(D.COL4) 
             ELSE 0 
         END) AS COL5,
         
         SUM(CASE 
             WHEN D.CAPITOL IN (405) 
               AND CI.ITEM_CODE IN (
                    '35.12.10','52.10.1','52.24.11','52.24.12','52.24.13',
                    '52.24.19','52.29.1','52.29.2','56.29.11','81.29.19'
               )
               AND D.RIND NOT IN ('1','-')  
             THEN CIS2.NVAL(D.COL4) 
             ELSE 0 
         END) AS COL6,
         SUM(CASE 
             WHEN D.CAPITOL IN (405) 
               AND CI.ITEM_CODE IN (
                    '18.11.1','18.12.1','18.13.1','18.13.3','18.14.1',
                    '18.20.10','18.20.20','18.20.30','33.20','35.13.10',
                    '35.22.10','35.30.12','35.30.22','36.00.20','58.11.5',
                    '62.09.10','63.99.10','68.10.11','68.10.12','68.10.14',
                    '68.31.11','68.31.12','68.31.13','68.31.14','68.31.15',
                    '68.31.16','68.32.11','68.32.12','68.32.13','74.10.11',
                    '74.10.19','74.20.21','74.20.23','74.20.24','74.20.29',
                    '74.20.3','74.30.11','74.30.12','74.90.11','74.90.12',
                    '74.90.15','74.90.20','78.1','78.2','78.3','79','80.10.11',
                    '80.10.12','80.10.19','80.2','80.3','81.1','81.21.1',
                    '81.22.1','81.29.11','81.3','82.11.10','82.19.11','82.19.12',
                    '82.19.13','82.2','82.91.11','82.91.12','82.99.11','82.99.12',
                    '82.99.19'
               )
               AND D.RIND NOT IN ('1','-')  
             THEN CIS2.NVAL(D.COL4) 
             ELSE 0 
         END) AS COL7,
       SUM(CASE 
             WHEN D.CAPITOL IN (405) 
               AND CI.ITEM_CODE IN (
                    '58.11.4','58.13.3','58.14.3','59.11.3','60.10.3','60.20.4',
                    '63.11.30','73.11.11','73.11.12','73.11.13','73.11.19',
                    '73.12.11','73.12.12','73.12.13','73.12.14','73.12.19',
                    '73.12.20','73.20.11','73.20.12','73.20.13','73.20.14',
                    '73.20.19','73.20.20','74.20.22'
               )
               AND D.RIND NOT IN ('1','-')  
             THEN CIS2.NVAL(D.COL4) 
             ELSE 0 
         END) AS COL8,
         SUM(CASE 
             WHEN D.CAPITOL IN (405) 
               AND CI.ITEM_CODE IN (
                    '70.1','70.21.1','70.22.1','70.22.2'
               )
               AND D.RIND NOT IN ('1','-')  
             THEN CIS2.NVAL(D.COL4) 
             ELSE 0 
         END) AS COL9,
         SUM(CASE 
             WHEN D.CAPITOL IN (405) 
               AND CI.ITEM_CODE IN (
                    '69.20.1','69.20.2','69.20.3','69.20.4'
               )
               AND D.RIND NOT IN ('1','-')  
             THEN CIS2.NVAL(D.COL4) 
             ELSE 0 
         END) AS COL10,
         SUM(CASE 
             WHEN D.CAPITOL IN (405) 
               AND CI.ITEM_CODE IN (
                    '71.20.11','71.20.12','71.20.13','71.20.14','71.20.19'
               )
               AND D.RIND NOT IN ('1','-')  
             THEN CIS2.NVAL(D.COL4) 
             ELSE 0 
         END) AS COL11,
         
         SUM(CASE 
             WHEN D.CAPITOL IN (405) 
               AND CI.ITEM_CODE IN (
                    '72.11.1','72.19.1','72.19.2','72.19.3','72.19.4',
                    '72.20.1','72.20.2','74.10.12'
               )
               AND D.RIND NOT IN ('1','-')  
             THEN CIS2.NVAL(D.COL4) 
             ELSE 0 
         END) AS COL12


  
     

     FROM VW_DATA_ALL D
     
                
         INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE)) 
         
         

   WHERE 
  (D.PERIOADA BETWEEN 10562AND 1055) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  
  D.FORM IN (44)
  AND D.CAPITOL IN (405) 

  
  
  GROUP BY 
  d.cuiio

