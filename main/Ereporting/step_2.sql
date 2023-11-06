




                SELECT 
                DISTINCT D.CUIIO
                
                
                        FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
                        
                        -- CIS2.VW_DATA_ALL D
                        
                        
                        
                        WHERE 
                        D.PERIOADA IN (:pPERIOADA)
                        
                        AND D.FORM IN (:pFORM)
                        
                        AND 
                        D.CUIIO IN (
             40857302,
04502916,
40988406,
40922502,
41194861,
40727309,
40517799,
38704258,
40986904,
40801431

             )
                         
                        
                         
                        