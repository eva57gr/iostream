SELECT 
L.RIND L_RIND,
L.COL1 L_COL1,
R.RIND R_RIND,
R.COL5 R_COL5


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
  (D.FORM            = :FORM             )        AND 
  (D.FORM_VERS       = :FORM_VERS)   AND 
  (D.CAPITOL         = :CAPITOL)   AND 
  (D.CAPITOL_VERS    = :CAPITOL_VERS     OR :CAPITOL_VERS = -1  ) 
  AND D.FORM = 67 
  AND D.CAPITOL IN (1141)
  AND D.RIND IN ('500','560')    
  AND D.ID_SCHEMA = 2
  AND D.CUIIO = 2747453
  GROUP BY
   D.CUIIO, 
   D.RIND
 --Cap.V Rind 500, 560 Col1= Rind 500, 560 Col5 (anul-1)  
  ) L  LEFT JOIN (
  SELECT 
D.CUIIO,
D.RIND,
SUM(D.COL5) AS COL5 
FROM

     CIS2.VW_DATA_ALL D 
      
WHERE

  (D.PERIOADA        = :PERIOADA          ) AND
  (D.CUIIO           =:CUIIO              ) AND
  (D.CUIIO_VERS      = :CUIIO_VERS       OR :CUIIO_VERS = -1)  AND 
  (D.FORM            = :FORM      )        AND 
  (D.FORM_VERS       = :FORM_VERS)   AND 
  (D.CAPITOL         = :CAPITOL)   AND 
  (D.CAPITOL_VERS    = :CAPITOL_VERS     OR :CAPITOL_VERS = -1  ) 
  AND D.FORM = 67 
  AND D.CAPITOL IN (1141)
  AND D.RIND IN ('500','560')    
 
  AND D.CUIIO = 2747453
  GROUP BY
   D.CUIIO, 
   D.RIND
 

--Cap.V Rind 500, 560 Col1= Rind 500, 560 Col5 (anul-1)  
   ORDER BY 
   D.CUIIO
  
  ) R ON R.RIND = L.RIND
  
  GROUP BY 
L.RIND,
L.COL1,
R.RIND,
R.COL5
  
  HAVING 
L.COL1 <> R.COL5   
  