--------------------------------------------------------------------------
--INSERT INTO CIS.FORM_CUIIO R (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)


----

--SELECT 
--        L.CUIIO,
--        2012 CUIIO_VERS,
--        4 FORM,
--        2000    FORM_VERS,
--        '1' STATUT
--        
--        FROM 
--
--
--(


SELECT   
       --  R.CUIIO  R_CUIIO,       
         L.CUIIO  CUIIO,
         2013 CUIIO_VERS,
         10 FORM,
         1999    FORM_VERS,
        '1' STATUT

         
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
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
          --   AND FC.FORM_VERS = 2011
             
             
             ) FC
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS) ) R 
               
               RIGHT   JOIN (
               
               SELECT CUIIO
               
        FROM USER_BANCU.PROD_24
        
        WHERE 
        CUIIO IS NOT NULL
        
        
        
               ) L ON L.CUIIO = R.CUIIO
               
               
               WHERE 
               R.CUIIO IS NOT   NULL  
--               ) L  
              
               
               
              