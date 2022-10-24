









            SELECT 
                
                CUIIO,
                COUNT (CUIIO) AS CNT 
                
                FROM CIS2.VW_DATA_ALL_FR
                
                WHERE 
                
                FORM IN (:pFORM)
                AND PERIOADA IN (:pPERIOADA)
                
                
                GROUP BY 
                CUIIO 
                
                ORDER BY 
                COUNT (CUIIO) DESC
                
                
                