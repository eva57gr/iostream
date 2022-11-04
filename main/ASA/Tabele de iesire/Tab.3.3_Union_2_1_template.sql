SELECT D.RIND,
            D.ID_MD
            
            FROM CIS2.MD_RIND D 
            
            WHERE 
            D.ID_MD BETWEEN 58733 AND 58785
            OR D.ID_MD IN (58791,59030,59032);
            
            
            
             SELECT D.*
            
            FROM CIS2.MD_RIND D 
            
            WHERE 
            D.ID_MD BETWEEN 58733 AND 58785
            
            
--            OR D.ID_MD IN (58791,59030,59032)
            
            ;
            
            
            
            
              SELECT D.*
            
            FROM CIS2.MD_RIND D 
            
            WHERE 
            
            D.RIND_VERS = 2010
            AND FORM = 64
            
        