--DECLARE
--
--  CURSOR C IS
--
--SELECT 
--    DF.PERIOADA,
--    DF.FORM,
--    DF.FORM_VERS,
--    DF.ID_MDTABLE,
--    DF.COD_CUATM,
--    DF.NR_SECTIE,
--    DF.NUME_SECTIE,
--    DF.NR_SECTIE1,
--    DF.NUME_SECTIE1,
--    DF.NR_SECTIE2,
--    DF.NUME_SECTIE2,
--    DF.NR_ROW  NR_ROW,
--    DF.ORDINE,
--    DF.DECIMAL_POS,
--    DF.NUME_ROW,
--    DF.COL1,
--    DF.COL2,DF.COL3,DF.COL4,DF.COL5,DF.COL6,DF.COL7,DF.COL8,DF.COL9,DF.COL10,DF.COL11,DF.COL12,DF.COL13,DF.COL14
--    
--    
--FROM 
--(
--------------------------------------------------------------------------------

SELECT 
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
         
  ORGANE_CODUL AS NR_SECTIE,
  ORGANE_DENUMIRE AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
  ITEM_CODE AS NR_ROW,
  ROWNUM AS ORDINE,
  '00000000000000' AS DECIMAL_POS,
  NAME AS NUME_ROW,
  ROUND(COL1,0) AS COL1,
  ROUND(COL2,0) AS COL2,
  ROUND(COL3,0) AS COL3,
  ROUND(COL4,0) AS COL4,
  ROUND(COL5,0) AS COL5,
  ROUND(COL6,0) AS COL6,
  ROUND(COL7,0) AS COL7,
  ROUND(COL8,0) AS COL8,
  ROUND(COL9,0) AS COL9,
  ROUND(COL10,0) AS COL10,
  ROUND(COL11,0) AS COL11,
  ROUND(COL12,0) AS COL12,
  ROUND(COL13,0) AS COL13,
  ROUND(COL14,0) AS COL14
FROM
(SELECT
  ORGANE_CODUL,
  ORGANE_DENUMIRE,
  ITEM_CODE,
  NAME,
  ITEM_PATH,
  SUM(COL1) AS COL1, SUM(COL2) AS COL2, SUM(COL3) AS COL3, SUM(COL4) AS COL4, SUM(COL5) AS COL5, SUM(COL6) AS COL6, 
  SUM(COL7) AS COL7, SUM(COL8) AS COL8, SUM(COL9) AS COL9, SUM(COL10) AS COL10, SUM(COL11) AS COL11, SUM(COL12) AS COL12, SUM(COL13) AS COL13, SUM(COL14) AS COL14
FROM
(
SELECT
  CIO.ITEM_CODE AS ORGANE_CODUL,
  CIO.NAME AS ORGANE_DENUMIRE,
--  D.ORGANE,
  CII.ITEM_CODE,
  MAX(CII.NAME) AS NAME,
  CII.ITEM_PATH,
  SUM(D.COL1) AS COL1,
  SUM(CASE WHEN CIO.ITEM_CODE IN ('42310') THEN NULL ELSE D.COL2 END) AS COL2,
  SUM(CASE WHEN CIO.ITEM_CODE IN ('42310') THEN NULL ELSE D.COL3 END) AS COL3,
  SUM(CASE WHEN CIO.ITEM_CODE IN ('42310') THEN NULL ELSE D.COL4 END) AS COL4,
  SUM(CASE WHEN CIO.ITEM_CODE IN ('42310') THEN NULL ELSE D.COL5 END) AS COL5,
  SUM(CASE WHEN CIO.ITEM_CODE IN ('42310') THEN NULL ELSE D.COL6 END) AS COL6,
  SUM(CASE WHEN CIO.ITEM_CODE IN ('42310') THEN NULL ELSE D.COL7 END) AS COL7,
  SUM(CASE WHEN CIO.ITEM_CODE IN ('42310') THEN NULL ELSE D.COL8 END) AS COL8,
  SUM(CASE WHEN CIO.ITEM_CODE IN ('42310') THEN NULL ELSE D.COL9 END) AS COL9,
  SUM(CASE WHEN CIO.ITEM_CODE IN ('42310') THEN NULL ELSE D.COL10 END) AS COL10,
  SUM(CASE WHEN CIO.ITEM_CODE IN ('42310') THEN NULL ELSE D.COL11 END) AS COL11,
  SUM(CASE WHEN CIO.ITEM_CODE IN ('42310') THEN NULL ELSE D.COL12 END) AS COL12,
  SUM(CASE WHEN CIO.ITEM_CODE IN ('42310') THEN NULL ELSE D.COL13 END) AS COL13,
  SUM(CASE WHEN CIO.ITEM_CODE IN ('42310') THEN NULL ELSE D.COL14 END) AS COL14
FROM 
  CIS2.VW_DATA_ALL D
  INNER JOIN (
  
  SELECT
                  CI.ITEM_CODE,
                  CII.ITEM_PATH,
                  CI.ITEM_CODE_VERS
                FROM
                (
                SELECT
                                  CI.CLASS_CODE,
                                  CI.ITEM_CODE,
                                  MAX(CI.ITEM_CODE_VERS) AS ITEM_CODE_VERS
                                FROM
                                  CIS2.CLS_CLASS_ITEM CI
                                WHERE
                                  CI.CLASS_CODE IN ('COD_CONTRAVENTIONAL') AND
                                  CI.ITEM_CODE_VERS <= :pPERIOADA
                                GROUP BY
                                  CI.CLASS_CODE,
                                  CI.ITEM_CODE
                                ORDER BY
                                  CI.ITEM_CODE
        ) CI
        INNER JOIN CIS2.VW_CLS_CLASS_ITEM CII ON (CI.CLASS_CODE=CII.CLASS_CODE AND CI.ITEM_CODE=CII.ITEM_CODE AND CI.ITEM_CODE_VERS=CII.ITEM_CODE_VERS)
        
        
        
             ) CI ON (D.RIND=CI.ITEM_CODE)
--  INNER JOIN CIS2.VW_CLS_CLASS_ITEM CII ON (CII.CLASS_CODE IN ('COD_CONTRAVENTIONAL') AND CI.ITEM_CODE_VERS=CII.ITEM_CODE_VERS AND CI.ITEM_PATH LIKE '%'||CII.ITEM_CODE||';%')
  INNER JOIN (
  
  SELECT
                  CI.ITEM_CODE,
                  CII.NAME,
                  CII.ITEM_PATH,
                  CI.ITEM_CODE_VERS
                FROM
                (
                SELECT
                                  CI.CLASS_CODE,
                                  CI.ITEM_CODE,
                                  MAX(CI.ITEM_CODE_VERS) AS ITEM_CODE_VERS
                                FROM
                                  CIS2.CLS_CLASS_ITEM CI
                                WHERE
                                  CI.CLASS_CODE IN ('COD_CONTRAVENTIONAL') AND
                                  CI.ITEM_CODE_VERS <= :pPERIOADA
                                GROUP BY
                                  CI.CLASS_CODE,
                                  CI.ITEM_CODE
                                ORDER BY
                                  CI.ITEM_CODE
                                  
                                  
                                  
        ) CI
        INNER JOIN CIS2.VW_CLS_CLASS_ITEM CII ON (CI.CLASS_CODE=CII.CLASS_CODE AND CI.ITEM_CODE=CII.ITEM_CODE AND CI.ITEM_CODE_VERS=CII.ITEM_CODE_VERS)
        
        
        
  ) CII ON (CI.ITEM_PATH LIKE '%'||CII.ITEM_CODE||';%')
  INNER JOIN (
  
  SELECT
                  CI.ITEM_CODE,
                  CI.NAME,
                  MAX(CI.ITEM_CODE_VERS) AS ITEM_CODE_VERS
                FROM
                  CIS2.CLS_CLASS_ITEM CI
                WHERE
                  CI.CLASS_CODE IN ('ORGANE') AND
                  CI.ITEM_CODE_VERS <= :pPERIOADA
                GROUP BY
                  CI.ITEM_CODE,
                  CI.NAME
                  
                  
             ) CIO ON (D.ORGANE=CIO.ITEM_CODE)
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (41)                 AND 
  D.CAPITOL IN (398) AND
  D.RIND NOT IN ('0000001')
--  AND CII.ITEM_CODE IN ('0000001') 
--  AND D.CUIIO IN (40043396)
GROUP BY
--  D.ORGANE,
  CIO.ITEM_CODE,
  CIO.NAME,
  CII.ITEM_CODE,
--  CII.NAME,
  CII.ITEM_PATH
--ORDER BY
--  CIO.ITEM_CODE,
--  CII.ITEM_CODE
UNION ALL
SELECT
  CIO.ITEM_CODE AS ORGANE_CODUL,
  CIO.NAME AS ORGANE_DENUMIRE,
--  D.ORGANE,
  CII.ITEM_CODE,
  MAX(CII.NAME) AS NAME,
  CII.ITEM_PATH,
  NULL AS COL1,
  SUM(D.COL2) AS COL2,
  SUM(D.COL3) AS COL3,
  SUM(D.COL4) AS COL4,
  SUM(D.COL5) AS COL5,
  SUM(D.COL6) AS COL6,
  SUM(D.COL7) AS COL7,
  SUM(D.COL8) AS COL8,
  SUM(D.COL9) AS COL9,
  SUM(D.COL10) AS COL10,
  SUM(D.COL11) AS COL11,
  SUM(D.COL12) AS COL12,
  SUM(D.COL13) AS COL13,
  SUM(D.COL14) AS COL14
FROM 
  CIS2.VW_DATA_ALL D
  INNER JOIN (SELECT
                  CI.ITEM_CODE,
                  CII.ITEM_PATH,
                  CI.ITEM_CODE_VERS
                FROM
                (
                SELECT
                                  CI.CLASS_CODE,
                                  CI.ITEM_CODE,
                                  MAX(CI.ITEM_CODE_VERS) AS ITEM_CODE_VERS
                                FROM
                                  CIS2.CLS_CLASS_ITEM CI
                                WHERE
                                  CI.CLASS_CODE IN ('COD_CONTRAVENTIONAL') AND
                                  CI.ITEM_CODE_VERS <= :pPERIOADA
                                GROUP BY
                                  CI.CLASS_CODE,
                                  CI.ITEM_CODE
                                ORDER BY
                                  CI.ITEM_CODE
        ) CI
        INNER JOIN CIS2.VW_CLS_CLASS_ITEM CII ON (CI.CLASS_CODE=CII.CLASS_CODE AND CI.ITEM_CODE=CII.ITEM_CODE AND CI.ITEM_CODE_VERS=CII.ITEM_CODE_VERS)
             ) CI ON (D.RIND=CI.ITEM_CODE)
--  INNER JOIN CIS2.VW_CLS_CLASS_ITEM CII ON (CII.CLASS_CODE IN ('COD_CONTRAVENTIONAL') AND CI.ITEM_CODE_VERS=CII.ITEM_CODE_VERS AND CI.ITEM_PATH LIKE '%'||CII.ITEM_CODE||';%')
  INNER JOIN (SELECT
                  CI.ITEM_CODE,
                  CII.NAME,
                  CII.ITEM_PATH,
                  CI.ITEM_CODE_VERS
                FROM
                (
                SELECT
                                  CI.CLASS_CODE,
                                  CI.ITEM_CODE,
                                  MAX(CI.ITEM_CODE_VERS) AS ITEM_CODE_VERS
                                FROM
                                  CIS2.CLS_CLASS_ITEM CI
                                WHERE
                                  CI.CLASS_CODE IN ('COD_CONTRAVENTIONAL') AND
                                  CI.ITEM_CODE_VERS <= :pPERIOADA
                                GROUP BY
                                  CI.CLASS_CODE,
                                  CI.ITEM_CODE
                                ORDER BY
                                  CI.ITEM_CODE
        ) CI
        INNER JOIN CIS2.VW_CLS_CLASS_ITEM CII ON (CI.CLASS_CODE=CII.CLASS_CODE AND CI.ITEM_CODE=CII.ITEM_CODE AND CI.ITEM_CODE_VERS=CII.ITEM_CODE_VERS)
  ) CII ON (CI.ITEM_PATH LIKE '%'||CII.ITEM_CODE||';%')
  INNER JOIN (SELECT
                  CI.ITEM_CODE,
                  CI.NAME,
                  MAX(CI.ITEM_CODE_VERS) AS ITEM_CODE_VERS
                FROM
                  CIS2.CLS_CLASS_ITEM CI
                WHERE
                  CI.CLASS_CODE IN ('ORGANE') AND
                  CI.ITEM_CODE_VERS <= :pPERIOADA
                GROUP BY
                  CI.ITEM_CODE,
                  CI.NAME
             ) CIO ON (DECODE(D.ORGANE,'42310','3980')=CIO.ITEM_CODE)
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (41)                 AND 
  D.CAPITOL IN (398) AND
  D.RIND NOT IN ('0000001')
  AND CIO.ITEM_CODE IN ('3980')
--  AND CII.ITEM_CODE IN ('0000001') 
--  AND D.CUIIO IN (40043396)
GROUP BY
--  D.ORGANE,
  CIO.ITEM_CODE,
  CIO.NAME,
  CII.ITEM_CODE,
--  CII.NAME,
  CII.ITEM_PATH
--ORDER BY
--  CIO.ITEM_CODE,
--  CII.ITEM_CODE
UNION ALL
SELECT
  '1' AS ORGANE_CODUL,
  'Total' AS ORGANE_DENUMIRE,
  CII.ITEM_CODE,
  MAX(CII.NAME) AS NAME,
  CII.ITEM_PATH,
  SUM(D.COL1) AS COL1,
  SUM(D.COL2) AS COL2,
  SUM(D.COL3) AS COL3,
  SUM(D.COL4) AS COL4,
  SUM(D.COL5) AS COL5,
  SUM(D.COL6) AS COL6,
  SUM(D.COL7) AS COL7,
  SUM(D.COL8) AS COL8,
  SUM(D.COL9) AS COL9,
  SUM(D.COL10) AS COL10,
  SUM(D.COL11) AS COL11,
  SUM(D.COL12) AS COL12,
  SUM(D.COL13) AS COL13,
  SUM(D.COL14) AS COL14
FROM 
  CIS2.VW_DATA_ALL D
  INNER JOIN (SELECT
                  CI.ITEM_CODE,
                  CII.ITEM_PATH,
                  CI.ITEM_CODE_VERS
                FROM
                (
                SELECT
                                  CI.CLASS_CODE,
                                  CI.ITEM_CODE,
                                  MAX(CI.ITEM_CODE_VERS) AS ITEM_CODE_VERS
                                FROM
                                  CIS2.CLS_CLASS_ITEM CI
                                WHERE
                                  CI.CLASS_CODE IN ('COD_CONTRAVENTIONAL') AND
                                  CI.ITEM_CODE_VERS <= :pPERIOADA
                                GROUP BY
                                  CI.CLASS_CODE,
                                  CI.ITEM_CODE
                                ORDER BY
                                  CI.ITEM_CODE
        ) CI
        INNER JOIN CIS2.VW_CLS_CLASS_ITEM CII ON (CI.CLASS_CODE=CII.CLASS_CODE AND CI.ITEM_CODE=CII.ITEM_CODE AND CI.ITEM_CODE_VERS=CII.ITEM_CODE_VERS)
             ) CI ON (D.RIND=CI.ITEM_CODE)
  INNER JOIN (SELECT
                  CI.ITEM_CODE,
                  CII.NAME,
                  CII.ITEM_PATH,
                  CI.ITEM_CODE_VERS
                FROM
                (
                SELECT
                                  CI.CLASS_CODE,
                                  CI.ITEM_CODE,
                                  MAX(CI.ITEM_CODE_VERS) AS ITEM_CODE_VERS
                                FROM
                                  CIS2.CLS_CLASS_ITEM CI
                                WHERE
                                  CI.CLASS_CODE IN ('COD_CONTRAVENTIONAL') AND
                                  CI.ITEM_CODE_VERS <= :pPERIOADA
                                GROUP BY
                                  CI.CLASS_CODE,
                                  CI.ITEM_CODE
                                ORDER BY
                                  CI.ITEM_CODE
        ) CI
        INNER JOIN CIS2.VW_CLS_CLASS_ITEM CII ON (CI.CLASS_CODE=CII.CLASS_CODE AND CI.ITEM_CODE=CII.ITEM_CODE AND CI.ITEM_CODE_VERS=CII.ITEM_CODE_VERS)
  ) CII ON (CI.ITEM_PATH LIKE '%'||CII.ITEM_CODE||';%')
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (41)                 AND 
  D.CAPITOL IN (398) AND
  D.RIND NOT IN ('0000001')
--  D.RIND IN ('1100001','1100002','1100003','1100004','1100005')
--  AND D.CUIIO IN (40043396)
GROUP BY
  CII.ITEM_CODE,
--  CII.NAME,
  CII.ITEM_PATH
--ORDER BY
--  CC.FULL_CODE
)
GROUP BY
  ORGANE_CODUL,
  ORGANE_DENUMIRE,
  ITEM_CODE,
  NAME,
  ITEM_PATH
ORDER BY
  ORGANE_CODUL,
  ITEM_PATH
  
  
--))DF;  
--    
--  BEGIN
--
--  FOR CR IN C
--  
--  LOOP
--    INSERT INTO 
--             
--    CIS2.TABLE_OUT
--    (
--      
--  PERIOADA,
--  FORM,
--  FORM_VERS,
--  ID_MDTABLE,
--  COD_CUATM,
--  NR_SECTIE,
--  NUME_SECTIE,
--  NR_SECTIE1,
--  NUME_SECTIE1,
--  NR_SECTIE2,
--  NUME_SECTIE2,
--  NR_ROW,
--  ORDINE,
--  DECIMAL_POS,
--  NUME_ROW,  
--  COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9,COL10,COL11,COL12,COL13,COL14
--    )
--    VALUES
--    (
--  CR.PERIOADA,
--  CR.FORM,
--  CR.FORM_VERS,
--  CR.ID_MDTABLE,
--  CR.COD_CUATM,
--  CR.NR_SECTIE,
--  CR.NUME_SECTIE,
--  CR.NR_SECTIE1,
--  CR.NUME_SECTIE1,
--  CR.NR_SECTIE2,
--  CR.NUME_SECTIE2,
--  CR.NR_ROW,
--  CR.ORDINE,
--  CR.DECIMAL_POS,
--  CR.NUME_ROW,  
--  CR.COL1, CR.COL2,
--  CR.COL3,CR.COL4,CR.COL5,CR.COL6,CR.COL7,CR.COL8,CR.COL9,CR.COL10,CR.COL11,CR.COL12,CR.COL13,CR.COL14
--    );
--  END LOOP;
--END;
--  