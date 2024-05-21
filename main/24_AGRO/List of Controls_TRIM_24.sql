SELECT 
      L.CONTROL,
      L.FORMULA,
      L.SQL_TEXT,
      L.PRIORITATEA,
      L.STATUT
      
      
        
        FROM

( 
SELECT 
      B.CONTROL,
      B.FORMULA,
      B.SQL_TEXT,
      B.PRIORITATEA,
      B.STATUT
      
      
        
        FROM CIS2.MD_CONTROL B  INNER JOIN (
        SELECT 
        A.CONTROL, 
        MAX(A.CONTROL_VERS) CONTROL_VERS
        
        FROM CIS2.MD_CONTROL A
        
        
         WHERE
         1=1
         AND A.FORM  = 33
               
         GROUP BY 
          A.CONTROL
         
         ORDER BY 
          A.CONTROL
        
        )  A  ON A.CONTROL = B.CONTROL AND A.CONTROL_VERS = B.CONTROL_VERS   
        
        
         WHERE
         1=1
         AND B.FORM  = 33
         AND B.STATUT <> '3'
        -- AND B.FORM_VERS = 2009
               
         
         
         ORDER BY 
          B.CONTROL ) L
          
          
--          WHERE 
--          1=1
--          AND  L.FORMULA LIKE '%Cap.2%'
          
          
          