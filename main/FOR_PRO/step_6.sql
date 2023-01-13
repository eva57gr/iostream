--UPDATE  CIS2.FORM_CUIIO
--
--SET STATUT = '3'

SELECT * 

        FROM CIS2.FORM_CUIIO 
        
        WHERE 
        FORM = 16
        
        AND CUIIO_VERS = 2011  
        AND FORM_VERS = 2000 
        
        AND STATUT IN ('1')
        
        AND 
        
        CUIIO IN (
        SELECT   


  
         R.CUIIO        
--         L.CUIIO        L_CUIIO        
         
         FROM (

SELECT     R.CUIIO,
           R.CUIIO_VERS
          
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (16) AND CUIIO_VERS <= 2011
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (16) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS) ) R 
               
               LEFT   JOIN (
               
               SELECT CUIIO
               
        FROM USER_BANCU.ADD_NEW_SU
               ) L ON L.CUIIO = R.CUIIO
               
               
               WHERE 
               L.CUIIO IS  NULL                 
               
               
               
               
               
              
               
               
              
        )
        