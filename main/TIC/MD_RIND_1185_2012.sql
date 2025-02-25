SELECT 

      D.RIND,
      D.RIND_VERS,
      D.ORDINE  
     FROM     CIS2.MD_RIND D
     
     WHERE 
     
     D.CAPITOL  IN (1186)
     AND D.CAPITOL_VERS = 2012 
     AND D.RIND IN ('611','612','620','631','632','633','641','642','643','660','670')   
GROUP BY 
      D.RIND,
      D.RIND_VERS,
      D.ORDINE          
      
      ORDER BY 
      D.ORDINE