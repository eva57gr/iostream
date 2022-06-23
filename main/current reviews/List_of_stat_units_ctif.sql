



        SELECT 
        DISTINCT 
        D.FORM,
        D.ID_SCHEMA
        FROM    USER_EREPORTING.VW_DATA_ALL_PRIMIT D
        
        WHERE 
        D.ANUL = 2021 

        GROUP BY
        D.FORM,
        D.ID_SCHEMA
        
        ORDER BY 
        D.ID_SCHEMA,
        D.FORM