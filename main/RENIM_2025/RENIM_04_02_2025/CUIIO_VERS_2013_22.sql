



            SELECT 
            DISTINCT L.CUIIO,
                     L.CUIIO_VERS  
            FROM (
               SELECT 
                    DISTINCT D.CUIIO,
                             D.CUIIO_VERS 
                    
                        FROM CIS2.VW_DATA_ALL D
                        
                        WHERE
                        D.FORM IN (:pFORM)
                        AND D.PERIOADA IN (:pPERIOADA) )L  LEFT JOIN 
                        (
                        SELECT FC.CUIIO
      

              FROM
              ( 
              SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (3) AND CUIIO_VERS <= 2013
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             FC.FORM IN (3) AND FC.STATUT <> '3') FC 
             
                        ) R   ON R.CUIIO = L.CUIIO 
                        
                        
                        WHERE
                        R.CUIIO IS NULL 