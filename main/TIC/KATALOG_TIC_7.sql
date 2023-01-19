--INSERT INTO CIS2.FORM_CUIIO R (
--        CUIIO,
--        CUIIO_VERS,
--        FORM,
--        FORM_VERS,
--        STATUT 
--)




--SELECT 
--        L.CUIIO,
--        2011 CUIIO_VERS,
--        71 FORM,
--        2000    FORM_VERS,
--        '1' STATUT
--        
--        FROM 
--
--
--(


SELECT   


  
         R.CUIIO  R_CUIIO,       
         L.CUIIO  CUIIO
         
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
                                  WHERE FORM IN (71) AND CUIIO_VERS <= 2011
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (71) AND FC.STATUT <> '3'
             
             
             
             ) FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS) ) R 
               
               RIGHT  JOIN (
               
               SELECT CUIIO
               
        FROM USER_BANCU.ADD_NEW_SU_TIC
               ) L ON L.CUIIO = R.CUIIO
               
               
               WHERE 
               R.CUIIO IS  NULL  
           --    ) L  
              
               
               
              