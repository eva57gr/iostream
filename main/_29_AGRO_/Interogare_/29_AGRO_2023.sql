        SELECT
                D.CUIIO,
                R.DENUMIRE,
                R.CUATM,
                R.CFOJ,
             
                SUM(CASE WHEN  D.capitol=399   AND  D.RIND IN ('5000')THEN D.COL1 ELSE NULL END ) AS R_5000
           
              
                
                FROM CIS2.VW_DATA_ALL D
                
                        INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
                        INNER JOIN CIS2.MD_CAPITOL MR ON MR.CAPITOL = D.CAPITOL AND MR.CAPITOL_VERS = D.CAPITOL_VERS  
            
                    WHERE 
                    D.PERIOADA IN (1059)
                    AND D.FORM IN (45)
                    AND D.capitol=399  
                    
                    
                   
                GROUP BY
                
                D.CUIIO,
                R.DENUMIRE,
                R.CUATM,
                R.CFOJ
              
                ORDER BY
                D.CUIIO
             
                
               
                