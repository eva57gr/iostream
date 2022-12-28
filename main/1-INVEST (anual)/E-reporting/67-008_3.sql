SELECT
DISTINCT 
 'Rind.'||L.RIND  
||':  '|| SUM(NVAL(L.COL1)) ||' <>  '||SUM(NVAL(R.COL5))    AS REZULTAT


FROM 


(
SELECT 
D.CUIIO,
D.RIND,
SUM(D.COL1) AS COL1 
FROM

     USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE D 
      
WHERE

  (D.PERIOADA        =:PERIOADA          ) AND
  (D.CUIIO           =:CUIIO              ) AND
  (D.CUIIO_VERS      = :CUIIO_VERS       OR :CUIIO_VERS = -1)  AND 
  (D.FORM            = :FORM             OR :FORM = -1)        AND 
  (D.FORM_VERS       = :FORM_VERS        OR :FORM_VERS = -1)   AND 
  (D.CAPITOL         = :CAPITOL          OR :CAPITOL = -1  )   AND 
  (D.CAPITOL_VERS    = :CAPITOL_VERS     OR :CAPITOL_VERS = -1  ) 
  AND D.FORM = 67 
  AND D.CAPITOL IN (1141)
  AND D.RIND IN ('500','560')    

  AND D.ID_SCHEMA = 2
  
  GROUP BY
  D.CUIIO,
  D.RIND
  
   ) L  LEFT JOIN (
   
   
   SELECT 
D.CUIIO,
D.RIND,
SUM(D.COL5) AS COL5 
FROM

     CIS2.VW_DATA_ALL D 
      
WHERE
  (D.PERIOADA        =:PERIOADA          ) AND
  (D.CUIIO=:CUIIO                ) AND
  (:CUIIO_VERS<>:CUIIO_VERS      OR :CUIIO_VERS=:CUIIO_VERS) AND
  (:FORM <> :FORM                OR :FORM =:FORM) AND
  (:FORM_VERS<>:FORM_VERS        OR :FORM_VERS=:FORM_VERS) AND
  (:CAPITOL <> :CAPITOL          OR :CAPITOL=:CAPITOL) AND
  (:CAPITOL_VERS<>:CAPITOL_VERS OR :CAPITOL_VERS=:CAPITOL_VERS) AND
  (:ID_MD=:ID_MD               OR :ID_MD = -1)
  AND D.FORM = 67 
  AND D.CAPITOL IN (1141)
  AND D.RIND IN ('500','560')    
 

  
  GROUP BY
  D.CUIIO, 
  D.RIND
   )  R ON (R.CUIIO = L.CUIIO AND R.RIND = L.RIND)
   
   
   GROUP BY 
   L.RIND 
   
   HAVING 
   
   SUM(NVAL(L.COL1)) <> SUM(NVAL(R.COL5))
     
   
  
  
  


 
 
 
