SELECT 

D.RIND,
SUM(CASE WHEN D.RIND IN ('050') THEN D.COL1 ELSE NULL END )  AS COL1,
SUM(CASE WHEN D.RIND IN ('010','020','030','035','040','050') THEN D.COL1 ELSE NULL END )  AS COL2


FROM
  CIS2.VW_DATA_ALL D
  


WHERE
  (D.PERIOADA=:PERIOADA          ) AND
 -- (D.CUIIO=:CUIIO                ) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS ) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (49)  AND
  D.CAPITOL IN (1049)
  
   ------------------------------------------------------------------
  AND D.RIND IN (
  
  SELECT 
        D.RIND
       
        
        FROM CIS2.MD_RIND D
        
        
        
        
        WHERE 
        
        FORM IN (49)
        AND CAPITOL IN (1049)
        
       AND D.RIND NOT IN 
       
       (
       
        SELECT 
        CODUL
        
        FROM CIS2.CL_TARI_CS
        
        
       )       
       
        
        
       -------------------------------------
  
  
  )
  
  GROUP BY 
  D.RIND
-- D.CUIIO
 
 
HAVING

SUM(CASE WHEN D.RIND IN ('050') THEN D.COL1 ELSE NULL END ) IS NOT null 

AND
SUM(CASE WHEN D.RIND IN ('010','020','030','035','040','050') THEN D.COL1 ELSE NULL END ) IS NOT null

--   CIS2.NVAL(SUM(CASE WHEN D.RIND IN('030') THEN DECODE(CC.NR_COLUMN,'1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6, '7', D.COL7, '8', D.COL8, '9', D.COL9,'10', D.COL10, '11', D.COL11, '12', D.COL12, '13', D.COL13) ELSE 0 END)) <> 
--   CIS2.NVAL(SUM(CASE WHEN  SUBSTR(D.RIND,1,1) IN (3) THEN DECODE(CC.NR_COLUMN,'1', D.COL1, '2', D.COL2, '3', D.COL3, '4', D.COL4, '5', D.COL5, '6', D.COL6, '7', D.COL7, '8', D.COL8, '9', D.COL9,'10', D.COL10, '11', D.COL11, '12', D.COL12, '13', D.COL13)ELSE 0 END))


