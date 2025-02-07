        SELECT
                D.CUIIO,
                R.DENUMIRE,
                R.CFOJ,
                D.RIND,
                SUM(D.COL1) AS COL1,
                SUM(D.COL2) AS COL2
              
                
                FROM CIS2.VW_DATA_ALL D
                
                        INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
            
                    WHERE 
                    D.PERIOADA IN (1060)
                    AND D.FORM IN (45)
                    AND 
                    capitol=399 
                    
                    AND D.RIND IN ('1302')

                GROUP BY
                
                D.CUIIO,
                R.DENUMIRE,
                R.CFOJ,
                D.RIND
               
                