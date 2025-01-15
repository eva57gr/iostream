SELECT 

 
 'CAP1 Rind : '||CIS2.NVAL(SUM( CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('111') THEN D.COL1  ELSE NULL END)) 
 || ' CAEM în CAP.4 trebuie sa fie un CAEM ?i anume G45 sau G47 'AS REZULTAT
  
  FROM

 CIS2.VW_DATA_ALL D  
 
WHERE
  (D.PERIOADA=:PERIOADA          ) AND
  (D.CUIIO=:CUIIO                ) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS ) AND
  (:CAPITOL = :CAPITOL           OR :CAPITOL <> :CAPITOL) AND
  (:CAPITOL_VERS=:CAPITOL_VERS   OR :CAPITOL_VERS <>  :CAPITOL_VERS) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
   D.FORM = 64


HAVING
CIS2.NVAL(SUM( CASE WHEN D.CAPITOL IN (1124) AND D.RIND IN ('111') THEN D.COL1  ELSE NULL END)) > 0

--AND 
--D.COL31 NOT IN  (
--       SELECT 
--
--            SUBSTR(CODUL,2,4) AS COL3
--                
--                FROM  CIS2.VW_CL_CAEM2
--                
--                WHERE 
--                PRIM IN ('1')
--                
--                AND 
--                (
--                SUBSTR(CODUL,2,2)  IN ('47','56')
--                OR 
--                SUBSTR(CODUL,2,3) IN ('451','453','454','462','463','464','465','466','467','468','469')
--                 OR 
--                SUBSTR(CODUL,2,4) IN ('3514','3523','3530')
--                )
--                
--                
--
--)


