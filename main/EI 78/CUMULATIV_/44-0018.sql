SELECT   
'Rind.'||D.RIND||' - nu exista asa cod in clasificatorul serviciilor = ['||D.COL31||']'

   
 AS REZULTAT

FROM
  CIS2.VW_DATA_ALL_TEMP D  
 

WHERE
  (D.PERIOADA=:PERIOADA          ) AND
  (D.CUIIO=:CUIIO                ) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               ) AND
  (D.FORM_VERS=:FORM_VERS  ) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (44)  AND
  D.RIND NOT IN ('1','--') AND 
  D.CAPITOL IN (405) 
  
  AND 
  
  D.COL31 NOT IN 
  (
 SELECT ITEM_CODE
        
        
            FROM CIS2.CLS_CLASS_ITEM 
            
            WHERE 
            1=1
            AND CLASS_CODE = 'CSPM2' 
            AND ITEM_PARENT NOT IN  ('00.00.00')
  )
  
 

GROUP BY 
  D.RIND, 
  D.COL31
