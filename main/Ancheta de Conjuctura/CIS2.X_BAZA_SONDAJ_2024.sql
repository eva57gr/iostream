
INSERT INTO CIS2.X_BAZA_SONDAJ (
  PERS_IT,
  CIF_IT,
  DATALIK,  
  CUIIO,
  ANUL 

)


SELECT 
  PERS_IT,
  CIF_IT,
  DATALIK,  
  CUIIO,
  2024 ANUL           
        
        FROM CIS2.X_BAZA_SONDAJ
        
        WHERE 
        ANUL = 2023