

    SELECT 
    D.RIND,
    SUM(D.COL1) AS COL
    
    FROM CIS2.VW_DATA_ALL D
    
    WHERE 
    
    
    D.FORM IN (18) 
    AND   
    D.CAPITOL IN (1009) 
    AND D.PERIOADA =  1052  
    
    AND D.RIND IN ('010')
    
    GROUP BY 
    D.RIND