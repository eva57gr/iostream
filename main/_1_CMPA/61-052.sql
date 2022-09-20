SELECT  
DISTINCT 'Completati Cap.II  rind (100,101,110) col.1,2 ' AS REZULTAT
 FROM
  CIS2.VW_DATA_ALL_GC D         

  INNER JOIN
         (
           SELECT P.PERIOADA, 
            P.NUM 
           FROM CIS2.VW_MD_PERIOADA P 
           
          WHERE P.PERIOADA = :PERIOADA
           AND P.NUM IN  (3,4)
   
        ) P ON(D.PERIOADA=P.PERIOADA)
  WHERE
  (D.NR_GOSP=:NR_GOSP           ) AND
  (D.UNIT_CODE_VERS=:UNIT_CODE_VERS    OR :UNIT_CODE_VERS = -1) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS  ) AND
  (:CAPITOL=:CAPITOL            OR :CAPITOL <> :CAPITOL) AND
  (:CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS <>:CAPITOL_VERS) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (61)  
  AND  P.NUM IN  (3,4)
  GROUP BY 
  D.RIND
  HAVING
(

  SELECT MAX (D.RIND)     AS RIND
            FROM CIS2.VW_DATA_ALL_GC  D
                 INNER JOIN
                 (SELECT P.PERIOADA, P.NUM
                    FROM CIS2.VW_MD_PERIOADA P
                   WHERE P.PERIOADA = :PERIOADA AND P.NUM IN (3, 4)) P
                     ON (D.PERIOADA = P.PERIOADA)
           WHERE     (D.NR_GOSP = :NR_GOSP )
                 AND D.FORM IN (61)
                 AND D.CAPITOL IN (1114)
                 AND P.NUM IN (3, 4)
                 AND D.RIND IN ('TIP2', 'TIP3')
                 AND D.PERIOADA = :PERIOADA
  
  

  
  
  ) IS NOT  NULL 
  
  AND 
  (   
  
  
SELECT 
RIND
FROM 

(
SELECT MAX (D.RIND)     AS RIND,
           SUM(D.COL1) AS COL1,
           SUM(D.COL2) AS COL2
            FROM CIS2.VW_DATA_ALL_GC  D
                 INNER JOIN
                 (SELECT P.PERIOADA, P.NUM
                    FROM CIS2.VW_MD_PERIOADA P
                   WHERE P.PERIOADA = :PERIOADA AND P.NUM IN (3, 4)) P
                     ON (D.PERIOADA = P.PERIOADA)
           WHERE     (D.NR_GOSP = :NR_GOSP )
                 AND D.FORM IN (61)
                 AND D.CAPITOL IN (1111)
                 AND P.NUM IN (3, 4)
                 AND D.RIND IN ('100', '101', '110')
                 AND D.PERIOADA = :PERIOADA
                 
                 
                 HAVING 
                 
                 SUM(D.COL1) <> 0
                 OR  
                 SUM(D.COL2) <> 0 
                 )
                 
                 
                 ) 
                 
                 
                 IS NULL