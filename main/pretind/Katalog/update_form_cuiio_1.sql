UPDATE CIS2.FORM_CUIIO


--SELECT * 
 
    SET STATUT = '3'     
  -- from CIS2.FORM_CUIIO 
    
    WHERE 

CUIIO IN (


  
  
  
  SELECT CUIIO
  
  FROM CIS2.FORM_CUIIO
 WHERE CUIIO_VERS = 2012 AND FORM = 71 AND FORM_VERS = 2000 AND STATUT = '1'
  
  )  
  
  
  
  AND FORM = 71 
  
  
  AND CUIIO_VERS = 2012
    AND FORM_VERS = 2000 
  AND STATUT = '1' ;
               
               
               
              