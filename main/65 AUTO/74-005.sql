SELECT
 
  'Daca SR=1, atunci la întrebarea 1 trebuie sa fie "da", iar 1.1, 1.2 ?i 1.3 sa nu fie completate' AS REZULTAT 
FROM
VW_DATA_ALL  D                                  
WHERE
  (D.PERIOADA=:PERIOADA) AND
  (D.CUIIO=:CUIIO) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS  OR :FORM_VERS = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
 
  D.FORM = 74
  AND D.CAPITOL IN (1197,1199)

HAVING
SUM(CASE WHEN D.capitol=1199 AND D.RIND IN ('1') THEN D.COL1 ELSE 0 END) = 1 

AND
SUM(CASE WHEN D.capitol=1197 AND D.RIND IN ('1') THEN D.COL2 ELSE 0 END) = 1

AND SUM(CASE WHEN D.capitol=1197 AND D.RIND IN ('1.1','1.2','1.3') THEN D.COL1 ELSE 0 END) = 1
