


SELECT 
  D.ID_MD,
  D.FORM,         
  D.FORM_VERS,
  D.CAPITOL,       
  D.RIND,
  MAX(D.RIND_VERS) RIND_VERS,
  D.ORDINE,        
  D.STATUT, 
  D.DINAMIC    

FROM CIS2.MD_RIND D

WHERE
D.STATUT = '1'  AND  
---- 
D.capitol= 398 AND D.capitol_vers=2000

  GROUP BY
  D.ID_MD,
  D.FORM,         
  D.FORM_VERS,
  D.CAPITOL,       
  D.RIND,
  D.ORDINE,        
  D.STATUT, 
  D.DINAMIC    
