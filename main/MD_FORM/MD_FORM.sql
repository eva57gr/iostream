


        SELECT 
        FORM,
        FORM_VERS,
        DENUMIRE,
        DEN_SHORT
        
        
            FROM CIS2.MD_FORM
            
            WHERE 
            
            FORM IN (20,19,12,71,48,13,8,4,6,34,35,36,60,26,45,18,5,29,43,39,74,64,44,16,3,57,63,59,67,66)
            
            AND DEN_SHORT NOT IN ('1-Inf.rev')
            
            
            
            UNION ALL 
            
            
               SELECT 
                     FORM,
        FORM_VERS,
        DENUMIRE,
        DEN_SHORT
        
        
        
            FROM CIS.MD_FORM
            
            WHERE 
            
            FORM IN (10,6,1,2,3,5,7,4)
            