SELECT
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
         -----------------------------------------------
         -------------------------------------------------
  '0' AS NR_SECTIE,
  '0' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
SUM(CASE WHEN NVAL(COL1) + NVAL(COL2) + NVAL(COL3) = 0 THEN NULL  ELSE   REGEXP_SUBSTR(NR_ROW, '\d+') END) ||'~'||ORDINE  AS NR_ROW, 
ORDINE,
  '0000' AS DECIMAL_POS,
NUME_ROW,
SUM(COL1) AS COL1,
SUM(COL2) AS COL2,
SUM(COL3) AS COL3
--SUM(COL4) AS COL4,
--SUM(COL5) AS COL5
      
      FROM TABLE_OUT         
        WHERE 
          COD_CUATM IN (:pCOD_CUATM)   AND
        --  PERIOADA IN (1060)     AND 
          PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA AND 
          ID_MDTABLE IN (13178) AND
          FORM IN (:pFORM)             AND
          FORM_VERS IN (:pFORM_VERS)     
          
          
          GROUP BY
          ORDINE,
          NUME_ROW
----          NR_ROW
          
          ORDER BY
          ORDINE
          