       SELECT 
            D.CUIIO,
        --    D.CAPITOL,
            D.CAPITOL_DEN,
            D.RIND,
            D.CUATM,
            D.CAEM2,
            D.COL31 AS COLB,
            D.COL32 AS COLC,
            SUM(D.COL3) AS COL1,
            SUM(D.COL4) AS COL2,
            SUM(D.COL5) AS COL3,
            
            SUM(D.COL10) AS CAP5_COL3
            
                FROM CIS2.VW_DATA_ALL D
                
                        
                
                    WHERE 
                    
                    D.CAPITOL IN (1127,1128)
        
                    AND D.FORM IN (64)
                    AND D.PERIOADA = 2010   
                --    AND D.CUIIO = 400053
                    
                    AND 
                    
                    (
                    D.COL31  LIKE  '45%' 
                    OR
                      D.COL31  LIKE  '46%'
                     OR 
                     
                      D.COL31  LIKE  '47%'   
                    )      
            

GROUP BY 
            D.CUIIO,
            D.CAPITOL,
            D.CAPITOL_DEN,
            D.RIND,
            D.COL31,
            D.COL32,
            D.CUATM,
            D.CAEM2
            
            
            HAVING 
            
              SUM(D.COL10) IS  NULL 
            
            ORDER BY 
            D.CUIIO,
            D.CAPITOL
            
            
            