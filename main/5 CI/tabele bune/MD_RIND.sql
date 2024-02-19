SELECT 
             D.RIND,
             
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
            CAPITOL,
            RIND
            ) DD ON DD.RIND = D.RIND AND DD.RIND_VERS = D.RIND_VERS 
WHERE 
             D.FORM IN (1) AND
             D.CAPITOL IN (1,2) 
             AND D.STATUT = '1'    


--ORDER BY
--D.ORDINE
