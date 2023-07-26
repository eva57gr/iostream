
SELECT 

    CODUL AS NR_SECTIE,
    CODUL ||'-'||DENUMIRE_CUATM AS NUME_SECTIE,
    CUIIO,
    DENUMIRE_CUIIO,
    DENUMIRE,
    ORDINE,
    COL1,
    COL2,
    SUM(COL3)  COL3,
    SUM(COL4)  COL4,
    SUM(COL5)  COL5,
    MAX(COL6)  COL6,
    MAX(COL7)  COL7,
    MAX(COL8)  COL8
FROM
(
--  '1' AS ORDINE, 
SELECT 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE DENUMIRE,
    '1' AS ORDINE, 
    NULL   AS  COL1,
    NULL   AS  COL2,
    NULL   AS  COL3,
    NULL   AS  COL4,
    NULL   AS  COL5,
    D.CUIIO   AS  COL6,
    NULL COL7,
    D.PACHET AS COL8 

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
         INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
   WHERE 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA                 ) AND
 -- (D.PERIOADA = :pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (CC.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (1)
  AND MR.RIND NOT  IN ('0')
 
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  D.PACHET,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE
  
  --  END '1' AS ORDINE, 
  UNION 
  
   --  '2' AS ORDINE,
  SELECT 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    MR.DENUMIRE,
    '2' AS ORDINE, 
    NULL AS  COL1,
    NULL AS  COL2,
   ------------------------- 
    
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) / CR.COL1 COL4,
    NULL AS COL5,
    ------------------------------
    NULL AS COL6,
    NULL AS COL7,
    NULL AS COL8 

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
    
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                       
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND           
                            
                           D.ID_MD  = 44519 
                           
                           
                           
                             
                              
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        
   WHERE 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA                 ) AND 
  --(D.PERIOADA = :pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (405)
  
  AND MR.RIND  IN ('1')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1 
  
     --   END '2' AS ORDINE,
  UNION 
  
  
     --   START  '4' AS ORDINE,
SELECT 
CODUL,
FULL_CODE,
DENUMIRE_CUATM,
CUIIO,
DENUMIRE_CUIIO,
RIND,
DENUMIRE,
4||'_'||TO_CHAR(ROWNUM,'000') ORDINE,
COL1,
COL2,
COL3,
COL4,
COL5,
NULL COL6,
NULL AS COL7,
 NULL AS COL8 
FROM 
(
SELECT
  CODUL,
  FULL_CODE,
  DENUMIRE_CUATM,
  CUIIO,
  NULL DENUMIRE_CUIIO,
  NULL RIND,
  DENUMIRE,
  --SUBSTR(ORDINE,1,1)  
  ORDINE,
  COL1,
  COL2,
  SUM(COL3) COL3,
  SUM(COL4) COL4,
  SUM(COL5) COL5
FROM
(

SELECT 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    CI.NAME DENUMIRE,
    4||'_'||D.COL31 AS ORDINE, 
    D.COL31 AS COL1,
    NULL AS COL2,
    
    
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) / CR.COL1 COL4,
    NULL AS COL5,
    
    
    NULL AS COL6,
    NULL AS COL7

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
      --  INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
         
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                       
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND           
                            
                           D.ID_MD  = 44519   
                              
                              
                              
                              ) CR
        ------------------------------------------------------------------------------   
        




INNER JOIN  CIS2.VW_CLS_CLASS_ITEM CI  ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE)) 
        
   WHERE 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA                 ) AND
 -- (D.PERIOADA = :pPERIOADA) AND  
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
 -- (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (405)
  AND MR.RIND NOT IN ('1','-')
  
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  CI.NAME,
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1,
  D.COL31,
  D.COL33 
  
  UNION 
  
  SELECT 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    TT.NAME  DENUMIRE,
    4||'_'||D.COL31||'_'||D.COL33 AS ORDINE, 
    NULL   AS  COL1,
    D.COL33 AS  COL2,
    
   
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) / CR.COL1 COL4,
    NULL AS COL5,
    
    
    NULL AS COL6,
    NULL AS COL7

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
       
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        CROSS JOIN (
        
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                       
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND           
                            
                           D.ID_MD  = 44519   
                              
                              
                              
                              
                              ) CR
  
    INNER JOIN  CIS2.VW_CLS_CLASS_ITEM TT  ON (TT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_CODE=D.COL33)
        
   WHERE 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA                 ) AND 
 -- (D.PERIOADA = :pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (405)
  AND MR.RIND NOT IN ('1','-')
   
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  TT.NAME,
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  MR.DENUMIRE,
  CR.COL1,
  D.COL31,
  D.COL33
  
  
  
)
GROUP BY
  CODUL,
  FULL_CODE,
  DENUMIRE_CUATM,
  CUIIO,
  DENUMIRE,
  ORDINE,
  COL1,
  COL2
ORDER BY
  CODUL,
  FULL_CODE,
  DENUMIRE_CUATM,
  CUIIO,
  ORDINE,
  COL1
  
  
  
  )
  
  --   END   '4' AS ORDINE,
  

UNION 


SELECT 
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE,
    ORDINE,
    NULL AS COL1,
    NULL AS COL2, 
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    NULL AS COL5,
    NULL AS COL6,
    NULL AS COL7,
    NULL AS COL8 
FROM 
(
SELECT 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    00000000 AS CUIIO,
    NULL DENUMIRE_CUIIO, 
    NULL RIND,
    CII.NAME DENUMIRE,
    '9' AS ORDINE, 
    NULL AS COL1,
    NULL AS COL2,
    SUM(D.COL4) AS COL3,
    SUM(D.COL4) / CR.COL1 AS COL4,
    NULL AS COL5,
    NULL AS COL6,
    NULL AS COL7,
    NULL AS COL8 

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        INNER JOIN  CIS2.VW_CLS_CLASS_ITEM CI  ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE)) 
        INNER JOIN VW_CLS_CLASS_ITEM CII ON  (CII.CLASS_CODE IN ('CSPM2') AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||TRIM(CII.ITEM_CODE)||';%')
        
        
        CROSS JOIN (
          SELECT
            SUM(D.COL1) AS COL1            
         FROM DATA_ALL D
         WHERE
            (D.PERIOADA = :pPERIOADA) AND
            D.FORM IN (101) AND
            D.CUIIO IN (5) AND
            D.ID_MD = 44519
                  
                              ) CR 
                              
                              
                              
                                 
        
   WHERE 
  (D.PERIOADA = :pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (405)
  AND MR.RIND NOT IN ('1','-')
   
  AND  CII.ITEM_CODE IN ('00.00.00')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  CII.NAME,
  CR.COL1
  
  
  UNION 
  
  
  SELECT 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    00000000 AS CUIIO,
    NULL DENUMIRE_CUIIO, 
    NULL RIND,
    CII.NAME DENUMIRE,
    '9' AS ORDINE, 
    NULL AS COL1,
    NULL AS COL2,
    SUM(D.COL4) AS COL3,
    SUM(D.COL4) / CR.COL1 AS COL4,
    NULL AS COL5,
    NULL AS COL6,
    NULL AS COL7,
    NULL AS COL8 

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        INNER JOIN  CIS2.VW_CLS_CLASS_ITEM CI  ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE)) 
        INNER JOIN VW_CLS_CLASS_ITEM CII ON  (CII.CLASS_CODE IN ('CSPM2') AND REPLACE(' '||CI.ITEM_PATH,';','; ') LIKE '% '||TRIM(CII.ITEM_CODE)||';%')
        
        
        CROSS JOIN (
          SELECT
            SUM(D.COL1) AS COL1            
         FROM DATA_ALL D
         WHERE
            (D.PERIOADA = :pPERIOADA-1) AND
            D.FORM IN (101) AND
            D.CUIIO IN (5) AND
            D.ID_MD = 44519
                  
                              ) CR 
                              
                              
                              
                                 
        
   WHERE 
  (D.PERIOADA = :pPERIOADA-1) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (405)
  AND MR.RIND NOT IN ('1','-')
   
  AND  CII.ITEM_CODE IN ('00.00.00')
  -------------------------------------------------
  GROUP BY 
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  CII.NAME,
  CR.COL1
  )
  
  
  GROUP BY
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE,
    ORDINE

  
  
)
  
  
  
  GROUP BY 
  

    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO,
    DENUMIRE,
    ORDINE,
    COL1,
    COL2
  
  ORDER BY 
  CODUL,
  FULL_CODE,
  DENUMIRE_CUATM,
  
  CUIIO,
  
  ORDINE,
  COL1
 
  



  
  


  


  
  



  
  