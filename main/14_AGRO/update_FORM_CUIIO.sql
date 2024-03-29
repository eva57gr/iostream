 UPDATE CIS2.FORM_CUIIO
--SELECT * 
    SET STATUT = '3'     
  --  from CIS2.FORM_CUIIO 
    
    WHERE 



                  CUIIO IN (
                    
                   SELECT 
                   FC.CUIIO
--                   2012 CUIIO_VERS,
--                   FC.FORM,
--                   FC.FORM_VERS,
--                   FC.STATUT
--                   
                   
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             
             
             GROUP BY
             FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT

        
        ) 
        
        AND 
        
        (
        CUIIO_VERS  =  2012 
         
        ) 
  

 AND FORM = 34 
--  
--  
  AND CUIIO_VERS = 2012
    AND FORM_VERS = 2000 
  AND STATUT = '1' 
               
               
               
              