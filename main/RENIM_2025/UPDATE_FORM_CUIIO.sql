UPDATE CIS2.FORM_CUIIO
SET STATUT = '3'

--SELECT *
--
--
--    FROM CIS2.FORM_CUIIO 
    
    WHERE 
    
FORM = 36 AND FORM_VERS = 2000 AND STATUT = '1' AND CUIIO_VERS = 2013

AND CUIIO IN ( 

SELECT   
    
         R.CUIIO  CUIIO
       

         
         FROM (

SELECT     R.CUIIO,
           R.CUIIO_VERS
          
      FROM (
      
      
      SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
          --   AND FC.FORM_VERS = 2011
             
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS) ) R 
               
               LEFT   JOIN (
               
               SELECT CUIIO
               
        FROM USER_BANCU.AGRO_36
        
        WHERE 
        CUIIO IS NOT NULL
        
        
        
               ) L ON L.CUIIO = R.CUIIO
               
               
               WHERE 
               L.CUIIO IS     NULL  

)