SELECT 
DISTINCT 
D.CUIIO

FROM   
       
     
     
     CIS2.VW_DATA_ALL D   
    
                   
WHERE
  D.FORM IN (40)             AND 
     
  D.PERIOADA =:pPERIOADA AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'  

  
  

GROUP BY 
D.CUIIO

--
HAVING 

SUM (CASE WHEN  D.CAPITOL IN (1022)  AND D.RIND IN ('19') THEN D.COL14 ELSE  0  END ) =    0 
--ORDER BY 
--D.CUIIO,
--D.CAPITOL,
--D.RIND