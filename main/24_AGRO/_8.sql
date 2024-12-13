


        SELECT 
            DISTINCT 
            R.CUIIO,
            RR.CUIIO AS RR_CUIIO,
            SUBSTR(R.CUIIO,1,8) AS SUBSTR 
            
            FROM CIS2.RENIM R INNER JOIN CIS2.RENIM RR ON R.CUIIO = RR.CUIIO  
            
            WHERE 
            
            R.CUIIO  LIKE   RR.CUIIO||'%'
            
           -- AND R.CUIIO = 38459149
            
            AND R.CUIIO LIKE   38459149||'%'

            GROUP BY 
                 R.CUIIO,
            RR.CUIIO,
            SUBSTR(R.CUIIO,1,8)
            
--            HAVING 
--       LENGTH(TO_CHAR(R.CUIIO)) > 8
            
                        ORDER BY 
            SUBSTR(R.CUIIO,1,8)  DESC 