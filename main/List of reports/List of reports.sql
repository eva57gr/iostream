SELECT 
DISTINCT D.PERIOADA,
D.FORM 
        FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
        
        WHERE 
        D.FORM IN (67)
        
        
        
        GROUP BY 
         D.PERIOADA,
        D.FORM
        ORDER BY 
        D.PERIOADA,
        D.FORM