--INSERT INTO TABLE_OUT 
--(
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
--  COL1, COL2, COL3, COL4
--)

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
  RIND AS NR_ROW,
  ORDINE AS ORDINE,
  '0111' AS DECIMAL_POS,
  DENUMIRE AS NUME_ROW,
  COL1 AS COL1,
  COL2 AS COL2,
  NULL AS COL3,
  NULL AS COL4
FROM
(
-- ============================================================================
  SELECT
    '01' AS RIND,
    'Autorizatiile de construire eliberate pentru toate cladirile - total( r.02+r.06)' AS DENUMIRE,
    0 AS ORDINE,
    SUM(D.COL1) AS COL1,
    SUM(D.COL2) AS COL2
  FROM
    CIS2.VW_DATA_ALL D
  WHERE
    D.FORM = 15 AND
    D.CAPITOL = 1000 AND
    D.RIND IN('02', '06')
    AND D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA
    AND (CIS2.D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%')
  

 UNION
  

 SELECT
    '02' AS RIND,
    'Autoriza?ii de construire eliberate pentru cladiri reziden?iale - total (r.03+r.04+r.05)' AS DENUMIRE,
    1 AS ORDINE,
    SUM(D.COL1) AS COL1,
    SUM(D.COL2) AS COL2
  FROM
    CIS2.VW_DATA_ALL D
  WHERE
    D.FORM = 15 AND
    D.CAPITOL = 1000 AND
    D.RIND IN('03', '04', '05')
    AND D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA
    AND (CIS2.D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%')
  UNION
  
  SELECT
    '~' AS RIND,
    'Autorizatii pentru:' AS DENUMIRE,
    3.1 AS ORDINE,
    NULL AS COL1,
    NULL AS COL2
  FROM
    DUAL
  
  UNION
  
  SELECT
    TRIM(TO_CHAR(1+TO_NUMBER(R.RIND), '00')) AS RIND,
    R.DENUMIRE AS DENUMIRE,
    1+TO_NUMBER(R.RIND) AS ORDINE,
    SUM(D.COL1) AS COL1,
    SUM(D.COL2) AS COL2
  FROM
    CIS2.VW_DATA_ALL D INNER JOIN
    CIS2.MD_RIND R ON(D.ID_MD=R.ID_MD)
  WHERE
    D.FORM = 15 AND
    D.CAPITOL = 1000 AND
    D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA
    AND (CIS2.D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%')
    
  GROUP BY
    R.RIND,
    R.DENUMIRE
    
    UNION
  
  SELECT
    '~' AS RIND,
    'Autorizatii pentru:' AS DENUMIRE,
    3.1 AS ORDINE,
    NULL AS COL1,
    NULL AS COL2
  FROM
    DUAL
  
  UNION
  
  SELECT
    '09' AS RIND,
    'Total pentru cladiri nerizidentiale' AS DENUMIRE,
    9 AS ORDINE,
    SUM(D.COL1) AS COL1,
    SUM(D.COL2) AS COL2
  FROM
    CIS2.VW_DATA_ALL D INNER JOIN
    CIS2.MD_RIND R ON(D.ID_MD=R.ID_MD)
  WHERE
    D.FORM = 15 AND
    D.CAPITOL = 1000 AND
    D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA
    AND (CIS2.D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
    D.RIND IN( '04', '05', '06', '07')
    
  
--=============================================================================
) D
ORDER BY
  ORDINE,
  RIND