SELECT 
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    MAX(DENUMIRE_CUIIO) DENUMIRE_CUIIO, 
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
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
                CROSS JOIN (
         
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                       
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA) AND           
                            
                           D.ID_MD  = 44519   
                              
                              
                              
                              ) CR
INNER JOIN  CIS2.VW_CLS_CLASS_ITEM CI  ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE)) 
        
   WHERE 
  (D.PERIOADA = :pPERIOADA) AND  
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (405)
  AND MR.RIND NOT IN ('1','-')
  
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
   (D.PERIOADA = :pPERIOADA) AND 
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
 
 
 UNION 
 
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
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
                CROSS JOIN (
         
        SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                       
                      
                        WHERE
                             (D.PERIOADA =:pPERIOADA-1) AND           
                            
                           D.ID_MD  = 44519   
                              
                              
                              
                              ) CR
INNER JOIN  CIS2.VW_CLS_CLASS_ITEM CI  ON (CI.CLASS_CODE IN ('CSPM2') AND TRIM(D.COL31)=TRIM(CI.ITEM_CODE)) 
        
   WHERE 
  (D.PERIOADA = :pPERIOADA-1) AND  
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (405)
  AND MR.RIND NOT IN ('1','-')
  
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
                             (D.PERIOADA =:pPERIOADA-1) AND           
                            
                           D.ID_MD  = 44519   
                              
                              
                              
                              
                              ) CR
  
    INNER JOIN  CIS2.VW_CLS_CLASS_ITEM TT  ON (TT.CLASS_CODE IN ('TARI_ISO') AND TT.ITEM_CODE=D.COL33)
        
   WHERE 
   (D.PERIOADA = :pPERIOADA) AND 
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
 
 ORDER BY
 CODUL,
  FULL_CODE,
  DENUMIRE_CUATM,
  CUIIO,
  ORDINE,
  COL1
  )
  
  
    GROUP BY
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
   -- DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE,
    ORDINE
    
    ORDER BY 
    CUIIO,
    FULL_CODE