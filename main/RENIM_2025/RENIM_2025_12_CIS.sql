 --UPDATE CIS.FORM_CUIIO
SELECT * 
--    SET STATUT = '3'     
 from CIS.FORM_CUIIO 
--    
    WHERE 



                  CUIIO IN (
                    
                   SELECT   
         R.CUIIO 
         -- R_CUIIsO,       
        -- L.CUIIO  CUIIO
         
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
                                  WHERE FORM IN (10) AND CUIIO_VERS <= 2013
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (10) AND FC.STATUT <> '3'
             --AND FC.FORM_VERS = 2011
             
             
             ) FC
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS) ) R 
               
               LEFT  JOIN (
               
               SELECT CUIIO
               
        FROM USER_BANCU.PROD_24
        
        
               ) L ON L.CUIIO = R.CUIIO
               
               
               WHERE 
               L.CUIIO IS    NULL  


        
        ) 
        
        AND 
        
        (
        CUIIO_VERS  =  2013 
         
        ) 
  

 AND FORM = 10 
--  
--  
  AND CUIIO_VERS = 2013
    AND FORM_VERS = 1999 
  AND STATUT = '1' 
--               
--               
               
              