SELECT   


     'Trimestrul '||D.NUM||' - '||
     DECODE(CC.NR_COLUMN, '1', 'COL.1', '2', 'COL.2', '3', 'COL.3', '4', 'COL.4')||', Rind.'||D.RIND||': '||


    NVAL(SUM(CASE WHEN   D.PERIOADA = :PERIOADA AND D.CAPITOL IN (311) THEN DECODE(CC.NR_COLUMN, '1', NVAL(D.COL1), '2', NVAL(D.COL2), '3', NVAL(D.COL3), '4', NVAL(D.COL4)) ELSE 0 END))
    
    
    AS REZULTAT

FROM
  USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE  D,             
       (                                                                        
       SELECT '1' AS NR_COLUMN FROM DUAL UNION                                  
       SELECT '2' AS NR_COLUMN FROM DUAL UNION 
       SELECT '3' AS NR_COLUMN FROM DUAL UNION 
       SELECT '4' AS NR_COLUMN FROM DUAL                                    
       ) CC 
 

WHERE
  (D.PERIOADA =:PERIOADA        ) AND
  (D.CUIIO=:CUIIO               ) AND
  (D.CUIIO_VERS=:CUIIO_VERS     ) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS       ) AND
  (D.CAPITOL=:CAPITOL           ) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS ) AND
  (D.ID_MD=:ID_MD               ) AND
  
--  (D.PERIOADA =:PERIOADA        OR :PERIOADA=  -1) AND
--  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
--  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
--  (D.FORM = :FORM               OR :FORM = -1) AND
--  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
--  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
--  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
--  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
--  
  
  D.FORM IN (5)  AND
  D.CAPITOL IN (311)
  AND  D.ID_SCHEMA IN (2)
   

 


GROUP BY CC.NR_COLUMN,D.RIND,D.NUM

HAVING  
 NVAL(SUM(CASE WHEN D.PERIOADA = :PERIOADA AND D.CAPITOL IN (311) THEN DECODE(CC.NR_COLUMN, '1', NVAL(D.COL1), '2', NVAL(D.COL2), '3', NVAL(D.COL3), '4',NVAL(D.COL4)) ELSE 0 END)) <> 0
 AND D.NUM IN (1,3)