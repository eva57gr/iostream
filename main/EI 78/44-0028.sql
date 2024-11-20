SELECT   
D.CUIIO,
'Rind.'||D.RIND||' - nu exista asa cod in clasificatorul tarior = ['||D.COL33||']'

   
 AS REZULTAT

FROM
  CIS2.VW_DATA_ALL D  
 

WHERE
  (D.PERIOADA=:PERIOADA          ) AND
 -- (D.CUIIO=:CUIIO                ) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS  ) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (44)  AND
  D.RIND NOT IN ('1','--') AND 
  D.CAPITOL IN (407) 
  
  AND 
  
  D.COL33 NOT IN 
  (
SELECT 
ITEM_CODE CODUL

FROM CIS2.VW_CLS_CLASS_ITEM

WHERE 

CLASS_CODE =   'TARI_ISO'

AND ITEM_CODE NOT IN ('000','444','55')
  )
  
 

GROUP BY 
  D.RIND, 
  D.COL33,
  D.CUIIO
