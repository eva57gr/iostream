UPDATE CIS2.FORM_CUIIO


--SELECT * 
 
    SET STATUT = '3'     
  -- from CIS2.FORM_CUIIO 
    
    WHERE 

CUIIO IN (


  
  
  
  SELECT   


  
                   R.CUIIO
--                   2011  CUIIO_VERS,
--                   R.FORM,
--                   R.FORM_VERS,
--                   R.STATUT
         
         FROM (

SELECT    
                   R.CUIIO,
                   R.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
          
      FROM (
      
      SELECT 
      
                   FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (71) AND CUIIO_VERS <= 2012
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (71) 
             AND FC.STATUT <> '3'
             AND FC.FORM_VERS = 2011
             
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS) 
               
               
               
               ) R 
               
               LEFT   JOIN (
               
               SELECT CUIIO
               
        FROM USER_BANCU.ADD_NEW_SU_TIC
               ) L ON L.CUIIO = R.CUIIO
               
               
               WHERE 
               L.CUIIO IS  NULL  
  
  
  )  
  
  
  
  AND FORM = 71 
  
  
  AND CUIIO_VERS = 2012
    AND FORM_VERS = 2011 
  AND STATUT = '1' ;
               
               
               
              