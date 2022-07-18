SELECT

 'Ati completat incorect  = '||SUM (CASE WHEN D.RIND IN ('INMPUT') THEN D.COL1  ELSE null END )    AS REZULTAT

 

        
FROM VW_DATA_ALL D

WHERE
  (D.PERIOADA=:PERIOADA          ) AND
  (D.CUIIO=:CUIIO                ) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS ) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
   D.FORM IN (64)
   AND D.CAPITOL  IN (100)
   

   
  
HAVING

SUM (CASE WHEN D.RIND IN ('INMPUT') THEN D.COL1  ELSE null END ) <>   1  
