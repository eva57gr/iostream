        SELECT
                D.CUIIO,
                R.DENUMIRE,
                R.CUATM,
                R.CFOJ,
                MR.DEN_SHORT,
                D.RIND,
                SUM(D.COL1) AS COL1,
                SUM(D.COL2) AS COL2,
                SUM(D.COL3) AS COL3,
                SUM(D.COL4) AS COL4,
                SUM(D.COL5) AS COL5,
                SUM(D.COL6) AS COL6,
                SUM(D.COL7) AS COL7
              
                
                FROM CIS2.VW_DATA_ALL D
                
                        INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
                        INNER JOIN CIS2.MD_CAPITOL MR ON MR.CAPITOL = D.CAPITOL AND MR.CAPITOL_VERS = D.CAPITOL_VERS  
            
                    WHERE 
                    D.PERIOADA IN (1063)
                    AND D.FORM IN (45)
                    
                    
                   
                GROUP BY
                
                D.CUIIO,
                R.DENUMIRE,
                R.CUATM,
                R.CFOJ,
                D.RIND,
                MR.DEN_SHORT
                
                ORDER BY
                D.CUIIO,
                MR.DEN_SHORT,
                D.RIND
                
               
                