SELECT 
                DISTINCT  D.CUIIO,
                R.DENUMIRE,
                D.CUATM,
                D.RIND,
                SUM(D.COL1) AS COL1
              

                FROM CIS2.VW_DATA_ALL D 
                
                            INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO  AND R.CUIIO_VERS = D.CUIIO_VERS
                
                WHERE 
                
                D.PERIOADA IN (:pPERIOADA)
            
               -- AND D.CUATM LIKE '85%'
                AND D.FORM IN (:pFORM)
                
                AND D.CAPITOL = 399
                
                AND D.RIND IN ('1630')
                AND D.CFOJ IN ('684','685')
                
                
                GROUP BY 
                
                D.CUIIO,
                R.DENUMIRE,
                D.RIND,
                D.CUATM
                
                HAVING 
                SUM(D.COL1) between 10 and 70 
                
                ORDER BY
                SUM(D.COL1) ASC