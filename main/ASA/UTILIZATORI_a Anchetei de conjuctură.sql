        SELECT *
        
        
            FROM CIS2.SYS_USER
            
            WHERE 
            
            NAME  LIKE '%'||:pNAME||'%' 
            OR 
            SURNAME  LIKE '%'||:pNAME||'%'



       