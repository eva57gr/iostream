     SELECT D.*
            
            FROM CIS2.MD_RIND D 
            
            WHERE 
            
            D.RIND_VERS = 2010
            AND FORM = 64
            
            
            AND D.RIND IN (
            
            SELECT 
            D.RIND
            
            
            FROM CIS2.MD_RIND D 
            
            WHERE 
            D.ID_MD BETWEEN 58733 AND 58785
          
            )
            
            AND D.RIND NOT IN('-')