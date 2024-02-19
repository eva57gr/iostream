

        


                SELECT
                CAPITOL,
                MAX(CAPITOL_VERS) AS CAPITOL_VERS,
                RIND,
                
                MAX(RIND_VERS)  RIND_VERS
                    
                    FROM CIS.MD_RIND
                    
                    WHERE
                    
                    FORM = 1
                    AND CAPITOL IN (1,2)
        
                    AND CAPITOL_VERS <= :pPERIOADA
                    AND RIND_VERS <= :pPERIOADA          

                    GROUP BY
                    RIND,
                    CAPITOL
                    
                    ORDER BY
                    CAPITOL,
                    RIND
                    
                    
                    
                    