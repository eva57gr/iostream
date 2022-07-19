



        SELECT 
                DISTINCT D.FORM
        
                FROM CIS2.VW_DATA_ALL D
                
                WHERE 
                
                D.PERIOADA = :pPERIOADA 
                AND D.CAPITOL = 100
                
                