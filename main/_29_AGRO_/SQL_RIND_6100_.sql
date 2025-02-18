SELECT 
                DISTINCT  D.CUIIO,
             --   R.IDNO,
                R.DENUMIRE,
                D.CUATM,
                R.CFOJ,
                D.RIND,
                SUM(D.COL1) AS COL1,
                SUM(D.COL2) AS COL2
              

                FROM CIS2.VW_DATA_ALL D 
                
                            INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO  AND R.CUIIO_VERS = D.CUIIO_VERS
                
                WHERE 
                
                D.PERIOADA IN (:pPERIOADA)
            
               -- AND D.CUATM LIKE '85%'
                AND D.FORM IN (:pFORM)
                
                AND D.CAPITOL = 400
                
                AND D.RIND IN ('6100')
                --AND D.CFOJ IN ('684','685')
                
                
                GROUP BY 
                
                D.CUIIO,
                R.DENUMIRE,
                D.RIND,
                R.CFOJ,
                D.CUATM
                --R.IDNO
                
--                HAVING 
--                SUM(D.COL1)  >= 70 
               -- between 10 and 70 
                
--                ORDER BY
--                SUM(D.COL1) ASC