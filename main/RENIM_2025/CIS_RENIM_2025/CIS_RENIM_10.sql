--INSERT INTO CIS.FORM_CUIIO R (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)


SELECT   
         L.CUIIO  R_CUIIO,       
        -- L.CUIIO  CUIIO,
         1064 CUIIO_VERS,
         6 FORM,
         1004  FORM_VERS,
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
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (44) AND CUIIO_VERS <= 1064
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (44) 
             AND FC.STATUT <> '3'
          --   AND FC.FORM_VERS = 2011
             
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS) ) R 
               
               RIGHT    JOIN (
               
               SELECT CUIIO
               
        FROM USER_BANCU.ADD_NEW_SU_M3_2024
        
--      WHERE 
--      CUIIO = 41493032
        
        
        
               ) L ON L.CUIIO = R.CUIIO
               
               
               WHERE 
               R.CUIIO IS NULL  
--               ) L  
              
               ;
               
               
               
               
               
               
               
               --INSERT INTO CIS.FORM_CUIIO R (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)


SELECT   
         DISTINCT R.CUIIO        
       

         
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
               
               LEFT    JOIN (
               
               SELECT CUIIO
               
        FROM USER_BANCU.AGRO_16
        
--      WHERE 
--      CUIIO = 41493032
        
        
        
               ) L ON L.CUIIO = R.CUIIO
               
               
               WHERE 
               L.CUIIO IS NULL  
--               ) L  
              
               
               
              
               
              