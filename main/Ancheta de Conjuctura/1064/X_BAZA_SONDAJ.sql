
INSERT INTO X_BAZA_SONDAJ 

(
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
  2025 ANUL  
       FROM  CIS2.X_BAZA_SONDAJ
       
  WHERE 
  ANUL = 2024     
       
       