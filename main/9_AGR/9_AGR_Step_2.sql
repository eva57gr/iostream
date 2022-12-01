   SELECT 
        DISTINCT D.CUIIO,
                 D.DATA_REG
            
                FROM CIS2.VW_DATA_ALL D

                    WHERE 
                    D.PERIOADA IN (:pPERIOADA)
                    AND D.FORM  IN (:pFORM)
                

ORDER BY 
D.DATA_REG DESC