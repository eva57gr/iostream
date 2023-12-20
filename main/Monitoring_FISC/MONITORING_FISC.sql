SELECT
DISTINCT D.CUIIO,
         D.FORM, 
       MAX(D.DATA_REG) DATA_REG         
            
            FROM USER_EREPORTING.VW_DATA_ALL_PRIMIT D
            
            WHERE 
            1=1
            
             AND D.DATA_REG > TO_DATE('12/19/2023 00:01:00', 'MM/DD/YYYY HH24:MI:SS')
            
           and  D.FORM IN (:pFORM)
            AND D.PERIOADA IN (:pPERIOADA)
            
            GROUP BY
            D.FORM, 
            D.CUIIO
     
            
--           HAVING 
--           
--           MAX(D.DATA_REG) > TO_DATE('07/28/2023 00:01:00', 'MM/DD/YYYY HH24:MI:SS')
            
            ORDER BY
            MAX(D.DATA_REG) DESC
            
            