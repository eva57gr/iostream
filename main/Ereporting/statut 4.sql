SELECT             DISTINCT 
                   FC.CUIIO,
                   FC.CUIIO_VERS 
                FROM FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM FORM_CUIIO
                                  WHERE 
                                  FORM IN (:vFORM) 
                                  AND CUIIO_VERS <= :vPERIOADA
                                  
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO AND BB.CUIIO_VERS = FC.CUIIO_VERS 
                       
                       --AND BB.ID_SCHEMA=FC.ID_SCHEMA 
                       
                       )
             WHERE 
             FC.FORM IN (:vFORM) 
             AND FC.STATUT <> '3'
             AND FC.CUIIO IN (:vCUIIO) 
             
             
             GROUP BY 
             FC.CUIIO,
             FC.CUIIO_VERS
             
             
             
             --AND FC.ID_SCHEMA=vID_SCHEMA