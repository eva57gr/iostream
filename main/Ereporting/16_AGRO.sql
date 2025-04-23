SELECT 
    L.CUIIO,
    C.DENUMIRE,
    L.CUATM,
    C.FULL_CODE,
    L.COL1    
            FROM  VW_36 L 
            
                   INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = L.CUATM
                   
                   UNION ALL 
                   
                   
                   
    SELECT 
    NULL CUIIO,
    DENUMIRE,
    CODUL CUATM,
    FULL_CODE,
    NULL COL1 
                   
                   FROM CIS2.VW_CL_CUATM
                   
                   WHERE 
                   PRGS IN ('2')
                   AND CODUL NOT IN ('0000000')
                   
                   
                   
                   ORDER BY 
                   FULL_CODE;