

        SELECT 
         DISTINCT D.CUIIO
        FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
        
        WHERE 
        D.FORM IN (:pFORM)
        AND D.PERIOADA IN (:pPERIOAA)     
        AND D.ID_SCHEMA IN (:SHECMA)   
        