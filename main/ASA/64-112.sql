SELECT 

 
 'CAP1 Rind-112 = ('||MAX(DD.COL1)||') - CAEM2 '||
 TO_CHAR(NVAL(MAX(CASE WHEN D.CAPITOL IN (1127) AND D.RIND NOT IN ('400','-') THEN D.COL31  ELSE NULL END))) 
 
 AS REZULTAT
 
-- TO_CHAR(NVAL(MAX(CASE WHEN D.CAPITOL IN (1127) AND D.RIND NOT IN ('400','-') THEN D.COL31  ELSE NULL END))) AS CAEM2
 
 
  FROM

 CIS2.VW_DATA_ALL D  
 
    INNER JOIN (
     SELECT
                D.PERIOADA, 
                D.CUIIO,
                D.CUIIO_VERS,
                D.ID_MD,
                D.COL1
                FROM CIS2.DATA_ALL D
                
                WHERE
                
                 (D.PERIOADA=:PERIOADA) AND 
                  (D.CUIIO=:CUIIO                ) AND
           (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
         (D.FORM = :FORM               ) AND
              (D.FORM_VERS=:FORM_VERS ) 
              AND D.ID_MD = 58736
    ) DD ON DD.PERIOADA = D.PERIOADA AND D.CUIIO = D.CUIIO AND D.CUIIO_VERS = D.CUIIO_VERS
 
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
   AND D.CAPITOL IN (1127,100) 

--GROUP BY 
--
--MAXD.COL31

HAVING

MAX(DD.COL1) > 0 

AND TO_CHAR(NVAL(MAX(CASE WHEN D.CAPITOL IN (1127) AND D.RIND NOT IN ('400','-') THEN D.COL31  ELSE NULL END))) 

 NOT IN  (
 SELECT 

            SUBSTR(CODUL,2,4) AS COL3
                
                FROM  CIS2.VW_CL_CAEM2
                
                WHERE 
                PRIM IN ('1')
                
                AND 
                (
                SUBSTR(CODUL,2,2)  IN ('46','45')
                
                )
 )
