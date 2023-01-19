SELECT 
        R.CUIIO,
        L.CUIIO
            
        FROM     USER_BANCU.ADD_NEW_SU_M3 L  
        RIGHT  JOIN  USER_BANCU.ADD_NEW_SU R 
        ON L.CUIIO = R.CUIIO
        
                WHERE 
                L.CUIIO IS  NULL                   
        

ORDER BY 
R.CUIIO
        
        
        
                    