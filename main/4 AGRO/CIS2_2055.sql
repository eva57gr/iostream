        SELECT 
            DISTINCT D.CUIIO,
            SUM(CASE WHEN D.RIND IN ('001') THEN D.COL1 ELSE NULL END) R001
            FROM CIS2.VW_DATA_ALL  D
            
                    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS 
            WHERE
            D.PERIOADA = 2014
            AND D.FORM = 43
            AND D.CAPITOL = 397
            
            GROUP BY
            D.CUIIO
            
            ORDER BY
            D.CUIIO    