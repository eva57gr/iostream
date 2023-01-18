SELECT 
                D.CUIIO,
                R.DENUMIRE,
                R.CUATM,
                R.IDNO,
                D.RIND,
                SUM(D.COL6) AS COL6 
                
                
                FROM CIS2.VW_DATA_ALL D
--                
                            INNER JOIN CIS2.RENIM  R ON R.CUIIO = D.CUIIO     AND R.CUIIO_VERS = D.CUIIO_VERS
--                            
--                
                WHERE
                
                D.PERIOADA = 2010
                AND D.FORM = 38
                AND  D.CAPITOL = 389
                AND D.RIND IN ('0001','0002','0004') 
--            
--                             
                GROUP BY 
                   D.CUIIO,
                R.DENUMIRE,
                R.CUATM,
                R.IDNO,
                D.RIND
                
                ORDER BY 
                R.CUATM,
                D.CUIIO,
                D.RIND
                