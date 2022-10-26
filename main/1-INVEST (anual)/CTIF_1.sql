SELECT DISTINCT D.CUIIO 

                FROM USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE D
                
                WHERE 
                D.FORM IN (:pFORM) 
                AND D.PERIOADA IN (:pPERIOADA)    
                AND     D.CAPITOL  IN(1142) 
                GROUP BY 
                D.CUIIO  
                