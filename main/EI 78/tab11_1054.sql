SELECT 
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
    '0' AS NR_SECTIE,
    '0' AS NUME_SECTIE,
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
   '0' AS NUME_SECTIE2,

 
 
 CASE WHEN     CODUL IN (
         SELECT
                  CI.ITEM_CODE CODUL
                  
                  
                  
                FROM
                  VW_CLS_CLASS_ITEM CI
                WHERE
                  CI.CLASS_CODE IN ('TARI_ISO') 
    
                GROUP BY
                  CI.ITEM_CODE,
                  CI.ITEM_PATH,
                  CI.NAME,
                  CI.SHOW_ORDER
          
          
        )       THEN  ' '||'~'||ROWNUM ELSE      
        
 
        
          SUBSTR(SUBSTR(CODUL,5,15), INSTR(SUBSTR(CODUL,5,15), '_')+1)
        
        ||'~'||ROWNUM  END NR_ROW,
        
        
        
ROWNUM ORDINE,
 '1111' AS DECIMAL_POS,
DENUMIRE NUME_ROW,
COL1,
COL2,
COL3,
COL4
FROM


(
 SELECT
   D.CODUL,
    D.DENUMIRE,
    D.ORDINE_CL,
    D.FULL_CODE,
    D.ORDINE,
    SUM(D.COL1) AS COL1,
    SUM(D.COL2) AS COL2,
    SUM(D.COL3) AS COL3,
    SUM(D.COL4) AS COL4
    
    
   FROM


(
SELECT  
    D.CODUL,
    D.DENUMIRE,
    D.ORDINE_CL,
    D.FULL_CODE,
    D.ORDINE,
    ROUND(D.COL1 / 1000,1) AS COL1,
    ROUND((D.COL2 / CR.COL1) / 1000,1) AS COL2,
    ROUND(D.COL3 / 1000,1) AS COL3,
    ROUND((D.COL4 / CR.COL1) / 1000,1) AS COL4
   FROM 

(
SELECT 
     '1' ORDINE,
       TTT.SHOW_ORDER ORDINE_CL, 
       TTT.NAME DENUMIRE,
       TTT.ITEM_CODE CODUL,
       TTT.ITEM_PATH FULL_CODE,

SUM(CASE WHEN  MR.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL1,
SUM(CASE WHEN  MR.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL2,
SUM(CASE WHEN  MR.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL3,
SUM(CASE WHEN  MR.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL4
     
        FROM CIS2.DATA_ALL D 
    
            INNER JOIN VW_CLS_CLASS_ITEM TT ON (TT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_CODE=D.COL33) 
            INNER JOIN VW_CLS_CLASS_ITEM TTT ON (TTT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_PATH LIKE '%'||TTT.ITEM_CODE||';%')
            INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
            INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
            INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        
             
   WHERE 
  (D.PERIOADA = 1052) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  --(:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  MR.CAPITOL IN (405,407)  
 AND TTT.ITEM_CODE NOT IN ('555','444') 
 
--  AND D.CUIIO = 1129894
   GROUP BY
   TTT.SHOW_ORDER,
   TTT.NAME,
   TTT.ITEM_CODE,
   TTT.ITEM_PATH
   UNION 
  SELECT 
     '2' ORDINE,
      TTT.SHOW_ORDER  ORDINE_CL,
      CII.NAME DENUMIRE, 
      CII.SHOW_ORDER||'_'||CII.ITEM_CODE CODUL, 
      TTT.ITEM_PATH FULL_CODE,
      SUM(CASE WHEN  MR.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL1,
      SUM(CASE WHEN  MR.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL2,
      SUM(CASE WHEN  MR.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL3,
      SUM(CASE WHEN  MR.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL4 
     
      FROM CIS2.DATA_ALL D 

            INNER JOIN VW_CLS_CLASS_ITEM TT ON (TT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_CODE=D.COL33) 
            INNER JOIN VW_CLS_CLASS_ITEM TTT ON (TTT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_PATH LIKE '%'||TTT.ITEM_CODE||';%')
            INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
            INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
            INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        
            INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE))
            INNER JOIN VW_CLS_CLASS_ITEM CII ON  (CII.CLASS_CODE IN ('CSPM2') AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||TRIM(CII.ITEM_CODE)||';%')
             
   WHERE 
  (D.PERIOADA = 1052) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND MR.CAPITOL IN (405,407)  
  AND TTT.ITEM_CODE  
  NOT IN ('555','444','000') AND 
  CII.ITEM_CODE NOT IN ('00.00.00') 
  --AND D.CUIIO = 1129894

 
   GROUP BY
   TTT.SHOW_ORDER,
   CII.NAME,
   CII.ITEM_CODE,
   CII.SHOW_ORDER,
   TTT.ITEM_PATH
 ) D 
 
 
 
    CROSS JOIN (
         
         
         SELECT
            SUM(D.COL1)  AS COL1            
                  FROM DATA_ALL D
                         
                      
                        WHERE
                            (D.PERIOADA = 1052) AND          
                            
                           D.ID_MD  = 44519 
                              
                              
                              
                              ) CR
                              
                              
-----------------------------------------------------------------------


UNION 



SELECT  
    D.CODUL,
    D.DENUMIRE,
    D.ORDINE_CL,
    D.FULL_CODE,
    D.ORDINE,
    ROUND(D.COL1 / 1000,1) AS COL1,
    ROUND((D.COL2 / CR.COL1) / 1000,1) AS COL2,
    ROUND(D.COL3 / 1000,1) AS COL3,
    ROUND((D.COL4 / CR.COL1) / 1000,1) AS COL4
   FROM 

(
SELECT 
     '1' ORDINE,
       TTT.SHOW_ORDER ORDINE_CL, 
       TTT.NAME DENUMIRE,
       TTT.ITEM_CODE CODUL,
       TTT.ITEM_PATH FULL_CODE,

SUM(CASE WHEN  MR.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL1,
SUM(CASE WHEN  MR.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL2,
SUM(CASE WHEN  MR.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL3,
SUM(CASE WHEN  MR.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL4
     
        FROM CIS2.DATA_ALL D 
    
            INNER JOIN VW_CLS_CLASS_ITEM TT ON (TT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_CODE=D.COL33) 
            INNER JOIN VW_CLS_CLASS_ITEM TTT ON (TTT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_PATH LIKE '%'||TTT.ITEM_CODE||';%')
            INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
            INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
            INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        
             
   WHERE 
  (D.PERIOADA = 1053) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  --(:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  MR.CAPITOL IN (405,407)  
 AND TTT.ITEM_CODE NOT IN ('555','444') 
 
  --AND D.CUIIO = 1129894
   GROUP BY
   TTT.SHOW_ORDER,
   TTT.NAME,
   TTT.ITEM_CODE,
   TTT.ITEM_PATH
   UNION 
  SELECT 
     '2' ORDINE,
      TTT.SHOW_ORDER  ORDINE_CL,
      CII.NAME DENUMIRE, 
      CII.SHOW_ORDER||'_'||CII.ITEM_CODE CODUL, 
      TTT.ITEM_PATH FULL_CODE,
      SUM(CASE WHEN  MR.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL1,
      SUM(CASE WHEN  MR.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL2,
      SUM(CASE WHEN  MR.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL3,
      SUM(CASE WHEN  MR.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL4 
     
      FROM CIS2.DATA_ALL D 

            INNER JOIN VW_CLS_CLASS_ITEM TT ON (TT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_CODE=D.COL33) 
            INNER JOIN VW_CLS_CLASS_ITEM TTT ON (TTT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_PATH LIKE '%'||TTT.ITEM_CODE||';%')
            INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
            INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
            INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        
            INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE))
            INNER JOIN VW_CLS_CLASS_ITEM CII ON  (CII.CLASS_CODE IN ('CSPM2') AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||TRIM(CII.ITEM_CODE)||';%')
             
   WHERE 
  (D.PERIOADA = 1053) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND MR.CAPITOL IN (405,407)  
  AND TTT.ITEM_CODE  
  NOT IN ('555','444','000') AND 
  CII.ITEM_CODE NOT IN ('00.00.00') 
  --AND D.CUIIO = 1129894

 
   GROUP BY
   TTT.SHOW_ORDER,
   CII.NAME,
   CII.ITEM_CODE,
   CII.SHOW_ORDER,
   TTT.ITEM_PATH
 ) D 
 
 
 
    CROSS JOIN (
         
         
         SELECT
            SUM(D.COL1)  AS COL1            
                  FROM DATA_ALL D
                         
                      
                        WHERE
                            (D.PERIOADA = 1053) AND          
                            
                           D.ID_MD  = 44519 
                              
                              
                              
                              ) CR
                              
                              
-----------------------------------------------------------------------------                              


-----------------------------------------------------------------------


UNION 



SELECT  
    D.CODUL,
    D.DENUMIRE,
    D.ORDINE_CL,
    D.FULL_CODE,
    D.ORDINE,
    ROUND(D.COL1 / 1000,1) AS COL1,
    ROUND((D.COL2 / CR.COL1) / 1000,1) AS COL2,
    ROUND(D.COL3 / 1000,1) AS COL3,
    ROUND((D.COL4 / CR.COL1) / 1000,1) AS COL4
   FROM 

(
SELECT 
     '1' ORDINE,
       TTT.SHOW_ORDER ORDINE_CL, 
       TTT.NAME DENUMIRE,
       TTT.ITEM_CODE CODUL,
       TTT.ITEM_PATH FULL_CODE,

SUM(CASE WHEN  MR.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL1,
SUM(CASE WHEN  MR.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL2,
SUM(CASE WHEN  MR.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL3,
SUM(CASE WHEN  MR.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL4
     
        FROM CIS2.DATA_ALL D 
    
            INNER JOIN VW_CLS_CLASS_ITEM TT ON (TT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_CODE=D.COL33) 
            INNER JOIN VW_CLS_CLASS_ITEM TTT ON (TTT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_PATH LIKE '%'||TTT.ITEM_CODE||';%')
            INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
            INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
            INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        
             
   WHERE 
  (D.PERIOADA = 1054) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  --(:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  MR.CAPITOL IN (405,407)  
 AND TTT.ITEM_CODE NOT IN ('555','444') 
 
 -- AND D.CUIIO = 1129894
   GROUP BY
   TTT.SHOW_ORDER,
   TTT.NAME,
   TTT.ITEM_CODE,
   TTT.ITEM_PATH
   UNION 
  SELECT 
     '2' ORDINE,
      TTT.SHOW_ORDER  ORDINE_CL,
      CII.NAME DENUMIRE, 
      CII.SHOW_ORDER||'_'||CII.ITEM_CODE CODUL, 
      TTT.ITEM_PATH FULL_CODE,
      SUM(CASE WHEN  MR.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL1,
      SUM(CASE WHEN  MR.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL2,
      SUM(CASE WHEN  MR.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL3,
      SUM(CASE WHEN  MR.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   AS COL4 
     
      FROM CIS2.DATA_ALL D 

            INNER JOIN VW_CLS_CLASS_ITEM TT ON (TT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_CODE=D.COL33) 
            INNER JOIN VW_CLS_CLASS_ITEM TTT ON (TTT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_PATH LIKE '%'||TTT.ITEM_CODE||';%')
            INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
            INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
            INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        
            INNER JOIN VW_CLS_CLASS_ITEM CI ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE))
            INNER JOIN VW_CLS_CLASS_ITEM CII ON  (CII.CLASS_CODE IN ('CSPM2') AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||TRIM(CII.ITEM_CODE)||';%')
             
   WHERE 
  (D.PERIOADA = 1054) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND MR.CAPITOL IN (405,407)  
  AND TTT.ITEM_CODE  
  NOT IN ('555','444','000') AND 
  CII.ITEM_CODE NOT IN ('00.00.00') 
 -- AND D.CUIIO = 1129894

 
   GROUP BY
   TTT.SHOW_ORDER,
   CII.NAME,
   CII.ITEM_CODE,
   CII.SHOW_ORDER,
   TTT.ITEM_PATH
 ) D 
 
 
 
    CROSS JOIN (
         
         
         SELECT
            SUM(D.COL1)  AS COL1            
                  FROM DATA_ALL D
                         
                      
                        WHERE
                            (D.PERIOADA = 1054) AND          
                            
                           D.ID_MD  = 44519 
                              
                              
                              
                              ) CR
                              
                              
-----------------------------------------------------------------------------                              


                     




  ) D
 
  
  
  
  GROUP BY
  D.CODUL,
    D.DENUMIRE,
    D.ORDINE_CL,
    D.FULL_CODE,
    D.ORDINE
  
                ORDER BY 
    ORDINE_CL,
    FULL_CODE,
    ORDINE,
    CODUL 
    
    
  ) 
  
  
  

    
    
  
  
  
  
  
 
    
  
  
  