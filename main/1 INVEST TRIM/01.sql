SELECT DISTINCT 
 
 'Raportul nu are date in  CAP INV  ' 
 AS REZULTAT

   
FROM
  VW_DATA_ALL D   

WHERE
  (D.PERIOADA=:PERIOADA          ) AND
  (D.CUIIO=:CUIIO                ) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS ) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
   
  D.FORM IN (6) 
 
 HAVING
 

( SUM(CASE WHEN  D.CAPITOL IN (0) AND RIND IN ('01')  THEN NVAL(D.COL1)   ELSE 0 END)  = 1 
 
AND 

SUM(CASE WHEN  D.CAPITOL  IN (31)    THEN NVAL(D.COL1) + NVAL(D.COL2) 
                                              
                                              
                                                                                    
 ELSE 0 END) = 0 )
 
 OR 
 
 ( SUM(CASE WHEN  D.CAPITOL IN (0) AND RIND IN ('01')  THEN NVAL(D.COL1)   ELSE 0 END)  <> 1 
 
AND 

SUM(CASE WHEN  D.CAPITOL  IN (31)    THEN NVAL(D.COL1) + NVAL(D.COL2) 
                                                                                    
 ELSE 0 END) > 0 )