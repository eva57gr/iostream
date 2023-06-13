SELECT DISTINCT D.CUIIO,
D.USER_NAME,
                MAX(D.DATA_REG) DATA_REG  
        FROM CIS2.VW_DATA_ALL D 

            WHERE 
            D.FORM IN (:pFORM)
            AND D.PERIOADA IN (:pPERIOADA)
            
            AND D.USER_NAME IN ('e-Reporting')
            GROUP BY 
            D.CUIIO,
            D.USER_NAME
            
        
ORDER BY 
DATA_REG DESC 