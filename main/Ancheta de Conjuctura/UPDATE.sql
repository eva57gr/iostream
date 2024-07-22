SELECT 
  CASE WHEN PERS_IT IS NULL THEN 0 ELSE PERS_IT END PERS_IT,
  CIF_IT,
  DATALIK,  
  CUIIO,
  ANUL           
        
        FROM CIS2.X_BAZA_SONDAJ
        
        WHERE 
        ANUL = 2024
       -- AND PERS_IT IS NULL
       
       ;
        
        
        UPDATE CIS2.X_BAZA_SONDAJ 
        SET PERS_IT =  (CASE WHEN PERS_IT IS NULL THEN 0 ELSE PERS_IT END) 
       
       
       WHERE 
        ANUL = 2024;