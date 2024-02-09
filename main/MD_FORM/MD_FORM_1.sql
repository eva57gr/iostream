


--        SELECT 
--        FORM,
--        FORM_VERS,
--        DENUMIRE,
--        DEN_SHORT
--        
--        
--            FROM CIS2.MD_FORM
--            
--            WHERE 
--            
--            FORM IN (20,19,12,71,48,13,8,4,6,34,35,36,60,26,45,18,5,29,43,39,74,64,44,16,3,57,63,59,67,66)
--            
--            AND DEN_SHORT NOT IN ('1-Inf.rev')
--            
--            
--            
--            ORDER BY 
--            FORM_VERS



SELECT 
                     FORM,
        FORM_VERS,
        DENUMIRE,
        DEN_SHORT
        
        
        
            FROM CIS.MD_FORM
            
            WHERE 
            
            FORM IN (10,6,1,2,3,5,7,4)
            
--            --CIS2
--             
--             FORM IN (63,39,59,36,60,57,48,43,35,34,20,16,12,8,3,4,67,64,66,57,71) -- ANUAL
--             
--             
--             FORM IN (6,45,13,44,18,29,26,74,19,5) --TRIM
--             
--             
--             -- CIS
--             
--             
--              FORM IN (10) -- -- ANUAL
--              
--              FORM IN (6,1) -- -- TRIM
--              
--              
--              FORM IN (2,3,4,5,7) -- Lunare