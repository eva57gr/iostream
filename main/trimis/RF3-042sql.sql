SELECT
DISTINCT 
  'Rind.'||(CASE WHEN L.RIND IS NULL THEN R.RIND  ELSE L.RIND END)||':   '|| SUM(NVAL(R.COL1)) ||' <> '|| SUM(NVAL(L.COL1)) AS REZULTAT
 
FROM 


(
SELECT 
--D.CUIIO,
D.RIND,
SUM(D.COL2) AS COL1 
FROM

     CIS2.VW_DATA_ALL_FR D 
      
WHERE
  
  (D.PERIOADA        = :PERIOADA -1           ) AND
  (D.CUIIO           =:CUIIO              ) AND
  (:CUIIO_VERS       = :CUIIO_VERS     OR :CUIIO_VERS   <>  :CUIIO_VERS)  AND 
  (:FORM             = :FORM           OR :FORM  <>  :FORM )        AND 
  (:FORM_VERS        = :FORM_VERS      OR :FORM_VERS  <> :FORM_VERS)   AND 
  (:CAPITOL          = :CAPITOL        OR :CAPITOL  <> :CAPITOL  )   AND 
  (:CAPITOL_VERS     = :CAPITOL_VERS   OR :CAPITOL_VERS  <> :CAPITOL_VERS) 

  
  
  
  AND D.FORM = 63 
  AND D.CAPITOL IN (1120)
 
  GROUP BY
  --D.CUIIO, 
  D.RIND 
 

 
 
  ) L LEFT JOIN (


SELECT 
--D.CUIIO,
D.RIND,
SUM(D.COL1) AS COL1 
FROM

     USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE_FR D 
     

      
WHERE
  
  (D.PERIOADA        =:PERIOADA           ) AND
  (D.CUIIO           =:CUIIO              ) AND
  (D.CUIIO_VERS      = :CUIIO_VERS       OR :CUIIO_VERS = -1)  AND 
  (D.FORM            = :FORM             )        AND 
  (D.FORM_VERS       = :FORM_VERS         )   AND 
  (D.CAPITOL         = :CAPITOL          OR :CAPITOL = -1  )   AND 
  (D.CAPITOL_VERS    = :CAPITOL_VERS     OR :CAPITOL_VERS = -1  ) 
  AND D.FORM = 63 
  AND D.CAPITOL IN (1120)            
  AND D.ID_SCHEMA IN (2) 
  
  
 

  GROUP BY
  --D.CUIIO, 
  D.RIND
  
  
  ) R ON (
  
  --R.CUIIO = L.CUIIO   AND 
  
  L.RIND = R.RIND) -- AND L.COL1 = R.COL1)   
   
  
 
  
  GROUP BY
  L.RIND,
  R.RIND
  
  HAVING 
--  NVAL(SUM(L.COL1))  <>   NVAL(SUM(R.COL1))
--  
--  AND
  (
 SELECT
  DISTINCT
  D.CUIIO
FROM
  CIS2.VW_DATA_ALL_FR D
WHERE
  (D.PERIOADA IN (:PERIOADA-1)) AND
  (D.CUIIO=:CUIIO  ) AND
   D.FORM  IN(63)
   AND D.CAPITOL IN (1120)
   
   
   ) IS NOT NULL
  
  
  UNION 
  
  SELECT
DISTINCT 
  'Rind.'||(CASE WHEN L.RIND IS NULL THEN R.RIND  ELSE L.RIND END)||':   '|| SUM(NVAL(R.COL1)) ||' <> '|| SUM(NVAL(L.COL1)) AS REZULTAT
 
FROM 


(
SELECT 
--D.CUIIO,
D.RIND,
SUM(D.COL2) AS COL1 
FROM

     CIS2.VW_DATA_ALL_FR D 
      
WHERE
  
  (D.PERIOADA        = :PERIOADA -1           ) AND
  (D.CUIIO           =:CUIIO              ) AND
  (:CUIIO_VERS       = :CUIIO_VERS     OR :CUIIO_VERS   <>  :CUIIO_VERS)  AND 
  (:FORM             = :FORM           OR :FORM  <>  :FORM )        AND 
  (:FORM_VERS        = :FORM_VERS      OR :FORM_VERS  <> :FORM_VERS)   AND 
  (:CAPITOL          = :CAPITOL        OR :CAPITOL  <> :CAPITOL  )   AND 
  (:CAPITOL_VERS     = :CAPITOL_VERS   OR :CAPITOL_VERS  <> :CAPITOL_VERS) 

  
  
  
  AND D.FORM = 63 
  AND D.CAPITOL IN (1120)
 
  GROUP BY
  --D.CUIIO, 
  D.RIND 
 

 
 
  ) L  RIGHT JOIN (


SELECT 
--D.CUIIO,
D.RIND,
SUM(D.COL1) AS COL1 
FROM

     USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE_FR D 
     

      
WHERE
  
  (D.PERIOADA        =:PERIOADA           ) AND
  (D.CUIIO           =:CUIIO              ) AND
  (D.CUIIO_VERS      = :CUIIO_VERS       OR :CUIIO_VERS = -1)  AND 
  (D.FORM            = :FORM             )        AND 
  (D.FORM_VERS       = :FORM_VERS         )   AND 
  (D.CAPITOL         = :CAPITOL          OR :CAPITOL = -1  )   AND 
  (D.CAPITOL_VERS    = :CAPITOL_VERS     OR :CAPITOL_VERS = -1  ) 
  AND D.FORM = 63 
  AND D.CAPITOL IN (1120)            
  AND D.ID_SCHEMA IN (2) 
  
  
 

  GROUP BY
  --D.CUIIO, 
  D.RIND
  
  
  ) R ON (
  
  --R.CUIIO = L.CUIIO   AND 
  
  L.RIND = R.RIND) -- AND L.COL1 = R.COL1)   
   
  

  
  GROUP BY
  L.RIND,
  R.RIND
  
 HAVING 
--  NVAL(SUM(L.COL1))  <>   NVAL(SUM(R.COL1))
  
   -- AND
  (
 SELECT
  DISTINCT
  D.CUIIO
FROM
  CIS2.VW_DATA_ALL_FR D
WHERE
  (D.PERIOADA IN (:PERIOADA-1)) AND
  (D.CUIIO=:CUIIO  ) AND
   D.FORM  IN(63)
   AND D.CAPITOL IN (1120)
   
   
   ) IS NOT NULL
 
  
  
  
  
 
  
  
  
  