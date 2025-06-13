SELECT 
      L.CONTROL,
      L.FORMULA,
      L.SQL_TEXT,
      L.PRIORITATEA,
      L.STATUT
      
      
        
        FROM

( ---------------------------

SELECT 
      L.CONTROL,
      L.FORMULA,
      L.SQL_TEXT,
      L.PRIORITATEA,
      L.STATUT
      
      
  ---------------------      
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
         AND A.FORM  = 45
         
         AND A.CONTROL_VERS <=:pPERIOADA 
               
         GROUP BY 
          A.CONTROL
         
         ORDER BY 
          A.CONTROL
        
        )  A  ON A.CONTROL = B.CONTROL AND A.CONTROL_VERS = B.CONTROL_VERS   
        
        
         WHERE
         1=1
         AND B.FORM  = 45
         AND B.STATUT <> '3'
         
        
        
               
         
         
         ORDER BY 
          B.CONTROL ) L
          
          WHERE 
          1=1
        --  AND L.FORMULA LIKE '%=%'
          ) L
          
--            WHERE 
--         1=1  
--          AND L.CONTROL    NOT   IN ('45-007','45-009','45-028','45-036','45-025','45-037','45-030','45-001'
--          ,'45-002','45-006','45-008','45-010','45-011','45-012','45-013','45-014','45-015','45-017','45-023','45-026','45-027','45-024','45-029'
--          ,'45-042','45-043','45-044','45-018','45-016','45-005','45-039','45-019','45-019','45-040','45-020')
--          
          
          
--         AND  
--         
--          (L.FORMULA  NOT LIKE '%>=%'
--          AND 
--          L.FORMULA  NOT LIKE '%=>%')