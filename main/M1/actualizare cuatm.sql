
      SELECT DISTINCT FC.CUIIO,
                   FC.CUIIO_VERS,
                   L.CUATM
                  
                   FROM (
      
      SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (5,6,11,13,15,18,19,26,29,33,44,45,58,61,62,74,76) AND CUIIO_VERS <= 1062
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (5,6,11,13,15,18,19,26,29,33,44,45,58,61,62,74,76) AND FC.STATUT <> '3' ) FC 
             
             
                                                left JOIN USER_BANCU.IDNO L ON L.CUIIO = FC.CUIIO
                                                
                                                
                                                WHERE 
             
                                                L.CUIIO IS not  NULL 
             
          
        
         
               
               
