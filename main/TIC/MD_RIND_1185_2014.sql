SELECT 

      D.RIND,
      D.RIND_VERS,
      D.ORDINE  
     FROM     CIS2.MD_RIND D
     
     WHERE 
     
     D.CAPITOL  IN (1185)
     AND D.CAPITOL_VERS = 2014 
     AND D.RIND IN ('511','512','520','531','532','533','541','542','543','560','570')  
     AND D.FORM_VERS = 2011
      
GROUP BY 
      D.RIND,
      D.RIND_VERS,
      D.ORDINE          
      
      ORDER BY 
      D.ORDINE