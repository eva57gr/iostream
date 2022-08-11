       SELECT 
               D.CUIIO,
               R.DENUMIRE,
               R.CUATM,
               R.CFP,
               R.CFOJ 
                
                FROM CIS2.VW_DATA_ALL D 
                                    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO
                                                               AND  R.CUIIO_VERS = D.CUIIO_VERS 
                
                WHERE 
                
                D.FORM IN (43)
                AND D.PERIOADA IN (2011) 
                
                GROUP BY 
               D.CUIIO,
               R.DENUMIRE,
               R.CUATM,
               R.CFP,
               R.CFOJ 
                
               ORDER BY 
               R.CUATM 