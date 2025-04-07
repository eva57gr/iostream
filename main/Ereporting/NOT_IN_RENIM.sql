                SELECT 
                  DISTINCT L.CUIIO,
                           l.CUIIO_VERS
                  
                  FROM CIS2.RENIM  L LEFT JOIN CIS2.FORM_CUIIO FC ON FC.CUIIO = L.CUIIO 
                  
                    WHERE 
                   FC.CUIIO IS NULL 
                   AND L.CUIIO_VERS = 2013