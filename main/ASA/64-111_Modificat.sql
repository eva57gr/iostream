
SELECT 
L.CNT_R,
L.RIND,
L.CNT,
L.CAEM2
FROM
(
SELECT 
 ROWNUM CNT_R,
 D.RIND,
 COUNT(D.RIND) AS CNT,
 TO_CHAR(NVAL(MAX(CASE WHEN D.CAPITOL IN (1127) AND D.RIND NOT IN ('400','-') THEN D.COL31  ELSE NULL END)))  AS CAEM2
 

 
 
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
              AND D.ID_MD = 58735
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
   AND D.CAPITOL IN (1127)  AND D.RIND NOT IN ('400','-')


GROUP BY
D.RIND,
ROWNUM

HAVING

MAX(DD.COL1) > 0  ) L LEFT JOIN 


(

 SELECT 

            SUBSTR(CODUL,2,4) AS COL3
                
                FROM  CIS2.VW_CL_CAEM2
                
                WHERE 
                PRIM IN ('1')
                
                AND 
                (
                 SUBSTR(CODUL,2,2)  IN ('47','45')
                OR 
                SUBSTR(CODUL,2,3)  IN ('461') )
                
                
 ) R ON R.COL3 = L.CAEM2
 
 GROUP BY
L.CNT_R,
L.RIND,
L.CNT,
L.CAEM2,
R.COL3

--
-- HAVING
-- 
-- R.COL3 IS  NULL 
 
Rescrie aceasta  
L este A
R este b