 SELECT
  DISTINCT  D.CUIIO,
                    MAX(D.PACHET) AS PACHET
                    FROM CIS2.DATA_ALL  D 
                             
                    
                    WHERE 
                    D.FORM = 44
                    AND D.PERIOADA IN(:pPERIOADA)
                 
                    AND D.CUIIO = 43038
                    
                    GROUP BY 
                    D.CUIIO
                    