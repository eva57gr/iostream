                SELECT 
                        D.CUIIO,
                        COUNT(D.CUIIO) AS CNT


                FROM CIS2.VW_DATA_ALL D

                WHERE
                D.FORM = 33
                AND D.PERIOADA IN (:pPERIOADA) 
                 

                GROUP BY
                D.CUIIO
                
                
                ORDER BY
                COUNT(D.CUIIO) DESC



                