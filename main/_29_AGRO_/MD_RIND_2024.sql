







            SELECT 
                D.CUIIO,
                R.DENUMIRE,
                D.CUATM,
             --   D.RIND,
                SUM(D.COL1) AS COL1,
                SUM(D.COL2) AS COL2,
                SUM(D.COL3) AS COL3,
                SUM(D.COL4) AS COL4

                FROM CIS2.VW_DATA_ALL D 
                
                            INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO  AND R.CUIIO_VERS = D.CUIIO_VERS
                
                WHERE 
                
                D.PERIOADA IN (:pPERIOADA)
            
              --  AND D.CUATM LIKE '85%'
                AND D.FORM IN (:pFORM)
                
                AND D.CAPITOL = 401
                
                AND D.RIND IN ('2300')
                
                
                GROUP BY 
                
                D.CUIIO,
                R.DENUMIRE,
                --D.RIND,
                D.CUATM
                
                ORDER BY
                D.CUIIO 
              --  D.RIND