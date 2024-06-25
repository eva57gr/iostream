              
                SELECT 
                L.CUIIO,
                L.CUIIO_VERS,
                RR.DENUMIRE,
                RR.CUATM
                FROM
                (
                    SELECT
                        DISTINCT D.CUIIO,
                        D.CUIIO_VERS
               
                        FROM CIS2.VW_DATA_ALL D
                        
                            WHERE 
                            D.FORM IN (43)
                            AND D.PERIOADA IN (2013)
                            ) L   LEFT JOIN (
                            
                            
                                  SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (43) AND CUIIO_VERS <= 2013
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (43) AND FC.STATUT <> '3'
                            ) R ON R.CUIIO = L.CUIIO
                            


                                               INNER JOIN   CIS2.RENIM RR ON RR.CUIIO = L.CUIIO AND RR.CUIIO_VERS = L.CUIIO_VERS     
                            WHERE 
                            R.CUIIO IS NULL 
                            
                            
                            
                            ORDER BY
                             
                              L.CUIIO_VERS