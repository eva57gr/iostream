

    
    SELECT 
    L.CUIIO    
    
        FROM USER_BANCU.VW_74_161 L
                LEFT JOIN (
                
                
                SELECT 
  PERS_IT,
  CIF_IT,
  DATALIK,  
  CUIIO,
  ANUL           
        
        FROM CIS2.X_BAZA_SONDAJ
        
        WHERE 
        ANUL = 2024
        
        AND 
        
        PERS_IT  IS NULL  
        
        --AND CIF_IT <> 0 ) 
        
        
                ) R ON R.CUIIO = L.CUIIO
                
                
                WHERE 
                R.CUIIO IS NULL;
                
                
                 