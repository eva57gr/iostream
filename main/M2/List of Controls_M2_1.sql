


            SELECT R.CUIIO,
                   R.CUIIO_VERS,
                   R.IDNO
            
                    FROM CIS2.RENIM R 
                    
                        WHERE 
                        R.CUIIO_VERS = 2010
                        
                        AND R.CUIIO IN (
                         SELECT 
                         
                         
                         R.CUIIO
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (7) AND CUIIO_VERS <= 452
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (7) AND FC.STATUT <> '3') FC
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
                        
                        )
                        
                        
            
                        GROUP BY 
                        R.CUIIO,
                        R.CUIIO_VERS,
                        R.IDNO
            
            HAVING 
            R.IDNO IS NULL
            OR 
            R.IDNO = 0
           
            
            