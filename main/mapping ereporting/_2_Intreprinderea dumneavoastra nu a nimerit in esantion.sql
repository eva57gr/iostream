             --Se poate optimiza SQL cu care se extrage CUIIO si CUIIO_VERS
             --il  luam  din  FORM_CUIIO din catalog
             -- si se executa mai repede si este corect. Si servicul v-a lucra mai repede.       

 SELECT       FC.CUIIO,
                   FC.CUIIO_VERS
                   
                    --INTO vCUIIO, vCUIIO_VERS
                  
              FROM FORM_CUIIO  FC
                   INNER JOIN (  
                   SELECT CUIIO, 
                   MAX (CUIIO_VERS) 
                   CUIIO_VERS
                                   FROM FORM_CUIIO
                                  
                                  WHERE 
                                  FORM IN (:vFORM) AND CUIIO_VERS <= :vPERIOADA
                                   AND ID_SCHEMA=:vID_SCHEMA
                                  
                                  
                               GROUP BY CUIIO
                               ) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE 
             
             FC.FORM IN (:vFORM) 
             AND FC.STATUT <> '3'
             AND FC.CUIIO IN (:vCUIIO)
             AND FC.ID_SCHEMA=:vID_SCHEMA;
             
             --Se poate optimiza SQL cu care se extrage CUIIO si CUIIO_VERS
             --il  luam  din  FORM_CUIIO din catalog
             -- si se executa mai repede si este corect. Si servicul v-a lucra mai repede.  
             
             