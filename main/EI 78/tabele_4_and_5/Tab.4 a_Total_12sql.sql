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