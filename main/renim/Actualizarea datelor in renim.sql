








            SELECT 
                DISTINCT 
                D.FORM,
                D.CUIIO,
                D.CUIIO_VERS 
                
                
                    FROM CIS2.VW_DATA_ALL D 
                    
                    WHERE 
                    D.PERIOADA IN (:pPERIOADA) 
                    
                    AND D.CUIIO IN (2336282)
                    
                    
                    GROUP BY 
                D.FORM,
                D.CUIIO,
                D.CUIIO_VERS 
                