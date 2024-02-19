SELECT
                D.RIND,
                D.ORDINE

                FROM CIS.MD_RIND  D
                
                        inner JOIN (

        


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
                    
                    
                    
                    
                    ) dd on D.capitol = DD.capitol AND D.capitol_VERS  = DD.capitol_VERS 
                           and D.RIND = DD.RIND AND D.RIND_VERS  = DD.RIND_VERS
                    
                    
                    where
                    
                    D.FORM IN (1) 
                    AND d.STATUT <> '3'
                    AND D.capitol in (1,2)
            
--                    order BY
--                    ORDINE
--                    