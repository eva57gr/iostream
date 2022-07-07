SELECT DISTINCT
 DECODE(CC.NR_COLUMN, '1', 'COL1 ', '2', 'COL2 ', '3', 'COL3 ', '4', 'COL4 ', '5', 'COL5 ', '6', 'COL6 ', '7', 'COL7 ', '8', 'COL8 ', '9', 'COL9 ', 
                      '10', 'COL10 ', '11', 'COL11 ', '12', 'COL12 ')||': '||
 
   ROUND(CIS.NVAL(
   SUM
   (
        CASE WHEN D.PERIOADA IN (:PERIOADA) AND  D.RIND IN ('70') 
          THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2',D.COL2, '3',D.COL3, '4',D.COL4, '5',D.COL5, '6',D.COL6, '7',D.COL7, '8',D.COL8, '9',D.COL9, 
                                    '10',D.COL10, '11',D.COL11, '12',D.COL12 ) ELSE 0 
        END  -
        CASE WHEN D.PERIOADA IN (:PERIOADA) AND  D.RIND IN ('73') 
          THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2',D.COL2, '3',D.COL3, '4',D.COL4, '5',D.COL5, '6',D.COL6, '7',D.COL7, '8',D.COL8, '9',D.COL9, 
                                    '10',D.COL10, '11',D.COL11, '12',D.COL12 ) ELSE 0 
        END
   ) * 1000 / 
   CIS.NOZERO(
   SUM(
        CASE WHEN D.PERIOADA IN (:PERIOADA) AND  D.RIND IN ('30') 
          THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2',D.COL2, '3',D.COL3, '4',D.COL4, '5',D.COL5, '6',D.COL6, '7',D.COL7, '8',D.COL8, '9',D.COL9, 
                                    '10',D.COL10, '11',D.COL11, '12',D.COL12 ) ELSE 0 
        END
   )
   )
   )/3,0)||' nu apartine intervalului [2935-20000]  Trimestru precedent  '  ||
   
    DECODE(CC.NR_COLUMN, '1', 'COL1 ', '2', 'COL2 ', '3', 'COL3 ', '4', 'COL4 ', '5', 'COL5 ', '6', 'COL6 ', '7', 'COL7 ', '8', 'COL8 ', '9', 'COL9 ', 
                      '10', 'COL10 ', '11', 'COL11 ', '12', 'COL12 ')||': '||
 
   ROUND(CIS.NVAL(
   SUM
   (
        CASE WHEN D.PERIOADA IN (:PERIOADA-3) AND  D.RIND IN ('70') 
          THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2',D.COL2, '3',D.COL3, '4',D.COL4, '5',D.COL5, '6',D.COL6, '7',D.COL7, '8',D.COL8, '9',D.COL9, 
                                    '10',D.COL10, '11',D.COL11, '12',D.COL12 ) ELSE 0 
        END  -
        CASE WHEN D.PERIOADA IN (:PERIOADA-3) AND  D.RIND IN ('73') 
          THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2',D.COL2, '3',D.COL3, '4',D.COL4, '5',D.COL5, '6',D.COL6, '7',D.COL7, '8',D.COL8, '9',D.COL9, 
                                    '10',D.COL10, '11',D.COL11, '12',D.COL12 ) ELSE 0 
        END
   ) * 1000 / 
   CIS.NOZERO(
   SUM(
        CASE WHEN D.PERIOADA IN (:PERIOADA-3) AND  D.RIND IN ('30') 
          THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2',D.COL2, '3',D.COL3, '4',D.COL4, '5',D.COL5, '6',D.COL6, '7',D.COL7, '8',D.COL8, '9',D.COL9, 
                                    '10',D.COL10, '11',D.COL11, '12',D.COL12 ) ELSE 0 
        END
   )
   )
   )/3,0)
   
   
   
   
   
   
   
  
  AS REZULTAT

FROM
  CIS.VW_DATA_ALL D,             
       (                                                                        
       SELECT '1' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '2' AS NR_COLUMN FROM DUAL  UNION                                  
       SELECT '3' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '4' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '5' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '6' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '7' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '8' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '9' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '10' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '11' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '12' AS NR_COLUMN FROM DUAL                                          
       ) CC                                      
WHERE
  
  (D.PERIOADA IN (:PERIOADA, :PERIOADA- 3 )) AND 
  (D.CUIIO=:CUIIO               ) AND
  (:CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS <> :CUIIO_VERS) AND
  (D.FORM=:FORM                 ) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (:CAPITOL=:CAPITOL            OR :CAPITOL <> :CAPITOL) AND
  (:CAPITOL_VERS=:CAPITOL_VERS  OR :CAPITOL_VERS <>  :CAPITOL_VERS) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
   D.CAPITOL IN (27) and
  (:FORM = :FORM) AND D.FORM IN (5) AND
  D.BUGET IN (0)
  
GROUP BY
  CC.NR_COLUMN
  
  
HAVING
 

  ROUND((
   SUM
   (
        CASE WHEN D.PERIOADA IN (:PERIOADA) AND  D.RIND IN ('70') 
          THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2',D.COL2, '3',D.COL3, '4',D.COL4, '5',D.COL5, '6',D.COL6, '7',D.COL7, '8',D.COL8, '9',D.COL9, 
                                    '10',D.COL10, '11',D.COL11, '12',D.COL12 ) ELSE 0 
        END  -
        CASE WHEN D.PERIOADA IN (:PERIOADA) AND  D.RIND IN ('73') 
          THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2',D.COL2, '3',D.COL3, '4',D.COL4, '5',D.COL5, '6',D.COL6, '7',D.COL7, '8',D.COL8, '9',D.COL9, 
                                    '10',D.COL10, '11',D.COL11, '12',D.COL12 ) ELSE 0 
        END
   ) * 1000 / 
   CIS.NOZERO(
   SUM(
        CASE WHEN D.PERIOADA IN (:PERIOADA) AND  D.RIND IN ('30') 
          THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2',D.COL2, '3',D.COL3, '4',D.COL4, '5',D.COL5, '6',D.COL6, '7',D.COL7, '8',D.COL8, '9',D.COL9, 
                                    '10',D.COL10, '11',D.COL11, '12',D.COL12 ) ELSE 0 
        END
   )
   )
   )/3,0)  < 3500
   
   
   
   OR 
  
ROUND((
   SUM
   (
        CASE WHEN D.PERIOADA IN (:PERIOADA) AND  D.RIND IN ('70') 
          THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2',D.COL2, '3',D.COL3, '4',D.COL4, '5',D.COL5, '6',D.COL6, '7',D.COL7, '8',D.COL8, '9',D.COL9, 
                                    '10',D.COL10, '11',D.COL11, '12',D.COL12 ) ELSE 0 
        END  -
        CASE WHEN D.PERIOADA IN (:PERIOADA) AND  D.RIND IN ('73') 
          THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2',D.COL2, '3',D.COL3, '4',D.COL4, '5',D.COL5, '6',D.COL6, '7',D.COL7, '8',D.COL8, '9',D.COL9, 
                                    '10',D.COL10, '11',D.COL11, '12',D.COL12 ) ELSE 0 
        END
   ) * 1000 / 
   CIS.NOZERO(
   SUM(
        CASE WHEN D.PERIOADA IN (:PERIOADA) AND  D.RIND IN ('30') 
          THEN DECODE(CC.NR_COLUMN, '1', D.COL1, '2',D.COL2, '3',D.COL3, '4',D.COL4, '5',D.COL5, '6',D.COL6, '7',D.COL7, '8',D.COL8, '9',D.COL9, 
                                    '10',D.COL10, '11',D.COL11, '12',D.COL12 ) ELSE 0 
        END
   )
   )
   )/3,0)  >  20000
   