 UPDATE CIS.FORM_CUIIO
--SELECT * 
    SET STATUT = '3'     
 --   from CIS.FORM_CUIIO 
    
    WHERE 

CUIIO IN (

SELECT 
        L.CUIIO
        

        
        FROM 


(


SELECT   


  
         R.CUIIO  CUIIO       
      --   L.CUIIO  CUIIO
         
         FROM (

SELECT     R.CUIIO,
           R.CUIIO_VERS
          
      FROM (
      
      
      SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (7) AND CUIIO_VERS <= 456
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (7) AND FC.STATUT <> '3'
             
             
             
             
             ) FC
             
             
             
             
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS) 
               
               
               
               
               ) R 
               
               LEFT   JOIN (
               
               SELECT CUIIO
               
        FROM USER_BANCU.ADD_NEW_SU_M2
        
        
        
               ) L ON L.CUIIO = R.CUIIO
               
               
               WHERE 
               L.CUIIO IS   NULL  
             

  ) L   ) 
  

 AND FORM = 7 
--  
--  
  AND CUIIO_VERS = 456
    AND FORM_VERS = 299 
  AND STATUT = '1' 
               
               
               
              