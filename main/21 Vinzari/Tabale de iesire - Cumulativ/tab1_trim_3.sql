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
-- COL1,COL2,COL3,COL4,COL5
--)
--SELECT
--
-- 
--
--NR_ROW,
--ORDINE,
--NUME_ROW,
--COL1,
--COL2,
--COL3,
--COL4,
--COL5
--
--FROM
--
--(
SELECT
--REGEXP_SUBSTR(NR_ROW, '\d+') NR_ROW_MODIF,



SUM(CASE
        WHEN INSTR(NR_ROW, '~') > 1 THEN SUBSTR(NR_ROW, 1, INSTR(NR_ROW, '~') - 1)
        ELSE '0'  -- Replace '0' with NULL if you prefer NULL instead of 0
    END )NR_ROW,
    
    
    
ORDINE,
NUME_ROW,
SUM(COL1) AS COL1,
SUM(COL2) AS COL2,
SUM(COL3) AS COL3,
SUM(COL4) AS COL4,
SUM(COL5) AS COL5
      
      FROM TABLE_OUT         
        WHERE 
          COD_CUATM IN (:pCOD_CUATM)   AND
          --PERIOADA IN (1060,1061)     AND 
          PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA AND 
          ID_MDTABLE IN (12267) AND
          FORM IN (:pFORM)             AND
          FORM_VERS IN (:pFORM_VERS)     
          
          
          GROUP BY
          ORDINE,
          NUME_ROW
--          REGEXP_SUBSTR(NR_ROW, '\d+'),
--          NR_ROW
          ORDER BY
          ORDINE
          