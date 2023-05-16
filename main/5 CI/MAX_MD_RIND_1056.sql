SELECT 
--             D.CAPITOL,
--             D.CAPITOL_VERS,
--             D.ID_MD,
             D.RIND,
            -- D.RIND_VERS,
            -- D.STATUT,
             D.ORDINE
               
            FROM CIS.MD_RIND D 
            INNER JOIN (



            SELECT 
             RIND,
             MAX(RIND_VERS) RIND_VERS
               
            FROM CIS.MD_RIND
           
             WHERE 
             FORM IN (1) AND
             CAPITOL IN (1,2) 
            
 
            GROUP BY
           -- ID_MD,
            CAPITOL,
            RIND
           
            
            ) DD ON DD.RIND = D.RIND AND DD.RIND_VERS = D.RIND_VERS 
--                       
            

WHERE 
D.FORM IN (1) AND
             D.CAPITOL IN (1,2) 

AND D.STATUT = '1'    
--AND D.RIND IN ('0100')   

ORDER BY
D.ORDINE