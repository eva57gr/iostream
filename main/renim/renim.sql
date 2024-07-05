     SELECT *
            
                    FROM CIS2.RENIM
                    
                    WHERE 
                    --DENUMIRE LIKE '%Biroul%'
                    CUIIO LIKE '41005328%'
                    -----------------------------------
                    ;
                    
            SELECT 
                DISTINCT D.CUIIO
            
                    FROM CIS2.VW_DATA_ALL D
                    
                    WHERE 
                    D.FORM IN (33)
                    AND D.PERIOADA IN (1061) AND 
                    --DENUMIRE LIKE '%Biroul%'
                    D.CUIIO LIKE '13706%'
                    -----------------------------------
                    
                    