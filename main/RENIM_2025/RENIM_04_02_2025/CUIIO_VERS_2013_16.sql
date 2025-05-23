



SELECT 
    DISTINCT D.CUIIO 
        FROM CIS2.VW_DATA_ALL  D
        WHERE
        D.FORM IN(:pFORM) AND
        D.PERIOADA IN (:pPERIOADA)
        
        