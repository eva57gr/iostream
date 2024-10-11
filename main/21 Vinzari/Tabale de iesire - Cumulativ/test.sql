INSERT INTO TABLE_OUT 
(
  PERIOADA,
  FORM,
  FORM_VERS,
  ID_MDTABLE,
  COD_CUATM,
  NR_SECTIE,
  NUME_SECTIE,
  NR_SECTIE1,
  NUME_SECTIE1,
  NR_SECTIE2,
  NUME_SECTIE2,
  NR_ROW,
  ORDINE,
  DECIMAL_POS,
  NUME_ROW,  
 COL1,COL2,COL3,COL4,COL5
)
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
  
  
SUM(CASE
        WHEN INSTR(NR_ROW, '~') > 1 THEN SUBSTR(NR_ROW, 1, INSTR(NR_ROW, '~') - 1)
        ELSE NULL  
    END ) ||'~'||ORDINE NR_ROW,

ORDINE,
  '02002' AS DECIMAL_POS,
NUME_ROW,
SUM(COL1) AS COL1,
ROUND(SUM(COL1) / SUM(CASE
        WHEN INSTR(NR_ROW, '~') > 1 THEN SUBSTR(NR_ROW, 1, INSTR(NR_ROW, '~') - 1)
        ELSE NULL   
    END ),2)  AS COL2,
SUM(COL3) AS COL3,
SUM(COL4) AS COL4,

ROUND (SUM(COL4) / NOZERO(SUM(COL3)),2)   AS COL5 -- In each row in the SQL column - is sqlcode.
--Now in every sql code it is ROUND (SUM(COL4) / NOZERO(SUM(COL3)),2) Now, exactly this code I have to change it with ROUND (NVAL(SUM(COL4)) / NOZERO(NVAL(SUM(COL3))),2)   AS COL5 
--Create update . Will be 
-- SET SQL_TEXT = 'New sunstring'
      
      FROM TABLE_OUT         
        WHERE 
          COD_CUATM IN (:pCOD_CUATM)   AND
        
          PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA AND 
          ID_MDTABLE IN (12403) AND
          FORM IN (:pFORM)             AND
          FORM_VERS IN (:pFORM_VERS)     
          
          
          GROUP BY
          ORDINE,
          NUME_ROW
--          NR_ROW
          
          ORDER BY
          ORDINE