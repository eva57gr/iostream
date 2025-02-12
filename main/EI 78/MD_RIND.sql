--- { id: "18406", rind: "0000001" }

SELECT 
'{ id : '||'"'||D.ID_MD||'"'||', rind: "'||D.RIND||'" },' AS COL1


FROM CIS2.MD_RIND D  INNER JOIN (

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
D.capitol= 407 AND D.capitol_vers=1064
and d.rind not in ('--')
  GROUP BY
  D.ID_MD,
  D.FORM,         
  D.FORM_VERS,
  D.CAPITOL,       
  D.RIND,
  D.ORDINE,        
  D.STATUT, 
  D.DINAMIC    

) DD ON D.RIND = DD.RIND AND D.RIND_VERS = DD.RIND_VERS

WHERE
D.STATUT = '1'  AND  
---- 
D.capitol= 407 AND D.capitol_vers = 1064

AND D.RIND NOT IN ('-')
--AND 
--(D.ORDINE > 4000 AND D.ORDINE < 5000)

  GROUP BY
   D.ID_MD,
  D.FORM,         
  D.FORM_VERS,
  D.CAPITOL,       
  D.RIND,
  D.RIND_VERS,
  D.ORDINE,        
  D.STATUT, 
  D.DINAMIC   



ORDER BY
D.ORDINE