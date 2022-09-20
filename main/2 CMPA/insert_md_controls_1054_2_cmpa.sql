--INSERT INTO CIS2.MD_CONTROL
--(
--
--
--      CONTROL,
--      CONTROL_VERS,
--      FORM,
--      FORM_VERS,
--      CAPITOL,
--      CAPITOL_VERS,
--      ID_MD, 
--      FORMULA,
--      SQL_TEXT,
--      PRIORITATEA,
--      DATA_REG, 
--      STATUT
--) 


SELECT 
      L.CONTROL,
--      L.CONTROL_VERS,
--      L.FORM,
--      L.FORM_VERS,
--      L.CAPITOL,
--      L.CAPITOL_VERS,
--      L.ID_MD, 
      L.FORMULA,
--      L.SQL_TEXT,
      L.PRIORITATEA,
--      L.DATA_REG, 
      L.STATUT
      
      
        
        FROM

( 
SELECT 
      B.CONTROL,
      B.CONTROL_VERS,
      B.FORM,
      B.FORM_VERS,
      B.CAPITOL,
      B.CAPITOL_VERS,
      B.ID_MD, 
      B.FORMULA,
      B.SQL_TEXT, 
      B.PRIORITATEA,
      B.DATA_REG, 
      B.STATUT
      
      
        
        FROM CIS2.MD_CONTROL B  INNER JOIN (
        SELECT 
        A.CONTROL, 
        MAX(A.CONTROL_VERS) CONTROL_VERS
        
        FROM CIS2.MD_CONTROL A
        
        
         WHERE
         1=1
         AND A.FORM  = 58
               
         GROUP BY 
          A.CONTROL
         
         ORDER BY 
          A.CONTROL
        
        )  A  ON A.CONTROL = B.CONTROL AND A.CONTROL_VERS = B.CONTROL_VERS   
        
        
         WHERE
         1=1
         AND B.FORM  = 58
         AND B.STATUT <> '3'
        -- AND B.FORM_VERS = 2009
               
         
         
         ORDER BY 
          B.CONTROL ) L
          
          
          WHERE 
          L.CONTROL_VERS =  1054