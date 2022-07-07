
SELECT DISTINCT 

'Rind 40 = '||
SUM( CASE WHEN   D.PERIOADA IN (:PERIOADA) AND DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', D.COL11, '12', D.COL12) IS NOT NULL AND D.RIND IN ('40') 
          THEN DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', D.COL11, '12', D.COL12)ELSE 0 END)
                                   
                                   
                                   ||' > '|| 'Rind 30 = '||
SUM( CASE WHEN  D.PERIOADA IN (:PERIOADA) AND  DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', D.COL11, '12', D.COL12) IS NOT NULL AND D.RIND IN ('30') 
          THEN DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', D.COL11, '12', D.COL12) ELSE 0 END)||' Col.'||N.NR_COLUMN
                                   
  
||' - Perioada precedenta - Rind 40 =  '||
SUM( CASE WHEN   D.PERIOADA IN (:PERIOADA -3) AND DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', D.COL11, '12', D.COL12) IS NOT NULL AND D.RIND IN ('40') 
          THEN DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', D.COL11, '12', D.COL12)ELSE 0 END)
                                   
                                   
                                   ||' > '|| 'Rind 30 = '||
SUM( CASE WHEN  D.PERIOADA IN (:PERIOADA-3) AND  DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', D.COL11, '12', D.COL12) IS NOT NULL AND D.RIND IN ('30') 
          THEN DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', D.COL11, '12', D.COL12) ELSE 0 END)||' Col.'||N.NR_COLUMN
                                 
                                   
          AS REZULTAT
FROM VW_DATA_ALL D,
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
SELECT '12' AS NR_COLUMN FROM DUAL
) N
WHERE
  (D.PERIOADA IN (:PERIOADA, :PERIOADA- 3 )) AND 
  (D.CUIIO=:CUIIO               ) AND
  (:CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS <> :CUIIO_VERS) AND
  (D.FORM=:FORM                 ) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (:CAPITOL=:CAPITOL            OR :CAPITOL <> :CAPITOL) AND
  (:CAPITOL_VERS=:CAPITOL_VERS  OR :CAPITOL_VERS <>  :CAPITOL_VERS) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  D.RIND IN ('30','40')
  
  
GROUP BY N.NR_COLUMN


HAVING
SUM( CASE WHEN D.PERIOADA IN (:PERIOADA) AND  DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', D.COL11, '12', D.COL12) IS NOT NULL AND D.RIND IN ('40') 
          THEN DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', D.COL11, '12', D.COL12) ELSE 0 END)>
SUM( CASE WHEN   D.PERIOADA IN (:PERIOADA) AND DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', D.COL11, '12', D.COL12) IS NOT NULL AND D.RIND IN ('30') 
          THEN DECODE(N.NR_COLUMN, '1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6,
                                   '7', D.COL7, '8', D.COL8, '9', D.COL9, '10', D.COL10, '11', D.COL11, '12', D.COL12) ELSE 0 END)

  
  
  
  
  
  