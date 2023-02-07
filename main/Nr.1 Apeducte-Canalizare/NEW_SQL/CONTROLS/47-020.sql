SELECT
D.CUIIO,
  DECODE(CC.NR_COLUMN, '1', 'COL1 ', '2', 'COL2 ', '3', 'COL3 ', '4', 'COL4 ', '5', 'COL5 ', '6', 'COL6 ', '7', 'COL7 ', '8', 'COL8 ')||': '|| 
  CIS2.NVAL(SUM(CASE WHEN D.RIND     IN ('0000000') THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6, '7', D.COL7, '8', D.COL8) END)) ||' <> '||
  CIS2.NVAL(SUM(CASE WHEN D.RIND NOT IN ('0000000') THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6, '7', D.COL7, '8', D.COL8) END))
  AS REZULTAT
  
FROM
  CIS2.VW_DATA_ALL D,             
       (                                                                        
       SELECT '1' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '2' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '3' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '4' AS NR_COLUMN FROM DUAL UNION
       SELECT '5' AS NR_COLUMN FROM DUAL UNION
       SELECT '6' AS NR_COLUMN FROM DUAL UNION
       SELECT '7' AS NR_COLUMN FROM DUAL UNION
       SELECT '8' AS NR_COLUMN FROM DUAL 
                                     
       ) CC  
WHERE
  (D.PERIOADA=:PERIOADA          ) AND
  --(D.CUIIO=:CUIIO                ) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS ) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (47)  AND
  D.CAPITOL IN (1037)
  
  GROUP BY
  CC.NR_COLUMN,
  D.CUIIO

 HAVING
 CIS2.NVAL(SUM(CASE WHEN D.RIND     IN ('0000000') THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6, '7', D.COL7, '8', D.COL8) END))  <> 
 CIS2.NVAL(SUM(CASE WHEN D.RIND NOT IN ('0000000') THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6, '7', D.COL7, '8', D.COL8) END))
 
 ORDER BY CC.NR_COLUMN