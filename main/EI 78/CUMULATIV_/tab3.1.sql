SELECT
            SUM(D.COL1) / 4  AS COL1            
                  FROM DATA_ALL D
                        
                      
                        WHERE
                           (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND    
                            
                           D.ID_MD  = 44519        