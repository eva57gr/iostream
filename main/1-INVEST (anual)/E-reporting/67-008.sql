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
 -- AND CUIIO = 2747453
  AND D.ID_SCHEMA = 2
  
  GROUP BY
  D.CUIIO, 
  D.RIND
  
  
  


 
 
 
