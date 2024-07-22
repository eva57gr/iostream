

    
    SELECT 
    L.CUIIO    
    
        FROM (
                SELECT 
        
        DISTINCT D.CUIIO 
        
        FROM CIS2.VW_DATA_ALL D
        
        WHERE 
        D.FORM = 74 AND 
        D.CAPITOL IN (1197) AND
        D.PERIOADA = 1061
        
        ) L
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
        
--        AND 
--        
--        (CIF_IT IS NOT NULL  AND CIF_IT <> 0 ) 
        
        
                ) R ON R.CUIIO = L.CUIIO
                
                
                WHERE 
                R.CUIIO IS NULL;
                
                
                 