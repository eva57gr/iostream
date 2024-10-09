SELECT DISTINCT 

DECODE(CC.NR_COLUMN,'1', 'COL1 ', '2', 'COL2 ', '3', 'COL3 ', '4', 'COL4 ', '5', 'COL5 ', '6', 'COL6 ', '7', 'COL7 ', '8', 'COL8 ','9', 'COL9 ','10', 'COL10 ', '11', 'COL11 ', 
'12', 'COL12 ','13', 'COL13 ', '14', 'COL14 ', '15', 'COL15 ', '16', 'COL16 ', '17', 'COL17' )||': '||


   
   CIS2.NVAL(SUM(CASE WHEN D.RIND IN('060') THEN DECODE(CC.NR_COLUMN,'1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6, '7', D.COL7, 
   '8', D.COL8, '9', D.COL9,'10', D.COL10, '11', D.COL11, '12', D.COL12, '13', D.COL13, '14', D.COL14, '15', D.COL15, '16', D.COL16, '17', D.COL17) ELSE 0 END))||' <> '||
  
   CIS2.NVAL(SUM(CASE WHEN D.RIND IS NOT NULL AND MD.ORDINE  BETWEEN 7000 AND 7225 THEN DECODE(CC.NR_COLUMN,'1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6, 
   '7', D.COL7, '8', D.COL8, '9', D.COL9,'10', D.COL10, '11', D.COL11, '12', D.COL12, '13', D.COL13, '14', D.COL14, '15', D.COL15, '16', D.COL16, '17', D.COL17)ELSE 0 END))
  
  
  AS REZULTAT

FROM
  CIS2.VW_DATA_ALL D  INNER JOIN CIS2.MD_RIND MD ON MD.ID_MD=D.ID_MD,             
       (                                                                        
       SELECT '1' AS NR_COLUMN FROM DUAL UNION
       SELECT '2' AS NR_COLUMN FROM DUAL UNION
       SELECT '3' AS NR_COLUMN FROM DUAL UNION                                                                                                    
       SELECT '4' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '5' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '6' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '7' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '8' AS NR_COLUMN FROM DUAL UNION
       SELECT '9' AS NR_COLUMN FROM DUAL UNION
       SELECT '10' AS NR_COLUMN FROM DUAL UNION
       SELECT '11' AS NR_COLUMN FROM DUAL UNION
       SELECT '12' AS NR_COLUMN FROM DUAL UNION
       SELECT '13' AS NR_COLUMN FROM DUAL UNION
       SELECT '14' AS NR_COLUMN FROM DUAL UNION
       SELECT '15' AS NR_COLUMN FROM DUAL UNION
       SELECT '16' AS NR_COLUMN FROM DUAL UNION
       SELECT '17' AS NR_COLUMN FROM DUAL 
       
       ) CC                                     


WHERE
  (D.PERIOADA=:PERIOADA          ) AND
  (D.CUIIO=:CUIIO                ) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS ) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (50)  AND
  D.CAPITOL IN (1058)
  
 GROUP BY CC.NR_COLUMN 
-- 
HAVING
    
   CIS2.NVAL(SUM(CASE WHEN D.RIND IN('060') THEN DECODE(CC.NR_COLUMN,'1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6, '7', D.COL7, 
   '8', D.COL8, '9', D.COL9,'10', D.COL10, '11', D.COL11, '12', D.COL12, '13', D.COL13, '14', D.COL14, '15', D.COL15, '16', D.COL16, '17', D.COL17) ELSE 0 END)) <> 
   
   CIS2.NVAL(SUM(CASE WHEN D.RIND IS NOT NULL AND MD.ORDINE  BETWEEN 7000 AND 7225 THEN DECODE(CC.NR_COLUMN,'1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6, 
   '7', D.COL7, '8', D.COL8, '9', D.COL9,'10', D.COL10, '11', D.COL11, '12', D.COL12, '13', D.COL13, '14', D.COL14, '15', D.COL15, '16', D.COL16, '17', D.COL17)ELSE 0 END))

