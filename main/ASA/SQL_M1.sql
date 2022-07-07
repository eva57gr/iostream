SELECT
            D.ANUL, 
            D.CUIIO,
            D.COL33, 
            D.RIND,
        
            SUM(D.COL9) AS NSAL,
            SUM(D.COL10) AS REM_MUNC


              FROM CIS2.VW_DATA_ALL D
                
                        
                
                    WHERE 
                    
                    D.CAPITOL IN (1128)
        
                    AND D.FORM IN (64)
                    AND D.PERIOADA = 2010   
                   -- AND D.RIND  IN ('500')
                    
               --     AND D.CUIIO = 400053
                    
                    
                    GROUP BY 
                       D.ANUL, 
            D.CUIIO,
            D.COL33, 
            D.RIND
            
            ORDER BY 
--              D.COL33, 
              D.CUIIO,
          
            D.RIND